// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>Android's file picker (Files), which an app opens to be given a file: it starts in Downloads.</summary>
public sealed class FilePicker(AndroidDriver driver)
{
    /// <summary>Waits until the picker shows <paramref name="file"/>.</summary>
    public Task WaitUntilFileShownAsync(string file) =>
        Waiting.UntilShownAsync(driver, Locate.Text(file), TimeSpan.FromSeconds(10), $"\"{file}\" in Android's file picker");

    /// <summary>Taps <paramref name="file"/>, which gives it to the app.</summary>
    public Task ClickFileAsync(string file) => OnScreen.PressAsync(driver, Locate.Text(file));

    /// <summary>Waits until the picker shows, to save a file: its name field and "SAVE".</summary>
    public Task WaitUntilSaveShownAsync() =>
        Waiting.UntilShownAsync(driver, Save, TimeSpan.FromSeconds(10), "Android's file picker, to save a file");

    /// <summary>Taps "SAVE", which saves the file under the name in its field, in the folder it shows, and closes the picker.</summary>
    public Task ClickSaveAsync() => OnScreen.PressAsync(driver, Save);

    /// <summary>What the picker shows to save a file: the folder it is in, and the name in its field.</summary>
    public Task<FilePickerSaveSnapshot> ReadSaveAsync() =>
        OnScreen.ReadAsync(driver, () =>
        {
            var screen = ScreenSnapshot.Take(driver);
            // The path above the files, whose last part is the folder the file goes to.
            var folder = screen.Root.Descendants().Last(view => view.ResourceId.EndsWith(":id/breadcrumb_text", StringComparison.Ordinal) && view.Displayed);
            var name = screen.Root.Descendants().First(view => view.ClassName == "android.widget.EditText" && view.Displayed);
            return new FilePickerSaveSnapshot(folder.Text, name.Text);
        });

    private static readonly OpenQA.Selenium.By Save = Locate.ButtonWithText("SAVE");
}

/// <summary>What Android's file picker shows to save a file: the folder it is in, and the file's name.</summary>
public sealed record FilePickerSaveSnapshot(string Folder, string Name);
