#!/usr/bin/env python3
"""Texture pack tool for GTA: Chinatown Wars 4.4.243 (Android). Makes the packs that the "Load texture and radio
packs" patch (libctwpacks.so) loads from Android/data/com.rockstargames.gtactw/files/. See README.md next to it.

  extract     game.pak OUT_DIR       game.pak's 2D textures (PNG and raw) -> OUT_DIR/<id>.png + index.json
  extract-dxt dxt.bin OUT_DIR        dxt.bin's 3D world sheets -> OUT_DIR/<id>.png
  build       dxt.bin HD_DIR DXT.bin    rebuild dxt.bin with HD_DIR/<id>.png replacing those sheets
  sidecar     index.json HD_DIR CTWHD.bin   pack HD_DIR/<id>.png versions of game.pak's PNG textures

Formats:

game.pak: header u32[6] = (1, seg1_first_id, seg2_first_id, -1, n_ids, n_pages), then u16 page table
  at 0x18 indexed by resource id; offset = seg*256MiB + page<<12, size = (page[id+1]-page[id])<<12.
dxt.bin: u32[8192] file offsets indexed by resource id (0 = no override), then entries in id order:
  12-byte header (u16 w, u16 h, u16 fmt 0x83f0 DXT1 / 0x83f3 DXT5, u8 bpp, u8 flag, u32 size) + blocks.
  The game prefers a dxt.bin entry over game.pak (GetDXTData) and transcodes it to ATC/RGB565 itself
  when the GPU lacks DXT, so adding entries here overrides textures without touching game.pak.
CTWHD.bin (ours, read by libctwpacks.so): u32 count, then count x (u32 id, u32 offset, u32 size), then payloads.
  Each payload is a game resource: 12-byte header with the ORIGINAL w/h and fmt PNG + a bigger PNG.
  The game uploads PNGs at their decoded size but lays out 2D art by the header size, so HD
  interface/cutscene art keeps its layout (dxt.bin entries can't do this: their size is the header size).
"""
import io, json, os, struct, sys
import numpy as np
from PIL import Image

RAW = {0x8363: 'RGB565', 0x8034: 'RGBA5551', 0x8033: 'RGBA4444'}
DXT1, DXT5, PNG = 0x83f0, 0x83f3, 0xbeef  # PNG: entry data is a whole PNG file, decoded by the game


def pak_entries(pak):
    hdr = struct.unpack('<6I', pak[:24])
    n = hdr[4]
    # Table spills past the first 4 KiB page: the rest is stored after the data, at hdr[5] pages.
    tab = pak[:0x1000] + pak[hdr[5] << 12:]
    page = struct.unpack(f'<{n + 1}H', tab[24:24 + 2 * (n + 1)])
    for i in range(n):
        seg = 0 if i < hdr[1] else 1 if i < hdr[2] else 2
        yield i, seg * 0x10000000 + (page[i] << 12), ((page[i + 1] - page[i]) & 0xffff) << 12

def decode_raw(fmt, w, h, data):
    v = np.frombuffer(data, '<u2', w * h).reshape(h, w).astype(np.uint32)
    if fmt == 0x8363:
        r, g, b, a = v >> 11, (v >> 5) & 63, v & 31, None
        g = g * 255 // 63
    elif fmt == 0x8034:
        r, g, b, a = v >> 11, (v >> 6) & 31, (v >> 1) & 31, (v & 1) * 255
        g = g * 255 // 31
    else:  # 4444
        r, g, b, a = (v >> 12) * 17, ((v >> 8) & 15) * 17, ((v >> 4) & 15) * 17, (v & 15) * 17
        return Image.fromarray(np.dstack([r, g, b, a]).astype(np.uint8), 'RGBA')
    r, b = r * 255 // 31, b * 255 // 31
    ch = [r, g, b] + ([a] if a is not None else [])
    return Image.fromarray(np.dstack(ch).astype(np.uint8), 'RGBA' if a is not None else 'RGB')


def extract(pak_path, out):
    """Write every raw/PNG texture in game.pak as <id>.png plus index.json (id -> w,h,fmt)."""
    os.makedirs(out, exist_ok=True)
    pak = open(pak_path, 'rb').read()
    index = {}
    for i, off, size in pak_entries(pak):
        if size < 12 or off + 12 > len(pak):
            continue
        w, h, fmt, bpp, _, n = struct.unpack('<HHHBBI', pak[off:off + 12])
        if fmt in RAW and bpp == 16 and n == w * h * 2 and n + 12 <= size:
            decode_raw(fmt, w, h, pak[off + 12:off + 12 + n]).save(f'{out}/{i}.png')
            index[i] = [w, h, RAW[fmt]]
        elif fmt == PNG and pak[off + 12:off + 16] == b'\x89PNG' and n + 12 <= size:
            open(f'{out}/{i}.png', 'wb').write(pak[off + 12:off + 12 + n])
            index[i] = [w, h, 'PNG']
    json.dump(index, open(f'{out}/index.json', 'w'), indent=0)
    print(f'{len(index)} textures -> {out}')


def bc_blocks(img, fmt):
    """DXT1/DXT5 block data for img (dims multiple of 4) via Pillow's DDS writer."""
    buf = io.BytesIO()
    img.save(buf, 'DDS', pixel_format='DXT1' if fmt == DXT1 else 'DXT5')
    n = img.width * img.height // (2 if fmt == DXT1 else 1)
    data = buf.getvalue()[128:128 + n]  # 128-byte DDS header, top mip only
    assert len(data) == n, (len(data), n)
    return data


def build(dxt_in, overrides, dxt_out):
    """overrides: {id: png}. Rebuild dxt.bin with them added (existing ids are replaced)."""
    src = open(dxt_in, 'rb').read()
    tab = struct.unpack('<8192I', src[:32768])
    entries = {}
    for i, o in enumerate(tab):  # keep original entries byte-for-byte (game sizes them by offset gaps)
        if o:
            nxt = min([x for x in tab if x > o] + [len(src)])
            entries[i] = src[o:nxt]
    for i, png in overrides.items():  # each png is used at its own size (power-of-two dims expected)
        img = Image.open(png)
        alpha = img.convert('RGBA').getextrema()[3][0] < 255
        img = img.convert('RGBA' if alpha else 'RGB')
        fmt = DXT5 if alpha else DXT1
        data = bc_blocks(img, fmt)
        # header mirrors Rockstar's own entries: bpp 4, flag 1 for DXT5, size w*h/2 (game recomputes the real size)
        entries[i] = struct.pack('<HHHBBI', img.width, img.height, fmt, 4, int(alpha), img.width * img.height // 2) + data
    out, table = bytearray(32768), [0] * 8192
    for i in sorted(entries):
        table[i] = len(out)
        out += entries[i]
    out[:32768] = struct.pack('<8192I', *table)
    open(dxt_out, 'wb').write(out)
    print(f'{len(entries)} entries ({len(overrides)} overrides) -> {dxt_out} ({len(out) >> 20} MiB)')


def sidecar(index_json, overrides, out_path):
    """overrides: {id: hd png}; index_json: extract's index (original w,h per id). Only textures that are PNGs in
    game.pak are packed: the raw ones (radar map tiles, sprite sheets) are read pixel-exact by the game and break."""
    idx = json.load(open(index_json))
    blobs = []
    for i, png in sorted(overrides.items()):
        w, h, fmt = idx[str(i)]
        if fmt != 'PNG':
            continue
        data = open(png, 'rb').read()
        bpp = 32 if Image.open(png).mode in ('RGBA', 'LA', 'P') else 24
        blobs.append((i, struct.pack('<HHHBBI', w, h, PNG, bpp, 1, len(data)) + data))
    off = 4 + 12 * len(blobs)
    with open(out_path, 'wb') as f:
        f.write(struct.pack('<I', len(blobs)))
        for i, b in blobs:
            f.write(struct.pack('<III', i, off, len(b)))
            off += len(b)
        for _, b in blobs:
            f.write(b)
    print(f'{len(blobs)} HD textures -> {out_path} ({off >> 20} MiB)')


def extract_dxt(dxt_path, out):
    """dxt.bin entries (DXT1/DXT5) -> <id>.png, decoded through Pillow's DDS reader."""
    os.makedirs(out, exist_ok=True)
    d = open(dxt_path, 'rb').read()
    tab = struct.unpack('<8192I', d[:32768])
    for i, o in enumerate(tab):
        if not o:
            continue
        w, h, fmt = struct.unpack('<HHH', d[o:o + 6])
        n = w * h // 2 if fmt == DXT1 else w * h
        dds = (b'DDS ' + struct.pack('<IIIIIII', 124, 0x1007, h, w, n, 0, 1) + b'\0' * 44
               + struct.pack('<II4sIIIII', 32, 4, b'DXT1' if fmt == DXT1 else b'DXT5', 0, 0, 0, 0, 0)
               + struct.pack('<IIIII', 0x1000, 0, 0, 0, 0))
        Image.open(io.BytesIO(dds + d[o + 12:o + 12 + n])).save(f'{out}/{i}.png')
    print(f'{sum(1 for o in tab if o)} sheets -> {out}')


def pngs(folder):
    """{id: path} for folder/<id>.png"""
    return {int(f[:-4]): os.path.join(folder, f) for f in os.listdir(folder) if f.endswith('.png') and f[:-4].isdigit()}


if __name__ == '__main__':
    cmd, *a = sys.argv[1:] or ['-h']
    if cmd == 'extract':
        extract(*a)
    elif cmd == 'extract-dxt':
        extract_dxt(*a)
    elif cmd == 'build':
        build(a[0], pngs(a[1]), a[2])
    elif cmd == 'sidecar':
        sidecar(a[0], pngs(a[1]), a[2])
    else:
        print(__doc__)
