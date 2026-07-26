/*
 * Codice che gira dentro YouTube per conto della patch. Due responsabilita'.
 * Lato dati: parsePivotBarItemRenderer clona la voce Home della barra e la trasforma nella nostra
 * (etichetta "Later", icona propria, identificatore proprio); setPivotBarRenderer la mette da parte;
 * getPivotBarRendererList la inserisce nella lista prima del profilo. Lato vista: onPivotViewCreated
 * viene chiamato per ogni tab appena costruito e, riconosciuto il nostro dall'etichetta "Later",
 * gli attacca il click che apre la playlist Guarda piu' tardi e ne sostituisce l'icona con il nostro
 * disegno (copiato nell'app come drawable "morphe_watch_later"). Il click apre la playlist via URL
 * perche' i tab della barra non navigano leggendo un campo dati: il comportamento va messo sulla vista.
 */

package app.ciraolone.extension.watchlater;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import com.google.protobuf.MessageLite;

import java.util.ArrayList;
import java.util.List;

import app.ciraolone.extension.watchlater.WatchLaterOuterClass.Accessibility;
import app.ciraolone.extension.watchlater.WatchLaterOuterClass.AccessibilityData;
import app.ciraolone.extension.watchlater.WatchLaterOuterClass.Icon;
import app.ciraolone.extension.watchlater.WatchLaterOuterClass.PivotBarItemRenderer;
import app.ciraolone.extension.watchlater.WatchLaterOuterClass.Runs;
import app.ciraolone.extension.watchlater.WatchLaterOuterClass.Title;
import app.ciraolone.extension.watchlater.WatchLaterOuterClass.YTIconType;

@SuppressWarnings("unused")
public final class WatchLaterButtonPatch {

    private static final String TAG = "WatchLaterButton";

    /** Etichetta del pulsante. Fa anche da marcatore: la vista del nostro tab si riconosce da qui. */
    private static final String BUTTON_LABEL = "Later";

    /** Identificatore proprio, distinto da Home, per non farci trattare come la voce clonata. */
    private static final String PIVOT_IDENTIFIER = "WATCH_LATER_BUTTON";

    /** Nome del drawable copiato nell'app durante il patch (vedi copyResources nella patch). */
    private static final String ICON_RESOURCE_NAME = "morphe_watch_later";

    /**
     * Playlist Guarda piu' tardi. "WL" e' l'id fisso della playlist; YouTube apre il link in-app.
     * I tab della barra non leggono un campo "destinazione", quindi si naviga cosi', non via proto.
     */
    private static final String WATCH_LATER_URL = "https://www.youtube.com/playlist?list=WL";

    private static Object pivotBarWatchLaterRenderer = null;

    private static final View.OnClickListener WATCH_LATER_CLICK = view -> {
        Context context = view.getContext();
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(WATCH_LATER_URL));
        intent.setPackage(context.getPackageName());
        context.startActivity(intent);
    };

    /**
     * Injection point.
     */
    public static byte[] parsePivotBarItemRenderer(MessageLite messageLite) {
        try {
            PivotBarItemRenderer.Builder builder =
                    PivotBarItemRenderer.parseFrom(messageLite.toByteArray()).toBuilder();

            // Valore numerico e non nome: l'enum del proto e' parziale, gli altri tornerebbero UNRECOGNIZED.
            int iconValue = builder.getIcon().getYtIconTypeValue();
            if (iconValue != YTIconType.PIVOT_HOME_VALUE
                    && iconValue != YTIconType.TAB_HOME_CAIRO_VALUE) {
                return null;
            }

            builder.setPivotIdentifier(PIVOT_IDENTIFIER);
            builder.setTargetId(PIVOT_IDENTIFIER);

            // Icona valida ma non usata da altri tab: garantisce una ImageView (che poi rimpiazziamo)
            // ed evita che la voce venga scambiata per un altro pulsante da altre patch della barra.
            builder.clearIcon();
            builder.setIcon(Icon.newBuilder().setYtIconType(YTIconType.WATCH_LATER_CAIRO).build());

            builder.clearTitle();
            builder.setTitle(Title.newBuilder()
                    .setRuns(Runs.newBuilder().setText(BUTTON_LABEL))
                    .build());

            builder.clearAccessibility();
            builder.setAccessibility(Accessibility.newBuilder()
                    .setAccessibilityData(AccessibilityData.newBuilder().setLabel(BUTTON_LABEL))
                    .build());

            return builder.build().toByteArray();
        } catch (Exception ex) {
            Log.e(TAG, "Failed to parse PivotBarItemRenderer", ex);
            return null;
        }
    }

    /**
     * Injection point.
     * Called after {@link #parsePivotBarItemRenderer(MessageLite)}.
     */
    public static void setPivotBarRenderer(Object object) {
        pivotBarWatchLaterRenderer = object;
    }

    /**
     * Injection point.
     * Called after {@link #setPivotBarRenderer(Object)}.
     */
    public static List<Object> getPivotBarRendererList(List<Object> list) {
        if (list == null || list.isEmpty() || pivotBarWatchLaterRenderer == null) {
            return list;
        }

        List<Object> newList = new ArrayList<>(list);
        // Penultima posizione: subito prima del profilo, che nella barra e' l'ultimo tab.
        int index = Math.max(0, newList.size() - 1);
        newList.add(index, pivotBarWatchLaterRenderer);
        return newList;
    }

    /**
     * Injection point.
     * Chiamato per ogni vista di tab appena creata. Riconosce la nostra dall'etichetta "Later"
     * e le applica click e icona.
     */
    public static void onPivotViewCreated(View view) {
        try {
            if (view == null || !hasLaterLabel(view)) {
                return;
            }

            view.setOnClickListener(WATCH_LATER_CLICK);

            ImageView imageView = findImageView(view);
            if (imageView != null) {
                Context context = view.getContext();
                int id = context.getResources().getIdentifier(
                        ICON_RESOURCE_NAME, "drawable", context.getPackageName());
                if (id != 0) {
                    imageView.setImageResource(id);
                }
            }
        } catch (Exception ex) {
            Log.e(TAG, "onPivotViewCreated failed", ex);
        }
    }

    private static boolean hasLaterLabel(View view) {
        CharSequence description = view.getContentDescription();
        if (description != null && BUTTON_LABEL.contentEquals(description)) {
            return true;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                if (hasLaterLabel(group.getChildAt(i))) {
                    return true;
                }
            }
        }
        return false;
    }

    private static ImageView findImageView(View view) {
        if (view instanceof ImageView) {
            return (ImageView) view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                ImageView found = findImageView(group.getChildAt(i));
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }
}
