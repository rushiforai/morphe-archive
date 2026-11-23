import androguard
from androguard.core.apk import APK
from androguard.core.dex import DEX

print("Testing androguard on output/Gboard_Pro.apk...")
apk = APK("output/Gboard_Pro.apk")
print("Package name:", apk.get_package())
print("Main activity:", apk.get_main_activity())
print("Activities count:", len(apk.get_activities()))
for act in apk.get_activities():
    if "Gboard" in act:
        print("Activity in manifest:", act)
