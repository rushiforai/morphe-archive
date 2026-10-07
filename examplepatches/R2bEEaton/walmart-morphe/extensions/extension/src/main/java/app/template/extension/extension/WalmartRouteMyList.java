package app.template.extension.extension;

import android.content.Context;
import android.graphics.Color;
import android.util.Log;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.ImageView;
import android.util.TypedValue;
import android.os.Bundle;
import android.content.SharedPreferences;
import android.graphics.drawable.Drawable;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.ArrayDeque;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Adds a "Plan my route" button to the Walmart shopping-list screen that opens Walmart's own
 * native in-store map (InterfaceC18119a.c, the same single-item "find in aisle" entry point used
 * by product pages and the list screen's own "storeMaps" click handler), fed with pins for every
 * list item that already has a resolved aisle location. A Prev/Next overlay is injected directly
 * onto the map screen itself (InStoreMapsItemLocatorFragment) to step through items, each step
 * re-invoking the native locator with a different "primary" item.
 *
 * Everything here uses reflection because the patches module cannot compile against Walmart's
 * internal (obfuscated, renamed-per-release) classes. Field/method/class names below match
 * Walmart Android v26.38 (versionCode 26380016) exactly, as traced from a jadx decompile of that
 * build, cross-checked against real call sites in glass/lists/view/lists/C0.java and
 * glass/instoremaps/view/InStoreMapsBaseFragment.java. They WILL need re-verification against
 * logcat output ("WalmartRouteMyList" tag) on first run, and updating for any other app version.
 */
@SuppressWarnings("unused")
public class WalmartRouteMyList {
    private static final String TAG = "WalmartRouteMyList";

    // Arbitrary unique-ish menu item id, unlikely to collide with Walmart's own menu ids.
    public static final int MENU_ITEM_ID = 0x57414C31;

    // State for the currently active route: the sorted pins, which one is "primary" right now,
    // and the ListDetailFragment used both to resolve items and as the (verified-real) receiver
    // for Walmart's own v0 analytics lambda passed into .c(). Cached so the Prev/Next overlay
    // (which lives on the map screen, not the list screen) can re-invoke the locator without
    // needing to re-walk the list screen's view model each time.
    private static Object cachedListFragment;
    private static final Map<String, String> MAP_ITEM_TO_LIST_ITEM = new ConcurrentHashMap<>();
    private static final Map<String, String> LIST_ITEM_TO_MAP_ITEM = new ConcurrentHashMap<>();
    private static final Set<String> ALREADY_CHECKED_ITEM_IDS = Collections.synchronizedSet(new HashSet<>());
    private static String currentListId = "";
    private static Object cachedMapFragment;
    private static List<Object> cachedPinItems;
    private static int currentIndex = 0;
    private static View navOverlayView;
    private static long routeSessionId = 0L;
    private static boolean coordinateOrderApplied = false;
    private static final Map<String, RouteOrderPlanner.Point> STORE_PIN_COORDINATES = new ConcurrentHashMap<>();

    private static String storePinKey(String storeId, String zone, String aisle, String section) {
        return (storeId == null ? "" : storeId) + ":"
                + (zone == null ? "" : zone.trim()) + ":"
                + (aisle == null ? "" : aisle.trim()) + ":"
                + (section == null ? "" : section.trim());
    }

    private static List<RouteMyListGeometry.Pin> getCachedPinsForItems(
            String storeId, List<RouteMyListGeometry.ItemLocation> items) {
        if (storeId == null || items == null || items.isEmpty()) return null;
        List<RouteMyListGeometry.Pin> pins = new ArrayList<>();
        for (RouteMyListGeometry.ItemLocation item : items) {
            if (item == null) return null;
            RouteOrderPlanner.Point center = STORE_PIN_COORDINATES.get(
                    storePinKey(storeId, item.zone, item.aisle, item.section));
            if (center == null || !center.isFinite()) return null;
            pins.add(new RouteMyListGeometry.Pin(item.zone, item.aisle, item.section, center));
        }
        return pins.size() == items.size() ? pins : null;
    }

    // Retain neither a Fragment nor a View: Route My List fragments are short lived and its
    // carousel is rebuilt as the shopper checks items off.  Weak references only prevent us from
    // registering the same layout observer more than once.
    private static final List<WeakReference<View>> FLASH_ROUTE_ROOTS = new ArrayList<>();

    /** Called from the patched Z0.kb(Menu, MenuInflater) to add our button. */
    /** Called when ChecklistFragment creates its view to inject the 'Plan my route' map icon. */
    public static void onChecklistFragmentViewCreated(Object fragment, View root) {
        try {
            Log.i(TAG, "onChecklistFragmentViewCreated: fragment=" + fragment);
            cachedListFragment = fragment;
            currentListId = getListId(fragment);

            if (root == null) return;
            root.post(() -> injectChecklistMapIcon(fragment, root));
        } catch (Throwable t) {
            Log.e(TAG, "Failed in onChecklistFragmentViewCreated", t);
        }
    }

    private static void injectChecklistMapIcon(Object fragment, View root) {
        try {
            Context context = root.getContext();
            View resetView = null;
            if (fragment != null) {
                try {
                    Object binding = callNoArg(fragment, "Te");
                    if (binding != null) {
                        resetView = (View) readField(binding, "k");
                    }
                } catch (Throwable ignored) {}
            }
            if (resetView == null) {
                int resetId = context.getResources().getIdentifier("reset_checklist", "id", context.getPackageName());
                if (resetId != 0) resetView = root.findViewById(resetId);
            }
            if (resetView == null) {
                resetView = root.findViewById(0x7f0a5023);
            }
            if (resetView == null) {
                resetView = findViewByResourceName(root, "reset_checklist");
            }
            if (resetView == null) {
                resetView = findViewByText(root, "Reset checklist");
            }
            if (resetView == null) {
                Log.w(TAG, "Could not find reset_checklist in ChecklistFragment");
                return;
            }

            ViewGroup parent = (ViewGroup) resetView.getParent();
            if (parent == null) return;

            String mapIconTag = "ROUTE_MAP_ICON_BTN";
            if (parent.findViewWithTag(mapIconTag) != null) {
                return;
            }

            ImageView mapIcon = new ImageView(context);
            mapIcon.setTag(mapIconTag);
            mapIcon.setContentDescription("Plan my route");

            int drawableId = context.getResources().getIdentifier("ui_shared_ic_map", "drawable", context.getPackageName());
            if (drawableId == 0) {
                drawableId = context.getResources().getIdentifier("wcp_ic_map", "drawable", context.getPackageName());
            }
            if (drawableId == 0) {
                drawableId = context.getResources().getIdentifier("wcp_ic_store_map", "drawable", context.getPackageName());
            }

            float density = context.getResources().getDisplayMetrics().density;
            int sizePx = (int) (36 * density);
            int padPx = (int) (6 * density);
            int marginPx = (int) (8 * density);

            if (drawableId != 0) {
                Drawable d = context.getDrawable(drawableId);
                if (d != null) {
                    d = d.mutate();
                    d.setColorFilter(Color.parseColor("#0071DC"), android.graphics.PorterDuff.Mode.SRC_IN);
                    mapIcon.setImageDrawable(d);
                }
            } else {
                mapIcon.setImageResource(android.R.drawable.ic_dialog_map);
                mapIcon.setColorFilter(Color.parseColor("#0071DC"), android.graphics.PorterDuff.Mode.SRC_IN);
            }

            TypedValue outValue = new TypedValue();
            if (context.getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, outValue, true)) {
                mapIcon.setBackgroundResource(outValue.resourceId);
            }
            mapIcon.setClickable(true);
            mapIcon.setFocusable(true);
            mapIcon.setPadding(padPx, padPx, padPx, padPx);

            parent.addView(mapIcon, new ViewGroup.LayoutParams(sizePx, sizePx));

            final View finalResetView = resetView;
            final ImageView finalMapIcon = mapIcon;
            Runnable alignPosition = () -> {
                int left = finalResetView.getLeft();
                int top = finalResetView.getTop();
                int height = finalResetView.getHeight();
                if (left > 0 && height > 0) {
                    float targetX = left - sizePx - marginPx;
                    float targetY = top + (height - sizePx) / 2f;
                    finalMapIcon.setTranslationX(targetX);
                    finalMapIcon.setTranslationY(targetY);
                    finalMapIcon.bringToFront();
                }
            };

            finalResetView.addOnLayoutChangeListener((v, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> {
                if (left > 0 && (bottom - top) > 0) {
                    float targetX = left - sizePx - marginPx;
                    float targetY = top + (bottom - top - sizePx) / 2f;
                    finalMapIcon.setTranslationX(targetX);
                    finalMapIcon.setTranslationY(targetY);
                    finalMapIcon.bringToFront();
                }
            });

            parent.post(alignPosition);
            finalResetView.post(alignPosition);
            mapIcon.post(alignPosition);

            mapIcon.setOnClickListener(v -> {
                try {
                    cachedListFragment = fragment;
                    currentListId = getListId(fragment);
                    List<Object> sorted = computeSortedPinItems(fragment);
                    if (sorted == null || sorted.isEmpty()) {
                        Toast.makeText(context, "No items with aisle locations found", Toast.LENGTH_SHORT).show();
                        return;
                    }
                    cachedPinItems = sorted;
                    currentIndex = 0;
                    routeSessionId++;
                    coordinateOrderApplied = false;
                    showNativeRouteMyList();
                } catch (Throwable t) {
                    Log.e(TAG, "Failed to launch Route My List from checklist icon", t);
                    Toast.makeText(context, "Route planner failed: " + t.getMessage(), Toast.LENGTH_LONG).show();
                }
            });

            Log.i(TAG, "Successfully injected Route My List map icon next to reset_checklist");
        } catch (Throwable t) {
            Log.e(TAG, "Failed injectChecklistMapIcon", t);
        }
    }

    private static String getListId(Object fragment) {
        try {
            Bundle args = (Bundle) callNoArg(fragment, "getArguments");
            if (args != null && args.containsKey("listId")) {
                String id = args.getString("listId");
                if (id != null && !id.isEmpty()) return id;
            }
        } catch (Throwable ignored) {}
        return "";
    }

    private static View findViewByText(View root, String text) {
        if (root instanceof TextView) {
            CharSequence cs = ((TextView) root).getText();
            if (cs != null && cs.toString().equalsIgnoreCase(text)) {
                return root;
            }
        }
        if (root instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) root;
            for (int i = 0; i < vg.getChildCount(); i++) {
                View found = findViewByText(vg.getChildAt(i), text);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static View findViewByResourceName(View root, String name) {
        if (root == null) return null;
        try {
            if (root.getId() != View.NO_ID && root.getResources() != null) {
                String entryName = root.getResources().getResourceEntryName(root.getId());
                if (name.equals(entryName)) {
                    return root;
                }
            }
        } catch (Throwable ignored) {}
        if (root instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) root;
            for (int i = 0; i < vg.getChildCount(); i++) {
                View found = findViewByResourceName(vg.getChildAt(i), name);
                if (found != null) return found;
            }
        }
        return null;
    }

    public static void addRouteMenuItem(Menu menu) {
        // Deprecated: "Plan my route" moved to the map icon inside "Shop in-store"
    }

    /**
     * Called from the patched Z0.Md(MenuItem). Returns true if we handled the click (which the
     * original Z0.Md always returns anyway, so the patch always returns our result directly).
     */
    public static boolean onMenuItemSelected(MenuItem item, Object listDetailFragment) {
        if (item.getItemId() != MENU_ITEM_ID) {
            return true;
        }
        try {
            cachedListFragment = listDetailFragment;
            cachedPinItems = computeSortedPinItems(listDetailFragment);
            currentIndex = 0;
            routeSessionId++;
            coordinateOrderApplied = false;
            showNativeRouteMyList();
        } catch (Throwable t) {
            Log.e(TAG, "Route My List failed", t);
            try {
                Context context = (Context) callNoArg(listDetailFragment, "requireContext");
                Toast.makeText(context, "Route planner failed: " + t, Toast.LENGTH_LONG).show();
            } catch (Throwable ignored) {
                // Context lookup itself failed; nothing more we can safely do.
            }
        }
        return true;
    }

    /**
     * Called after Walmart creates its multi-item Route My List carousel.  The native view model
     * already knows whether the selected store/item can flash an ESL tag and owns the timer and
     * cooldown.  Asking it to refresh here preserves those rules; we leave its native
     * action button and timer exactly as Walmart renders them.
     */
    public static void onNativeRouteMyListViewCreated(Object routeFragment) {
        try {
            // Temporary: lets Chrome DevTools attach to the map WebView (chrome://inspect via
            // adb forward) to debug the blank space above the floorplan from the live page's
            // actual DOM/CSS instead of guessing. Remove once that's root-caused.
            WebView.setWebContentsDebuggingEnabled(true);
            cachedMapFragment = routeFragment;
            Object viewModel = callNoArg(routeFragment, "cf");
            viewModel.getClass().getMethod("Me").invoke(viewModel);
            View root = (View) callNoArg(routeFragment, "getView");
            if (root == null) return;
            final long session = routeSessionId;
            tryApplyCoordinateRouteOrder(routeFragment, session);
            root.post(() -> waitForCoordinateRouteOrder(root, routeFragment, session, 0));
            // Cached geometry can finish before the WebView even exists. Wait separately for
            // the mounted SVG, and use its JS acknowledgement rather than assuming injection worked.
            RouteMapReadyRetry.start(
                    () -> session == routeSessionId && cachedMapFragment == routeFragment,
                    retry -> root.postDelayed(retry, 250L),
                    done -> {
                        if (!coordinateOrderApplied) {
                            done.accept(false);
                            return;
                        }
                        try {
                            WebView map = (WebView) routeFragment.getClass().getField("i").get(routeFragment);
                            injectRouteConnectors(routeFragment, map, done);
                        } catch (Throwable failure) {
                            done.accept(false);
                        }
                    });
            if (!hasFlashRouteObserver(root)) {
                rememberFlashRouteRoot(root);
                root.getViewTreeObserver().addOnGlobalLayoutListener(() -> compactNativeFlashButtons(root));
                root.post(() -> compactNativeFlashButtons(root));
                refreshRouteFlashCapabilityWhenReady(root, viewModel, 0);
                prefetchEslTags(root);
            }
            // Experimental: give the carousel card time to settle into its collapsed height
            // (collapseUnusedCarouselCardSpace), then nudge the map to recompute its zoom-to-fit.
            // The native camera-fit calculation appears to run once against whatever vertical
            // space was reserved below the map at that time, leaving the floorplan rendered
            // smaller than the viewport once the card shrinks. Unverified on real hardware.
            root.postDelayed(WalmartRouteMyList::nudgeMapViewportResize, 500L);
            Log.i(TAG, "Native Route My List flash capability refresh requested");
        } catch (Throwable t) {
            // Flashing is an optional enhancement.  Do not interfere with the route if a future
            // Walmart release changes this private view-model API.
            Log.w(TAG, "Unable to initialize Route My List flash control", t);
        }
    }

    /** Waits for Walmart's map-ready metadata and rendered pin rectangles without reopening it. */
    private static void waitForCoordinateRouteOrder(View root, Object routeFragment, long session, int attempt) {
        if (session != routeSessionId || coordinateOrderApplied) return;
        if (!root.isAttachedToWindow()) {
            if (attempt < 12) {
                root.postDelayed(() -> waitForCoordinateRouteOrder(root, routeFragment, session, attempt + 1), 250L);
            }
            return;
        }
        if (tryApplyCoordinateRouteOrder(routeFragment, session)) return;
        if (attempt >= 12) {
            Log.i(TAG, "Route My List geometry was unavailable; retaining aisle order");
            return;
        }
        root.postDelayed(() -> waitForCoordinateRouteOrder(root, routeFragment, session, attempt + 1), 250L);
    }

    /**
     * Converts Walmart's private map state to the pure route planner input.  Reflection failures
     * deliberately leave the already-open native route untouched so aisle order remains usable.
     */
    static boolean tryApplyCoordinateRouteOrder(Object routeFragment, long session) {
        if (session != routeSessionId || coordinateOrderApplied || cachedPinItems == null
                || cachedPinItems.size() < 2 || routeFragment != cachedMapFragment) return false;
        List<Object> previousPins = null;
        List<?> previousNativePins = null;
        List<?> previousCarouselItems = null;
        int previousIndex = currentIndex;
        Object viewModel = null;
        boolean nativeStateMutated = false;
        try {
            viewModel = callNoArg(routeFragment, "cf");
            Object mapDataReady = readField(viewModel, "Y");
            Object selectedMapArea = readField(viewModel, "Z");
            String storeId = getCurrentStoreId(cachedListFragment);

            List<RouteMyListGeometry.ItemLocation> items = geometryItems(cachedPinItems);
            List<RouteMyListGeometry.Poi> pois = null;
            List<RouteMyListGeometry.Pin> pins = null;

            if (selectedMapArea != null) {
                pins = geometryPins((List<?>) readField(selectedMapArea, "f"));
                if (pins != null) {
                    for (RouteMyListGeometry.Pin pin : pins) {
                        if (pin != null && pin.center != null && pin.center.isFinite()) {
                            STORE_PIN_COORDINATES.put(
                                    storePinKey(storeId, pin.zone, pin.aisle, pin.section), pin.center);
                        }
                    }
                }
            } else {
                pins = getCachedPinsForItems(storeId, items);
            }

            if (mapDataReady != null) {
                pois = geometryPois((List<?>) readField(mapDataReady, "b"));
            } else {
                pois = Collections.emptyList();
            }

            if (pins == null || pins.isEmpty()) {
                Log.i(TAG, "Route My List geometry pending: mapDataReady="
                        + (mapDataReady != null) + ", selectedMapArea="
                        + (selectedMapArea != null));
                return false;
            }

            List<Integer> orderedIndexes = RouteMyListGeometry.orderIndexes(pois, pins, items);
            if (orderedIndexes == null || orderedIndexes.size() != cachedPinItems.size()) {
                Log.i(TAG, "Route My List geometry incomplete: pois=" + pois.size()
                        + ", pins=" + pins.size() + ", items=" + items.size());
                return false;
            }

            previousPins = cachedPinItems;
            List<Object> reordered = RouteMyListGeometry.reorder(previousPins, orderedIndexes);
            previousNativePins = (List<?>) readField(viewModel, "t1");
            previousCarouselItems = (List<?>) readField(viewModel, "z1");
            if (reordered == null || previousNativePins == null || previousCarouselItems == null) return false;
            List<?> reorderedNativePins = reorderNativePins(previousNativePins, reordered);
            List<Object> reorderedCarouselItems = reorderCarouselItems(previousCarouselItems, reordered);
            if (reorderedNativePins == null || reorderedCarouselItems == null) return false;

            cachedPinItems = reordered;
            nativeStateMutated = true;
            writeField(viewModel, "t1", reorderedNativePins);
            writeField(viewModel, "z1", reorderedCarouselItems);
            writeField(viewModel, "A1", null);
            writeField(viewModel, "B1", 0L);
            writeField(viewModel, "C1", false);
            currentIndex = 0;
            for (String checkedId : ALREADY_CHECKED_ITEM_IDS) {
                try {
                    viewModel.getClass().getMethod("Ne", Boolean.class, String.class)
                            .invoke(viewModel, Boolean.TRUE, checkedId);
                } catch (Throwable ignored) {}
            }
            viewModel.getClass().getMethod("Me").invoke(viewModel);
            syncCarouselSelection(routeFragment, reordered);
            coordinateOrderApplied = true;
            try {
                renderMountedMapWithFocusedPin();
            } catch (Throwable renderFailure) {
                Log.d(TAG, "Map WebView not yet ready for pin rendering", renderFailure);
            }
            Log.i(TAG, "Route My List reordered " + reordered.size()
                    + " item(s) from entrance-aware map geometry");
            View routeView = (View) callNoArg(routeFragment, "getView");
            if (routeView != null) {
                routeView.post(() -> compactNativeFlashButtons(routeView));
                routeView.postDelayed(WalmartRouteMyList::nudgeMapViewportResize, 400L);
            }
            return true;
        } catch (Throwable t) {
            if (nativeStateMutated && viewModel != null) {
                try {
                    cachedPinItems = previousPins;
                    currentIndex = previousIndex;
                    writeField(viewModel, "t1", previousNativePins);
                    writeField(viewModel, "z1", previousCarouselItems);
                    viewModel.getClass().getMethod("Me").invoke(viewModel);
                    renderMountedMapWithFocusedPin();
                } catch (Throwable rollbackFailure) {
                    Log.w(TAG, "Unable to restore native Route My List order", rollbackFailure);
                }
            }
            coordinateOrderApplied = false;
            Log.w(TAG, "Unable to apply Route My List coordinate order", t);
            return false;
        }
    }

    private static void syncCarouselSelection(Object routeFragment, List<Object> reorderedPins) {
        if (routeFragment == null || reorderedPins == null || reorderedPins.isEmpty()) return;
        try {
            Object binding = callNoArg(routeFragment, "Ve");
            Object carouselBinding = readField(binding, "h");
            Object carousel = readField(carouselBinding, "b");
            if (carousel != null) {
                String firstItemId = routeItemId(reorderedPins.get(0));
                writeField(carousel, "b", firstItemId);
                carousel.getClass().getMethod("scrollToPosition", int.class).invoke(carousel, 0);
                if (carousel instanceof View) {
                    View carouselView = (View) carousel;
                    carouselView.post(() -> {
                        try {
                            writeField(carouselView, "b", firstItemId);
                            carouselView.getClass().getMethod("scrollToPosition", int.class).invoke(carouselView, 0);
                            carouselView.requestLayout();
                        } catch (Throwable ignored) {}
                    });
                    carouselView.postDelayed(() -> {
                        try {
                            writeField(carouselView, "b", firstItemId);
                            carouselView.getClass().getMethod("scrollToPosition", int.class).invoke(carouselView, 0);
                            carouselView.requestLayout();
                        } catch (Throwable ignored) {}
                    }, 120);
                }
            }
        } catch (Throwable carouselSyncFailure) {
            Log.w(TAG, "Unable to scroll carousel to initial coordinate route item", carouselSyncFailure);
        }
    }

    private static List<Object> reorderNativePins(List<?> nativePins, List<Object> reorderedPins)
            throws Exception {
        Map<String, ArrayDeque<Object>> byItemId = new HashMap<>();
        for (Object nativePin : nativePins) {
            String itemId = routeItemId(nativePin);
            ArrayDeque<Object> matches = byItemId.get(itemId);
            if (matches == null) {
                matches = new ArrayDeque<>();
                byItemId.put(itemId, matches);
            }
            matches.addLast(nativePin);
        }

        Class<?> pinItemCls = Class.forName("com.walmart.glass.instoremaps.api.model.StoreMapPinItemDetails");
        Class<?> pinOptionsCls = Class.forName("com.walmart.glass.instoremaps.api.PinOptions");
        Class<?> pinTypeCls = Class.forName("com.walmart.glass.instoremaps.api.l0");
        Class<?> itemDetailsCls = Class.forName("com.walmart.glass.instoremaps.api.model.InstoreMapsItemDetails");
        Constructor<?> pinOptionsCtor = pinOptionsCls.getConstructor(
                String.class, String.class, String.class, String.class, Boolean.class,
                Integer.class, pinTypeCls, Boolean.class, Boolean.class);
        Constructor<?> pinItemCtor = pinItemCls.getConstructor(pinOptionsCls, itemDetailsCls);

        List<Object> reordered = new ArrayList<>();
        for (int i = 0; i < reorderedPins.size(); i++) {
            String itemId = routeItemId(reorderedPins.get(i));
            ArrayDeque<Object> matches = byItemId.get(itemId);
            if (matches == null || matches.isEmpty()) return null;
            Object match = matches.removeFirst();
            Object origOptions = readField(match, "a");
            Object details = readField(match, "b");

            String zone = (String) readField(origOptions, "a");
            String aisle = (String) readField(origOptions, "b");
            String section = (String) readField(origOptions, "c");
            String dept = (String) readField(origOptions, "d");
            Boolean isVisible = (Boolean) readField(origOptions, "e");
            Integer floor = (Integer) readField(origOptions, "f");
            Object pinType = readField(origOptions, "g");
            Boolean isPrimary = Boolean.valueOf(i == 0);
            Boolean isNavigating = (Boolean) readField(origOptions, "i");

            Object updatedOptions = pinOptionsCtor.newInstance(
                    zone, aisle, section, dept, isVisible, floor, pinType, isPrimary, isNavigating);
            reordered.add(pinItemCtor.newInstance(updatedOptions, details));
        }
        return reordered.size() == nativePins.size() ? reordered : null;
    }

    /** Mirrors the same permutation into Walmart's carousel models, keyed by its stable item id. */
    private static List<Object> reorderCarouselItems(List<?> carouselItems, List<Object> reorderedPins)
            throws Exception {
        Map<String, ArrayDeque<Object>> byItemId = new HashMap<>();
        for (Object carouselItem : carouselItems) {
            Object details = readField(carouselItem, "a");
            String itemId = (String) readField(details, "b");
            ArrayDeque<Object> matches = byItemId.get(itemId);
            if (matches == null) {
                matches = new ArrayDeque<>();
                byItemId.put(itemId, matches);
            }
            matches.addLast(carouselItem);
        }
        List<Object> reordered = new ArrayList<>();
        for (Object pinItem : reorderedPins) {
            String itemId = routeItemId(pinItem);
            ArrayDeque<Object> matches = byItemId.get(itemId);
            if (matches == null || matches.isEmpty()) return null;
            Object carouselItem = matches.removeFirst();
            if (ALREADY_CHECKED_ITEM_IDS.contains(itemId)) {
                try {
                    writeField(carouselItem, "c", true);
                } catch (Throwable ignored) {}
            }
            reordered.add(carouselItem);
        }
        return reordered.size() == carouselItems.size() ? reordered : null;
    }

    private static String routeItemId(Object pinItem) throws Exception {
        Object details = readField(pinItem, "b");
        return (String) readField(details, "b");
    }

    private static List<RouteMyListGeometry.Poi> geometryPois(List<?> rawPois) throws Exception {
        List<RouteMyListGeometry.Poi> pois = new ArrayList<>();
        if (rawPois == null) return pois;
        for (Object poi : rawPois) {
            Double minX = asDouble(readField(poi, "f"));
            Double maxX = asDouble(readField(poi, "g"));
            Double minY = asDouble(readField(poi, "h"));
            Double maxY = asDouble(readField(poi, "i"));
            if (minX == null || maxX == null || minY == null || maxY == null) continue;
            pois.add(new RouteMyListGeometry.Poi((String) readField(poi, "a"),
                    (String) readField(poi, "b"), minX, maxX, minY, maxY));
        }
        return pois;
    }

    private static List<RouteMyListGeometry.Pin> geometryPins(List<?> rawPins) throws Exception {
        List<RouteMyListGeometry.Pin> pins = new ArrayList<>();
        if (rawPins == null) return pins;
        for (Object pin : rawPins) {
            Object pinRect = readField(pin, "i");
            Object center = pinRect == null ? null : readField(pinRect, "a");
            Double x = center == null ? null : asDouble(readField(center, "a"));
            Double y = center == null ? null : asDouble(readField(center, "b"));
            if (x == null || y == null) continue;
            pins.add(new RouteMyListGeometry.Pin((String) readField(pin, "c"),
                    (String) readField(pin, "d"), (String) readField(pin, "e"),
                    new RouteOrderPlanner.Point(x, y)));
        }
        return pins;
    }

    private static List<RouteMyListGeometry.ItemLocation> geometryItems(List<Object> pinItems)
            throws Exception {
        Class<?> pinItemCls = Class.forName("com.walmart.glass.instoremaps.api.model.StoreMapPinItemDetails");
        Class<?> pinOptionsCls = Class.forName("com.walmart.glass.instoremaps.api.PinOptions");
        Field itemOptions = pinItemCls.getField("a");
        Field zone = pinOptionsCls.getField("a");
        Field aisle = pinOptionsCls.getField("b");
        Field section = pinOptionsCls.getField("c");
        List<RouteMyListGeometry.ItemLocation> items = new ArrayList<>();
        for (int index = 0; index < pinItems.size(); index++) {
            Object options = itemOptions.get(pinItems.get(index));
            items.add(new RouteMyListGeometry.ItemLocation(index, (String) zone.get(options),
                    (String) aisle.get(options), (String) section.get(options)));
        }
        return items;
    }

    private static Double asDouble(Object value) {
        return value instanceof Number ? ((Number) value).doubleValue() : null;
    }

    private static String describeCollectionFields(Object value) {
        StringBuilder result = new StringBuilder();
        for (Field field : value.getClass().getFields()) {
            try {
                Object fieldValue = field.get(value);
                if (fieldValue instanceof List<?>) {
                    if (result.length() > 0) result.append(',');
                    result.append(field.getName()).append('=').append(((List<?>) fieldValue).size());
                }
            } catch (IllegalAccessException ignored) {
                // Diagnostics must never affect the native route.
            }
        }
        return result.toString();
    }

    private static String describePois(List<?> rawPois) {
        if (rawPois == null) return "null";
        StringBuilder result = new StringBuilder();
        for (Object poi : rawPois) {
            if (poi == null) continue;
            if (result.length() > 0) result.append(';');
            try {
                result.append(readField(poi, "a")).append('/')
                        .append(readField(poi, "b")).append('/')
                        .append(readField(poi, "c")).append(':')
                        .append(readField(poi, "f")).append(',')
                        .append(readField(poi, "g")).append(',')
                        .append(readField(poi, "h")).append(',')
                        .append(readField(poi, "i"));
            } catch (Throwable t) {
                result.append(poi);
            }
        }
        return result.toString();
    }

    private static String describeBoxes(List<?> rawBoxes) {
        if (rawBoxes == null) return "null";
        StringBuilder result = new StringBuilder();
        for (Object box : rawBoxes) {
            if (box == null) continue;
            if (result.length() > 0) result.append(';');
            try {
                result.append(readField(box, "a")).append(',')
                        .append(readField(box, "b")).append(',')
                        .append(readField(box, "c")).append(',')
                        .append(readField(box, "d"));
            } catch (Throwable t) {
                result.append(box);
            }
        }
        return result.toString();
    }

    private static String describePins(List<RouteMyListGeometry.Pin> pins) {
        if (pins == null) return "null";
        StringBuilder result = new StringBuilder();
        for (RouteMyListGeometry.Pin pin : pins) {
            if (pin == null) continue;
            if (result.length() > 0) result.append(';');
            result.append(pin.zone).append('-').append(pin.aisle).append('-').append(pin.section)
                    .append('@').append(pin.center.x).append(',').append(pin.center.y);
        }
        return result.toString();
    }

    /**
     * The Route My List carousel is first bound before Walmart's remote flash configuration has
     * arrived.  Its own ViewModel intentionally omits the action until that state is available;
     * recompute once it is ready so the native button (and its native cooldown flow) can bind.
     */
    private static void refreshRouteFlashCapabilityWhenReady(View root, Object viewModel, int attempt) {
        if (!root.isAttachedToWindow() || attempt >= 6) return;
        try {
            Object flashConfigState = readField(viewModel, "r1");
            Object flashConfig = callNoArg(flashConfigState, "getValue");
            if (flashConfig != null) {
                viewModel.getClass().getMethod("Me").invoke(viewModel);
                Log.i(TAG, "Route My List flash capability became available after " + attempt + " check(s)");
                return;
            }
        } catch (Throwable t) {
            Log.w(TAG, "Unable to check Route My List flash capability", t);
            return;
        }
        root.postDelayed(() -> refreshRouteFlashCapabilityWhenReady(root, viewModel, attempt + 1), 750L);
    }

    /**
     * Called after Walmart's own checkbox listener has updated its route state. Scrolling the
     * native RecyclerView keeps its item-focus callback, map pin selection, and animations intact.
     */
    private static String extractItemId(Object item) {
        if (item == null) return null;
        if (item instanceof String) {
            return (String) item;
        }
        try {
            Object details = readField(item, "a");
            if (details != null) {
                Object id = readField(details, "b");
                if (id != null) return id.toString();
            }
        } catch (Throwable ignored) {}
        try {
            Object id = tryCallAny(item, "getItemId", "getId", "b");
            if (id != null) return id.toString();
        } catch (Throwable ignored) {}
        return item.toString();
    }

    public static void onNativeRouteCheckboxChecked(Object carouselClickListener, Object item) {
        try {
            String itemId = extractItemId(item);
            Log.i(TAG, "onNativeRouteCheckboxChecked: item=" + item + ", resolved itemId=" + itemId);
            if (!isEmpty(itemId)) {
                ALREADY_CHECKED_ITEM_IDS.add(itemId);
                syncChecklistState(itemId, true);
            }
            Object routeFragment = readField(carouselClickListener, "a");
            View root = (View) callNoArg(routeFragment, "getView");
            if (root != null) {
                root.post(() -> advanceToNextUnchecked(routeFragment));
            }
        } catch (Throwable t) {
            Log.w(TAG, "Unable to handle Route My List checkbox check", t);
        }
    }

    public static void onNativeRouteAddBack(Object carouselClickListener, Object item) {
        try {
            String itemId = extractItemId(item);
            Log.i(TAG, "onNativeRouteAddBack: item=" + item + ", resolved itemId=" + itemId);
            if (!isEmpty(itemId)) {
                ALREADY_CHECKED_ITEM_IDS.remove(itemId);
                syncChecklistState(itemId, false);
            }
            Object routeFragment = readField(carouselClickListener, "a");
            View root = (View) callNoArg(routeFragment, "getView");
            if (root != null) {
                root.post(() -> updateRouteConnectors(routeFragment));
            }
        } catch (Throwable t) {
            Log.w(TAG, "Unable to handle Route My List add back", t);
        }
    }

    public static void onNativeRouteCheckboxToggled(Object carouselClickListener) {
        try {
            Object routeFragment = readField(carouselClickListener, "a");
            View root = (View) callNoArg(routeFragment, "getView");
            if (root != null) {
                root.post(() -> advanceToNextUnchecked(routeFragment));
            }
        } catch (Throwable t) {
            Log.w(TAG, "Unable to schedule Route My List auto-advance", t);
        }
    }

    private static void syncChecklistState(String completedItemId, boolean isNowChecked) {
        try {
            String listItemId = MAP_ITEM_TO_LIST_ITEM.get(completedItemId);
            if (listItemId == null) {
                listItemId = completedItemId;
            }

            Log.i(TAG, "syncChecklistState: completedItemId=" + completedItemId + ", listItemId=" + listItemId + ", isNowChecked=" + isNowChecked + ", currentListId=" + currentListId);

            // 1. Update SharedPreferences
            if (!isEmpty(currentListId) && cachedListFragment != null) {
                Context ctx = null;
                try {
                    ctx = (Context) tryCallNoArg(cachedListFragment, "getContext");
                } catch (Throwable ignored) {}
                if (ctx == null) {
                    try {
                        ctx = (Context) tryCallNoArg(cachedListFragment, "requireContext");
                    } catch (Throwable ignored) {}
                }
                if (ctx != null) {
                    SharedPreferences prefs = ctx.getSharedPreferences("com.walmart.glass.lists", Context.MODE_PRIVATE);
                    String prefKey = "listsChecklistPreferenceKey" + currentListId;
                    Set<String> currentSet = prefs.getStringSet(prefKey, Collections.emptySet());
                    Set<String> newSet = new HashSet<>(currentSet);
                    if (isNowChecked) {
                        newSet.add(listItemId);
                    } else {
                        newSet.remove(listItemId);
                    }
                    prefs.edit()
                            .putStringSet(prefKey, newSet)
                            .putLong("listsChecklistPreferenceTimeoutKey" + currentListId, System.currentTimeMillis() + 7 * 24 * 3600 * 1000L)
                            .apply();
                    Log.i(TAG, "Synced SharedPreferences: " + newSet);
                }
            }

            // 2. Update ChecklistFragment in-memory state
            if (cachedListFragment != null) {
                final Object fragment = cachedListFragment;
                final String finalListItemId = listItemId;
                final boolean finalIsChecked = isNowChecked;
                View view = (View) tryCallNoArg(fragment, "getView");
                Runnable updateAction = () -> {
                    try {
                        if (finalIsChecked) {
                            Object q0 = readField(fragment, "k");
                            if (q0 != null) {
                                Method invoke = q0.getClass().getMethod("invoke", Object.class, Object.class);
                                invoke.invoke(q0, finalListItemId, 0);
                                Log.i(TAG, "Invoked ChecklistFragment check lambda k for " + finalListItemId);
                            }
                        } else {
                            Object r0 = readField(fragment, "l");
                            if (r0 != null) {
                                Method invoke = r0.getClass().getMethod("invoke", Object.class, Object.class);
                                invoke.invoke(r0, finalListItemId, 0);
                                Log.i(TAG, "Invoked ChecklistFragment uncheck lambda l for " + finalListItemId);
                            }
                        }
                    } catch (Throwable t) {
                        Log.w(TAG, "Failed to invoke ChecklistFragment lambda for item " + finalListItemId, t);
                    }
                };
                if (view != null) {
                    view.post(updateAction);
                } else {
                    updateAction.run();
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed in syncChecklistState for " + completedItemId, t);
        }
    }

    private static void advanceToNextUnchecked(Object routeFragment) {
        try {
            Object binding = callNoArg(routeFragment, "Ve");
            Object carouselBinding = readField(binding, "h");
            Object carousel = readField(carouselBinding, "b");
            String completedItemId = (String) readField(carousel, "b");
            Object adapter = readField(carousel, "a");
            List<?> items = (List<?>) readField(adapter, "c");
            if (items == null || items.isEmpty()) return;

            // Also refresh after unchecking and after checking the final item, when there is
            // no next unchecked card to advance to.
            updateRouteConnectors(routeFragment);
            View routeView = (View) callNoArg(routeFragment, "getView");
            if (routeView != null) {
                routeView.postDelayed(() -> {
                    if (cachedMapFragment == routeFragment) updateRouteConnectors(routeFragment);
                }, 300L);
            }

            int completedIndex = -1;
            for (int index = 0; index < items.size(); index++) {
                Object itemDetails = readField(items.get(index), "a");
                String itemId = (String) readField(itemDetails, "b");
                if (completedItemId != null && completedItemId.equals(itemId)) {
                    completedIndex = index;
                    break;
                }
            }
            if (completedIndex >= 0) {
                boolean isNowChecked = Boolean.TRUE.equals(readField(items.get(completedIndex), "c"));
                if (isNowChecked) {
                    ALREADY_CHECKED_ITEM_IDS.add(completedItemId);
                } else {
                    ALREADY_CHECKED_ITEM_IDS.remove(completedItemId);
                }
                syncChecklistState(completedItemId, isNowChecked);
            }
            if (completedIndex < 0) return;

            for (int offset = 1; offset < items.size(); offset++) {
                int nextIndex = (completedIndex + offset) % items.size();
                Object candidate = items.get(nextIndex);
                boolean checked = ((Boolean) readField(candidate, "c")).booleanValue();
                if (!checked) {
                    carousel.getClass().getMethod("smoothScrollToPosition", int.class)
                            .invoke(carousel, nextIndex);
                    Log.i(TAG, "Advanced Route My List to unchecked carousel item " + (nextIndex + 1));
                    return;
                }
            }
            Log.i(TAG, "All Route My List items are checked; leaving native completed state selected");
        } catch (Throwable t) {
            Log.w(TAG, "Unable to advance Route My List carousel", t);
        }
    }

    /**
     * Called when ItemCarouselView's swipe-settle focus change fires (W.invoke, installed via
     * setOnItemFocused). This is the actual gesture a shopper uses to move between stops --
     * unlike the Prev/Next bar this extension also defines (injectNavBar/step), which is never
     * wired to any patch hook and so never renders. Advances currentIndex to match and redraws
     * the route connector so legs already walked grey out as the shopper swipes forward.
     */
    public static void onCarouselItemFocused(Object focusedCarouselItem) {
        try {
            Log.i(TAG, "onCarouselItemFocused: fired, cachedPinItems=" +
                    (cachedPinItems == null ? "null" : cachedPinItems.size()) +
                    ", cachedMapFragment=" + (cachedMapFragment != null));
            if (cachedPinItems == null || cachedMapFragment == null) return;
            Object itemDetails = readField(focusedCarouselItem, "a");
            String itemId = (String) readField(itemDetails, "b");
            if (itemId == null) return;

            int matchedIndex = -1;
            for (int i = 0; i < cachedPinItems.size(); i++) {
                Object pinItemDetails = readField(cachedPinItems.get(i), "b");
                if (itemId.equals(readField(pinItemDetails, "b"))) {
                    matchedIndex = i;
                    currentIndex = i;
                    break;
                }
            }
            Log.i(TAG, "onCarouselItemFocused: itemId=" + itemId + " matchedIndex=" + matchedIndex);

            WebView map = null;
            try {
                map = (WebView) cachedMapFragment.getClass().getField("i").get(cachedMapFragment);
            } catch (Throwable ignored) {
                map = (WebView) readField(cachedMapFragment, "i");
            }
            if (map != null) {
                injectRouteConnectors(cachedMapFragment, map);
            }

            View routeView = (View) tryCallNoArg(cachedMapFragment, "getView");
            if (routeView != null) {
                routeView.post(() -> compactNativeFlashButtons(routeView));
            }
        } catch (Throwable t) {
            Log.w(TAG, "Unable to advance currentIndex from carousel focus change", t);
        }
    }

    private static synchronized boolean hasFlashRouteObserver(View root) {
        for (int i = FLASH_ROUTE_ROOTS.size() - 1; i >= 0; i--) {
            View observed = FLASH_ROUTE_ROOTS.get(i).get();
            if (observed == null) {
                FLASH_ROUTE_ROOTS.remove(i);
            } else if (observed == root) {
                return true;
            }
        }
        return false;
    }

    private static synchronized void rememberFlashRouteRoot(View root) {
        FLASH_ROUTE_ROOTS.add(new WeakReference<>(root));
    }

    /** Walks the native carousel after each bind to hide the feedback and resume-route prompts and
     * collapse unused card space. The native Flash Price Tag button and its timer stay untouched. */
    private static void compactNativeFlashButtons(View root) {
        try {
            List<View> allViews = new ArrayList<>();
            collectViews(root, allViews);
            applyEslTags(root);
            hideRouteFeedbackPrompt(allViews);
            hideResumeRouteButton(allViews);
        } catch (Throwable t) {
            Log.w(TAG, "Unable to compact native flash control", t);
        }
    }

    /** Removes only the native feedback sentence shown below Route My List's carousel. */
    private static void hideRouteFeedbackPrompt(List<View> views) {
        for (View view : views) {
            if (!(view instanceof TextView)) continue;
            String text = String.valueOf(((TextView) view).getText());
            if (text.startsWith("We'd love to hear what you think!") ||
                    "Give feedback".equals(text.trim())) {
                view.setVisibility(View.GONE);
            }
        }
    }

    /** See the comment at its one call site in onNativeRouteMyListViewCreated. */
    private static void nudgeMapViewportResize() {
        if (cachedMapFragment == null) return;
        try {
            WebView map = (WebView) cachedMapFragment.getClass().getField("i").get(cachedMapFragment);
            if (map == null) return;
            map.post(() -> map.evaluateJavascript(
                    "(function(){window.dispatchEvent(new Event('resize'));return true;})();",
                    result -> Log.i(TAG, "Map viewport resize nudge dispatched: " + result)));
        } catch (Throwable t) {
            Log.w(TAG, "Unable to nudge map viewport resize", t);
        }
    }

    /**
     * Hides Walmart's native "Resume route" prompt (R.id.instoremaps_resume_route /
     * instoremaps_resume_route_button). It decides whether to show itself by comparing against
     * Walmart's own naive aisle-order bookkeeping, which our coordinate reorder in
     * tryApplyCoordinateRouteOrder doesn't feed back into — so once our reorder has taken over
     * and already started the route at the nearest-to-entrance stop, the prompt is always stale
     * (it can fire even when the shopper is already exactly where the reordered route says they
     * should be). Only suppress it once our own ordering is active; before that, native's aisle
     * order is still what's showing, so its own resume logic is still meaningful.
     */
    private static void hideResumeRouteButton(List<View> views) {
        if (!coordinateOrderApplied) {
            return;
        }
        for (View view : views) {
            if (hasResourceEntryName(view, "instoremaps_resume_route_button")
                    || hasResourceEntryName(view, "instoremaps_resume_route")) {
                if (view.getVisibility() != View.GONE) {
                    view.setVisibility(View.GONE);
                    Log.i(TAG, "hideResumeRouteButton: set GONE on " + view.getClass().getSimpleName());
                }
            }
        }
    }

    private static boolean hasResourceEntryName(View view, String entryName) {
        int id = view.getId();
        if (id == View.NO_ID) return false;
        try {
            return entryName.equals(view.getResources().getResourceEntryName(id));
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static View findViewByClassSuffix(View root, String suffix) {
        if (root.getClass().getName().endsWith(suffix)) return root;
        if (!(root instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) root;
        for (int i = 0; i < group.getChildCount(); i++) {
            View found = findViewByClassSuffix(group.getChildAt(i), suffix);
            if (found != null) return found;
        }
        return null;
    }

    private static void collectViews(View root, List<View> output) {
        output.add(root);
        if (!(root instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) root;
        for (int i = 0; i < group.getChildCount(); i++) {
            collectViews(group.getChildAt(i), output);
        }
    }

    private static int dp(View view, int dp) {
        return (int) (dp * view.getResources().getDisplayMetrics().density + 0.5f);
    }

    private static Object readField(Object target, String name) throws Exception {
        Class<?> current = target.getClass();
        while (current != null) {
            try {
                Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(target);
            } catch (NoSuchFieldException ignored) {
                current = current.getSuperclass();
            }
        }
        throw new NoSuchFieldException("No field " + name + " in " + target.getClass() + " or superclasses");
    }

    private static void writeField(Object target, String name, Object value) throws Exception {
        Class<?> current = target.getClass();
        while (current != null) {
            try {
                Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                field.set(target, value);
                return;
            } catch (NoSuchFieldException ignored) {
                current = current.getSuperclass();
            }
        }
        throw new NoSuchFieldException("No field " + name + " in " + target.getClass() + " or superclasses");
    }

    /**
     * Opens Walmart's own multi-item Route My List destination. This is the internal flow that
     * owns the provider-specific entrance/exit route line; the patch only supplies resolved list
     * pins and the normal shopping-list launch context.
     */
    private static void showNativeRouteMyList() throws Exception {
        if (cachedPinItems == null || cachedPinItems.isEmpty()) return;

        Class<?> pinItemCls = Class.forName("com.walmart.glass.instoremaps.api.model.StoreMapPinItemDetails");
        Class<?> routeDetailsCls = Class.forName("com.walmart.glass.instoremaps.api.model.RouteMyListAnalyticsDetails");
        Class<?> contextEnumCls = Class.forName("com.walmart.analytics.schema.ContextEnum");
        Class<?> multiItemMapCls = Class.forName("com.walmart.glass.instoremaps.view.InStoreMapsMultiItemLocatorFragment");
        Class<?> routeArgsCls = Class.forName("com.walmart.glass.instoremaps.view.g0");
        Class<?> navigationApiCls = Class.forName("glass.platform.navigation.api.f");
        Class<?> navigationActionsCls = Class.forName("glass.platform.navigation.api.e");
        Class<?> registryCls = Class.forName("glass.platform.registry.api.a");
        Class<?> function1Cls = Class.forName("kotlin.jvm.functions.Function1");

        Object context = contextEnumCls.getField("myItems").get(null);
        Object analyticsDetails = routeDetailsCls.getConstructor(contextEnumCls, String.class, String.class)
                .newInstance(context, "", "");
        String storeId = getCurrentStoreId(cachedListFragment);
        Object pinArray = java.lang.reflect.Array.newInstance(pinItemCls, cachedPinItems.size());
        for (int index = 0; index < cachedPinItems.size(); index++) {
            java.lang.reflect.Array.set(pinArray, index, cachedPinItems.get(index));
        }
        Object routeArgs = routeArgsCls.getConstructor(pinArray.getClass(), String.class, routeDetailsCls)
                .newInstance(pinArray, storeId, analyticsDetails);
        Object routeFragment = multiItemMapCls.getConstructor().newInstance();
        multiItemMapCls.getMethod("setArguments", Class.forName("android.os.Bundle"))
                .invoke(routeFragment, routeArgsCls.getMethod("a").invoke(routeArgs));

        Object navigationApi = getFromRegistryUsingE(registryCls, navigationApiCls);
        if (navigationApi == null) {
            throw new IllegalStateException("Walmart navigation API is unavailable.");
        }
        Object navigationCallback = Proxy.newProxyInstance(
                function1Cls.getClassLoader(), new Class[]{function1Cls}, (proxy, method, args) -> {
                    if ("invoke".equals(method.getName()) && args != null && args.length == 1) {
                        return navigationActionsCls.getMethod("Q", Class.forName("androidx.fragment.app.Fragment"), boolean.class)
                                .invoke(args[0], routeFragment, true);
                    }
                    if ("toString".equals(method.getName())) return "RouteMyListNavigationCallback";
                    return null;
                });
        Context androidContext = (Context) callNoArg(cachedListFragment, "requireContext");
        navigationApiCls.getMethod("O2", Context.class, function1Cls)
                .invoke(navigationApi, androidContext, navigationCallback);
        Log.i(TAG, "Opened native Route My List with " + cachedPinItems.size() + " pin(s)");
    }

    /** Gets the active shopping-list store ID using the same view-model path as Walmart's UI. */
    private static String getCurrentStoreId(Object listDetailFragment) {
        try {
            Object viewModel = tryCallNoArg(listDetailFragment, "Ve");
            if (viewModel == null) {
                viewModel = tryCallNoArg(listDetailFragment, "Ye");
            }
            if (viewModel == null) return "";
            Object storeLiveData = viewModel.getClass().getField("l").get(viewModel);
            Object store = callNoArg(storeLiveData, "getValue");
            Object storeId = store == null ? null : store.getClass().getField("a").get(store);
            return storeId == null ? "" : storeId.toString();
        } catch (Throwable t) {
            Log.w(TAG, "Unable to read selected store ID; native Route My List will resolve it", t);
            return "";
        }
    }

    /** Called from the patched InStoreMapsBaseFragment.onViewCreated to add the Prev/Next bar. */
    public static void onMapFragmentViewCreated(Object mapFragment) {
        try {
            cachedMapFragment = mapFragment;
            injectNavBar(mapFragment);
        } catch (Throwable t) {
            Log.e(TAG, "injectNavBar failed", t);
        }
    }

    /** Called from the patched InStoreMapsItemLocatorFragment.onDestroyView to clean up the bar. */
    public static void onMapFragmentDestroyed(Object mapFragment) {
        if (cachedMapFragment == mapFragment) {
            cachedMapFragment = null;
        }
        removeNavBar();
    }

    /** Builds (or rebuilds) the list of pins/items for the current list, sorted by aisle code. */
    private static List<Object> computeSortedPinItems(Object fragment) throws Exception {
        List<Object> products = findProducts(fragment);
        Log.i(TAG, "findProducts returned " + products.size() + " product(s)");

        Class<?> pinOptionsCls = Class.forName("com.walmart.glass.instoremaps.api.PinOptions");
        Class<?> pinTypeCls = Class.forName("com.walmart.glass.instoremaps.api.l0");
        Class<?> itemDetailsCls = Class.forName("com.walmart.glass.instoremaps.api.model.InstoreMapsItemDetails");
        Class<?> storeMapPinItemDetailsCls = Class.forName("com.walmart.glass.instoremaps.api.model.StoreMapPinItemDetails");

        Constructor<?> pinOptionsCtor = pinOptionsCls.getConstructor(
                String.class, String.class, String.class, String.class, Boolean.class,
                Integer.class, pinTypeCls, Boolean.class, Boolean.class);
        Constructor<?> itemDetailsCtor = itemDetailsCls.getConstructor(
                String.class, String.class, String.class, String.class, String.class, Double.class,
                String.class, String.class, String.class, String.class, String.class, String.class,
                String.class, String.class, String.class, String.class, List.class, int.class);
        Constructor<?> pinItemCtor = storeMapPinItemDetailsCls.getConstructor(pinOptionsCls, itemDetailsCls);

        List<Object> pinItems = new ArrayList<>();
        for (Object product : products) {
            // Real compiled getter names differ from jadx's Kotlin-metadata display names
            // (e.g. getName() is really "e", getUsItemId() is really "D3"); both are tried.
            String name = (String) tryCallAny(product, "getName", "e");
            String itemId = (String) tryCallAny(product, "getUsItemId", "D3");
            if (isEmpty(itemId)) {
                itemId = (String) tryCallAny(product, "getId", "d");
            }

            Object productLocation = tryCallAny(product, "getProductLocation", "K");
            if (productLocation == null) {
                Log.i(TAG, "Skipping '" + name + "': no productLocation");
                continue;
            }
            String displayValue = (String) tryCallAny(productLocation, "getDisplayValue", "a");
            Object aisle = tryCallAny(productLocation, "getAisle", "b");

            String zone = "";
            String aisleNumber = "";
            String section = "";
            if (aisle != null) {
                Object z = tryCallAny(aisle, "getZone", "a");
                Object a = tryCallAny(aisle, "getAisle", "b");
                Object s = tryCallAny(aisle, "getSection", "d");
                if (z != null) zone = z.toString();
                if (a != null) aisleNumber = a.toString();
                if (s != null) section = s.toString();
            }
            if (isEmpty(aisleNumber)) {
                Log.i(TAG, "Skipping '" + name + "': no resolved aisle number");
                continue;
            }
            if (itemId == null) itemId = "";
            if (name == null) name = "";
            Object imageInfo = tryCallAny(product, "getImageInfo", "P", "g2");
            String thumbnailUrl = imageInfo == null ? null : (String) tryCallAny(
                    imageInfo, "getThumbnailUrl", "a", "i");
            String preciseLocation = aisleNumber;
            if (!isEmpty(section)) {
                preciseLocation += " \u00b7 Section " + section;
            }

            Object pinOptions = pinOptionsCtor.newInstance(
                    zone, aisleNumber, section, null, null, null, null, null, null);
            // Shelf-label (ESL) tags are not part of the list data; prefetchEslTags() fills them in
            // later from the item page's product query so Walmart shows its native flash button.
            List<Object> locations = Collections.emptyList();
            Object itemDetails = itemDetailsCtor.newInstance(
                    thumbnailUrl, itemId, name, preciseLocation, null, null,
                    null, null, null, null, null, null, null, null, null, null,
                    locations, 1);
            pinItems.add(pinItemCtor.newInstance(pinOptions, itemDetails));
        }

        if (pinItems.isEmpty()) {
            throw new IllegalStateException(
                    "No list items had a resolved aisle location (see earlier 'Skipping' log lines)");
        }

        // Approximate a sensible walking order with no floorplan graph available: a natural
        // (alphanumeric-aware) sort of the aisle code puts e.g. "A2" before "A10" and groups
        // same-letter aisles together, which is a reasonable proxy for "walk the aisles in order."
        Field pinOptionsZoneField = pinOptionsCls.getField("a");
        Field pinOptionsAisleField = pinOptionsCls.getField("b");
        Field pinOptionsSectionField = pinOptionsCls.getField("c");
        Field pinItemOptionsField = storeMapPinItemDetailsCls.getField("a");
        Collections.sort(pinItems, (p1, p2) -> {
            try {
                Object opt1 = pinItemOptionsField.get(p1);
                Object opt2 = pinItemOptionsField.get(p2);
                String zone1 = (String) pinOptionsZoneField.get(opt1);
                String zone2 = (String) pinOptionsZoneField.get(opt2);
                int zComp = (zone1 == null ? "" : zone1).compareTo(zone2 == null ? "" : zone2);
                if (zComp != 0) return zComp;
                String aisle1 = (String) pinOptionsAisleField.get(opt1);
                String aisle2 = (String) pinOptionsAisleField.get(opt2);
                int aComp = naturalCompare(aisle1, aisle2);
                if (aComp != 0) return aComp;
                String sec1 = (String) pinOptionsSectionField.get(opt1);
                String sec2 = (String) pinOptionsSectionField.get(opt2);
                return naturalCompare(sec1, sec2);
            } catch (Exception e) {
                return 0;
            }
        });

        return pinItems;
    }

    // ---------------------------------------------------------------------------------------
    // Shelf-label (ESL) tag lookup. Route My List's own item details carry no shelf-label data, so
    // Walmart hides "Flash price tag". The item page gets the tags from its product GraphQL query;
    // replay that query through Walmart's own Apollo client for each route item and write the tags
    // into the item details, then ask the view model to recompute which actions to show.
    // ---------------------------------------------------------------------------------------
    private static final Map<String, List<String>> ESL_TAGS = new ConcurrentHashMap<>();
    private static final Set<String> ESL_REQUESTED = ConcurrentHashMap.newKeySet();

    private static void prefetchEslTags(View root) {
        try {
            List<Object> pins = cachedPinItems;
            if (pins == null) return;
            Class<?> pinCls = Class.forName("com.walmart.glass.instoremaps.api.model.StoreMapPinItemDetails");
            Class<?> detailsCls = Class.forName("com.walmart.glass.instoremaps.api.model.InstoreMapsItemDetails");
            Field pinDetails = pinCls.getField("b");
            Field detailsId = detailsCls.getField("b");
            final List<String> missing = new ArrayList<>();
            for (Object pin : pins) {
                String id = (String) detailsId.get(pinDetails.get(pin));
                if (!isEmpty(id) && ESL_REQUESTED.add(id)) missing.add(id);
            }
            if (missing.isEmpty()) return;
            Thread worker = new Thread(() -> {
                for (String id : missing) {
                    try {
                        List<String> tags = fetchEslTags(id);
                        ESL_TAGS.put(id, tags);
                        Log.i(TAG, "ESLFETCH item " + id + " -> " + tags);
                    } catch (Throwable t) {
                        Log.w(TAG, "ESLFETCH item " + id + " failed", t);
                        ESL_TAGS.put(id, Collections.emptyList());
                    }
                    root.post(() -> applyEslTags(root));
                }
            }, "RouteMyListEslFetch");
            worker.start();
        } catch (Throwable t) {
            Log.w(TAG, "ESLFETCH setup failed", t);
        }
    }

    /** Writes any fetched tags into the live item details and refreshes the native view model. */
    private static void applyEslTags(View root) {
        try {
            if (ESL_TAGS.isEmpty() || cachedMapFragment == null) return;
            Object viewModel = callNoArg(cachedMapFragment, "cf");
            Class<?> pinCls = Class.forName("com.walmart.glass.instoremaps.api.model.StoreMapPinItemDetails");
            List<Object> detailsList = new ArrayList<>();
            List<Object> pins = cachedPinItems;
            if (pins != null) {
                Field pinDetails = pinCls.getField("b");
                for (Object pin : pins) detailsList.add(pinDetails.get(pin));
            }
            Object models = readField(viewModel, "z1");
            if (models instanceof List) {
                for (Object model : (List<?>) models) detailsList.add(readField(model, "a"));
            }
            boolean changed = false;
            for (Object details : detailsList) {
                if (details != null && attachEslTags(details)) changed = true;
            }
            if (changed) {
                viewModel.getClass().getMethod("Me").invoke(viewModel);
                Log.i(TAG, "ESLFETCH applied shelf-label tags; view model refreshed");
            }
        } catch (Throwable t) {
            Log.w(TAG, "ESLFETCH apply failed", t);
        }
    }

    private static boolean attachEslTags(Object details) throws Exception {
        Class<?> detailsCls = details.getClass();
        String id = (String) detailsCls.getField("b").get(details);
        List<String> tags = id == null ? null : ESL_TAGS.get(id);
        if (tags == null || tags.isEmpty()) return false;
        Field q = detailsCls.getField("q");
        Object current = q.get(details);
        if (current instanceof List && !((List<?>) current).isEmpty()) return false;
        Class<?> eslCls = Class.forName("com.walmart.glass.instoremaps.api.model.InstoreMapsItemDetails$ESLTag");
        Class<?> aisleCls = Class.forName("com.walmart.glass.instoremaps.api.model.InstoreMapsItemDetails$Aisle");
        Class<?> locCls = Class.forName("com.walmart.glass.instoremaps.api.model.InstoreMapsItemDetails$ProductLocation");
        List<Object> tagObjects = new ArrayList<>();
        for (String barcode : tags) tagObjects.add(eslCls.getConstructor(String.class).newInstance(barcode));
        Object aisle = aisleCls.getConstructor(String.class, List.class).newInstance("", tagObjects);
        List<Object> locations = new ArrayList<>();
        locations.add(locCls.getConstructor(aisleCls).newInstance(aisle));
        q.setAccessible(true);
        q.set(details, locations);
        return true;
    }

    private static List<String> fetchEslTags(String itemId) throws Exception {
        Class<?> productCls = Class.forName(
                "com.walmart.glass.featureitem.orchestration.graphql.generated.GetProduct");
        Object operation = buildGetProduct(productCls, itemId);
        Object client = Class.forName("com.walmart.glass.item.repository.f").getMethod("t").invoke(null);
        Class<?> callCls = Class.forName("com.apollographql.apollo3.a");
        Object call = null;
        for (Constructor<?> ctor : callCls.getConstructors()) {
            Class<?>[] types = ctor.getParameterTypes();
            if (types.length == 2 && types[0].isInstance(client) && types[1].isInstance(operation)) {
                call = ctor.newInstance(client, operation);
                break;
            }
        }
        if (call == null) throw new IllegalStateException("No Apollo call constructor matched");
        Method addHeader = callCls.getMethod("a", String.class, String.class);
        addHeader.invoke(call, "POST_INCLUDE_DOCUMENT", "true");
        addHeader.invoke(call, "WM_CONSUMER.ID", "c52ce16a-df55-43ee-ba7c-4c24fdb3bb05");
        addHeader.invoke(call, "cyomv2enabled", "true");
        addHeader.invoke(call, "sizeConversionEnabled", "true");
        Class<?> continuationCls = Class.forName("kotlin.coroutines.Continuation");
        Object response = awaitSuspend(callCls.getMethod("b", continuationCls), call, continuationCls);
        List<String> tags = new ArrayList<>();
        collectEslBarcodes(response, tags);
        return tags;
    }

    /** Invokes a Kotlin suspend function from Java and blocks the (background) caller for its result. */
    private static Object awaitSuspend(Method method, Object target, Class<?> continuationCls) throws Exception {
        final java.util.concurrent.CountDownLatch latch = new java.util.concurrent.CountDownLatch(1);
        final Object[] holder = new Object[1];
        final Object context = Class.forName("kotlin.coroutines.EmptyCoroutineContext").getField("INSTANCE").get(null);
        Object continuation = Proxy.newProxyInstance(continuationCls.getClassLoader(), new Class<?>[]{continuationCls},
                (proxy, m, args) -> {
                    if (m.getDeclaringClass() == Object.class) {
                        if (m.getName().equals("hashCode")) return System.identityHashCode(proxy);
                        if (m.getName().equals("equals")) return proxy == args[0];
                        return "RouteMyListContinuation";
                    }
                    if (args == null || args.length == 0) return context;
                    holder[0] = args[0];
                    latch.countDown();
                    return null;
                });
        Object result = method.invoke(target, continuation);
        String resultType = result == null ? "" : result.getClass().getName();
        if (resultType.contains("CoroutineSingletons") || String.valueOf(result).equals("COROUTINE_SUSPENDED")) {
            if (!latch.await(40, java.util.concurrent.TimeUnit.SECONDS)) {
                throw new IllegalStateException("Timed out waiting for the item query");
            }
            result = holder[0];
        }
        if (result != null && result.getClass().getName().contains("Failure")) {
            throw new IllegalStateException("Item query failed: " + result);
        }
        return result;
    }

    private static Object buildGetProduct(Class<?> productCls, String itemId) throws Exception {
        Class<?> unsafeCls = Class.forName("sun.misc.Unsafe");
        Field theUnsafe = unsafeCls.getDeclaredField("theUnsafe");
        theUnsafe.setAccessible(true);
        Object operation = unsafeCls.getMethod("allocateInstance", Class.class).invoke(theUnsafe.get(null), productCls);

        Class<?> optionalCls = Class.forName("com.apollographql.apollo3.api.Optional");
        Class<?> presentCls = Class.forName("com.apollographql.apollo3.api.Optional$Present");
        Object absent = Class.forName("com.apollographql.apollo3.api.Optional$Absent").getField("INSTANCE").get(null);
        Constructor<?> presentCtor = presentCls.getConstructors()[0];

        // Values observed when Walmart's item page loads a product (see the GETPRODUCT capture).
        Map<String, Object> values = new HashMap<>();
        values.put("itId", itemId);
        values.put("contentLayoutVersion", "v2");
        values.put("layoutId", "mobile-item");
        values.put("pageType", "MobileItemscreenGlobal");
        values.put("ten", "WM_GLASS");
        for (String name : new String[]{"enablePrepurchaseReviewIncentive", "isOneDebitCardBannerEnabled",
                "isStoreJourneyEnabled", "isSubscriptionFrequencyListEnabled", "isVisionCenterEnabled",
                "secondaryOffersEnabled"}) {
            values.put(name, Boolean.TRUE);
        }
        for (String name : new String[]{"includefilterCriteria", "isATFReviewSummaryBulletFormatEnabled", "sel",
                "vCrit"}) {
            values.put(name, presentCtor.newInstance(Boolean.TRUE));
        }
        for (String name : new String[]{"enableMergeProductIdml", "includeTopRankedReviewMedia", "includeVideo",
                "isAOSWplusDiscountEnabled", "isAddToDeliveryEnabled", "isBill29Enabled", "isBuyboxAdV1Enabled",
                "isBuyboxSponsoredPromptsEnabled", "isBuyboxVideoEnabled", "isChannelLevelPriceInfoEnabled",
                "isComparisonChartSponsoredEnabled", "isContactLensPurchaseEnabled", "isFlowerDeliveryDateEnabled",
                "isOptionalPropertyEnabled", "isPrismWalmartPlusEventBannerEnabled", "isPromotionEligibleEnabled",
                "isShippingCostMessageEnabled", "isSubscriptionValuePropEnabled", "isUpstreamErrorCodeEnabled",
                "shouldEnableSDAS", "skipIDMLAtRootLevel"}) {
            values.put(name, presentCtor.newInstance(Boolean.FALSE));
        }
        values.put("count", presentCtor.newInstance(Integer.valueOf(1)));
        values.put("startAt", presentCtor.newInstance(Integer.valueOf(1)));
        values.put("postProcessingVersion", presentCtor.newInstance(Integer.valueOf(2)));
        values.put("reviewSummaryAspectsLimit", presentCtor.newInstance(Integer.valueOf(6)));

        for (Field field : productCls.getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers())) continue;
            field.setAccessible(true);
            Class<?> type = field.getType();
            Object value = values.get(field.getName());
            if (value == null) {
                if (type == boolean.class) value = Boolean.FALSE;
                else if (optionalCls.isAssignableFrom(type)) value = absent;
                else if (type == String.class) value = "";
                else if (List.class.isAssignableFrom(type)) value = Collections.emptyList();
            }
            if (value != null) field.set(operation, value);
        }
        return operation;
    }

    /** Collects barcodes from any list field named like "eslTags" anywhere in a response graph. */
    private static void collectEslBarcodes(Object root, List<String> out) throws Exception {
        java.util.IdentityHashMap<Object, Boolean> seen = new java.util.IdentityHashMap<>();
        ArrayDeque<Object> queue = new ArrayDeque<>();
        if (root != null) queue.add(root);
        int visited = 0;
        while (!queue.isEmpty() && visited < 300000) {
            Object node = queue.poll();
            if (node == null || seen.put(node, Boolean.TRUE) != null) continue;
            visited++;
            if (node instanceof java.util.Collection) {
                for (Object e : (java.util.Collection<?>) node) if (e != null) queue.add(e);
                continue;
            }
            if (node instanceof Map) {
                for (Object e : ((Map<?, ?>) node).values()) if (e != null) queue.add(e);
                continue;
            }
            String cn = node.getClass().getName();
            if (!(cn.startsWith("com.walmart") || cn.startsWith("com.apollographql"))) continue;
            for (Field field : node.getClass().getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                field.setAccessible(true);
                Object value = field.get(node);
                if (value == null) continue;
                if (field.getName().toLowerCase(Locale.ROOT).contains("esltag") && value instanceof List) {
                    for (Object tag : (List<?>) value) {
                        String barcode = barcodeOf(tag);
                        if (!isEmpty(barcode) && !out.contains(barcode)) out.add(barcode);
                    }
                } else {
                    queue.add(value);
                }
            }
        }
    }

    private static String barcodeOf(Object tag) throws Exception {
        if (tag == null) return null;
        String fallback = null;
        for (Field f : tag.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(f.getModifiers()) || f.getType() != String.class) continue;
            f.setAccessible(true);
            String v = (String) f.get(tag);
            if (f.getName().toLowerCase(Locale.ROOT).contains("barcode")) return v;
            if (fallback == null) fallback = v;
        }
        return fallback;
    }

    /** (Re)opens the native map, focused on cachedPinItems.get(currentIndex), with all pins shown. */
    private static void showMapForCurrentIndex() throws Exception {
        if (cachedPinItems == null || cachedPinItems.isEmpty()) return;
        currentIndex = ((currentIndex % cachedPinItems.size()) + cachedPinItems.size()) % cachedPinItems.size();
        Log.i(TAG, "Showing item " + (currentIndex + 1) + " of " + cachedPinItems.size() + " (sorted by aisle)");

        Class<?> pinOptionsCls = Class.forName("com.walmart.glass.instoremaps.api.PinOptions");
        Class<?> itemDetailsCls = Class.forName("com.walmart.glass.instoremaps.api.model.InstoreMapsItemDetails");
        Class<?> storeMapPinItemDetailsCls = Class.forName("com.walmart.glass.instoremaps.api.model.StoreMapPinItemDetails");
        // Real name is "a" - jadx displayed it as "InterfaceC18119a" only because "a.java" collided
        // with another file on a case-insensitive filesystem during decompilation; that display
        // name never existed in the compiled app.
        Class<?> instoreMapsApiCls = Class.forName("com.walmart.glass.instoremaps.api.a");
        Class<?> registryCls = Class.forName("glass.platform.registry.api.a");

        // Use the single-item locator (.c), proven live today from product pages and the list
        // screen's own existing "storeMaps" click handler (glass/lists/view/lists/C0.java) rather
        // than the unused/unwired .g() route-my-list method. The real call site there is:
        //   interfaceC18119a.c(collection, instoreMapsItemDetails, AbstractC18121c.a.a,
        //       new C14686v0(listDetailFragment, 3));
        // We replicate it exactly, reusing that same merged-lambda receiver pattern with our own
        // fragment instance - a verified-real (arity, receiver-type) pair, not a guess.
        List<Object> allPinOptions = new ArrayList<>();
        for (Object pinItem : cachedPinItems) {
            allPinOptions.add(pinOptionsCls.cast(storeMapPinItemDetailsCls.getField("a").get(pinItem)));
        }
        Object primaryItemDetails = itemDetailsCls.cast(
                storeMapPinItemDetailsCls.getField("b").get(cachedPinItems.get(currentIndex)));

        Class<?> launchSourceCls = Class.forName("com.walmart.glass.instoremaps.api.c");
        Class<?> launchSourceVariantCls = Class.forName("com.walmart.glass.instoremaps.api.c$a");
        Object launchSource = launchSourceVariantCls.getField("a").get(null);

        Class<?> function1Cls = Class.forName("kotlin.jvm.functions.Function1");
        // jadx displayed this as "C14686v0" (a collision-disambiguation prefix, same pattern as
        // InterfaceC18119a -> "a"); the real class name is just the preserved "v0" suffix.
        // (A Proxy implementing Function1 directly was tried to hook the Fragment it receives -
        // confirmed real class com.walmart.glass.instoremaps.view.InStoreMapsItemLocatorFragment -
        // but returning null from it stopped .c() from actually showing the screen, so the real
        // v0 lambda is used here; the fragment is hooked separately via its own patched lifecycle.)
        Class<?> callbackImplCls = Class.forName("com.walmart.glass.checkout.analytics.v0");
        Constructor<?> callbackCtor = callbackImplCls.getDeclaredConstructor(Object.class, int.class);
        callbackCtor.setAccessible(true);
        Object callback = callbackCtor.newInstance(cachedListFragment, 3);

        Object instoreMapsApi = getFromRegistry(registryCls, instoreMapsApiCls);
        if (instoreMapsApi == null) {
            throw new IllegalStateException("glass.platform.registry.api.a returned null for InterfaceC18119a");
        }

        Method cMethod = instoreMapsApiCls.getMethod("c", java.util.Collection.class, itemDetailsCls, launchSourceCls, function1Cls);
        cMethod.invoke(instoreMapsApi, allPinOptions, primaryItemDetails, launchSource, callback);
        Log.i(TAG, "InterfaceC18119a.c() invoked with " + allPinOptions.size() + " pin(s), primary index " + currentIndex);
    }

    /** Adds a floating Prev/Next bar to the map screen's own window, below the item detail card. */
    private static void injectNavBar(Object mapFragment) throws Exception {
        removeNavBar();
        if (cachedPinItems == null || cachedPinItems.size() <= 1) {
            return; // Nothing to page through.
        }

        Method getView = mapFragment.getClass().getMethod("getView");
        View root = (View) getView.invoke(mapFragment);
        if (root == null) {
            Log.i(TAG, "injectNavBar: fragment view is null, skipping");
            return;
        }
        View windowRoot = root.getRootView();
        if (!(windowRoot instanceof ViewGroup)) {
            Log.i(TAG, "injectNavBar: root view is not a ViewGroup, skipping");
            return;
        }
        Context context = root.getContext();
        float density = context.getResources().getDisplayMetrics().density;

        LinearLayout bar = new LinearLayout(context);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setBackgroundColor(Color.argb(230, 0, 113, 206)); // Walmart blue, mostly opaque
        int padV = (int) (10 * density);
        int padH = (int) (18 * density);
        bar.setPadding(padH, padV, padH, padV);

        Button prev = new Button(context);
        prev.setText("◀ Prev");
        styleNavButton(prev);

        TextView label = new TextView(context);
        label.setTextColor(Color.WHITE);
        label.setGravity(Gravity.CENTER);
        label.setPadding(padH, 0, padH, 0);
        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        label.setLayoutParams(labelParams);

        Button next = new Button(context);
        next.setText("Next ▶");
        styleNavButton(next);

        prev.setOnClickListener(v -> step(-1, label));
        next.setOnClickListener(v -> step(1, label));

        bar.addView(prev);
        bar.addView(label);
        bar.addView(next);
        updateLabel(label);

        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.gravity = Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL;
        params.bottomMargin = (int) (220 * density); // sits just below the item detail card

        ((ViewGroup) windowRoot).addView(bar, params);
        navOverlayView = bar;
        Log.i(TAG, "injectNavBar: added Prev/Next bar for " + cachedPinItems.size() + " items");
    }

    private static void styleNavButton(Button button) {
        button.setTextColor(Color.WHITE);
        button.setBackgroundColor(Color.argb(60, 255, 255, 255));
    }

    private static void updateLabel(TextView label) {
        if (cachedPinItems == null) return;
        label.setText((currentIndex + 1) + " of " + cachedPinItems.size());
    }

    private static void step(int delta, TextView label) {
        try {
            if (cachedPinItems == null || cachedPinItems.isEmpty()) {
                return;
            }
            currentIndex += delta;
            currentIndex = ((currentIndex % cachedPinItems.size()) + cachedPinItems.size()) % cachedPinItems.size();
            renderMountedMapWithFocusedPin();
            updateMountedItemCard();
            updateLabel(label);
        } catch (Throwable t) {
            Log.e(TAG, "step failed", t);
        }
    }

    /**
     * Re-renders pins through the WebView already owned by the visible Fragment. The native
     * launcher creates a new Fragment and WebView; this sends the same RENDER_PINS_REQUESTED
     * message to the mounted page. Walmart's response to that message carries the selected map
     * area and its existing callback animates the camera to that area.
     */
    private static void renderMountedMapWithFocusedPin() throws Exception {
        if (cachedMapFragment == null || cachedPinItems == null || cachedPinItems.isEmpty()) {
            throw new IllegalStateException("The active store map is not available.");
        }

        Class<?> pinOptionsCls = Class.forName("com.walmart.glass.instoremaps.api.PinOptions");
        Class<?> pinItemCls = Class.forName("com.walmart.glass.instoremaps.api.model.StoreMapPinItemDetails");
        Class<?> renderPinCls = Class.forName("com.walmart.glass.instoremaps.model.request.RenderPin$Pin");
        Field pinItemOptionsField = pinItemCls.getField("a");
        Constructor<?> renderPinCtor = renderPinCls.getConstructor(
                Boolean.class, Boolean.class, Boolean.class, Integer.class,
                String.class, String.class, String.class, String.class, String.class);

        List<Object> renderedPins = new ArrayList<>();
        for (int index = 0; index < cachedPinItems.size(); index++) {
            Object original = pinOptionsCls.cast(pinItemOptionsField.get(cachedPinItems.get(index)));
            Object pinType = pinOptionsCls.getField("g").get(original);
            String pinTypeName = pinType == null ? null : (String) callNoArg(pinType, "a");
            renderedPins.add(renderPinCtor.newInstance(
                    pinOptionsCls.getField("e").get(original),
                    Boolean.valueOf(index == currentIndex),
                    pinOptionsCls.getField("i").get(original),
                    pinOptionsCls.getField("f").get(original),
                    pinTypeName,
                    pinOptionsCls.getField("a").get(original),
                    pinOptionsCls.getField("b").get(original),
                    pinOptionsCls.getField("c").get(original),
                    null));
        }

        Class<?> jsMessageCls = Class.forName("com.walmart.glass.instoremaps.z");
        String script = (String) jsMessageCls.getMethod("a", List.class).invoke(null, renderedPins);
        WebView webView = (WebView) cachedMapFragment.getClass().getField("i").get(cachedMapFragment);
        if (webView == null) {
            throw new IllegalStateException("The mounted map WebView is unavailable.");
        }
        webView.evaluateJavascript(script, null);
        Log.i(TAG, "RENDER_PINS_REQUESTED sent to the mounted map, primary index " + currentIndex);
        injectRouteConnectors(cachedMapFragment, webView);
        webView.postDelayed(() -> injectRouteConnectors(cachedMapFragment, webView), 300L);
    }

    /** Updates the locator Fragment's native item card without recreating that Fragment. */
    private static void updateMountedItemCard() throws Exception {
        Class<?> pinItemCls = Class.forName("com.walmart.glass.instoremaps.api.model.StoreMapPinItemDetails");
        Object itemDetails = pinItemCls.getField("b").get(cachedPinItems.get(currentIndex));
        String title = (String) itemDetails.getClass().getField("c").get(itemDetails);
        String location = (String) itemDetails.getClass().getField("d").get(itemDetails);

        Object fragmentBinding = callNoArg(cachedMapFragment, "Ve");
        Object itemCardBinding = fragmentBinding.getClass().getField("g").get(fragmentBinding);
        TextView titleView = (TextView) itemCardBinding.getClass().getField("j").get(itemCardBinding);
        TextView locationView = (TextView) itemCardBinding.getClass().getField("h").get(itemCardBinding);
        titleView.setText(title == null ? "" : title);
        locationView.setText(location == null || location.isEmpty() ? "" : "Aisle " + location);
        Log.i(TAG, "Updated mounted item card for primary index " + currentIndex);
    }

    private static void removeNavBar() {
        if (navOverlayView != null && navOverlayView.getParent() instanceof ViewGroup) {
            ((ViewGroup) navOverlayView.getParent()).removeView(navOverlayView);
        }
        navOverlayView = null;
    }

    /** Tries the fragment's ViewModel first (via Ye()), then the fragment itself, for a list of items with getProduct(). */
    private static List<Object> findProducts(Object fragment) {
        List<Object> results = new ArrayList<>();

        Object viewModel = tryCallNoArg(fragment, "Ve");
        if (viewModel == null) {
            viewModel = tryCallNoArg(fragment, "Ye");
        }
        List<Object> items = viewModel != null ? findBestProductList(viewModel) : Collections.emptyList();
        if (items.isEmpty()) {
            Log.i(TAG, "No product list found on Ve()/Ye() view model; trying fragment itself");
            items = findBestProductList(fragment);
        }

        MAP_ITEM_TO_LIST_ITEM.clear();
        LIST_ITEM_TO_MAP_ITEM.clear();

        for (Object item : items) {
            Object product = tryCallAny(item, "getProduct", "A");
            if (product != null) {
                results.add(product);

                String itemId = (String) tryCallAny(product, "getUsItemId", "D3");
                if (isEmpty(itemId)) {
                    itemId = (String) tryCallAny(product, "getId", "d");
                }

                Object listItemId = tryCallAny(item, "getListItemId", "w", "getId");
                if (itemId != null && listItemId != null) {
                    MAP_ITEM_TO_LIST_ITEM.put(itemId, listItemId.toString());
                    LIST_ITEM_TO_MAP_ITEM.put(listItemId.toString(), itemId);
                }
            }
        }
        Log.i(TAG, "MAP_ITEM_TO_LIST_ITEM populated with " + MAP_ITEM_TO_LIST_ITEM.size() + " mapping(s): " + MAP_ITEM_TO_LIST_ITEM);

        loadCheckedItemsFromPreferences(fragment);

        return results;
    }

    private static void loadCheckedItemsFromPreferences(Object fragment) {
        ALREADY_CHECKED_ITEM_IDS.clear();
        Context ctx = null;
        try {
            ctx = (Context) tryCallNoArg(fragment, "getContext");
        } catch (Throwable ignored) {}
        if (ctx == null) {
            try {
                ctx = (Context) tryCallNoArg(fragment, "requireContext");
            } catch (Throwable ignored) {}
        }
        if (ctx != null && !isEmpty(currentListId)) {
            try {
                SharedPreferences prefs = ctx.getSharedPreferences("com.walmart.glass.lists", Context.MODE_PRIVATE);
                Set<String> checkedListIds = prefs.getStringSet("listsChecklistPreferenceKey" + currentListId, Collections.emptySet());
                if (checkedListIds != null) {
                    for (Map.Entry<String, String> entry : MAP_ITEM_TO_LIST_ITEM.entrySet()) {
                        if (checkedListIds.contains(entry.getValue())) {
                            ALREADY_CHECKED_ITEM_IDS.add(entry.getKey());
                        }
                    }
                }
                Log.i(TAG, "Loaded checked items for list " + currentListId + ": " + ALREADY_CHECKED_ITEM_IDS);
            } catch (Throwable t) {
                Log.w(TAG, "Failed reading checklist SharedPreferences", t);
            }
        }
    }

    /** Scans getters and fields of target for a non-empty List whose elements expose getProduct(). */
    @SuppressWarnings("unchecked")
    private static List<Object> findBestProductList(Object target) {
        List<Object> best = null;
        List<String> candidates = new ArrayList<>();

        for (Method m : target.getClass().getMethods()) {
            if (m.getParameterCount() != 0 || !List.class.isAssignableFrom(m.getReturnType())) continue;
            try {
                m.setAccessible(true);
                Object result = m.invoke(target);
                if (!(result instanceof List) || ((List<?>) result).isEmpty()) continue;
                List<?> list = (List<?>) result;
                candidates.add(m.getName() + "() -> " + list.size() + "x " + list.get(0).getClass().getName());
                if (best == null && hasGetProduct(list.get(0))) {
                    best = (List<Object>) list;
                }
            } catch (Throwable ignored) {
            }
        }
        for (Field f : target.getClass().getDeclaredFields()) {
            if (!List.class.isAssignableFrom(f.getType())) continue;
            try {
                f.setAccessible(true);
                Object result = f.get(target);
                if (!(result instanceof List) || ((List<?>) result).isEmpty()) continue;
                List<?> list = (List<?>) result;
                candidates.add(f.getName() + " (field) -> " + list.size() + "x " + list.get(0).getClass().getName());
                if (best == null && hasGetProduct(list.get(0))) {
                    best = (List<Object>) list;
                }
            } catch (Throwable ignored) {
            }
        }

        Log.i(TAG, "List candidates on " + target.getClass().getName() + ": " + candidates);
        return best != null ? best : Collections.emptyList();
    }

    private static boolean hasGetProduct(Object element) {
        if (element == null) return false;
        return findMethodAny(element.getClass(), "getProduct", "A") != null;
    }

    /** Finds a public zero-arg method by any of the candidate names (jadx's display name may
     * differ from the real compiled name due to Kotlin-metadata-based getter renaming). */
    private static Method findMethodAny(Class<?> cls, String... candidateNames) {
        for (String candidate : candidateNames) {
            try {
                return cls.getMethod(candidate);
            } catch (NoSuchMethodException ignored) {
            }
        }
        return null;
    }

    /** Handles both true-static methods and Kotlin `object` singletons (INSTANCE field) uniformly. */
    private static Object getFromRegistry(Class<?> registryCls, Class<?> wantedCls) throws Exception {
        Method m = registryCls.getMethod("a", Class.class);
        m.setAccessible(true);
        if (Modifier.isStatic(m.getModifiers())) {
            return m.invoke(null, wantedCls);
        }
        Field instanceField = registryCls.getField("INSTANCE");
        return m.invoke(instanceField.get(null), wantedCls);
    }

    /** Gets an eagerly-registered platform service; navigation is registered through e(), not a(). */
    private static Object getFromRegistryUsingE(Class<?> registryCls, Class<?> wantedCls) throws Exception {
        Method m = registryCls.getMethod("e", Class.class);
        m.setAccessible(true);
        return Modifier.isStatic(m.getModifiers()) ? m.invoke(null, wantedCls)
                : m.invoke(registryCls.getField("INSTANCE").get(null), wantedCls);
    }

    private static Object callNoArg(Object target, String methodName) throws Exception {
        Method m = target.getClass().getMethod(methodName);
        m.setAccessible(true);
        return m.invoke(target);
    }

    private static Object tryCallNoArg(Object target, String methodName) {
        if (target == null) return null;
        try {
            return callNoArg(target, methodName);
        } catch (Throwable t) {
            return null;
        }
    }

    /** Tries each candidate method name in order, returning the first successful call's result. */
    private static Object tryCallAny(Object target, String... candidateNames) {
        if (target == null) return null;
        Method m = findMethodAny(target.getClass(), candidateNames);
        if (m == null) return null;
        try {
            m.setAccessible(true);
            return m.invoke(target);
        } catch (Throwable t) {
            return null;
        }
    }

    private static boolean isEmpty(String s) {
        return s == null || s.isEmpty();
    }

    /** Alphanumeric-aware comparison so "A2" sorts before "A10" instead of after it. */
    private static int naturalCompare(String a, String b) {
        if (a == null) a = "";
        if (b == null) b = "";
        int i = 0, j = 0;
        while (i < a.length() && j < b.length()) {
            char ca = a.charAt(i);
            char cb = b.charAt(j);
            if (Character.isDigit(ca) && Character.isDigit(cb)) {
                int si = i, sj = j;
                while (i < a.length() && Character.isDigit(a.charAt(i))) i++;
                while (j < b.length() && Character.isDigit(b.charAt(j))) j++;
                String numA = a.substring(si, i).replaceFirst("^0+(?=\\d)", "");
                String numB = b.substring(sj, j).replaceFirst("^0+(?=\\d)", "");
                if (numA.length() != numB.length()) return numA.length() - numB.length();
                int cmp = numA.compareTo(numB);
                if (cmp != 0) return cmp;
            } else {
                if (ca != cb) return Character.compare(Character.toLowerCase(ca), Character.toLowerCase(cb));
                i++;
                j++;
            }
        }
        return (a.length() - i) - (b.length() - j);
    }

    private static void updateRouteConnectors(Object routeFragment) {
        if (routeFragment == null) return;
        try {
            WebView webView = (WebView) routeFragment.getClass().getField("i").get(routeFragment);
            if (webView != null) {
                injectRouteConnectors(routeFragment, webView);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed to update route connectors", t);
        }
    }

    private static void injectRouteConnectors(Object routeFragment, WebView webView) {
        injectRouteConnectors(routeFragment, webView, ready -> {});
    }

    private static void injectRouteConnectors(Object routeFragment, WebView webView,
                                              java.util.function.Consumer<Boolean> done) {
        if (routeFragment == null || webView == null || cachedPinItems == null || cachedPinItems.size() < 2) {
            done.accept(false);
            return;
        }
        try {
            Set<String> checkedItemIds = new HashSet<>();
            try {
                Object binding = callNoArg(routeFragment, "Ve");
                Object carouselBinding = readField(binding, "h");
                Object carousel = readField(carouselBinding, "b");
                Object adapter = readField(carousel, "a");
                List<?> items = (List<?>) readField(adapter, "c");
                if (items != null) {
                    for (Object it : items) {
                        Boolean isChecked = (Boolean) readField(it, "c");
                        if (isChecked != null && isChecked) {
                            Object itemDetails = readField(it, "a");
                            String id = (String) readField(itemDetails, "b");
                            if (id != null) checkedItemIds.add(id);
                        }
                    }
                }
            } catch (Throwable ignored) {}

            Class<?> pinOptionsCls = Class.forName("com.walmart.glass.instoremaps.api.PinOptions");
            Class<?> pinItemCls = Class.forName("com.walmart.glass.instoremaps.api.model.StoreMapPinItemDetails");
            Class<?> itemDetailsCls = Class.forName("com.walmart.glass.instoremaps.api.model.InstoreMapsItemDetails");
            Field pinOptionsField = pinItemCls.getField("a");
            Field itemDetailsField = pinItemCls.getField("b");
            Field aisleField = pinOptionsCls.getField("b");
            Field zoneField = pinOptionsCls.getField("a");
            Field sectionField = pinOptionsCls.getField("c");
            Field itemIdField = itemDetailsCls.getField("b");

            org.json.JSONArray stops = new org.json.JSONArray();
            // Position of cachedPinItems.get(currentIndex) within the filtered (unchecked) stops
            // below, so the JS can grey out legs already walked. -1 if the focused item has no
            // match here (e.g. it was just checked off), in which case nothing is greyed.
            int activeStopIndex = -1;
            for (int i = 0; i < cachedPinItems.size(); i++) {
                Object pinItem = cachedPinItems.get(i);
                Object itemDetails = itemDetailsField.get(pinItem);
                String itemId = itemDetails != null ? (String) itemIdField.get(itemDetails) : null;
                if (itemId != null && checkedItemIds.contains(itemId)) {
                    continue;
                }
                if (i == currentIndex) {
                    activeStopIndex = stops.length();
                }
                Object pinOptions = pinOptionsField.get(pinItem);
                String zone = (String) zoneField.get(pinOptions);
                String aisle = (String) aisleField.get(pinOptions);
                String section = (String) sectionField.get(pinOptions);
                org.json.JSONObject stop = new org.json.JSONObject();
                stop.put("zone", zone == null ? "" : zone);
                stop.put("aisle", aisle == null ? "" : aisle);
                stop.put("section", section == null ? "" : section);
                stops.put(stop);
            }

            String js = String.format(Locale.US,
                    "(function(stops, active){" +
                    "  try {" +
                    "    var svg = document.querySelector('.store-map-svg') || document.querySelector('svg');" +
                    "    if (!svg) return false;" +
                    "    if (svg.__routeConnectorObserver) svg.__routeConnectorObserver.disconnect();" +
                    "    function draw() {" +
                    "    var existing = document.getElementById('route-my-list-connector');" +
                    "    var groups = Array.from(svg.querySelectorAll('.pin-group'));" +
                    "    var points = [];" +
                    "    function matches(data, stop) {" +
                    "      return data && ['zone','aisle','section'].every(function(k){ return String(data[k] == null ? '' : data[k]).toUpperCase() === String(stop[k]).toUpperCase(); });" +
                    "    }" +
                    "    for (var stop of stops) {" +
                    "      var pin = groups.find(function(g) {" +
                    "        var data = g.data && g.data.data;" +
                    "        return matches(data,stop) || (data && (data.groupedPins || []).some(function(p){return matches(p,stop);}));" +
                    "      });" +
                    "      if (!pin) return false;" +
                    "      var anchor = pin.style.transformOrigin.split(/\\s+/).map(parseFloat);" +
                    "      if (!Number.isFinite(anchor[0]) || !Number.isFinite(anchor[1])) return false;" +
                    "      if (!points.length || points[points.length-1][0] !== anchor[0] || points[points.length-1][1] !== anchor[1]) points.push(anchor);" +
                    "    }" +
                    "    if (points.length < 2) {" +
                    "      if (existing) existing.remove();" +
                    "      return true;" +
                    "    }" +
                    "    var container = svg.querySelector('.store-map-pins-container, .xy-pins-container');" +
                    "    if (!container) return false;" +
                    "    if (!existing) {" +
                    "      existing = document.createElementNS('http://www.w3.org/2000/svg', 'g');" +
                    "      existing.id = 'route-my-list-connector';" +
                    "    }" +
                    "    if (existing.parentNode !== container) {" +
                    "      container.insertBefore(existing, container.firstChild);" +
                    "    }" +
                    "    var legCount = points.length - 1;" +
                    "    while (existing.childNodes.length > legCount) existing.removeChild(existing.lastChild);" +
                    "    while (existing.childNodes.length < legCount) {" +
                    "      var newLeg = document.createElementNS('http://www.w3.org/2000/svg', 'path');" +
                    "      newLeg.setAttribute('fill', 'none');" +
                    "      newLeg.setAttribute('pointer-events', 'none');" +
                    "      newLeg.setAttribute('stroke-width', '14');" +
                    "      newLeg.setAttribute('stroke-linecap', 'round');" +
                    "      newLeg.setAttribute('stroke-linejoin', 'round');" +
                    "      newLeg.setAttribute('stroke-dasharray', '28 18');" +
                    "      existing.appendChild(newLeg);" +
                    "    }" +
                    "    for (var i = 0; i < legCount; i++) {" +
                    "      var leg = existing.childNodes[i];" +
                    "      var complete = active >= 0 && (i + 1) < active;" +
                    "      leg.setAttribute('stroke', complete ? '#8a93a3' : '#0071dc');" +
                    "      leg.setAttribute('stroke-opacity', complete ? '0.35' : '0.45');" +
                    "      leg.setAttribute('d', 'M ' + points[i][0] + ' ' + points[i][1] + ' L ' + points[i+1][0] + ' ' + points[i+1][1]);" +
                    "    }" +
                    "    return true;" +
                    "    }" +
                    "    var ready = draw();" +
                    "    if (ready && stops.length > 1) {" +
                    "      svg.__routeConnectorObserver = new MutationObserver(draw);" +
                    "      svg.__routeConnectorObserver.observe(svg, {childList:true, subtree:true});" +
                    "    }" +
                    "    return ready;" +
                    "  } catch(e) {" +
                    "    console.error('route connector injection failed', e);" +
                    "    return false;" +
                    "  }" +
                    "})(%s, %d);", stops.toString(), activeStopIndex);

            webView.evaluateJavascript(js, result -> {
                boolean ready = "true".equals(result);
                if (ready) Log.i(TAG, "Rendered route connector with " + stops.length() + " stop(s)");
                done.accept(ready);
            });
        } catch (Throwable t) {
            Log.w(TAG, "Unable to inject route connector line", t);
            done.accept(false);
        }
    }

}
