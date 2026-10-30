package app.template.extension.extension;

import android.content.Context;
import android.content.BroadcastReceiver;
import android.content.IntentFilter;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.widget.Toast;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;

public final class ChatHeadAction {
    private static final int OPTION_ID = 0x4e7a;
    private static final int CHAT_HEAD_ICON = 0x7f0815b3;
    private static final int CHAT_HEAD_LABEL = 0x7f101d5a;

    private ChatHeadAction() { }

    private static Context appContext() throws ReflectiveOperationException {
        return (Context) ChatHeadAction.class.getClassLoader().loadClass("com.zing.zalo.MainApplication")
                .getMethod("getAppContext").invoke(null);
    }

    private static boolean currentVersion() throws ReflectiveOperationException {
        Context context = appContext();
        try {
            return "26.10.02".equals(context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName);
        } catch (android.content.pm.PackageManager.NameNotFoundException error) {
            throw new ReflectiveOperationException(error);
        }
    }

    private static String optionClass() throws ReflectiveOperationException {
        return currentVersion() ? "nh1.n" : "wd1.m";
    }

    private static Object field(Object owner, String name) throws ReflectiveOperationException {
        Field value = owner.getClass().getField(name);
        return value.get(owner);
    }

    public static void registerMiniChatReceiver(Context context, BroadcastReceiver receiver, IntentFilter filter) {
        if (Build.VERSION.SDK_INT >= 33) {
            context.registerReceiver(receiver, filter, Context.RECEIVER_NOT_EXPORTED);
        } else {
            context.registerReceiver(receiver, filter);
        }
    }

    public static boolean canObservePosture(Context context) {
        boolean allowed = Build.VERSION.SDK_INT < 31 || context.isUiContext();
        if (!allowed) Log.i("ChatHeadAction", "Skipping posture listener for non-UI context");
        return allowed;
    }

    public static void addOption(ArrayList<?> items) {
        try {
            ClassLoader loader = ChatHeadAction.class.getClassLoader();
                String owner = optionClass();
                for (Object item : items) {
                if (item != null && owner.equals(item.getClass().getName())
                    && item.getClass().getField("b").getInt(item) == OPTION_ID) return;
                }
                Context context = appContext();
                int icon = currentVersion() ? context.getResources().getIdentifier("ic_chathead_selected", "drawable", context.getPackageName()) : CHAT_HEAD_ICON;
                int label = currentVersion() ? context.getResources().getIdentifier("str_open_chat_head", "string", context.getPackageName()) : CHAT_HEAD_LABEL;
                if (icon == 0 || label == 0) throw new IllegalStateException("Missing chat head resources");
                Object option = loader.loadClass(owner).getConstructor(int.class, int.class, int.class)
                    .newInstance(OPTION_ID, icon, label);
            ((ArrayList<Object>) items).add(option);
            Log.i("ChatHeadAction", "Created chat head option; source rows=" + items.size());
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w("ChatHeadAction", "Unable to add chat head option", error);
        }
    }

    public static void logOptionsCommitted(ArrayList<?> source, ArrayList<?> displayed) {
        boolean found = false;
        for (Object item : displayed) {
            try {
                if (item != null && "wd1.m".equals(item.getClass().getName())
                        && item.getClass().getField("b").getInt(item) == OPTION_ID) {
                    found = true;
                    break;
                }
            } catch (ReflectiveOperationException ignored) {
            }
        }
        Log.i("ChatHeadAction", "ChatInfo rows: source=" + source.size()
                + ", displayed=" + displayed.size() + ", option=" + found);
    }

    public static boolean handleOption(Object adapter, Object option) {
        if (option == null || !("wd1.m".equals(option.getClass().getName()) || "nh1.n".equals(option.getClass().getName()))) return false;
        try {
            int optionId = option.getClass().getField("b").getInt(option);
            if (optionId != OPTION_ID) return false;
            if (!open(adapter)) showUnavailable();
            return true;
        } catch (NoSuchFieldException error) {
            return false;
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w("ChatHeadAction", "Unable to handle chat head option", error);
            return true;
        }
    }

    private static void showUnavailable() {
        try {
            Class<?> applicationClass = ChatHeadAction.class.getClassLoader().loadClass("com.zing.zalo.MainApplication");
            Context context = (Context) applicationClass.getMethod("getAppContext").invoke(null);
            Toast.makeText(context, "Chat head is unavailable for this conversation", Toast.LENGTH_SHORT).show();
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w("ChatHeadAction", "Unable to show chat head status", error);
        }
    }

    private static boolean open(Object adapter) {
        try {
            ClassLoader loader = adapter.getClass().getClassLoader();
            boolean current = currentVersion();
            Class<?> controllerClass = loader.loadClass(current ? "iu.l" : "ts.l");
            if (!(boolean) controllerClass.getMethod("a").invoke(null)) return false;

            Object chat = field(adapter, "f");
            Object conversation = field(chat, "h");
            if (conversation == null) return false;

            Class<?> conversationClass = loader.loadClass("com.zing.zalo.data.chat.model.tabmessage.Conversation");
            String conversationId = (String) conversationClass.getField("b").get(conversation);
            if (conversationId == null || conversationId.isEmpty()) return false;

            Class<?> bundleBuilderClass = loader.loadClass(current ? "vg1.j9" : "ed1.p9");
            Object builder = bundleBuilderClass.getConstructor(String.class).newInstance(conversationId);
            bundleBuilderClass.getMethod("b", conversationClass).invoke(builder, conversation);
            Bundle bundle = (Bundle) bundleBuilderClass.getMethod("a").invoke(builder);

            Class<?> holderClass = loader.loadClass(current ? "iu.k" : "ts.k");
            Object controller = holderClass.getField("a").get(null);
            Class<?> taskClass = loader.loadClass(current ? "iu.j" : "ts.j");
            Constructor<?> constructor = taskClass.getConstructor(controllerClass, conversationClass,
                    boolean.class, int.class, boolean.class, CharSequence.class, Bundle.class, boolean.class);
            Runnable task = (Runnable) constructor.newInstance(controller, conversation, true, 0, true, "", bundle, true);
            return ((Handler) controllerClass.getField("b").get(controller)).post(task);
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w("ChatHeadAction", "Unable to open chat head", error);
            return false;
        }
    }
}