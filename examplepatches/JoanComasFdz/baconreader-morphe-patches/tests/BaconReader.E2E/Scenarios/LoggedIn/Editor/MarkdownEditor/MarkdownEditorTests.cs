// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Editor;

/// <summary>
/// "Markdown editor": the text box of a reply and of a text post gets a bar of Reddit's formats above it, which put
/// Markdown in the text ("Heading" puts "# " before the line), and a counter of its characters against Reddit's limit,
/// 10,000 for a comment and 40,000 for a post, or the subreddit's own (Reddit's <c>api/v1/&lt;sub&gt;/post_requirements</c>).
/// Left out: the formatting it draws in the box while typing (spans, which the screen's tree doesn't show), and the box's
/// size, which follows the keyboard.
/// </summary>
public sealed class MarkdownEditorTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Markdown editor puts Reddit's formats above the text box with a character counter
          Given Reddit has a post "Introductions" in r/e2e
          And the post "Introductions" has a comment "Hello there" by u/other_user
          And r/strict asks text posts for 10 to 100 characters
          And r/linksonly takes no text in posts
          And BaconReader is patched with every patch
          And the test account is logged in
          And BaconReader is open
          When I select the "e2e" feed
          And I tap the post "Introductions"
          And I swipe the comment "Hello there" to its action bar
          And I tap "Comment" in the comment's action bar
          Then the reply screen shows the formats "Bold", "Italic", "Strikethrough", "Superscript", "Spoiler", "Inline code", "Link", "Heading", "Bulleted list", "Numbered list", "Quote", "Code block", "Table" and "Horizontal line", in this order
          And the counter shows "0 / 10,000"
          When I type "Hi"
          And I tap "Heading"
          Then the text box shows "# Hi"
          And the counter shows "4 / 10,000"
          When I tap the send button
          Then Reddit got the comment "# Hi" to the comment "Hello there"
          When I go back to the posts
          And I open the left menu
          And I tap "Submit post"
          Then the counter shows "0 / 40,000"
          When I type "Hello" in "Message (Optional)"
          And I type "strict" in "Subreddit: r/"
          Then the counter shows "5 / 100 (min. 10)"
          When I type "linksonly" in "Subreddit: r/"
          Then the counter shows "No text in r/linksonly"
        """)]
    public async Task MarkdownEditorPutsRedditsFormatsAboveTheTextBoxWithACharacterCounter(Screen screen)
    {
        // Given
        Reddit.HasAPost("Introductions", "e2e");
        Reddit.ThePost("Introductions").HasACommentBy("Hello there", "other_user");
        Reddit.TheSubredditAsksTextPostsFor("strict", 10, 100);
        Reddit.TheSubredditTakesNoTextInPosts("linksonly");
        Reddit.TheTestAccountIsLoggedIn();
        await Phone.BaconReader.OpenAsync();

        // When
        await Phone.BaconReader.Main.Toolbar.SelectFeedAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.Toolbar.WaitUntilFeedShownAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Introductions");
        await Phone.BaconReader.Detail.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("Hello there");
        await Phone.BaconReader.Detail.Comments.SwipeToActionBarAsync("Hello there");
        await Phone.BaconReader.Detail.Comments.WaitUntilActionBarShownAsync();
        await Phone.BaconReader.Detail.Comments.ClickActionBarCommentAsync();
        await Phone.BaconReader.ReplyScreen.WaitUntilShownAsync();
        await Phone.BaconReader.ReplyScreen.Editor.WaitUntilShownAsync();

        // Then
        var formats = await Phone.BaconReader.ReplyScreen.Editor.ReadFormatsAsync();
        var empty = await Phone.BaconReader.ReplyScreen.Editor.ReadAsync();
        Asserting.That(formats).ShowsTheFormats(
            new MarkdownFormat.Bold(),
            new MarkdownFormat.Italic(),
            new MarkdownFormat.Strikethrough(),
            new MarkdownFormat.Superscript(),
            new MarkdownFormat.Spoiler(),
            new MarkdownFormat.InlineCode(),
            new MarkdownFormat.Link(),
            new MarkdownFormat.Heading(),
            new MarkdownFormat.BulletedList(),
            new MarkdownFormat.NumberedList(),
            new MarkdownFormat.Quote(),
            new MarkdownFormat.CodeBlock(),
            new MarkdownFormat.Table(),
            new MarkdownFormat.HorizontalLine());
        Asserting.That(empty).ShowsTheCounter("0 / 10,000");

        // When
        await Phone.BaconReader.ReplyScreen.Editor.TypeAsync("Hi");
        await Phone.BaconReader.ReplyScreen.Editor.ClickAsync(new MarkdownFormat.Heading());
        await Phone.BaconReader.ReplyScreen.Editor.WaitUntilCounterSettledAsync();

        // Then
        var heading = await Phone.BaconReader.ReplyScreen.Editor.ReadAsync();
        Asserting.That(heading)
            .ShowsTheText("# Hi")
            .ShowsTheCounter("4 / 10,000");

        // When
        await Phone.BaconReader.ReplyScreen.ClickSendAsync();
        await Reddit.WaitUntilAReplyToTheCommentIsSentAsync("Hello there");

        // Then
        var sent = Reddit.ReadRepliesToTheComment("Hello there");
        Asserting.That(sent).GotTheComment("# Hi");

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.SubmitPost());
        await Phone.BaconReader.SubmitPost.WaitUntilShownAsync();
        await Phone.BaconReader.SubmitPost.Editor.WaitUntilCounterSettledAsync();

        // Then
        var post = await Phone.BaconReader.SubmitPost.Editor.ReadAsync();
        Asserting.That(post).ShowsTheCounter("0 / 40,000");

        // When
        await Phone.BaconReader.SubmitPost.Editor.TypeAsync("Hello");
        await Phone.BaconReader.SubmitPost.TypeSubredditAsync("strict");
        await Reddit.WaitUntilThePostRequirementsOfTheSubredditAreServedAsync("strict");
        await Phone.BaconReader.SubmitPost.Editor.WaitUntilCounterSettledAsync();

        // Then
        var strict = await Phone.BaconReader.SubmitPost.Editor.ReadAsync();
        Asserting.That(strict).ShowsTheCounter("5 / 100 (min. 10)");

        // When
        await Phone.BaconReader.SubmitPost.TypeSubredditAsync("linksonly");
        await Reddit.WaitUntilThePostRequirementsOfTheSubredditAreServedAsync("linksonly");
        await Phone.BaconReader.SubmitPost.Editor.WaitUntilCounterSettledAsync();

        // Then
        var linksOnly = await Phone.BaconReader.SubmitPost.Editor.ReadAsync();
        Asserting.That(linksOnly).ShowsTheCounter("No text in r/linksonly");
    }
}
