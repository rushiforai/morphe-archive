package app.afterglow.extension.interfaceui;

import android.view.View;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.navigation.ShortsHeaderBindings;
import app.afterglow.extension.playback.PlayerOverlay;
import java.io.ByteArrayOutputStream;
import java.util.HashMap;
import java.util.Map;

public final class ShortsSubscriptionsBindingsTest {
    private static int checks;
    private static void check(boolean value, String label) { checks++; if (!value) throw new AssertionError(label); }
    private static final class Builder implements ShortsSubscriptionsBindings.Owner, ShortsHeaderBindings.TagBuilder {
        final Map<Integer,Object> tags = new HashMap<>();
        public Object afterglow_subscriptionOwner() { return this; }
        public void afterglow_putShortsTag(int id, Object role) { tags.put(id, role); }
        void mount(View view) { view.tags.clear(); view.tags.putAll(tags); ShortsSubscriptionsBindings.mounted(view); }
    }
    private static final class Delegate implements ShortsSubscriptionsBindings.Owner {
        final Builder owner; Delegate(Builder owner) { this.owner = owner; }
        public Object afterglow_subscriptionOwner() { return owner; }
    }
    private static byte[] varint(long value) {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        while ((value & ~127L) != 0) { bytes.write((int)(value & 127) | 128); value >>>= 7; }
        bytes.write((int)value); return bytes.toByteArray();
    }
    private static byte[] join(byte[]... parts) {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        for (byte[] part : parts) bytes.writeBytes(part); return bytes.toByteArray();
    }
    private static byte[] message(int field, byte[] bytes) { return join(varint(((long)field << 3) | 2), varint(bytes.length), bytes); }
    private static byte[] primary(int source) { return message(169495254, message(139608561, join(varint(26L << 3), varint(source)))); }
    private static int mountCount(Builder owner) { int before=PlayerOverlay.binds; owner.mount(new View()); return PlayerOverlay.binds-before; }
    public static void main(String[] args) {
        View view = new View(); Object click = view.clickListener, longClick = view.longClickListener;
        Builder owner = new Builder(); ShortsSubscriptionsBindings.primaryCommand(owner, primary(32));
        owner.mount(view);
        check(PlayerOverlay.bound.containsKey(view), "positive native owner registers the exact preference");
        check(view.visibility == 0, "default OFF preserves native visibility");
        check(click == view.clickListener && longClick == view.longClickListener, "native listeners retained");
        PlayerOverlay.setEnabled(true); check(view.visibility == 8, "already mounted item follows live preference");
        PlayerOverlay.setEnabled(false); check(view.visibility == 0, "disable restores native visibility");
        PlayerOverlay.setEnabled(true); ShortsSubscriptionsBindings.unmounted(view);
        check(view.visibility == 0 && !PlayerOverlay.bound.containsKey(view), "restore before native tag removal and pooling");
        Builder ordinary = new Builder(); ShortsSubscriptionsBindings.primaryCommand(ordinary, primary(7)); ordinary.mount(view);
        check(view.visibility == 0 && !PlayerOverlay.bound.containsKey(view), "same recycled view cannot retain subscription ownership");
        check(ordinary.tags.isEmpty(), "ordinary components allocate no native role tag");
        for (int source : new int[]{7,33,61,64}) {
            Builder other = new Builder(); ShortsSubscriptionsBindings.primaryCommand(other, primary(source));
            check(mountCount(other)==0, "preserve ordinary subscriptions, avatar, live and shopping: " + source);
        }
        Builder mixed = new Builder(); ShortsSubscriptionsBindings.primaryCommand(mixed, primary(32));
        ShortsSubscriptionsBindings.primaryCommand(new Delegate(mixed), primary(61));
        check(mountCount(mixed)==0, "same owner across delegates blocks mixed primary actions");
        Builder reversed = new Builder(); ShortsSubscriptionsBindings.primaryCommand(reversed, primary(7));
        ShortsSubscriptionsBindings.primaryCommand(reversed, primary(32));
        check(mountCount(reversed)==0, "mixed result is independent of callback order");
        Builder malformed = new Builder(); ShortsSubscriptionsBindings.primaryCommand(malformed, primary(32));
        ShortsSubscriptionsBindings.primaryCommand(malformed, null);
        check(mountCount(malformed)==0, "failed native serialization clears positive ownership");
        Builder target = new Builder(), unknown = new Builder();
        ShortsSubscriptionsBindings.primaryCommand(new Delegate(target), primary(32));
        ShortsSubscriptionsBindings.primaryCommand(unknown, new byte[]{0});
        check(mountCount(target)==1 && mountCount(unknown)==0, "independent component identities stay independent");
        Builder duplicate = new Builder(); ShortsSubscriptionsBindings.primaryCommand(duplicate, primary(32));
        ShortsSubscriptionsBindings.primaryCommand(duplicate, primary(32));
        check(mountCount(duplicate)==1, "duplicate identical primary source does not create extra bindings");
        InstalledTweaks.installed=false; Builder absent = new Builder();
        ShortsSubscriptionsBindings.primaryCommand(absent, primary(32));
        check(absent.tags.isEmpty() && mountCount(absent)==0, "unselected patch remains native");
        InstalledTweaks.installed=true; InstalledTweaks.fail=true;
        check(!ShortsSubscriptionsBindings.shouldInspect(), "storage exception preserves native behavior");
        InstalledTweaks.fail=false; check(ShortsSubscriptionsBindings.shouldInspect(), "storage recovers without initializer poisoning");
        ShortsSubscriptionsBindings.primaryCommand(new Object(), primary(32));
        ShortsSubscriptionsBindings.mounted(new Object()); ShortsSubscriptionsBindings.unmounted(null);
        check(Afterglow.errors==1, "storage error is logged once");
        System.out.println("PASS " + checks + " subscription owner, live binding and recycling checks");
    }
}
