"""Verify newspaper navigation removal against independent original app bodies."""
import json
from pathlib import Path

from mediahuis_emitted import code, digest, remove_instructions, run_boundary

NEWSPAPER = "Hide newspaper navigation"
BRANDS = {
    "hbvl": ("MhbeHbvlBrandInfo", "5e479e695b91b1c47f0a14b7b3b601e627fb3e08b970211cf019473be6cc842a"),
    "gva": ("MhbeGvaBrandInfo", "9f499af16e5091007da0ece5550cf6713e3bd05bd805f2b6b87f36aa1c82928f"),
}
BANNER = ("com/mediahuis/oneapps/cueappsdk/data/settings/datasources/EpaperMenuDataSource",
          "getEpaperBanner$co_novemberfive_mediahuis_cueappsdk()Lcom/mediahuis/oneapps/cueappsdk/domain/external/menu/models/nav2/MenuItemComponent;")
BANNER_HASH = "278f59e7edfc05c4161947c5ca04e26a85d256aa193871f17ac89a0e6f21dcea"
PRESERVED = [
    ("be/mediahuis/core/domain/usecases/ui/GetBottomTabsUseCase", "execute()Ljava/util/List;",
     "f3a4391f118865922e0e0749988e9aa13d7271084355a7a67b9ae574a63cc925"),
    ("com/mediahuis/oneapps/cueappsdk/data/settings/datasources/AppMenuDataSource",
     "getAppMenu$co_novemberfive_mediahuis_cueappsdk()Ljava/util/List;",
     "2d5e8b1cb8227ca6719883891d6046d9cc344185d77734f75a019cc718ecc0e3"),
]


def verify_newspaper_navigation(root, enabled, app):
    original = json.loads(Path(__file__).with_name("fixtures").joinpath("mediahuis_bottom_tabs.json").read_text())
    expected = [tab for tab in original if tab["deeplink"] != "onep://epaper"] if enabled else original
    actual = json.loads((root / "res/raw/bottom_tabs.json").read_text())
    assert actual == expected, "Remove only De krant; preserve remaining tab objects, routes and order"
    for name, (brand, expected_hash) in BRANDS.items():
        owner = "com/mediahuis/oneapps/cueappsdk/data/config/brandinfo/models/" + brand
        lines = code(root, owner, "getHasEPaperCapabilities()Z")
        if enabled and name == app:
            assert run_boundary(lines[:2]) == 0 and lines[1].startswith("return "), "Remove Krant settings/menu capability"
            lines = remove_instructions(lines, 0, 2)
        assert digest(lines) == expected_hash, (name, "Preserve original own/sibling brand body")
    lines = code(root, *BANNER)
    if enabled:
        assert run_boundary(lines[:2]) == 0 and lines[1].startswith("return-object "), "Remove complete newspaper Menu card"
        lines = remove_instructions(lines, 0, 2)
    assert digest(lines) == BANNER_HASH, "Preserve original newspaper banner body when disabled"
    for owner, signature, expected_hash in PRESERVED:
        assert digest(code(root, owner, signature)) == expected_hash, "Preserve non-newspaper navigation builders"
