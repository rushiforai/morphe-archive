package defpackage;

import android.adservices.common.AdData;
import android.adservices.common.AdSelectionSignals;
import android.adservices.common.AdTechIdentifier;
import android.adservices.customaudience.CustomAudience;
import android.adservices.customaudience.CustomAudienceManager;
import android.adservices.customaudience.JoinCustomAudienceRequest;
import android.adservices.customaudience.TrustedBiddingData;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import java.util.concurrent.Executors;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qx8 {
    public static final qx8 a = new qx8();
    public static final String b = "Fledge: ".concat(qx8.class.getSimpleName());
    public static boolean c;
    public static boolean d;
    public static CustomAudienceManager e;
    public static pe5 f;
    public static String g;

    public static final void a() {
        String string;
        if (ec2.a.contains(qx8.class)) {
            return;
        }
        try {
            d = true;
            Context contextA = f94.a();
            f = new pe5(contextA);
            g = "https://www." + f94.s + "/privacy_sandbox/pa/logic";
            try {
                CustomAudienceManager customAudienceManager = CustomAudienceManager.get(contextA);
                e = customAudienceManager;
                if (customAudienceManager != null) {
                    c = true;
                }
                string = null;
            } catch (Error e2) {
                string = e2.toString();
                Log.w(b, "Failed to get CustomAudienceManager: " + e2);
            } catch (Exception e3) {
                string = e3.toString();
                Log.w(b, "Failed to get CustomAudienceManager: " + e3);
            }
            if (c) {
                return;
            }
            pe5 pe5Var = f;
            if (pe5Var == null) {
                g76.g0("gpsDebugLogger");
                throw null;
            }
            Bundle bundle = new Bundle();
            bundle.putString("gps_pa_failed_reason", string);
            pe5Var.a("gps_pa_failed", bundle);
        } catch (Throwable th) {
            ec2.a(qx8.class, th);
        }
    }

    public final void b(String str, String str2) {
        String str3 = b;
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            String strC = c(str, str2);
            if (strC == null) {
                return;
            }
            try {
                try {
                    ne5 ne5Var = new ne5(1);
                    AdData.Builder builder = new AdData.Builder();
                    String str4 = g;
                    if (str4 == null) {
                        g76.g0("baseUri");
                        throw null;
                    }
                    Uri uri = Uri.parse(str4.concat("/ad"));
                    uri.getClass();
                    AdData adDataBuild = builder.setRenderUri(uri).setMetadata("{'isRealAd': false}").build();
                    adDataBuild.getClass();
                    TrustedBiddingData.Builder builder2 = new TrustedBiddingData.Builder();
                    String str5 = g;
                    if (str5 == null) {
                        g76.g0("baseUri");
                        throw null;
                    }
                    Uri uri2 = Uri.parse(str5.concat("?trusted_bidding"));
                    uri2.getClass();
                    TrustedBiddingData trustedBiddingDataBuild = builder2.setTrustedBiddingUri(uri2).setTrustedBiddingKeys(d46.Q("")).build();
                    trustedBiddingDataBuild.getClass();
                    CustomAudience.Builder buyer = new CustomAudience.Builder().setName(strC).setBuyer(AdTechIdentifier.fromString("facebook.com"));
                    StringBuilder sb = new StringBuilder();
                    String str6 = g;
                    if (str6 == null) {
                        g76.g0("baseUri");
                        throw null;
                    }
                    sb.append(str6);
                    sb.append("?daily&app_id=");
                    sb.append(str);
                    Uri uri3 = Uri.parse(sb.toString());
                    uri3.getClass();
                    CustomAudience.Builder dailyUpdateUri = buyer.setDailyUpdateUri(uri3);
                    String str7 = g;
                    if (str7 == null) {
                        g76.g0("baseUri");
                        throw null;
                    }
                    Uri uri4 = Uri.parse(str7.concat("?bidding"));
                    uri4.getClass();
                    CustomAudience customAudienceBuild = dailyUpdateUri.setBiddingLogicUri(uri4).setTrustedBiddingData(trustedBiddingDataBuild).setUserBiddingSignals(AdSelectionSignals.fromString("{}")).setAds(d46.Q(adDataBuild)).build();
                    customAudienceBuild.getClass();
                    JoinCustomAudienceRequest joinCustomAudienceRequestBuild = new JoinCustomAudienceRequest.Builder().setCustomAudience(customAudienceBuild).build();
                    joinCustomAudienceRequestBuild.getClass();
                    CustomAudienceManager customAudienceManager = e;
                    if (customAudienceManager != null) {
                        customAudienceManager.joinCustomAudience(joinCustomAudienceRequestBuild, Executors.newSingleThreadExecutor(), ne5Var);
                    }
                } catch (Exception e2) {
                    Log.w(str3, "Failed to join Custom Audience: " + e2);
                    pe5 pe5Var = f;
                    if (pe5Var == null) {
                        g76.g0("gpsDebugLogger");
                        throw null;
                    }
                    Bundle bundle = new Bundle();
                    bundle.putString("gps_pa_failed_reason", e2.toString());
                    pe5Var.a("gps_pa_failed", bundle);
                }
            } catch (Error e3) {
                Log.w(str3, "Failed to join Custom Audience: " + e3);
                pe5 pe5Var2 = f;
                if (pe5Var2 == null) {
                    g76.g0("gpsDebugLogger");
                    throw null;
                }
                Bundle bundle2 = new Bundle();
                bundle2.putString("gps_pa_failed_reason", e3.toString());
                pe5Var2.a("gps_pa_failed", bundle2);
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public final String c(String str, String str2) {
        if (!ec2.a.contains(this) && str2 != null) {
            try {
                if (!str2.equals("_removed_") && !muc.Q(str2, "gps", false)) {
                    return str + '@' + str2 + '@' + (System.currentTimeMillis() / 1000) + "@1";
                }
            } catch (Throwable th) {
                ec2.a(this, th);
                return null;
            }
        }
        return null;
    }
}
