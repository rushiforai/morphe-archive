// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Globalization;
using System.Text.Json;
using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium;
using OpenQA.Selenium.Appium;
using OpenQA.Selenium.Appium.Android.Enums;

namespace BaconReader.E2E.Exploring;

/// <summary>
/// Not a scenario: a tool to look at the app before writing a Gherkin (README, "Exploring the app before writing a
/// Gherkin"). It sets the app up as a LoggedIn scenario does (every patch, the fake Reddit, logged in with the test
/// account), with the Reddit data its commands file (<c>E2E_EXPLORE</c>) makes, then waits for commands that
/// <c>tools/e2e/explore.sh</c> sends through files in <c>build/e2e/explore/</c>: taps, Back, page sources, screenshots,
/// what the fake Reddit saw. It runs until <c>quit</c>. Without <c>E2E_EXPLORE</c> it is skipped, and
/// <c>record.sh</c> never picks it (it isn't under <c>Scenarios/</c>); <c>ScenarioShapeTests</c> leaves it out.
/// </summary>
public sealed class Explorer : BaseE2E
{
    private const string FileVariable = "E2E_EXPLORE";
    private static readonly TimeSpan KeepAlive = TimeSpan.FromSeconds(60);

    private int sources;
    private int screenshots;

    /// <summary>Whether <c>E2E_EXPLORE</c> names a commands file: only then does the explorer run.</summary>
    public static bool IsOn => Environment.GetEnvironmentVariable(FileVariable) is { Length: > 0 };

    /// <summary>The folder the explorer and <c>tools/e2e/explore.sh</c> talk through: <c>build/e2e/explore/</c>.</summary>
    public static string Folder => Path.Combine(E2EDevice.WorkFolder, "explore");

    [Fact(Skip = "Set E2E_EXPLORE to a commands file to explore the app (README, \"Exploring the app before writing a Gherkin\").", SkipUnless = nameof(IsOn))]
    [PatchedWithEveryPatch]
    public async Task Explore()
    {
        var cancel = TestContext.Current.CancellationToken;
        if (Directory.Exists(Folder))
        {
            Directory.Delete(Folder, recursive: true);
        }

        Directory.CreateDirectory(Folder);
        var commands = (await File.ReadAllLinesAsync(Environment.GetEnvironmentVariable(FileVariable)!, cancel)).Select(ExplorerCommand.Parse).OfType<ExplorerCommand>().ToList();
        var data = commands.Where(command => command.IsRedditData).ToList();
        var answers = data.Select(Run).ToList();
        if (!World.Posts.Any())
        {
            // Logging in waits for the Front Page's posts.
            Reddit.HasAPost("Hello from r/e2e", "e2e");
            answers.Add("post: e2e | Hello from r/e2e (none in the commands file: logging in waits for a post)");
        }

        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();
        foreach (var command in commands.Except(data))
        {
            if (command.Name == "quit")
            {
                return;
            }

            answers.Add(await RunAsync(command, cancel));
        }

        await File.WriteAllLinesAsync(Path.Combine(Folder, "answer"), answers, cancel);
        await File.WriteAllTextAsync(Path.Combine(Folder, "ready"), "", cancel);
        var idle = System.Diagnostics.Stopwatch.StartNew();
        while (true)
        {
            var incoming = Path.Combine(Folder, "commands");
            if (!File.Exists(incoming))
            {
                await Task.Delay(300, cancel);
                if (idle.Elapsed > KeepAlive)
                {
                    // Appium ends a session that sent no command for 5 minutes (newCommandTimeout).
                    _ = Driver.CurrentPackage;
                    idle.Restart();
                }

                continue;
            }

            var lines = await File.ReadAllLinesAsync(incoming, cancel);
            File.Delete(incoming);
            answers = [];
            foreach (var command in lines.Select(ExplorerCommand.Parse).OfType<ExplorerCommand>())
            {
                if (command.Name == "quit")
                {
                    await File.WriteAllTextAsync(Path.Combine(Folder, "answer"), "quit\n", cancel);
                    return;
                }

                answers.Add(await RunAsync(command, cancel));
            }

            await File.WriteAllLinesAsync(Path.Combine(Folder, "answer"), answers, cancel);
            idle.Restart();
        }
    }

    // A command on the phone or the fake Reddit; its answer, one line or more, or "error: …" without stopping.
    private async Task<string> RunAsync(ExplorerCommand command, CancellationToken cancel)
    {
        try
        {
            switch (command.Name)
            {
                case "tap":
                    Driver.FindElement(UiSelector($"text({Quote(command.Argument(0))})")).Click();
                    return $"tapped \"{command.Argument(0)}\"";
                case "tap containing":
                    Driver.FindElement(UiSelector($"textContains({Quote(command.Argument(0))})")).Click();
                    return $"tapped the text containing \"{command.Argument(0)}\"";
                case "tap id":
                    var id = command.Argument(0).Contains(':', StringComparison.Ordinal) ? command.Argument(0) : $"{E2EDevice.Package}:id/{command.Argument(0)}";
                    Driver.FindElement(By.Id(id)).Click();
                    return $"tapped {id}";
                case "tap description":
                    Driver.FindElement(MobileBy.AccessibilityId(command.Argument(0))).Click();
                    return $"tapped the description \"{command.Argument(0)}\"";
                case "tap at":
                    var point = command.Argument(0).Split(',', StringSplitOptions.TrimEntries);
                    Driver.ExecuteScript("mobile: clickGesture", new Dictionary<string, object>
                    {
                        ["x"] = int.Parse(point[0], CultureInfo.InvariantCulture),
                        ["y"] = int.Parse(point[1], CultureInfo.InvariantCulture),
                    });
                    return $"tapped at {point[0]},{point[1]}";
                case "type":
                    Driver.SwitchTo().ActiveElement().SendKeys(command.Argument(0));
                    return $"typed \"{command.Argument(0)}\"";
                case "back":
                    Driver.PressKeyCode(AndroidKeyCode.Back);
                    return "back";
                case "wait":
                    await Task.Delay(TimeSpan.FromSeconds(double.Parse(command.Argument(0), CultureInfo.InvariantCulture)), cancel);
                    return $"waited {command.Argument(0)} s";
                case "source":
                    var source = Path.Combine(Folder, $"source-{sources++}.xml");
                    await File.WriteAllTextAsync(source, Driver.PageSource, cancel);
                    return $"source {source}";
                case "screenshot":
                    var screenshot = Path.Combine(Folder, $"screenshot-{screenshots++}.png");
                    await File.WriteAllBytesAsync(screenshot, Driver.GetScreenshot().AsByteArray, cancel);
                    return $"screenshot {screenshot}";
                case "actions":
                    return Lines(World.Actions.Select(action => $"{action.At:HH:mm:ss.fff} {action.Name} {JsonSerializer.Serialize(action.Form)}"), "no action");
                case "requests":
                    var count = command.Arguments.Count > 0 ? int.Parse(command.Argument(0), CultureInfo.InvariantCulture) : 30;
                    return Lines(World.Requests.TakeLast(count).Select(request => $"{request.At:HH:mm:ss.fff} {request.Status} {request.Method} {request.Path}{request.Query}"), "no request");
                case "unhandled":
                    return Lines(World.Unhandled.Select(request => $"{request.Method} {request.Path}{request.Query}"), "no unhandled request");
                default:
                    return command.IsRedditData ? Run(command) : $"error: unknown command \"{command.Name}\" (README, \"Exploring the app before writing a Gherkin\")";
            }
        }
        catch (Exception exception) when (exception is not OperationCanceledException)
        {
            return Error(command, exception);
        }
    }

    // Reddit data, in the Gherkins' words (Infrastructure/Reddit/): what a Given line would make.
    private string Run(ExplorerCommand command)
    {
        try
        {
            switch (command.Name)
            {
                case "post": Reddit.HasAPost(command.Argument(1), command.Argument(0)); break;
                case "youtube video": Reddit.YouTubeHasAVideo(command.Argument(0), command.Argument(1)); break;
                case "removed youtube video": Reddit.YouTubeHasRemovedItsVideo(command.Argument(0)); break;
                case "youtube post": Reddit.HasALinkPostLinkingToTheYouTubeVideo(command.Argument(1), command.Argument(0), command.Argument(2)); break;
                case "comment with link": Reddit.ThePost(command.Argument(0)).HasACommentWithTheLink(command.Argument(1), command.Argument(2)); break;
                case "comment with snoomoji": Reddit.ThePost(command.Argument(0)).HasACommentWithTheSnoomoji(command.Argument(1), command.Argument(2)); break;
                case "chat link": Reddit.TheChatHasALinkToThePost(command.Argument(0), command.Argument(1)); break;
                case "imgflip templates": Reddit.ImgflipHasItsMemeTemplates(); break;
                case "removed imgflip template": Reddit.ImgflipHasRemovedItsTemplate(command.Argument(0)); break;
                case "comment with subreddit emote": Reddit.ThePost(command.Argument(0)).HasACommentWithAnEmoteOfItsSubreddit(command.Argument(1)); break;
                case "x post": Reddit.XHasAPost(command.Argument(0), command.Argument(1), command.Argument(2), Enum.Parse<BaconReader.FakeReddit.World.XMedia>(command.Argument(3), ignoreCase: true)); break;
                case "long x post": Reddit.XHasALongPost(command.Argument(0), command.Argument(1), command.Argument(2)); break;
                case "bluesky post": Reddit.BlueskyHasAPost(command.Argument(0), command.Argument(1), command.Argument(2), Enum.Parse<BaconReader.FakeReddit.World.BlueskyEmbed>(command.Argument(3), ignoreCase: true)); break;
                case "phone joins another network": Reddit.ThePhoneJoinsAnotherNetwork(); break;
                case "redgifs post": Reddit.HasARedGifsPost(command.Argument(1), command.Argument(0)); break;
                case "deleted redgifs post": Reddit.HasARedGifsPostWhoseVideoWasDeleted(command.Argument(1), command.Argument(0)); break;
                case "missing redgifs post": Reddit.HasARedGifsPostWhoseVideoRedGifsNeverHad(command.Argument(1), command.Argument(0)); break;
                case "imgur album": Reddit.ImgurHasAnAlbumOf(command.Argument(0), int.Parse(command.Argument(1), CultureInfo.InvariantCulture)); break;
                case "imgur video album": Reddit.ImgurHasAnAlbumOfVideos(command.Argument(0), int.Parse(command.Argument(1), CultureInfo.InvariantCulture)); break;
                case "imgur gallery post": Reddit.ImgurHasAGalleryPostOf(command.Argument(0), int.Parse(command.Argument(1), CultureInfo.InvariantCulture)); break;
                case "imgur album post": Reddit.HasALinkPostLinkingToTheImgurAlbum(command.Argument(1), command.Argument(0), command.Argument(2)); break;
                case "comment with imgur album": Reddit.ThePost(command.Argument(0)).HasACommentWithALinkToTheImgurAlbum(command.Argument(1), command.Argument(2)); break;
                case "post with text and image": Reddit.HasAPostWithTheTextAndAnImage(command.Argument(1), command.Argument(0), command.Argument(2)); break;
                case "post with flair": Reddit.HasAPostWithTheFlair(command.Argument(1), command.Argument(0), command.Argument(2)); break;
                case "post with silver": Reddit.HasAPostWithSilverAwards(command.Argument(1), command.Argument(0), int.Parse(command.Argument(2), CultureInfo.InvariantCulture)); break;
                case "flairs": Reddit.TheSubredditLetsUsersChooseTheFlairs(command.Argument(0), [.. command.Arguments.Skip(1)]); break;
                case "comment with silver": Reddit.ThePost(command.Argument(0)).HasACommentWithSilverAwards(command.Argument(1), int.Parse(command.Argument(2), CultureInfo.InvariantCulture)); break;
                case "post with text": Reddit.HasAPostWithTheText(command.Argument(1), command.Argument(0), Lines(command.Argument(2))); break;
                case "comment": Reddit.ThePost(command.Argument(0)).HasAComment(Lines(command.Argument(1))); break;
                case "comment by": Reddit.ThePost(command.Argument(0)).HasACommentBy(Lines(command.Argument(2)), command.Argument(1)); break;
                case "comment with table link": Reddit.ThePost(command.Argument(0)).HasACommentWithATableWhoseCellLinksToAnImage(command.Argument(1), command.Argument(2)); break;
                case "comment with spoiler link": Reddit.ThePost(command.Argument(0)).HasACommentThatIsASpoilerLinkingToAnImage(command.Argument(1)); break;
                case "comments": Reddit.ThePost(command.Argument(0)).HasComments(int.Parse(command.Argument(1), CultureInfo.InvariantCulture)); break;
                case "reply": Reddit.ThePost(command.Argument(0)).TheComment(Lines(command.Argument(1))).HasAReply(Lines(command.Argument(2))); break;
                case "comment with image": Reddit.ThePost(command.Argument(0)).HasACommentWithAnImage(command.Argument(1)); break;
                case "comment with gif": Reddit.ThePost(command.Argument(0)).HasACommentWithAGif(command.Argument(1)); break;
                case "comment with image link": Reddit.ThePost(command.Argument(0)).HasACommentWithALinkToAnImage(command.Argument(1)); break;
                case "comment with video": Reddit.ThePost(command.Argument(0)).HasACommentWithAVideo(command.Argument(1)); break;
                case "comment with video link": Reddit.ThePost(command.Argument(0)).HasACommentWithALinkToAVideo(command.Argument(1)); break;
                case "subscribe": Reddit.TheTestAccountIsSubscribedTo(command.Argument(0)); break;
                case "message": Reddit.TheTestAccountHasAnUnreadMessage(command.Argument(0), command.Argument(1)); break;
                case "late comments": Reddit.AnswersTheCommentsOfThePostLate(command.Argument(0), int.Parse(command.Argument(1), CultureInfo.InvariantCulture)); break;
                case "fail posts": Reddit.AnswersThePostsWith(command.Argument(0), command.Argument(1)); break;
                case "refuse posts": Reddit.RefusesThePostsWith(command.Argument(0), command.Argument(1), command.Argument(2)); break;
                case "drop posts": Reddit.DropsTheConnectionForThePosts(command.Argument(0)); break;
                case "image post": Reddit.HasAnImagePost(command.Argument(1), command.Argument(0)); break;
                case "gif post": Reddit.HasAGifPost(command.Argument(1), command.Argument(0)); break;
                case "signed thumbnail post": Reddit.HasAnImagePostWithASignedThumbnail(command.Argument(1), command.Argument(0)); break;
                case "video post": Reddit.HasAVideoPost(command.Argument(1), command.Argument(0)); break;
                case "link post with preview": Reddit.HasALinkPostWithAPreviewAndNoThumbnail(command.Argument(1), command.Argument(0)); break;
                case "nsfw image post": Reddit.HasAnNsfwImagePost(command.Argument(1), command.Argument(0)); break;
                case "spoiler image post": Reddit.HasASpoilerImagePost(command.Argument(1), command.Argument(0)); break;
                case "gallery post": Reddit.HasAGalleryPostOf(command.Argument(1), command.Argument(0), int.Parse(command.Argument(2), CultureInfo.InvariantCulture)); break;
                case "crosspost": Reddit.HasACrosspostOf(command.Argument(1), command.Argument(0), command.Argument(2)); break;
                case "link post to video": Reddit.HasALinkPostLinkingToTheVideoOf(command.Argument(1), command.Argument(0), command.Argument(2)); break;
                case "avatar": Reddit.TheUserHasAnAvatar(command.Argument(0)); break;
                case "late media": Reddit.AnswersTheMediaOfThePostLate(command.Argument(0), int.Parse(command.Argument(1), CultureInfo.InvariantCulture)); break;
                case "fail media": Reddit.AnswersTheMediaOfThePostWith(command.Argument(0), command.Argument(1)); break;
                case "fail thumbnail": Reddit.AnswersTheThumbnailOfThePostWithTheFirstTimes(command.Argument(0), command.Argument(1), int.Parse(command.Argument(2), CultureInfo.InvariantCulture)); break;
                default: return $"error: unknown command \"{command.Name}\"";
            }

            return command.Text;
        }
        catch (Exception exception)
        {
            return Error(command, exception);
        }
    }

    // The error's first line, without the link to Selenium's documentation Appium adds.
    private static string Error(ExplorerCommand command, Exception exception) =>
        $"error: {command.Name}: {exception.Message.Split('\n')[0].Split("; For documentation", 2)[0]}";

    // A text on one line of the commands: "\n" is a line break and "¦" a "|", which separates the arguments, as a
    // Markdown table needs.
    private static string Lines(string text) => text.Replace("\\n", "\n", StringComparison.Ordinal).Replace('¦', '|');

    private static string Lines(IEnumerable<string> lines, string none) =>
        lines.ToList() is { Count: > 0 } found ? string.Join('\n', found) : none;

    private static By UiSelector(string selector) => MobileBy.AndroidUIAutomator($"new UiSelector().{selector}");

    private static string Quote(string text) => $"\"{text.Replace("\\", "\\\\").Replace("\"", "\\\"")}\"";
}

/// <summary>
/// One line of the explorer's commands: "name" or "name: argument | argument". Blank lines and lines starting with "#"
/// are none.
/// </summary>
public sealed record ExplorerCommand(string Text, string Name, IReadOnlyList<string> Arguments)
{
    private static readonly string[] RedditData =
    [
        "post", "post with flair", "post with silver", "flairs", "post with text", "post with text and image", "comment",
        "comment by", "comment with silver", "comment with table link", "comment with spoiler link", "comments", "reply",
        "comment with image", "comment with gif", "comment with image link",
        "comment with video", "comment with video link", "subscribe", "message", "late comments", "fail posts",
        "refuse posts", "drop posts", "image post", "gif post", "signed thumbnail post", "video post",
        "link post with preview", "nsfw image post", "spoiler image post", "gallery post", "crosspost",
        "link post to video", "avatar", "late media", "fail media", "fail thumbnail", "imgur album", "imgur video album", "imgur gallery post",
        "imgur album post", "comment with imgur album", "redgifs post", "deleted redgifs post", "missing redgifs post", "phone joins another network", "x post", "long x post", "bluesky post", "youtube video", "removed youtube video", "youtube post", "comment with link", "comment with snoomoji", "comment with subreddit emote", "imgflip templates", "removed imgflip template", "chat link",
    ];

    /// <summary>Whether it makes Reddit data: from the commands file, it runs before the app opens.</summary>
    public bool IsRedditData => RedditData.Contains(Name);

    /// <summary>The argument at <paramref name="index"/>, or a failure naming what is missing.</summary>
    public string Argument(int index) =>
        index < Arguments.Count ? Arguments[index] : throw new ArgumentException($"\"{Name}\" needs {index + 1} argument(s), separated by \"|\".");

    /// <summary>The command a line holds, or null for a blank line or a comment.</summary>
    public static ExplorerCommand? Parse(string line)
    {
        var text = line.Trim();
        if (text.Length == 0 || text.StartsWith('#'))
        {
            return null;
        }

        var colon = text.IndexOf(':', StringComparison.Ordinal);
        return colon < 0
            ? new ExplorerCommand(text, text.ToLowerInvariant(), [])
            : new ExplorerCommand(text, text[..colon].Trim().ToLowerInvariant(), [.. text[(colon + 1)..].Split('|', StringSplitOptions.TrimEntries)]);
    }
}
