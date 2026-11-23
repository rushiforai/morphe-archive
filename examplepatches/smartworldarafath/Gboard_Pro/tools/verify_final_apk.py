import zipfile
import re
from androguard.core.apk import APK
from androguard.core.dex import DEX

apk_path = "output/Gboard_Pro.apk"
print(f"Inspecting {apk_path}...")

apk = APK(apk_path)
print("Package name:", apk.get_package())
print("Version Name:", apk.get_androidversion_name())
print("Version Code:", apk.get_androidversion_code())

# Check activities
activities = apk.get_activities()
print("Total activities:", len(activities))
for a in activities:
    if "Gboard" in a:
        print("  Activity:", a)

# Check classes in dex
classes_found = {}
target_classes = [
    "GboardPatchesSettingsActivity",
    "GboardAppearanceFeature",
    "GboardBoardUiFeature",
    "GboardAboutFeature",
    "PixelBoardUpdateFeature",
    "PixelBoardUpdateManager",
    "GboardM3Helper"
]

z = zipfile.ZipFile(apk_path)
for n in z.namelist():
    if n.endswith(".dex"):
        dex_data = z.read(n)
        d = DEX(dex_data)
        for c in d.get_classes():
            cname = c.get_name()
            for target in target_classes:
                if target in cname:
                    classes_found.setdefault(target, []).append(f"{n}: {cname}")

print("\nTarget classes verification in DEX files:")
for target in target_classes:
    found = classes_found.get(target, [])
    print(f"  {target}: {len(found)} class(es) found")

print("\nVerification complete!")
