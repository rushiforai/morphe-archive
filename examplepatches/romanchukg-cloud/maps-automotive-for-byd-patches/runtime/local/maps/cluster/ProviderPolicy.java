// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

/** Provider availability only. It never reads accounts or tokens. */
public final class ProviderPolicy {
    public static final long MIN_VERSION=255070218L;
    public enum State { READY, MISSING, DISABLED, OUTDATED, UNTRUSTED, INCOMPLETE }
    public static State evaluate(boolean installed,boolean enabled,boolean trusted,long version,boolean auth,boolean accounts,boolean location) {
        if(!installed)return State.MISSING;
        if(!trusted)return State.UNTRUSTED;
        if(!enabled)return State.DISABLED;
        if(version<MIN_VERSION)return State.OUTDATED;
        return auth&&accounts&&location?State.READY:State.INCOMPLETE;
    }
    public static int availability(State state) {
        switch(state){case READY:return 0;case MISSING:return 1;case OUTDATED:return 2;case DISABLED:return 3;default:return 9;}
    }
    /** ConnectionResult codes that availability() reports for a provider problem. */
    public static boolean providerError(int code) {
        return code==1||code==2||code==3||code==9;
    }
}
