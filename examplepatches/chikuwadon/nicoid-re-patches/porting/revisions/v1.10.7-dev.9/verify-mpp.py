#!/usr/bin/env python3
"""Verify shipped MPP identity, exact processed payload and user-visible version."""
from pathlib import Path
from zipfile import ZipFile
import glob, hashlib, struct, sys
version=sys.argv[1]
bundle=Path(f"patches/build/libs/patches-{version}.mpp")
assert bundle.is_file() and bundle.stat().st_size > 0, f"Release MPP missing: {bundle}"
with ZipFile(bundle) as z:
    assert z.testzip() is None
    manifest=z.read("META-INF/MANIFEST.MF").decode()
    assert "Version: "+version+"\r\n" in manifest or "Version: "+version+"\n" in manifest
    for name in ("nicoid/helpers.mpe","nicoid/method-delta.dex"):
        shipped=z.read(name)
        generated=Path("patches/src/main/resources")/name
        assert shipped==generated.read_bytes(), f"MPP contained stale {name}"
    data=z.read("nicoid/helpers.mpe")
    assert data.startswith(b"dex\n")
    size,offset=struct.unpack_from("<II",data,0x38)
    strings=set()
    for i in range(size):
        pos=struct.unpack_from("<I",data,offset+4*i)[0]
        while data[pos]&0x80: pos+=1
        pos+=1
        end=data.index(b"\x00",pos)
        strings.add(data[pos:end].decode("utf-8","replace"))
    assert version in strings, "Shipped helper dex has stale PatchVersion value"
    assert "v"+version+" @chikuwadon" in strings, "Shipped helper dex has stale ModernShorts version"
    class_size,class_offset=struct.unpack_from("<II",data,0x60)
    type_size,type_offset=struct.unpack_from("<II",data,0x40)
    string_count,string_offset=struct.unpack_from("<II",data,0x38)
    decoded=[]
    for index in range(string_count):
        pos=struct.unpack_from("<I",data,string_offset+index*4)[0]
        while data[pos]&0x80: pos+=1
        pos+=1
        decoded.append(data[pos:data.index(b"\x00",pos)].decode("utf-8","replace"))
    type_names=[decoded[struct.unpack_from("<I",data,type_offset+i*4)[0]]
                for i in range(type_size)]
    classes=[type_names[struct.unpack_from("<I",data,class_offset+i*32)[0]]
             for i in range(class_size)]
    included=[cls for cls in classes if cls.startswith("Le/e/a/BikeRun")]
    assert len(included)==22, f"Missing validated runtime class: {len(included)} of 22"
    assert "Le/e/a/BikeRun$Track;" in included
    assert "Le/e/a/BikeRunModel;" in included
    assert " v1.4.3" in strings or "v1.4.3" in strings, "Validated runtime version missing"
    for name in ("SCROLL_RESTORES", "DIRTY_ADAPTERS", "REFRESH_ARTWORK", "updateSummaries"):
        assert name in strings, "Shipped helper DEX is missing optimized member " + name
    for name in ("Le/e/a/Dev128;","Le/e/a/GestureTurnPolicy128;","Le/e/a/Dev130;","Le/e/a/Dev131;","Le/e/a/Dev132;","Le/e/a/RankingTabIdentity133;","Le/e/a/Dev134;","Le/e/a/Dev111;","Le/e/a/Dev112;","Le/e/a/Dev113;","Le/e/a/Dev114;","Le/e/a/Dev115;","Le/e/a/Dev116;","Le/e/a/Dev117;","Le/e/a/Dev118;","Le/e/a/Dev119;","Le/e/a/Dev120;","Le/e/a/PlaylistUrlParser;"):
        assert name in strings, "Shipped helper DEX missing "+name
    assert "gesture_vertical_reversal_enabled" in strings, "Shipped MPP missing issue #113 preference key"
    assert "nicoid_audio_focus_enabled" in strings, "Shipped MPP missing audio focus preference key"
    for option in ("addRankingLabel","addRankingTab","ランキング","https://www.nicovideo.jp/ranking/genre/all?term=hour"):
        assert option in strings, "Shipped MPP missing ranking add-tab route: "+option
    for option in ("addtab","タブを追加","nicoid_app_resume_playback","roundSettings"):
        assert option in strings, "Shipped MPP missing v1.10.7 feature: "+option
    for option in ("nicoid_tab_bar_buttons", "tablist", "タブバーのボタン表示", "直前に閉じたタブを復元"):
        assert option in strings, "Shipped MPP missing vertical tab manager: " + option
    assert any("左端の一覧ボタンでタブの切替・管理" in text for text in strings), "Settings button help text missing"
    assert "OFFの場合、上下方向のみの操作をジェスチャーとして認識せず、スクロールを継続します" in strings, "Issue #113 Japanese description missing"
print("PASS: shipped MPP manifest, byte-exact helper resources and runtime version",version)
