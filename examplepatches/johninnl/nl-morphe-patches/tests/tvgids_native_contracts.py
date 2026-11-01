"""Independent ELF reader for TVgids native output verification (no publisher bytes)."""
from dataclasses import dataclass
import struct
import hashlib
import json
from pathlib import Path


ORIGINAL_SHA = '10a2672434fca0b4143e23606e83a8a5cefd6828be8808d63b1777eca7510ac7'
NATIVE_SHA = {
    'arm64-v8a': '5b9e587b8b5a23d20ae8178fe0eb8918eccf8b016a8ac12fbf518e80003ad402',
    'armeabi-v7a': '3b50a69edb9aad8053c71ea98ee70a5d0f51c14fe431dd1add05b2064dc205ce',
    'x86_64': '606abe26e33bfcf6febdcbf2854945165eb7697ab2ed6d701b675b60e93060b6',
}


ABI_FORMATS = {'arm64-v8a': (2, 183), 'armeabi-v7a': (1, 40), 'x86_64': (2, 62)}


@dataclass(frozen=True)
class LoadSegment:
    address: int
    offset: int
    file_size: int
    memory_size: int
    flags: int


@dataclass(frozen=True)
class NativeLayout:
    abi: str
    size: int
    segments: tuple[LoadSegment, ...]


def native_layout(data, abi):
    assert abi in ABI_FORMATS, f'Unexpected ABI: {abi}'
    elf_class, machine = ABI_FORMATS[abi]
    header_size, entry_size = (64, 56) if elf_class == 2 else (52, 32)
    assert len(data) >= header_size and data[:4] == b'\x7fELF', 'Invalid ELF header'
    assert data[4:7] == bytes([elf_class, 1, 1]), 'Unexpected ELF class/endian/version'
    assert struct.unpack_from('<HHI', data, 16) == (3, machine, 1), 'Unexpected ELF machine/type/version'
    if elf_class == 2:
        table, = struct.unpack_from('<Q', data, 32)
        actual_header, actual_entry, count = struct.unpack_from('<HHH', data, 52)
        pattern = '<IIQQQQQQ'
    else:
        table, = struct.unpack_from('<I', data, 28)
        actual_header, actual_entry, count = struct.unpack_from('<HHH', data, 40)
        pattern = '<IIIIIIII'
    assert actual_header == header_size, 'Unexpected ELF header size'
    assert actual_entry == entry_size and 0 < count < 0xffff, 'Unsupported program table'
    assert header_size <= table <= len(data) and count * entry_size <= len(data)-table, 'Truncated program table'
    segments = []
    for index in range(count):
        entry = struct.unpack_from(pattern, data, table+index*entry_size)
        if elf_class == 2:
            kind, flags, offset, address, _, file_size, memory_size, alignment = entry
        else:
            kind, offset, address, _, file_size, memory_size, flags, alignment = entry
        if kind != 1:
            continue
        assert offset <= len(data) and file_size <= len(data)-offset, 'Segment outside file'
        assert file_size <= memory_size and address <= (1 << 63)-1-memory_size, 'Invalid virtual range'
        assert alignment <= 1 or alignment & (alignment-1) == 0, 'Invalid segment alignment'
        assert alignment <= 1 or offset % alignment == address % alignment, 'Unaligned segment mapping'
        segments.append(LoadSegment(address, offset, file_size, memory_size, flags))
    return NativeLayout(abi, len(data), tuple(segments))


def executable_offset(layout, address, size):
    assert size > 0 and 0 <= address <= (1 << 63)-1-size, 'Invalid native range'
    matches = [segment for segment in layout.segments
               if segment.flags & 1 and segment.address <= address
               and address-segment.address+size <= segment.file_size]
    assert len(matches) == 1, 'Range is not uniquely file-backed executable code'
    segment, = matches
    return segment.offset+address-segment.address


def verify_ad_output(abi, original, output, expected_original_sha256, *, tracking=False, consent=False):
    assert not consent or tracking, 'Consent policy requires tracking'
    edits = json.loads(Path(__file__).with_name('tvgids_ad_native_edits.json').read_text())[abi]
    if tracking:
        edits += json.loads(Path(__file__).with_name('tvgids_tracking_native_edits.json').read_text())[abi]
    if consent:
        edits += json.loads(Path(__file__).with_name('tvgids_consent_native_edits.json').read_text())[abi]
    assert hashlib.sha256(original).hexdigest() == expected_original_sha256, 'Unexpected original image'
    assert len(output) == len(original), 'Native image size changed'
    layout = native_layout(original, abi)
    restored = bytearray(output)
    owned = set()
    for edit in edits:
        size, at = edit['size'], edit['address']
        offset = executable_offset(layout, at, size)
        assert hashlib.sha256(original[offset:offset+size]).hexdigest() == edit['sha256'], 'Original owner changed'
        before, after = bytes.fromhex(edit['before']), bytes.fromhex(edit['after'])
        assert len(before) == len(after) > 0
        assert at <= edit['at'] and edit['at']+len(before) <= at+size
        offset = executable_offset(layout, edit['at'], len(before))
        indexes = set(range(offset, offset+len(before)))
        assert not owned & indexes, 'Overlapping native ownership'
        owned.update(indexes)
        assert original[offset:offset+len(before)] == before, 'Original preimage changed'
        assert output[offset:offset+len(after)] == after, 'Required native effect missing'
        restored[offset:offset+len(before)] = before
    assert bytes(restored) == original, 'Native bytes changed outside declared ownership'
