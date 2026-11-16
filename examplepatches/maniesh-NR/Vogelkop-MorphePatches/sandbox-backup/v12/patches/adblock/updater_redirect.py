"""v12: blocklist updater redirects lists to their original maintainers.

Opera's updater fetches content-addressed blobs from
https://blocklists.operacdn.com/<sha256>; the manifest (assets-only) pins the
hashes, so lists can never change between app updates. v12 redirects each
list's fetch to the maintainer's live URL (uBlock-Origin-style), normalizes
the payload to gzip (the engine stores/serves gzipped lists), and stores it
under the manifest hash so the engine/DB stay consistent.

Four patches (all in classes3):
  AB.1  f9: add static hash->URL map (<clinit> + fields V/W) + u()/v() helpers
  AB.2  f9 pswitch_6bf: resolve the fetch URL through f9.u (map, CDN fallback)
  AB.3  cv2 pswitch_3a4: normalize response body to gzip via f9.v
  AB.4  lj3.b: accept content whose digest differs from the manifest hash
        (mandatory for live upstream content; file is still stored under the
        requested hash name)
"""
import json
import os

from common import Patch

HERE = os.path.dirname(os.path.abspath(__file__))


def _map():
    with open(os.path.join(HERE, "updater_map.json"), encoding="utf-8") as f:
        m = json.load(f)
    # stable order
    return sorted(m.items(), key=lambda kv: kv[1]["id"])


def _smali_map_and_helpers():
    entries = _map()
    hashes = [h for h, _ in entries]
    urls = [e["url"] for _, e in entries]
    out = []
    out.append(
        '.field private static final V:[Ljava/lang/String;\n\n'
        '.field private static final W:[Ljava/lang/String;\n')
    # <clinit>
    out.append('.method static constructor <clinit>()V\n    .registers 4\n\n')
    out.append(f'    const/{_slen(len(hashes))} v0, {hex(len(hashes))}\n\n'
               '    new-array v0, v0, [Ljava/lang/String;\n\n')
    for i, h in enumerate(hashes):
        out.append(f'    const-string v1, "{h}"\n\n')
        out.append(f'    const/{_slen(i)} v2, {hex(i)}\n\n'
                   '    aput-object v1, v0, v2\n\n')
    out.append('    sput-object v0, Lf9;->V:[Ljava/lang/String;\n\n')
    out.append(f'    const/{_slen(len(urls))} v0, {hex(len(urls))}\n\n'
               '    new-array v0, v0, [Ljava/lang/String;\n\n')
    for i, u in enumerate(urls):
        out.append(f'    const-string v1, "{u}"\n\n')
        out.append(f'    const/{_slen(i)} v2, {hex(i)}\n\n'
                   '    aput-object v1, v0, v2\n\n')
    out.append('    sput-object v0, Lf9;->W:[Ljava/lang/String;\n\n')
    out.append('    return-void\n.end method\n\n')
    # u(url, hash) -> mapped or url
    out.append(
        '.method public static u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;\n'
        '    .registers 6\n\n'
        '    sget-object v0, Lf9;->V:[Ljava/lang/String;\n\n'
        '    const/4 v1, 0x0\n\n'
        '    :goto_0\n'
        '    array-length v2, v0\n\n'
        '    if-ge v1, v2, :cond_0\n\n'
        '    aget-object v2, v0, v1\n\n'
        '    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z\n\n'
        '    move-result v2\n\n'
        '    if-eqz v2, :cond_1\n\n'
        '    sget-object v2, Lf9;->W:[Ljava/lang/String;\n\n'
        '    aget-object v2, v2, v1\n\n'
        '    return-object v2\n\n'
        '    :cond_1\n'
        '    add-int/lit8 v1, v1, 0x1\n\n'
        '    goto :goto_0\n\n'
        '    :cond_0\n'
        '    return-object p0\n'
        '.end method\n\n')
    # v(stream) -> gzip-normalized stream
    out.append(
        '.method public static v(Ljava/io/InputStream;)Ljava/io/InputStream;\n'
        '    .registers 8\n\n'
        '    new-instance v0, Ljava/io/ByteArrayOutputStream;\n\n'
        '    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V\n\n'
        '    const/16 v1, 0x2000\n\n'
        '    new-array v1, v1, [B\n\n'
        '    :goto_0\n'
        '    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I\n\n'
        '    move-result v2\n\n'
        '    const/4 v3, -0x1\n\n'
        '    if-eq v2, v3, :cond_0\n\n'
        '    const/4 v3, 0x0\n\n'
        '    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V\n\n'
        '    goto :goto_0\n\n'
        '    :cond_0\n'
        '    invoke-virtual {p0}, Ljava/io/InputStream;->close()V\n\n'
        '    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B\n\n'
        '    move-result-object v1\n\n'
        '    array-length v2, v1\n\n'
        '    const/4 v3, 0x2\n\n'
        '    if-lt v2, v3, :cond_2\n\n'
        '    const/4 v2, 0x0\n\n'
        '    aget-byte v2, v1, v2\n\n'
        '    const/16 v4, 0x1f\n\n'
        '    if-ne v2, v4, :cond_2\n\n'
        '    const/4 v2, 0x1\n\n'
        '    aget-byte v2, v1, v2\n\n'
        '    const/16 v4, -0x75\n\n'
        '    if-ne v2, v4, :cond_2\n\n'
        '    new-instance v2, Ljava/io/ByteArrayInputStream;\n\n'
        '    invoke-direct {v2, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V\n\n'
        '    return-object v2\n\n'
        '    :cond_2\n'
        '    :try_start_0\n'
        '    new-instance v2, Ljava/io/ByteArrayOutputStream;\n\n'
        '    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V\n\n'
        '    new-instance v3, Ljava/util/zip/GZIPOutputStream;\n\n'
        '    invoke-direct {v3, v2}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V\n\n'
        '    invoke-virtual {v3, v1}, Ljava/util/zip/GZIPOutputStream;->write([B)V\n\n'
        '    invoke-virtual {v3}, Ljava/util/zip/GZIPOutputStream;->close()V\n\n'
        '    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B\n\n'
        '    move-result-object v1\n\n'
        '    :try_end_0\n'
        '    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0\n\n'
        '    new-instance v2, Ljava/io/ByteArrayInputStream;\n\n'
        '    invoke-direct {v2, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V\n\n'
        '    return-object v2\n\n'
        '    :catch_0\n'
        '    move-exception v2\n\n'
        '    new-instance v2, Ljava/io/ByteArrayInputStream;\n\n'
        '    invoke-direct {v2, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V\n\n'
        '    return-object v2\n'
        '.end method\n')
    return "".join(out)


def _slen(i):
    """const/4 fits -8..7; use const/16 for the rest."""
    return "4" if -8 <= i <= 7 else "16"


def register(reg, ver):
    # AB.1 — inject map + helpers into f9 (fields/methods right after .source)
    reg.append(Patch(
        "AB.1", "adblock", "f9: hash->maintainer URL map + u()/v() helpers", ver,
        "c3/f9.smali",
        '.class public final synthetic Lf9;\n'
        '.super Ljava/lang/Object;\n'
        '.source "SourceFile"\n',
        '.class public final synthetic Lf9;\n'
        '.super Ljava/lang/Object;\n'
        '.source "SourceFile"\n\n'
        + _smali_map_and_helpers(),
        count=1,
        verify=".method public static u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;",
        note="map built from patches/adblock/updater_map.json (37 verified URLs)"))

    # AB.2 — route the fetch URL through the map
    reg.append(Patch(
        "AB.2", "adblock", "f9: fetch URL resolved via u() (maintainer, CDN fallback)", ver,
        "c3/f9.smali",
        """    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lfvh;->h(Ljava/lang/String;)V""",
        """    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v9}, Lf9;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lfvh;->h(Ljava/lang/String;)V""",
        count=1, verify_absent="old",
        note="v1=base+hash URL, v9=manifest hash; unmapped hashes keep Opera CDN"))

    # AB.3 — normalize response body to gzip before lj3.b stores it
    reg.append(Patch(
        "AB.3", "adblock", "cv2: response body gzip-normalized (engine expects .gz)", ver,
        "c3/cv2.smali",
        """    invoke-virtual {v1}, Lvzh;->byteStream()Ljava/io/InputStream;

    move-result-object v1""",
        """    invoke-virtual {v1}, Lvzh;->byteStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1}, Lf9;->v(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v1""",
        count=1,
        verify="invoke-static {v1}, Lf9;->v(Ljava/io/InputStream;)Ljava/io/InputStream;",
        note="plain-text maintainer payloads are gzipped; already-gzip passes through"))

    # AB.4 — accept upstream content under the manifest hash name
    reg.append(Patch(
        "AB.4", "adblock", "lj3.b: checksum gate accepts live upstream content", ver,
        "c3/lj3.smali",
        """    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3""",
        """    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    const/4 v3, 0x1""",
        count=1,
        verify="move-result v3\n\n    const/4 v3, 0x1",
        note="SHA256 no longer blocks storage; file stored under requested hash name"))
