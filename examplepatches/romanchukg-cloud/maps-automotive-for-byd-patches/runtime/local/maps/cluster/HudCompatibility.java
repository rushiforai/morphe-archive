package local.maps.cluster;

/** Receiver/firmware combination documented by the DiPlay vehicle test, plus untested builds of the same firmware family. */
final class HudCompatibility {
    static final String FIRMWARE="BYD-AUTO/IVI/IVI:13/TP1A.220624.014/eng.build20260722.221155:user/release-keys";
    /** DiLink 5.1 / Android 13 builds. Other builds pass only as UNTESTED, which needs the user's opt-in. */
    static final String FIRMWARE_FAMILY="BYD-AUTO/IVI/IVI:13/";
    static final String UNTESTED="firmware_untested";
    static final String SIGNER="efe3ca8ada0d10c655c3df9910ad2ebc121a47d9a6358434eb24074309933efc";
    static String reject(int api,String caller,String firmware,long version,boolean system,boolean applicationEnabled,
                         boolean receiverEnabled,boolean exported,String permission,int signers,String signer) {
        if(api<28)return "android_version";
        if(!BuildInfo.PACKAGE.equals(caller))return "caller_package";
        if(firmware==null||!firmware.startsWith(FIRMWARE_FAMILY))return "firmware_not_verified";
        if(version!=10601004L)return "receiver_version";
        if(!system)return "receiver_not_system";
        if(!applicationEnabled||!receiverEnabled)return "receiver_disabled";
        if(!exported)return "receiver_not_exported";
        if(permission!=null&&!permission.isEmpty())return "receiver_requires_permission";
        if(signers!=1||!SIGNER.equals(signer))return "receiver_signature";
        return FIRMWARE.equals(firmware)?null:UNTESTED;
    }
}
