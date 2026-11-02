import app.morphe.extension.facebook.marketplace.AboutMenu;
import X.C1UM;
import X.OlL;
import java.util.ArrayList;
import java.util.List;

public class AboutMenuTest {
  static int fails = 0;
  static void check(boolean ok, String m) { System.out.println((ok ? "PASS " : "FAIL ") + m); if (!ok) fails++; }

  public static void main(String[] a) {
    AboutMenu.setIconClassNameForTesting("X.C1UM");

    // 1: a row is appended after Facebook's own rows, with the expected label / id / icon / no badge
    List<Object> items = new ArrayList<>();
    items.add("existing row 1"); items.add("existing row 2");
    AboutMenu.addAboutItem(items, new Object());
    check(items.size() == 3 && "existing row 1".equals(items.get(0)), "existing rows untouched, one row appended");
    OlL row = items.size() == 3 && items.get(2) instanceof OlL ? (OlL) items.get(2) : null;
    check(row != null && "About".equals(row.label), "row label is About");
    check(row != null && "marketplace_about".equals(row.id), "row id is marketplace_about");
    check(row != null && row.icon == C1UM.INFO_CIRCLE, "icon found by enum name INFO_CIRCLE");
    check(row != null && row.badge == 0, "no badge");

    // 2: clicking calls Function0.invoke without throwing, even though there is no Android here, and returns kotlin.Unit
    Object result = null; boolean threw = false;
    try { result = row.onClick.invoke(); } catch (Throwable t) { threw = true; }
    check(!threw && result == kotlin.Unit.INSTANCE, "click callback is safe and returns Unit");

    // 3: the proxy behaves as an object (the menu may put callbacks in sets / log them)
    check(row.onClick.equals(row.onClick) && !row.onClick.equals(new Object()) && row.onClick.hashCode() == row.onClick.hashCode()
        && row.onClick.toString() != null, "equals / hashCode / toString work on the callback");

    // 4: failure modes leave the menu alone and never throw
    AboutMenu.addAboutItem(null, null);
    AboutMenu.addAboutItem("not a collection", new Object());
    List<Object> other = new ArrayList<>();
    AboutMenu.setIconClassNameForTesting("X.DoesNotExist");
    AboutMenu.addAboutItem(other, new Object());
    check(other.isEmpty(), "unknown icon class: menu unchanged, no exception");
    AboutMenu.setIconClassNameForTesting("X.C1UM");

    // 5: immutable list (add throws) is swallowed
    AboutMenu.addAboutItem(java.util.Collections.emptyList(), new Object());
    check(true, "read-only list does not throw");

    if (fails > 0) { System.out.println(fails + " FAILED"); System.exit(1); }
    System.out.println("ALL PASSED");
  }
}
