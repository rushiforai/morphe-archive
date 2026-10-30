// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

/** Inspected read-only BYD values and bounded shell-sample freshness. No energy-unit inference. */
public final class VehicleReadingRules {
    public static final long MAX_AGE_MS=90000, LEASE_MS=300000;
    public static final int MAX_CYCLES=60, PERIOD_MS=60000;

    private VehicleReadingRules() {}

    /** Legacy one-session invocation remains bounded; only this exact flag opts in. */
    public static boolean continuousMode(String[] args) {
        if(args==null||args.length<1||args.length>2||args[0]==null
                ||!args[0].matches("[a-f0-9]{32}")
                ||args.length==2&&!"--continuous".equals(args[1]))
            throw new SecurityException("Authorized ADB reader session required");
        return args.length==2;
    }

    public static boolean continueSampling(boolean continuous,int cycles,long elapsed) {
        return cycles>=0&&elapsed>=0&&(continuous||cycles<MAX_CYCLES&&elapsed<LEASE_MS);
    }

    public static boolean percent(double value) {
        return Double.isFinite(value) && value>=0 && value<=100;
    }

    public static boolean range(double value) {
        return Double.isFinite(value) && value>=0 && value<=3000
                && value==Math.rint(value) && value!=1000 && value!=1023;
    }

    public static String cable(int code) {
        switch(code) {
            case 1:return "Disconnected";
            // Presence is diagnostic only: AC/DC/V2L meanings are not verified on this firmware.
            case 2:case 3:case 4:case 5:return "Connected (code "+code+")";
            default:return "Unknown";
        }
    }

    public static String charging(int code) {
        switch(code) {
            case 0:return "Ready";
            case 1:return "Charging";
            case 2:return "Finished";
            case 3:return "Discharging";
            case 4:return "Terminated";
            case 9:return "Scheduled";
            case 13:return "Paused";
            default:return "Unknown";
        }
    }

    public static String port(int code) {
        return code==0?"Closed":code==1?"Open":"Unknown";
    }

    public static boolean trustedSender(int uid,boolean dumpGranted) {
        return uid==2000 && dumpGranted;
    }

    /** Age starts at source capture, never at receipt; a lease cannot cross a boot. */
    public static boolean fresh(long captured,long received,long now,int sampleBoot,
            int currentBoot,long leaseDeadline) {
        return captured>=0 && received>=0 && now>=0 && leaseDeadline>=0
                && captured<=received && received<=now
                && sampleBoot>=0 && currentBoot>=0 && sampleBoot==currentBoot
                && now-captured<=MAX_AGE_MS && now<leaseDeadline;
    }
}
