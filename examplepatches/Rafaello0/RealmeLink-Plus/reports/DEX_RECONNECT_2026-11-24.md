# Target APK verification and reconnect follow-up

APK SHA-256 d1f2a5d8f8fc0d6c4098fb8aff6ec830af42e92ffd9822563f5c8660a650a2ce (matches RESEARCH.md); version 5.8.811.2814, minSdk 33, targetSdk 36.

Verified in DEX:
- classes40.dex CallbackManager.Q(Device, BaseCallbackData) decodes ConnectStatusData then calls static O(Device, ConnectStatus). O dispatches callbacks via Handler; hook now independent of activity/presenter lifetime.
- HeadsetManagerProxy.x retains query callback via WeakReference; runtime now retains callback until response/timeout.
- HeadsetManagerProxy.connectDevice(Device) delegates to the existing permission-checked two-argument connection API.
- classes37.dex DeviceDomainDataSourceHelper.S(), R(String) loads DeviceDomain via Observable.blockingFirst; Util.s(DeviceDomain) returns vendor Device. Lookup is off-main; exact MAC and HEADSET type checked.
- Manifest has BLUETOOTH_CONNECT and separate :link.monitor service. Added receiver and bounded JobService in main process; protected action, permission, active profile, fresh event, same MAC. No changes to vendor monitor or firmware. Android force-stop/OEM restrictions remain. Physical testing required.

Single tap: ItemFactory.M constructs action rows from KeyAction.getActionType and getOptionValues, then c/d/e map ITEM_ACTION_SINGLE_CLICK to the existing icon/title/gesture ID. No defect established in these mappings; do not invent support or gesture values. Exact malfunction and device-side behavior need reproduction.

Low battery: realme_common_headset_low_energy_tips is referenced by HeadsetManagerDelegate.canStartOTA. LDHeadSetManager.notifyBatterLevelLow calls OTA listener. These are firmware-update safeguards, not confirmed user-facing discharge notifications. HeadsetNotificationManager.k creates pairing/binding notifications, not low-battery notifications. Do not disable any of those. Need actual notification/channel or acoustic alert reproduction. No claim of fixing either feature.
