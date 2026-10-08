/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.privacy;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.net.NetworkCapabilities;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.Settings;

import java.lang.reflect.Method;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;

/**
 * The reads TikTok makes about this device, answered without handing it the real value while the
 * matching switch is on: what you copied, whether you're on a VPN, and the advertising id with
 * its limit ad tracking flag.
 *
 * <p>One method per intercepted signature, each returning what the call site expects. A single
 * helper returning {@link ClipData} for all three clipboard reads handed a ClipData back where
 * getText's CharSequence and hasPrimaryClip's boolean were expected, and the verifier rejects that
 * class as soon as it loads rather than failing at the call. The VPN and advertising-id intercepts
 * keep to the same rule.
 *
 * <p>Each switch is read at the call, so none needs a restart, and a switch answers off while
 * Hushfeed is paused, so a paused build hands TikTok its real clipboard, VPN state and id.
 */
@SuppressWarnings("unused")
public final class DevicePrivacyGuard {

    /** What Android hands back for the advertising id once the user has deleted it. */
    private static final String BLANK_ADVERTISING_ID = "00000000-0000-0000-0000-000000000000";

    private static boolean blocks(String what) {
        if (Utils.getContext() != null && !Settings.BLOCK_CLIPBOARD_READS.get()) return false;
        Logger.printInfo(() -> "Device privacy guard: " + what);
        return true;
    }

    public static ClipData interceptPrimaryClip(ClipboardManager manager) {
        if (blocks("blocked a getPrimaryClip read")) return null;
        return manager.getPrimaryClip();
    }

    public static CharSequence interceptClipboardText(ClipboardManager manager) {
        if (blocks("blocked a getText read")) return "";
        return manager.getText();
    }

    public static boolean interceptHasPrimaryClip(ClipboardManager manager) {
        if (blocks("answered hasPrimaryClip as false")) return false;
        return manager.hasPrimaryClip();
    }

    // --- VPN ---

    /**
     * Off-by-default switches answer off until the extension has a context: TikTok checks its
     * connection early in startup, and reading a setting before then would load Settings without
     * its preferences.
     */
    private static boolean hidesVpn(String what) {
        if (Utils.getContext() == null || !Settings.HIDE_VPN.get()) return false;
        Logger.printInfo(() -> "Device privacy guard: " + what);
        return true;
    }

    /**
     * Only the VPN transport is answered false, and only while the switch is on. Every other
     * transport, and the real VPN answer while the switch is off, comes straight from the system.
     */
    public static boolean interceptHasTransport(NetworkCapabilities capabilities, int transport) {
        if (transport == NetworkCapabilities.TRANSPORT_VPN && hidesVpn("answered hasTransport(VPN) as false")) {
            return false;
        }
        return capabilities.hasTransport(transport);
    }

    /**
     * The interface list with the tunnel devices a VPN adds taken out, so code that walks the list
     * looking for one never sees it. Every other interface stays, and with the switch off the real
     * list comes back untouched.
     */
    public static Enumeration<NetworkInterface> interceptNetworkInterfaces() throws SocketException {
        Enumeration<NetworkInterface> all = NetworkInterface.getNetworkInterfaces();
        if (all == null || !hidesVpn("hid the VPN network interfaces")) return all;
        ArrayList<NetworkInterface> kept = new ArrayList<>();
        while (all.hasMoreElements()) {
            NetworkInterface candidate = all.nextElement();
            if (!isVpnInterfaceName(candidate.getName())) kept.add(candidate);
        }
        return Collections.enumeration(kept);
    }

    /** tun, ppp, ipsec and wg are the names a VPN tunnel interface takes. */
    static boolean isVpnInterfaceName(String name) {
        if (name == null) return false;
        return name.startsWith("tun") || name.startsWith("ppp")
                || name.startsWith("ipsec") || name.startsWith("wg");
    }

    // --- Advertising id ---

    /**
     * Whether the advertising id switch is on, read at the call. It answers off until the
     * extension has a context, since TikTok's ad SDKs read the id early in startup, and off while
     * Hushfeed is paused.
     */
    private static boolean blocksAdvertisingId(String what) {
        if (!(Utils.getContext() != null && Settings.BLOCK_ADVERTISING_ID.get())) return false;
        Logger.printInfo(() -> "Device privacy guard: " + what);
        return true;
    }

    /**
     * The advertising id lookup, answered with the blank id Android gives once the user has deleted
     * it while the switch is on. The call site hands its {@code AdvertisingIdClient.Info} in as an
     * Object, since the extension does not compile against Play Services; the real id is read back
     * off it by reflection only when the switch is off.
     */
    public static String interceptAdvertisingId(Object info) {
        if (blocksAdvertisingId("answered the advertising id as blank")) return BLANK_ADVERTISING_ID;
        return realAdvertisingId(info);
    }

    /**
     * An id read without Info.getId: off the reply of Google's advertising id service, which two
     * SDKs inside TikTok ask directly, or off Info's id field. The blank id while the switch is on,
     * the id the read produced otherwise.
     */
    public static String interceptAdvertisingIdRead(String id) {
        if (blocksAdvertisingId("answered a direct advertising id read as blank")) return BLANK_ADVERTISING_ID;
        return id;
    }

    /**
     * Whether ad tracking is limited, as the service's reply carries it: an int, nonzero for
     * limited. 1 while the switch is on, which is what Android answers once the user has deleted
     * the id or opted out of ads personalization.
     */
    public static int interceptLimitAdTrackingReply(int limited) {
        if (blocksAdvertisingId("answered a direct limit ad tracking read as limited")) return 1;
        return limited;
    }

    /**
     * The same flag read off Info's field, where R8 inlined isLimitAdTrackingEnabled: limited
     * while the switch is on, the real answer otherwise.
     */
    public static boolean interceptLimitAdTracking(boolean limited) {
        if (blocksAdvertisingId("answered limit ad tracking as limited")) return true;
        return limited;
    }

    private static String realAdvertisingId(Object info) {
        if (info == null) return null;
        try {
            Method getId = info.getClass().getMethod("getId");
            Object value = getId.invoke(info);
            return value == null ? null : value.toString();
        } catch (Throwable ignored) {
            return null;
        }
    }

    private DevicePrivacyGuard() {}
}
