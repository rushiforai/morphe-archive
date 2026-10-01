/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.extension.fotmob.plus;

import static hoodles.morphe.extension.shared.Utils.smaliClassToJava;

import java.lang.reflect.Constructor;
import java.util.Date;
import java.util.Map;

import app.morphe.extension.shared.Logger;

@SuppressWarnings("unused")
public final class EnablePlusPatch {
    private static final String ENTITLEMENT_INFO_CLASS = "com.revenuecat.purchases.EntitlementInfo";
    public static String PERIOD_TYPE_CLASS = "";
    public static String STORE_TYPE_CLASS = "";
    public static String OWNERSHIP_TYPE_CLASS = "";
    public static String VERIFIED_TYPE_CLASS = "";

    private static final long YEAR_IN_MS = 31536000000L;
    private static final Date now;
    private static final Date expiry;

    static {
        now = new Date();
        expiry = new Date(now.getTime() + YEAR_IN_MS);
    }

    public static void addEntitlement(Map infoMap) {
        try {
            Class<?> infoClass = Class.forName(ENTITLEMENT_INFO_CLASS);
            Class<?> periodClass = Class.forName(smaliClassToJava(PERIOD_TYPE_CLASS));
            Class<?> storeClass = Class.forName(smaliClassToJava(STORE_TYPE_CLASS));
            Class<?> ownershipClass = Class.forName(smaliClassToJava(OWNERSHIP_TYPE_CLASS));
            Class<?> verifiedClass = Class.forName(smaliClassToJava(VERIFIED_TYPE_CLASS));

            Object period = periodClass.getField("NORMAL").get(null);
            Object store = storeClass.getField("PLAY_STORE").get(null);
            Object ownership = ownershipClass.getField("PURCHASED").get(null);
            Object verified = verifiedClass.getField("VERIFIED").get(null);

            Constructor<?> ctor = infoClass.getConstructors()[0];

            Object info = ctor.newInstance("FotMob+", true, false, period, now, now, expiry, store, "fotmob_membership", null, false, null, null, ownership, null, verified);
            infoMap.put("FotMob+", info);
        } catch (Exception ex) {
            Logger.printException(() -> "Failed creating Entitlement", ex);
        }
    }
}