package app.morphe.extension.carscanner;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Car Scanner (com.ovz.carscanner) e um app .NET MAUI: o C# (Plugin.InAppBilling) consulta as compras
 * pelo BillingClient Java e recebe a resposta em
 * crc64f0146600faa7a777/InternalPurchasesResponseListener.onQueryPurchasesResponse(BillingResult, List).
 * Este helper troca essa resposta por "OK + compras Pro ja realizadas".
 *
 * Tudo por reflexao: nao precisa da biblioteca billingclient em tempo de compilacao.
 * Nunca lanca excecao: em qualquer falha devolve o valor original.
 */
@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class FakePro {
    private static final String PKG = "com.ovz.carscanner";
    private static final String[] PRODUCTS = {
            "ovz.carscanner.pro1",
            "ovz.carscanner.pro2",
            "ovz.carscanner.pro3",
    };

    private FakePro() {
    }

    /** BillingResult original -> BillingResult com responseCode OK (0). */
    public static Object result(Object original) {
        try {
            Class<?> resultClass = Class.forName("com.android.billingclient.api.BillingResult");
            Object builder = resultClass.getMethod("newBuilder").invoke(null);
            Method setCode = builder.getClass().getMethod("setResponseCode", int.class);
            Object same = setCode.invoke(builder, 0);
            return same.getClass().getMethod("build").invoke(same);
        } catch (Throwable t) {
            return original;
        }
    }

    /** Lista original de Purchase -> copia da original + uma compra por produto Pro. */
    public static List purchases(List original) {
        try {
            Class<?> purchaseClass = Class.forName("com.android.billingclient.api.Purchase");
            ArrayList out = original == null ? new ArrayList() : new ArrayList(original);
            long time = 1700000000000L;
            for (int i = 0; i < PRODUCTS.length; i++) {
                String json = "{\"orderId\":\"GPA.3300-0000-0000-0000" + i + "\","
                        + "\"packageName\":\"" + PKG + "\","
                        + "\"productId\":\"" + PRODUCTS[i] + "\","
                        + "\"purchaseTime\":" + (time + i) + ","
                        + "\"purchaseState\":0,"
                        + "\"purchaseToken\":\"wagg13-" + i + "\","
                        + "\"quantity\":1,"
                        + "\"acknowledged\":true}";
                out.add(purchaseClass.getConstructor(String.class, String.class).newInstance(json, "wagg13"));
            }
            return out;
        } catch (Throwable t) {
            return original;
        }
    }
}
