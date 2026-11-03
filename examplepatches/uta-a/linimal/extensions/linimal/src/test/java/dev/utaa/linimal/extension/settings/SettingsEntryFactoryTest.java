package dev.utaa.linimal.extension.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Test;

import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * 難読化された対象クラスと同じ形状の fixture を使い、reflection の前提を検証します。
 * 対象アプリのコードは含めず、constructor と field の形状だけを再現しています。
 */
public final class SettingsEntryFactoryTest {
    @Test
    public void findsTheItemConstructorByShape() {
        Constructor<?> constructor = SettingsEntryFactory.findModelConstructor(
                Collections.singletonList(item("line-main-settings.account")));

        assertEquals(14, constructor.getParameterCount());
        assertEquals(Item.class, constructor.getDeclaringClass());
    }

    @Test
    public void rejectsListsWithoutTheExpectedShape() {
        try {
            SettingsEntryFactory.findModelConstructor(Arrays.asList("item", new Separator()));
            fail("Expected the unknown item shape to be rejected");
        } catch (IllegalStateException expected) {
            // 形状が一致しない場合は生成しません。
        }
    }

    @Test
    public void detectsAnAlreadyRegisteredKey() {
        List<Object> items = Collections.singletonList(item(SettingsEntryHooks.SETTING_KEY));

        assertTrue(SettingsEntryFactory.containsKey(items, SettingsEntryHooks.SETTING_KEY));
        assertFalse(SettingsEntryFactory.containsKey(
                Collections.singletonList(item("line-main-settings.account")),
                SettingsEntryHooks.SETTING_KEY));
    }

    @Test
    public void reusesATagWithoutInstanceState() {
        Object tag = SettingsEntryFactory.createNeutralTag(
                Arrays.asList(item("a", NeutralTag.INSTANCE), item("b")),
                Tag.class,
                null);

        assertSame(NeutralTag.INSTANCE, tag);
    }

    @Test
    public void buildsAnEmptyTagWhenOnlyStatefulTagsExist() {
        AtomicInteger navigations = new AtomicInteger();
        Object tag = SettingsEntryFactory.createNeutralTag(
                Collections.singletonList(item("a", new NavigationTag(argument -> {
                    navigations.incrementAndGet();
                    return null;
                }))),
                Tag.class,
                null);

        assertNotNull(tag);
        assertEquals(NavigationTag.class, tag.getClass());
        ((NavigationTag) tag).navigation.invoke(null);
        // 他項目の遷移や計測を流用していないことを確認します。
        assertEquals(0, navigations.get());
    }

    @Test
    public void failsWhenNoTagCanBeFound() {
        try {
            SettingsEntryFactory.createNeutralTag(new ArrayList<>(), Tag.class, null);
            fail("Expected the missing tag to be rejected");
        } catch (IllegalStateException expected) {
            // タグを再現できない場合は項目を作りません。
        }
    }

    @Test
    public void constantProxyAlwaysReturnsTheSameValue() {
        Function2 provider = (Function2) SettingsEntryFactory.constantProxy(Function2.class, Boolean.TRUE);

        assertEquals(Boolean.TRUE, provider.invoke(null, null));
        assertEquals(Boolean.TRUE, provider.invoke("context", "continuation"));
        assertEquals(provider, provider);
        assertNotNull(provider.toString());
    }

    @Test
    public void actionProxyRunsTheActionAndReturnsTheGivenValue() {
        AtomicInteger opened = new AtomicInteger();
        Object unit = new Object();
        Function1 click = (Function1) SettingsEntryFactory.actionProxy(
                Function1.class, unit, opened::incrementAndGet);

        assertSame(unit, click.invoke("fragment"));
        assertEquals(1, opened.get());
    }

    @Test
    public void actionProxyKeepsWorkingWhenTheActionFails() {
        Function1 click = (Function1) SettingsEntryFactory.actionProxy(
                Function1.class,
                null,
                () -> {
                    throw new IllegalStateException("cannot open");
                });

        assertNull(click.invoke("fragment"));
    }

    @Test
    public void buildsTheItemWithNeutralArguments() throws Exception {
        List<Object> items = Arrays.asList(item("a", NeutralTag.INSTANCE));
        Constructor<?> constructor = SettingsEntryFactory.findModelConstructor(items);
        Object tag = SettingsEntryFactory.createNeutralTag(items, Tag.class, null);

        Item entry = (Item) constructor.newInstance(
                SettingsEntryHooks.SETTING_KEY,
                null,
                42,
                SettingsEntryFactory.constantProxy(Function2.class, null),
                SettingsEntryFactory.constantProxy(Function2.class, Boolean.FALSE),
                null,
                SettingsEntryFactory.constantProxy(Function2.class, Boolean.FALSE),
                SettingsEntryFactory.constantProxy(Function2.class, null),
                null,
                SettingsEntryFactory.constantProxy(Function1.class, null),
                SettingsEntryFactory.constantProxy(Function1.class, null),
                tag,
                SettingsEntryFactory.constantProxy(Function2.class, Boolean.TRUE),
                Boolean.TRUE);

        assertEquals(SettingsEntryHooks.SETTING_KEY, entry.key);
        assertEquals(42, entry.titleResourceId);
        assertNull(entry.icon);
        // 下位画面を持たない項目として、タップ時に画面遷移用の値を返しません。
        assertNull(entry.subScreen.invoke(null));
        assertEquals(Boolean.TRUE, entry.visibility.invoke(null, null));
    }

    @Test
    public void appendEntryKeepsTheOriginalListWhenNotInitialized() {
        List<Object> original = Collections.singletonList(item("a"));

        assertSame(original, SettingsEntryHooks.appendEntry(original));
        assertSame(null, SettingsEntryHooks.appendEntry(null));
    }

    private static Item item(String key) {
        return item(key, NeutralTag.INSTANCE);
    }

    private static Item item(String key, Tag tag) {
        return new Item(key, null, 1, argumentsToNull(), argumentsToNull(), null, argumentsToNull(),
                argumentsToNull(), null, null, null, tag, argumentsToNull(), true);
    }

    private static Function2 argumentsToNull() {
        return (first, second) -> null;
    }

    /** LINE の Kotlin 関数型に対応する形状です。 */
    public interface Function1 {
        Object invoke(Object argument);
    }

    public interface Function2 {
        Object invoke(Object first, Object second);
    }

    public enum Placement {
        NONE
    }

    public abstract static class Tag {
    }

    public static final class NeutralTag extends Tag {
        public static final NeutralTag INSTANCE = new NeutralTag();
    }

    public static final class NavigationTag extends Tag {
        final Function1 navigation;

        public NavigationTag(Function1 navigation) {
            this.navigation = navigation;
        }
    }

    public static final class Separator {
    }

    public static final class Item {
        final String key;
        final Integer icon;
        final int titleResourceId;
        final Function2 summary;
        final Function2 badge;
        final Integer badgeResourceId;
        final Function2 secondaryBadge;
        final Placement placement;
        final Function1 subScreen;
        final Function1 click;
        final Tag tag;
        final Function2 visibility;
        final boolean searchable;

        public Item(
                String key,
                Integer icon,
                int titleResourceId,
                Function2 summary,
                Function2 badge,
                Integer badgeResourceId,
                Function2 secondaryBadge,
                Function2 statusBadge,
                Placement placement,
                Function1 subScreen,
                Function1 click,
                Tag tag,
                Function2 visibility,
                boolean searchable) {
            this.key = key;
            this.icon = icon;
            this.titleResourceId = titleResourceId;
            this.summary = summary;
            this.badge = badge;
            this.badgeResourceId = badgeResourceId;
            this.secondaryBadge = secondaryBadge;
            this.placement = placement;
            this.subScreen = subScreen;
            this.click = click;
            this.tag = tag;
            this.visibility = visibility;
            this.searchable = searchable;
        }
    }
}
