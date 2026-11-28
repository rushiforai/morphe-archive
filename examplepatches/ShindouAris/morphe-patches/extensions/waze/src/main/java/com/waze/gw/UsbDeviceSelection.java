package com.waze.gw;

/** Pure USB selection rules shared by persistence and Android device lookup. */
final class UsbDeviceSelection {
    private UsbDeviceSelection() { }

    static boolean hasValidIds(int vid, int pid) {
        return vid > 0 && pid > 0;
    }

    static boolean isMatch(int targetVid, int targetPid, int vid, int pid) {
        return hasValidIds(targetVid, targetPid) && targetVid == vid && targetPid == pid;
    }
}
