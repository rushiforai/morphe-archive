from androguard.core.apk import APK
from androguard.core.dex import DEX
import zipfile

z = zipfile.ZipFile("output/Gboard_Pro.apk")
for dex_name in z.namelist():
    if dex_name.endswith(".dex"):
        dex_bytes = z.read(dex_name)
        d = DEX(dex_bytes)
        for c in d.get_classes():
            name = c.get_name()
            if "GboardAboutActivity" in name or "GboardAppearanceActivity" in name:
                print(f"{dex_name}: {name} (super={c.get_superclassname()})")
