package app.template.extension.extension;

import android.content.Context;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.ImageView;

import java.io.Serializable;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Collections;
import java.util.List;

/** Adds the "Play in background" row to the player's More pane. */
@SuppressWarnings("unused")
public final class BackgroundPlayMenu {

    private static final String TAG = "TikTokTVBg";
    private static final String MENU_ITEM = "com.ss.android.ugc.aweme.tv.feed.fragment.moremenu.a";
    private static final String TITLE = "Play in background";
    private static final String VALUE_TAG = "app.tiktoktv.menu.value";

    /** A private item type: the stock adapter treats it as a plain row whose switch it will show. */
    private static final int TYPE_SWITCH = 99;

    /** The loop switch is the one row every root menu carries, which is how the root is spotted. */
    private static final int TYPE_LOOP = 1;

    private BackgroundPlayMenu() {
    }

    /** Called with the list the More pane is about to show. */
    public static void addToMenu(Object listObject) {
        if (!(listObject instanceof List)) return;

        List<Object> rows = (List<Object>) listObject;
        int loop = -1;
        for (int i = 0; i < rows.size(); i++) {
            int type = typeOf(rows.get(i));
            if (type == TYPE_SWITCH) return;
            if (type == TYPE_LOOP) loop = i;
        }
        if (loop < 0) return;

        rows.add(loop, switchRow());
        Log.i(TAG, "menu row added");
    }

    /** Called with each row the menu adapter binds. */
    public static void bindRow(Object holder, Object item) {
        if (!isMine(item)) return;

        View view = itemView(holder);
        if (view == null) return;

        BackgroundPlay.noteContext(view.getContext());

        // The adapter sets its own switch/row listeners later in this bind; run after it returns.
        view.post(() -> bindSwitch(view));
    }

    /** Replace the stock listeners with ours. The stock checked listener does nothing for #TYPE_SWITCH. */
    private static void bindSwitch(View view) {
        Context context = view.getContext();
        if (context == null) return;

        // The switch replaces the old text value; clear a recycled value if one is still attached.
        View value = view.findViewWithTag(VALUE_TAG);
        if (value != null) value.setVisibility(View.GONE);

        // This row deliberately has no glyph. A recycled holder can still show the previous row's
        // icon, so clear it rather than letting the speedometer/CC mark leak onto this row.
        int iconId = Subtitles.idOf(view, "left_icon_view");
        View icon = iconId == 0 ? null : view.findViewById(iconId);
        if (icon != null) {
            icon.setVisibility(View.GONE);
            if (icon instanceof ImageView) ((ImageView) icon).setImageDrawable(null);
        }

        CompoundButton toggle = findToggle(view);
        if (toggle == null) {
            Log.i(TAG, "no switch on the background row");
            return;
        }

        boolean on = BackgroundPlay.mode(context) == BackgroundPlay.MODE_AUDIO;
        toggle.setOnCheckedChangeListener(null);
        toggle.setChecked(on);
        toggle.setOnCheckedChangeListener((button, checked) ->
                BackgroundPlay.setMode(button.getContext(),
                        checked ? BackgroundPlay.MODE_AUDIO : BackgroundPlay.MODE_OFF));

        // CENTER on the row is what a TV remote does; the switch itself may not take focus.
        view.setOnClickListener(v -> {
            boolean next = BackgroundPlay.mode(v.getContext()) != BackgroundPlay.MODE_AUDIO;
            BackgroundPlay.setMode(v.getContext(),
                    next ? BackgroundPlay.MODE_AUDIO : BackgroundPlay.MODE_OFF);
            CompoundButton button = findToggle(v);
            if (button != null) button.setChecked(next);
        });
    }

    private static CompoundButton findToggle(View view) {
        if (view instanceof CompoundButton) return (CompoundButton) view;
        if (!(view instanceof ViewGroup)) return null;

        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            CompoundButton found = findToggle(group.getChildAt(i));
            if (found != null) return found;
        }
        return null;
    }

    // ---------------------------------------------------------------------------------------------
    // The item
    // ---------------------------------------------------------------------------------------------

    /** @return an object the menu adapter will bind as a switch row. */
    private static Object switchRow() {
        try {
            Class<?> iface = Class.forName(MENU_ITEM);
            return Proxy.newProxyInstance(iface.getClassLoader(), new Class<?>[] {iface},
                    new Item());
        } catch (Throwable failure) {
            Log.i(TAG, "no menu item " + failure);
            return null;
        }
    }

    /** The one row, as this patch describes it. */
    private static final class Item implements InvocationHandler, Serializable {

        @Override
        public Object invoke(Object proxy, Method method, Object[] args) {
            String name = method.getName();
            if ("getTitle".equals(name)) return TITLE;
            if ("getExtra".equals(name)) {
                return Boolean.valueOf(BackgroundPlay.mode() == BackgroundPlay.MODE_AUDIO);
            }
            if ("getType".equals(name)) return Integer.valueOf(TYPE_SWITCH);
            if ("getIcon".equals(name)) return Integer.valueOf(-1);
            if ("isSwitch".equals(name)) return Boolean.TRUE;
            if ("hasNextLevel".equals(name)) return Boolean.FALSE;
            if ("getSubMenu".equals(name)) return Collections.emptyList();
            if ("toString".equals(name)) return "BackgroundPlayRow";
            if ("hashCode".equals(name)) return Integer.valueOf(System.identityHashCode(proxy));
            if ("equals".equals(name)) return Boolean.valueOf(args != null && args[0] == proxy);
            return null;
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Reflection
    // ---------------------------------------------------------------------------------------------

    private static boolean isMine(Object item) {
        return typeOf(item) == TYPE_SWITCH;
    }

    private static int typeOf(Object item) {
        Object type = Subtitles.call(item, "getType");
        return type instanceof Integer ? (Integer) type : -1;
    }

    private static View itemView(Object holder) {
        if (holder == null) return null;
        try {
            return (View) holder.getClass().getField("itemView").get(holder);
        } catch (Throwable failure) {
            Log.i(TAG, "no row view " + failure);
            return null;
        }
    }
}
