/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-16.
 */
package app.morphe.extension.youtube.patches.general;

import static org.junit.Assert.*;

import android.content.pm.PackageInfo;

import com.google.protobuf.ByteString;
import com.google.protobuf.CodedOutputStream;
import com.google.protobuf.MessageLite;
import com.google.protobuf.Parser;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.util.List;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.innertube.GuideResponseOuterClass.PivotBarIconOnlyItemRenderer;
import app.morphe.extension.youtube.innertube.GuideResponseOuterClass.PivotBarItemRenderer;
import app.morphe.extension.youtube.innertube.IconOuterClass.Icon;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.NavigationBar;
import app.morphe.extension.youtube.shared.NavigationBar.NavigationButton;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class NavigationButtonsOrderTest {
    @Before
    public void setUp() throws Exception {
        var application = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = application.getPackageName();
        packageInfo.versionName = "21.45.90";
        packageInfo.applicationInfo = application.getApplicationInfo();
        Shadows.shadowOf(application.getPackageManager()).installPackage(packageInfo);

        Field context = Utils.class.getDeclaredField("context");
        context.setAccessible(true);
        context.set(null, RuntimeEnvironment.getApplication());
        Settings.NAVIGATION_BAR_ORDER.save("");
        NavigationBar.setServerNavigationButtonOrder(List.of());
    }

    /** The public wrapper/message fields verified in all four stock APK versions. */
    public static final class StockItem {
        public final MessageLite a;

        StockItem(String id) {
            a = new StockMessage(id, PivotBarItemRenderer.newBuilder().setPivotIdentifier(id).build());
        }

        StockItem(MessageLite message) {
            a = message;
        }
    }

    public static final class StockMessage implements MessageLite {
        public final String e;
        private final MessageLite message;

        StockMessage(String id, MessageLite message) {
            e = id;
            this.message = message;
        }

        @Override public void writeTo(CodedOutputStream output) throws IOException { message.writeTo(output); }
        @Override public int getSerializedSize() { return message.getSerializedSize(); }
        @Override public Parser<? extends MessageLite> getParserForType() { return message.getParserForType(); }
        @Override public ByteString toByteString() { return message.toByteString(); }
        @Override public byte[] toByteArray() { return message.toByteArray(); }
        @Override public void writeTo(OutputStream output) throws IOException { message.writeTo(output); }
        @Override public void writeDelimitedTo(OutputStream output) throws IOException {
            message.writeDelimitedTo(output);
        }
        @Override public Builder newBuilderForType() { return message.newBuilderForType(); }
        @Override public Builder toBuilder() { return message.toBuilder(); }
        @Override public MessageLite getDefaultInstanceForType() { return message.getDefaultInstanceForType(); }
        @Override public boolean isInitialized() { return message.isInitialized(); }
    }

    private static NavigationButton identify(Object item) throws Exception {
        var method = NavigationButtonsPatch.class.getDeclaredMethod("getNavigationButton", Object.class);
        method.setAccessible(true);
        return (NavigationButton) method.invoke(null, item);
    }

    @SuppressWarnings("unchecked")
    private static List<Object> reorder(List<Object> items) throws Exception {
        var method = NavigationButtonsPatch.class.getDeclaredMethod("reorderPivotBarRendererList", List.class);
        method.setAccessible(true);
        return (List<Object>) method.invoke(null, items);
    }

    @Test
    public void everyStableIdentifierMapsToTheCorrectEditorEntry() throws Exception {
        String[] ids = {"FEwhat_to_watch", "FEshorts", "FEuploads", "FEsubscriptions", "FElibrary",
                "FEactivity", "FEnotifications", "FEexplore", "FEsearch", "FEsettings", "morphe_watch_later", "VLWL"};
        NavigationButton[] buttons = {NavigationButton.HOME, NavigationButton.SHORTS, NavigationButton.CREATE,
                NavigationButton.SUBSCRIPTIONS, NavigationButton.LIBRARY, NavigationButton.NOTIFICATIONS,
                NavigationButton.NOTIFICATIONS, NavigationButton.EXPLORE, NavigationButton.SEARCH,
                NavigationButton.SETTINGS, NavigationButton.WATCH_LATER, NavigationButton.WATCH_LATER};
        for (int i = 0; i < ids.length; i++) {
            assertEquals(ids[i], buttons[i], identify(new StockItem(ids[i])));
        }
    }

    @Test
    public void createIdentifierWorksForIconOnlyMessagesWithoutParsingAsLabeled() throws Exception {
        var message = PivotBarIconOnlyItemRenderer.newBuilder().setPivotIdentifier("FEuploads")
                .setTargetId("not a nested navigation endpoint").build();
        assertEquals(NavigationButton.CREATE,
                identify(new StockItem(new StockMessage("FEuploads", message))));
    }

    @Test
    public void addCircleOutlineAndOlderCreateIconsRemainRecognized() throws Exception {
        for (int icon : new int[]{405, 650, 670, 730, 732, 734, 1161}) {
            var message = PivotBarItemRenderer.newBuilder().setIcon(Icon.newBuilder().setYtIconTypeValue(icon)).build();
            assertEquals("icon " + icon, NavigationButton.CREATE, identify(message));
        }
    }

    @Test
    public void explicitOrderMovesCreateToTheMiddle() throws Exception {
        Object home = new StockItem("FEwhat_to_watch");
        Object shorts = new StockItem("FEshorts");
        Object subscriptions = new StockItem("FEsubscriptions");
        Object create = new StockItem("FEuploads");
        Object you = new StockItem("FElibrary");
        List<Object> server = List.of(home, shorts, subscriptions, create, you);
        Settings.NAVIGATION_BAR_ORDER.save("HOME,SHORTS,CREATE,SUBSCRIPTIONS,LIBRARY");
        assertEquals(List.of(home, shorts, create, subscriptions, you), reorder(server));
        assertEquals(List.of(home, shorts, subscriptions, create, you), server);
        assertEquals(List.of(NavigationButton.HOME, NavigationButton.SHORTS, NavigationButton.SUBSCRIPTIONS,
                NavigationButton.CREATE, NavigationButton.LIBRARY),
                NavigationBar.getDefaultNavigationButtonOrder().subList(0, 5));
    }

    @Test
    public void existingLibraryValueCanPutSubscriptionsAfterYou() throws Exception {
        Object home = new StockItem("FEwhat_to_watch");
        Object subscriptions = new StockItem("FEsubscriptions");
        Object create = new StockItem("FEuploads");
        Object you = new StockItem("FElibrary");
        Settings.NAVIGATION_BAR_ORDER.save("home, create,LIBRARY,subscriptions,library,unknown");
        assertEquals(List.of(home, create, you, subscriptions), reorder(List.of(home, subscriptions, create, you)));
    }

    @Test
    public void untouchedPreferencePreservesServerOrder() throws Exception {
        List<Object> server = List.of(new StockItem("FEsubscriptions"), new StockItem("FEuploads"));
        assertSame(server, reorder(server));
        assertEquals(List.of(NavigationButton.SUBSCRIPTIONS, NavigationButton.CREATE),
                NavigationBar.getDefaultNavigationButtonOrder().subList(0, 2));
    }

    @Test
    public void unknownItemsStayInPlaceAndDuplicateKnownItemsAreNotDropped() throws Exception {
        Object subscriptions = new StockItem("FEsubscriptions");
        Object create = new StockItem("FEuploads");
        Object unknown = new StockItem("future_button");
        Settings.NAVIGATION_BAR_ORDER.save("CREATE,SUBSCRIPTIONS");
        assertEquals(List.of(create, unknown, subscriptions), reorder(List.of(subscriptions, unknown, create)));
        List<Object> duplicate = List.of(subscriptions, create, new StockItem("FEuploads"));
        assertSame(duplicate, reorder(duplicate));
    }
}
