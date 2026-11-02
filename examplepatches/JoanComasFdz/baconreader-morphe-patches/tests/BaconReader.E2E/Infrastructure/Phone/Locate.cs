// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium;
using OpenQA.Selenium.Appium;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>
/// The only ways a page object finds a view (E2E-TEST-CODE-RULES.md, rule c): its resource id, its content description or
/// its exact text, or a web page's HTML id. Never XPath or a position.
/// </summary>
public static class Locate
{
    /// <summary>A view of BaconReader by its resource id (<c>R.id.toolbarTitle</c> → "toolbarTitle").</summary>
    public static By AppId(string id) => By.Id($"{E2EDevice.Package}:id/{id}");

    /// <summary>A view of Android's own (a dialog's <c>android:id/button1</c>) by its resource id.</summary>
    public static By AndroidId(string id) => By.Id($"android:id/{id}");

    /// <summary>A view of Android's Settings app (its "Open by default" screen's <c>entity_header_title</c>) by its resource id.</summary>
    public static By SettingsId(string id) => By.Id($"com.android.settings:id/{id}");

    /// <summary>A view by its content description, which views a patch creates in code get from the patch.</summary>
    public static By Description(string description) => MobileBy.AccessibilityId(description);

    /// <summary>
    /// A view whose content description starts with <paramref name="description"/>: one a test-only patch adds to
    /// ("Navigate up, orange envelope").
    /// </summary>
    public static By DescriptionStartingWith(string description) => UiSelector($"descriptionStartsWith({Quote(description)})");

    /// <summary>A view showing exactly <paramref name="text"/>.</summary>
    public static By Text(string text) => UiSelector($"text({Quote(text)})");

    /// <summary>A view whose text contains <paramref name="text"/>: a sentence of a web page around a name it composes in.</summary>
    public static By TextContaining(string text) => UiSelector($"textContains({Quote(text)})");

    /// <summary>The view of BaconReader with resource id <paramref name="id"/> that shows exactly <paramref name="text"/>: one entry of a list whose entries share an id.</summary>
    public static By AppIdWithText(string id, string text) =>
        UiSelector($"resourceId({Quote($"{E2EDevice.Package}:id/{id}")}).text({Quote(text)})");

    /// <summary>
    /// The view of BaconReader with resource id <paramref name="id"/> that shows exactly <paramref name="text"/>, inside a
    /// disabled view: a menu entry greyed out, whose row is disabled while its title still reads as enabled.
    /// </summary>
    public static By AppIdWithTextInDisabled(string id, string text) =>
        UiSelector($"enabled(false).childSelector(new UiSelector().resourceId({Quote($"{E2EDevice.Package}:id/{id}")}).text({Quote(text)}))");

    /// <summary>A button showing exactly <paramref name="text"/>, where a title shows the same text (a web page's "Log In").</summary>
    public static By ButtonWithText(string text) => UiSelector($"className(\"android.widget.Button\").text({Quote(text)})");

    /// <summary>The one text field a dialog shows (a setting's value), which has no id or description of its own.</summary>
    public static By TextField() => UiSelector("className(\"android.widget.EditText\")");

    /// <summary>The web page a web view shows, which scrolls (its view has no id once the page loaded).</summary>
    public static By WebPage() => UiSelector("className(\"android.webkit.WebView\").scrollable(true)");

    /// <summary>The text field inside the web page's view with HTML id <paramref name="id"/> (a form's field and its label).</summary>
    public static By WebFieldIn(string id) =>
        UiSelector($"resourceId({Quote(id)}).childSelector(new UiSelector().className(\"android.widget.EditText\"))");

    private static By UiSelector(string selector) => MobileBy.AndroidUIAutomator($"new UiSelector().{selector}");

    private static string Quote(string text) => $"\"{text.Replace("\\", "\\\\").Replace("\"", "\\\"")}\"";
}
