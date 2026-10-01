import collections, logging, sys
logging.disable(logging.CRITICAL)
from loguru import logger; logger.remove()
from androguard.core.apk import APK
from androguard.core.dex import DEX
a = APK("mmc.apk")
print("pkg", a.get_package(), "ver", a.get_androidversion_name(), a.get_androidversion_code(), "min", a.get_min_sdk_version(), "target", a.get_target_sdk_version())
print("main", a.get_main_activity())
print("ACTIVITIES"); [print(" ", x) for x in a.get_activities()]
print("PROVIDERS"); [print(" ", x) for x in a.get_providers()]
print("SERVICES"); [print(" ", x) for x in a.get_services()]
print("RECEIVERS"); [print(" ", x) for x in a.get_receivers()]
cnt = collections.Counter()
for i, d in enumerate(a.get_all_dex()):
    dx = DEX(d)
    for c in dx.get_classes():
        n = c.get_name()[1:].split("/")
        cnt["/".join(n[:3])] += 1
for k, v in sorted(cnt.items()):
    print(f"{v:6d} {k}")
