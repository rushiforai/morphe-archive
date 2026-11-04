// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2E.Infrastructure.Device;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>
/// Android's Downloads folder, as the Files app shows it: the scenarios read BaconReader's folder in it,
/// Downloads/BaconReader, where "Embed comment images" saves an image on a long press. Not on the screen: read through adb.
/// BaseE2E empties the folder before each scenario (<see cref="Folder"/>).
/// </summary>
public sealed class Downloads(AndroidDriver driver)
{
    /// <summary>Downloads/BaconReader on the phone.</summary>
    public const string Folder = "/sdcard/Download/BaconReader";

    /// <summary>
    /// Waits until Downloads/BaconReader holds an image, saved whole: Android's download manager makes the file empty
    /// first, then writes it, so the wait ends once the file has bytes and the same size twice in a row.
    /// </summary>
    public Task WaitUntilImageSavedAsync() => WaitUntilNewImageSavedAsync(new HashSet<string>());

    /// <summary>
    /// Waits as long as an image takes to be saved (10 s), for one that should never come: it ends sooner when one does,
    /// for the check to say so. An image saved before the wait, by an earlier round, doesn't end it.
    /// </summary>
    public async Task WaitUntilNoImageSavedAsync()
    {
        var before = ReadFiles().Select(file => file.Name).ToHashSet();
        try
        {
            await WaitUntilNewImageSavedAsync(before);
        }
        catch (TimeoutException)
        {
            // Nothing saved, as expected.
        }
    }

    // Until a file not named in before is there, and every file has bytes and the same size twice in a row.
    private Task WaitUntilNewImageSavedAsync(IReadOnlySet<string> before)
    {
        ImmutableArray<SavedFile>? last = null;
        return Waiting.UntilAsync(
            () =>
            {
                var now = ReadFiles();
                var saved = now.Any(file => !before.Contains(file.Name))
                    && now.All(file => file.Size > 0)
                    && last is { } previous
                    && previous.SequenceEqual(now);
                last = now;
                return saved;
            },
            TimeSpan.FromSeconds(10),
            "An image saved to Downloads/BaconReader");
    }

    /// <summary>
    /// Waits until Downloads/BaconReader holds the file <paramref name="name"/>, written whole: it has bytes and the same
    /// size twice in a row, half a second apart. A video is saved, then given its sound ("Save videos with sound").
    /// </summary>
    public Task WaitUntilFileSavedAsync(string name)
    {
        long? last = null;
        return Waiting.UntilAsync(
            () =>
            {
                var size = ReadFiles().FirstOrDefault(file => file.Name == name)?.Size;
                var saved = size > 0 && size == last;
                last = size;
                return saved;
            },
            TimeSpan.FromSeconds(20),
            $"\"{name}\" saved to Downloads/BaconReader");
    }

    /// <summary>
    /// The tracks of the video <paramref name="name"/> in Downloads/BaconReader. Not on the screen: the file is pulled
    /// from the phone and read with ffprobe.
    /// </summary>
    public Task<SavedVideoSnapshot> ReadVideoAsync(string name) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var local = Path.Combine(Path.GetTempPath(), $"e2e-{Guid.NewGuid():N}-{name}");
            try
            {
                Commands.AdbAsync("pull", $"{Folder}/{name}", local).GetAwaiter().GetResult();
                var types = Commands.RunOrFailAsync("ffprobe", "-v", "error", "-show_entries", "stream=codec_type", "-of", "csv=p=0", local).GetAwaiter().GetResult()
                    .Split('\n', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries);
                return new SavedVideoSnapshot(name, types.Contains("video"), types.Contains("audio"));
            }
            finally
            {
                File.Delete(local);
            }
        });

    /// <summary>What Downloads/BaconReader holds: each file's name and size.</summary>
    public Task<DownloadsSnapshot> ReadAsync() => OnScreen.ReadAsync(driver, () => new DownloadsSnapshot(ReadFiles()));

    // The folder's files, but the hidden ones the download manager writes into: "<size> <path>" each.
    private static ImmutableArray<SavedFile> ReadFiles() =>
    [
        .. Commands.ShellAsync($"for f in {Folder}/*; do [ -f \"$f\" ] && stat -c '%s %n' \"$f\"; done; true").GetAwaiter().GetResult()
            .Split('\n', StringSplitOptions.RemoveEmptyEntries)
            .Select(line => line.Split(' ', 2))
            .Select(parts => new SavedFile(Path.GetFileName(parts[1]), long.Parse(parts[0], System.Globalization.CultureInfo.InvariantCulture))),
    ];
}

/// <summary>What Downloads/BaconReader holds.</summary>
public sealed record DownloadsSnapshot(ImmutableArray<SavedFile> Files);

/// <summary>A video saved in Downloads/BaconReader: its name, and whether it has a video track and a sound track.</summary>
public sealed record SavedVideoSnapshot(string Name, bool HasVideo, bool HasSound);

/// <summary>A file in Downloads/BaconReader: its name and its size in bytes.</summary>
public sealed record SavedFile(string Name, long Size);
