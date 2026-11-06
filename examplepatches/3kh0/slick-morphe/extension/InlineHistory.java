package slick.android;

import android.os.Handler;
import android.os.Looper;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.WeakHashMap;

public final class InlineHistory {
  private static final Handler main = new Handler(Looper.getMainLooper());
  private static final Map<Object, Screen> screens = new WeakHashMap<>();
  private static final String DETAILS = "slack.features.messagedetails.MessageDetailsAdapter";

  private static final class Screen {
    final WeakReference<Object> owner;
    Object metadata;
    String scope, anchor, thread, oldest;
    boolean reloadScheduled;
    List<?> original;
    final Map<Object, Object> groupedOriginals = new IdentityHashMap<>();
    List<Archive.Entry> entries = Collections.emptyList();
    boolean requested;
    int revision;

    Screen(Object owner, Object metadata) {
      this.owner = new WeakReference<>(owner);
      this.metadata = metadata;
    }
  }

  public static void channel(Object owner, Object metadata) {
    try {
      Screen current = screens.get(owner);
      if (current != null
          && Host.string(current.metadata, "id").equals(Host.string(metadata, "id")))
        current.metadata = metadata;
      else screens.put(owner, new Screen(owner, metadata));
    } catch (ReflectiveOperationException e) {
      Archive.failed(e);
    }
  }

  public static List<?> messages(Object owner, String anchor, List<?> original) {
    if (!Settings.enabled("message_logger")) return original;
    try {
      Screen screen = screens.get(owner);
      if (screen == null) return original;
      Object presenter = Host.get(owner, "presenter");
      if (presenter == null
          || !presenter
              .getClass()
              .getName()
              .equals("slack.features.legacy.csc.messages.MessagesPresenterLegacy"))
        return original;
      String scope = Accounts.scope(lazy(Host.get(presenter, "loggedInUserLazy")));
      if (screen.scope != null && !screen.scope.equals(scope))
        screens.put(owner, screen = new Screen(owner, screen.metadata));
      screen.scope = scope;
      if (!Objects.equals(screen.anchor, anchor)) screen.oldest = null;
      screen.anchor = anchor;
      screen.original = original;
      if (!screen.requested) load(screen);
      return merge(owner, screen, original);
    } catch (ReflectiveOperationException | RuntimeException e) {
      Archive.failed(e);
      return original;
    }
  }

  public static List<?> thread(Object owner, List<?> original, boolean notify) {
    if (!Settings.enabled("message_logger") || !owner.getClass().getName().equals(DETAILS))
      return original;
    try {
      Object presenter =
          lazy(Host.get(Host.get(owner, "threadActionsListener"), "messageDetailsPresenter"));
      String scope = Accounts.scope(lazy(Host.get(presenter, "loggedInUser")));
      Object state = Host.get(presenter, "messageDetailsState");
      String thread = Host.string(state, "threadTs");
      if (thread.isEmpty()) return original;
      List<?> roots = (List<?>) Host.get(state, "rootMessageViewModels");
      if (roots.isEmpty()) return original;
      Object metadata = Host.get(roots.get(0), "channelMetadata");
      Screen screen = screens.get(owner);
      if (screen == null
          || !scope.equals(screen.scope)
          || !thread.equals(screen.thread)
          || !Host.string(metadata, "id").equals(Host.string(screen.metadata, "id"))) {
        screens.put(owner, screen = new Screen(owner, metadata));
        screen.scope = scope;
        screen.thread = thread;
      }
      screen.original = original;
      if (!screen.requested) load(screen);
      return merge(owner, screen, original);
    } catch (ReflectiveOperationException | RuntimeException e) {
      Archive.failed(e);
      return original;
    }
  }

  private static Object lazy(Object value) throws ReflectiveOperationException {
    return Class.forName("dagger.Lazy").getMethod("get").invoke(value);
  }

  private static Object obj(Object model) throws ReflectiveOperationException {
    return Host.get(Host.get(model, "pmo"), "obj");
  }

  private static String ts(Object model) throws ReflectiveOperationException {
    return Host.string(obj(model), "ts");
  }

  private static void setMessages(Object owner, List<?> rows) throws ReflectiveOperationException {
    owner.getClass().getMethod("setMessages", List.class, boolean.class).invoke(owner, rows, true);
  }

  private static Method copy(Class<?> type, int parameters) {
    return Arrays.stream(type.getMethods())
        .filter(m -> m.getName().equals("copy$default") && m.getParameterCount() == parameters)
        .findFirst()
        .orElseThrow();
  }

  private static boolean current(Screen screen, Object owner) throws ReflectiveOperationException {
    Object presenter =
        screen.thread == null
            ? Host.get(owner, "presenter")
            : lazy(Host.get(Host.get(owner, "threadActionsListener"), "messageDetailsPresenter"));
    String scope =
        Accounts.scope(
            lazy(Host.get(presenter, screen.thread == null ? "loggedInUserLazy" : "loggedInUser")));
    if (!scope.equals(screen.scope)) return false;
    if (screen.thread == null) return true;
    Object state = Host.get(presenter, "messageDetailsState");
    return screen.thread.equals(Host.string(state, "threadTs"))
        && Host.string(screen.metadata, "id").equals(Host.string(state, "channelId"));
  }

  public static boolean threadLoaded(
      Object delegate, int index, int before, int after, List<?> original, boolean reaction) {
    if (reaction && before == after) {
      try {
        boolean retained = false;
        for (Object row : (List<?>) Host.get(Host.get(delegate, "this$0"), "rows"))
          if (isDeleted(row)) {
            retained = true;
            break;
          }
        if (!retained) return false;
      } catch (ReflectiveOperationException | RuntimeException e) {
        Archive.failed(e);
        return false;
      }
    }
    return threadUpdate(delegate, original);
  }

  public static boolean threadUpdate(Object delegate, List<?> original) {
    try {
      Object owner = Host.get(delegate, "this$0");
      if (owner == null || !owner.getClass().getName().equals(DETAILS)) return false;
      setMessages(owner, original);
      return true;
    } catch (ReflectiveOperationException | RuntimeException e) {
      Archive.failed(e);
      return false;
    }
  }

  private static void load(Screen screen) throws ReflectiveOperationException {
    screen.requested = true;
    int revision = ++screen.revision;
    Archive.inline(
        screen.scope,
        Host.string(screen.metadata, "id"),
        entries ->
            main.post(() -> {
              Object owner = screen.owner.get();
              if (owner == null || screens.get(owner) != screen || revision != screen.revision)
                return;
              screen.entries = entries;
              refresh(screen);
            }));
  }

  private static void refresh(Screen screen) {
    Object owner = screen.owner.get();
    if (owner == null || screen.original == null) return;
    try {
      if (!current(screen, owner)) return;
      if (screen.thread != null) {
        List<Object> live = new ArrayList<>();
        for (Object row : (List<?>) Host.get(owner, "rows"))
          if (!isDeleted(row)) live.add(screen.groupedOriginals.getOrDefault(row, row));
        setMessages(owner, live);
      } else
        owner
            .getClass()
            .getMethod("updateData", String.class, List.class)
            .invoke(owner, screen.anchor, screen.original);
      InlineEdits.refresh();
    } catch (ReflectiveOperationException | RuntimeException e) {
      Archive.failed(e);
    }
  }

  static List<String> editTexts(Object model) throws ReflectiveOperationException {
    if (!Settings.enabled("message_logger")) return Collections.emptyList();
    for (Screen screen : new ArrayList<>(screens.values())) {
      Object source = screen.groupedOriginals.getOrDefault(model, model);
      if (screen.original == null || screen.original.stream().noneMatch(row -> row == source))
        continue;
      Object owner = screen.owner.get();
      if (owner == null || !current(screen, owner)) continue;
      String ts = ts(model);
      for (Object row : screen.original) {
        if (ts.equals(ts(row))) {
          if (row != source) return Collections.emptyList();
          break;
        }
      }
      Archive.Entry entry = rows(screen.entries, screen.thread).get(ts);
      if (entry != null && !entry.status.equals("Deleted")) {
        List<String> texts = new ArrayList<>();
        Set<String> seen = new HashSet<>();
        String text = Host.string(obj(source), "text");
        seen.add(text.substring(0, Math.min(4000, text.length())));
        for (Archive.Entry v : screen.entries)
          if (v.ts.equals(ts)
              && Objects.equals(v.thread, entry.thread)
              && v.status.equals("Before edit")
              && seen.add(v.text)) texts.add(v.text);
        return texts;
      }
      return Collections.emptyList();
    }
    return null;
  }

  static void invalidate(String scope, String channel) {
    main.post(() -> {
      for (Screen screen : new ArrayList<>(screens.values())) {
        if (screen.scope == null || (scope != null && !scope.equals(screen.scope))) continue;
        try {
          if (channel != null && !channel.equals(Host.string(screen.metadata, "id"))) continue;
          if (!Settings.enabled("message_logger")) {
            refresh(screen);
            continue;
          }
          if (screen.reloadScheduled) continue;
          screen.reloadScheduled = true;
          main.postDelayed(
              () -> {
                screen.reloadScheduled = false;
                Object owner = screen.owner.get();
                if (owner == null || screens.get(owner) != screen) return;
                try {
                  load(screen);
                } catch (ReflectiveOperationException e) {
                  Archive.failed(e);
                }
              },
              50);
        } catch (ReflectiveOperationException e) {
          Archive.failed(e);
        }
      }
    });
  }

  static Map<String, Archive.Entry> rows(List<Archive.Entry> entries, String thread) {
    Map<String, Archive.Entry> latest = new LinkedHashMap<>();
    Map<String, StringBuilder> edits = new LinkedHashMap<>();
    for (Archive.Entry entry : entries) {
      if (entry.thread == null) continue;
      if (thread == null
          ? (!entry.thread.isEmpty() && !entry.thread.equals(entry.ts))
          : (!thread.equals(entry.thread) && !thread.equals(entry.ts))) continue;
      latest.put(entry.ts, entry);
      if (entry.status.equals("Before edit"))
        edits
            .computeIfAbsent(entry.ts, k -> new StringBuilder())
            .append('\n')
            .append(entry.text)
            .append('\n');
    }
    Map<String, Archive.Entry> rows = new LinkedHashMap<>();
    for (Archive.Entry entry : latest.values()) {
      boolean deleted = entry.status.equals("Deleted");
      StringBuilder history = edits.get(entry.ts);
      if (!deleted && history == null) continue;
      String text = deleted ? entry.text : "Previously (saved locally):" + history;
      rows.put(entry.ts, new Archive.Entry(entry.ts, entry.user, text, entry.status, entry.thread));
    }
    return rows;
  }

  private static List<?> merge(Object owner, Screen screen, List<?> original)
      throws ReflectiveOperationException {
    screen.groupedOriginals.clear();
    Set<String> live = new HashSet<>();
    String first = null, last = null;
    for (Object model : original) {
      String ts = ts(model);
      if (ts.isEmpty()) continue;
      live.add(ts);
      if (first == null || ts.compareTo(first) < 0) first = ts;
      if (last == null || ts.compareTo(last) > 0) last = ts;
    }
    if (first != null && (screen.oldest == null || first.compareTo(screen.oldest) < 0))
      screen.oldest = first;
    Map<String, Archive.Entry> rows = rows(screen.entries, screen.thread);
    if (rows.isEmpty()) return original;
    List<Object> additions = new ArrayList<>();
    Object factory =
        screen.thread == null
            ? lazy(Host.get(owner, "messageFactoryLazy"))
            : Host.get(owner, "messageFactory");
    String channel = Host.string(screen.metadata, "id");
    for (Archive.Entry entry : rows.values()) {
      if (entry.status.equals("Deleted") && live.contains(entry.ts)) continue;
      if (!entry.status.equals("Deleted")) continue;
      if (screen.oldest != null && entry.ts.compareTo(screen.oldest) < 0) continue;
      if (last != null
          && screen.anchor != null
          && !screen.anchor.isEmpty()
          && entry.ts.compareTo(last) > 0) continue;
      additions.add(viewModel(factory, screen.metadata, channel, entry, screen.thread));
    }
    if (additions.isEmpty()) return original;
    additions.sort(
        Comparator.comparing(model -> {
          try {
            return ts(model);
          } catch (ReflectiveOperationException e) {
            throw new IllegalStateException(e);
          }
        }));
    int lastTimed = -1;
    for (int i = 0; i < original.size(); i++) if (!ts(original.get(i)).isEmpty()) lastTimed = i;
    List<Object> result = new ArrayList<>();
    int next = 0;
    for (int i = 0; i < original.size(); i++) {
      String ts = ts(original.get(i));
      while (next < additions.size()) {
        if (i <= lastTimed && (ts.isEmpty() || ts(additions.get(next)).compareTo(ts) >= 0)) break;
        result.add(additions.get(next++));
      }
      result.add(original.get(i));
    }
    result.addAll(additions.subList(next, additions.size()));
    Object grouping = Host.get(factory, "messageViewModelFactory");
    Class<?> pmoType = Class.forName("slack.model.PersistedMessageObj");
    Method shadow = grouping.getClass().getMethod("isShadowMessage", pmoType, pmoType);
    Object previous = null;
    for (int i = 0; i < result.size(); i++) {
      Object model = result.get(i);
      if (isDeleted(model) || (previous != null && isDeleted(previous))) {
        boolean compact =
            (Boolean) shadow.invoke(grouping, Host.get(model, "pmo"), Host.get(previous, "pmo"));
        if (compact != (Boolean) Host.get(model, "shadowMessage")) {
          Object grouped =
              copy(model.getClass(), 11)
                  .invoke(
                      null, model, null, null, null, null, compact, null, null, false, false, ~64);
          screen.groupedOriginals.put(grouped, model);
          result.set(i, grouped);
        }
      }
      previous = model;
    }
    return result;
  }

  static boolean isDeleted(Object model) throws ReflectiveOperationException {
    return Host.string(obj(model), "clientMsgId").startsWith("slick-history:");
  }

  private static Object viewModel(
      Object factory, Object metadata, String channel, Archive.Entry entry, String thread)
      throws ReflectiveOperationException {
    Class<?> messageType = Class.forName("slack.model.Message");
    // Slack supplies all model defaults. This fresh local model is never submitted or persisted.
    Object message =
        Class.forName("slack.model.Message$Companion")
            .getMethod(
                "newPendingMessage",
                String.class,
                String.class,
                String.class,
                String.class,
                String.class,
                Class.forName("slack.model.blockkit.RichTextItem"))
            .invoke(
                null,
                entry.user == null ? "" : entry.user,
                "slick-history:" + entry.ts,
                channel,
                entry.text,
                thread,
                null);
    Method copy = copy(messageType, 28);
    Object[] args = new Object[28];
    Class<?>[] types = copy.getParameterTypes();
    for (int i = 0; i < types.length; i++) {
      if (types[i] == int.class) args[i] = 0;
      else if (types[i] == boolean.class) args[i] = false;
    }
    args[0] = message;
    args[1] = entry.ts;
    args[25] = ~16;
    args[26] = -1;
    args[27] = 0x0fffffff;
    message = copy.invoke(null, args);
    Object state =
        Class.forName("kotlin.ResultKt")
            .getMethod("stateFromTs", messageType)
            .invoke(null, message);
    Class<?> pmoType = Class.forName("slack.model.PersistedMessageObj");
    Object pmo =
        Class.forName("slack.model.PersistedModelObj")
            .getMethod(
                "from",
                String.class,
                String.class,
                messageType,
                Class.forName("slack.model.MessageState"))
            .invoke(null, "slick-history:" + entry.ts, channel, message, state);
    return factory
        .getClass()
        .getMethod(
            "createViewModel",
            pmoType,
            pmoType,
            Class.forName("slack.messagerendering.model.ChannelMetadata"))
        .invoke(factory, pmo, null, metadata);
  }
}
