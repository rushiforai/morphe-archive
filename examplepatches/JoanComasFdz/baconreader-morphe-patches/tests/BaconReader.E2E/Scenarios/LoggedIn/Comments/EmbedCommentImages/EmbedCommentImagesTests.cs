// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.FakeReddit.World;
using BaconReader.E2E.Infrastructure.Phone;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Comments;

/// <summary>
/// "Embed comment images": BaconReader shows the images, GIFs and videos of comments and post texts under the text, and
/// plays the videos in place. A tap switches an image between full width and 200×200, a double tap opens it in full
/// screen, a long press saves it to Downloads/BaconReader. An Imgur album shows one image at a time, swiped sideways, with
/// its place in the album over it. A bare YouTube link shows its video's channel and title, from YouTube's oEmbed, and,
/// with "Show YouTube thumbnails" on, the video's thumbnail drawn in the text under it. Left out: a playlist, whose
/// thumbnail the patch takes from oEmbed's answer only at an https address, which the fake's plain HTTP isn't. A bare X
/// or Bluesky link shows the post in its place: its author, @handle and date, its text, and its first photo or video
/// still, drawn in the text. An emote is drawn in the text too, whatever "Show images" says: Reddit sends one placeholder
/// for every emote, so a Snoomoji's GIF comes from its name and a subreddit's emote shows the placeholder.
/// </summary>
public sealed class EmbedCommentImagesTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Embed comment images shows the media of comments and post texts and follows its settings
          Given Reddit has a post "Weekly thread" in r/e2e
          And the post "Weekly thread" has a comment "Here is an image" with an image
          And the post "Weekly thread" has a comment "Love it" with the Snoomoji "grin"
          And the post "Weekly thread" has a comment "Stonks" with an emote of r/e2e
          And Reddit has a post "Media thread" in r/e2e
          And the post "Media thread" has a comment "Another image" with an image
          And the post "Media thread" has a comment "Here is a GIF" with a GIF
          And the post "Media thread" has a comment "Here is an image link" with a link to an image
          And the post "Media thread" has a comment by u/e2e_snapper with only an image
          And the post "Media thread" has a comment by u/e2e_captioner with an image and then the text "Look above"
          And the comment by u/e2e_captioner has a reply "Nice photo"
          And the post "Media thread" has a comment by u/e2e_gifster with only a GIF
          And the post "Media thread" has a comment "Two pictures" with 2 different images
          And the post "Media thread" has a comment "Mine and a link" with an image and a link to another image
          And the post "Media thread" has a comment "Here is a video" with a video
          And the post "Media thread" has a comment "Here is a video link" with a link to a video
          And the post "Media thread" has a comment "Just text"
          And Imgur has an album "Trip" of 3 images
          And Imgur has an album "Single" of 1 image
          And the post "Media thread" has a comment "Here is an album" with a link to the Imgur album "Trip"
          And the post "Media thread" has a comment "One picture" with a link to the Imgur album "Single"
          And Reddit has a post "A picture in text" in r/e2e with the text "Look at this" and an image
          And Reddit has a post "A picture first" in r/e2e with an image and then the text "Above is my photo"
          And YouTube has a video "Cooking pasta at home" on the channel "@e2ekitchen"
          And YouTube has a Short "Short clip" on the channel "@e2ekitchen"
          And YouTube has removed its video "Gone video"
          And Reddit has a post "YouTube thread" in r/e2e
          And the post "YouTube thread" has a comment "Bare link" with a bare link to the YouTube video "Cooking pasta at home"
          And the post "YouTube thread" has a comment "From a minute in" with a bare short link to the YouTube video "Cooking pasta at home" at 83 seconds
          And the post "YouTube thread" has a comment "A Short" with a bare link to the YouTube Short "Short clip"
          And the post "YouTube thread" has a comment "Written link" with the link "my video" to the YouTube video "Cooking pasta at home"
          And the post "YouTube thread" has a comment "Channel link" with a bare link to the YouTube channel "@e2ekitchen"
          And the post "YouTube thread" has a comment "Removed link" with a bare link to the YouTube video "Gone video"
          And X has a post by "E2E Writer" @e2ewriter saying "Just setting up my fake account"
          And X has a post by "E2E Writer" @e2ewriter saying "A photo from the beach" with a photo
          And X has a post by "E2E Writer" @e2ewriter saying "A clip of the match" with a video
          And X has a long post by "E2E Writer" @e2ewriter starting "This is a very long post"
          And Reddit has a post "X thread" in r/e2e
          And the post "X thread" has a comment "Plain X post" with a bare link to the X post "Just setting up my fake account"
          And the post "X thread" has a comment "X photo" with a bare link to the X post "A photo from the beach"
          And the post "X thread" has a comment "X video" with a bare link to the X post "A clip of the match"
          And the post "X thread" has a comment "Long X post" with a bare link to the X post "This is a very long post"
          And the post "X thread" has a comment "Missing X post" with a bare link to an X post X doesn't have
          And the post "X thread" has a comment "Written X link" with the link "their post" to the X post "Just setting up my fake account"
          And Bluesky has a post by "E2E Poster" @e2eposter.bsky.social saying "Hello from Bluesky"
          And Bluesky has a post by "E2E Poster" @e2eposter.bsky.social saying "Photos of the park" with photos
          And Bluesky has a post by "E2E Poster" @e2eposter.bsky.social saying "Watch this" with a video
          And Bluesky has a post by "E2E Poster" @e2eposter.bsky.social saying "Read this page" with a link card
          And Bluesky has a post by "E2E Poster" @e2eposter.bsky.social saying "A gallery of photos" with a gallery
          And Reddit has a post "Bluesky thread" in r/e2e
          And the post "Bluesky thread" has a comment "Plain Bluesky post" with a bare link to the Bluesky post "Hello from Bluesky"
          And the post "Bluesky thread" has a comment "Bluesky photos" with a bare link to the Bluesky post "Photos of the park"
          And the post "Bluesky thread" has a comment "Bluesky video" with a bare link to the Bluesky post "Watch this"
          And the post "Bluesky thread" has a comment "Bluesky link card" with a bare link to the Bluesky post "Read this page"
          And the post "Bluesky thread" has a comment "Bluesky gallery" with a bare link to the Bluesky post "A gallery of photos"
          And the post "Bluesky thread" has a comment "Missing Bluesky post" with a bare link to a Bluesky post Bluesky doesn't have
          And BaconReader is patched with every patch
          And the test account is logged in
          And BaconReader is open
          When I tap the post "Weekly thread"
          Then the comment "Here is an image" shows 1 image
          And the comment "Here is an image" shows no picture twice
          # "Full width by default" is off: an image starts at up to 200×200.
          And the image of the comment "Here is an image" fits in 200×200
          When I tap the image of the comment "Here is an image"
          Then the image of the comment "Here is an image" fills the comment's width
          When I tap the image of the comment "Here is an image"
          Then the image of the comment "Here is an image" fits in 200×200
          When I double tap the image of the comment "Here is an image"
          Then the image fills the screen
          When I tap Back
          And I long press the image of the comment "Here is an image"
          # BaconReader shows "Downloading image…" for a moment, but UiAutomator2 doesn't see that toast: the test can't check it.
          # Not on the screen: the test reads the phone's files.
          Then Downloads/BaconReader holds the image of the comment "Here is an image"
          When I scroll to the comment "Love it"
          # An emote is drawn in the comment's text, on its line.
          Then the comment "Love it" shows 1 emote after its text
          # Reddit sends the same placeholder, "dizzy_face", for every emote: the patch finds a Snoomoji's GIF from its name.
          # On the setup page: the fake Reddit records what BaconReader asked for.
          And Reddit served the Snoomoji "grin"
          And the comment "Stonks" shows 1 emote after its text
          # A subreddit's emote can't be found from its name: it shows Reddit's placeholder.
          And Reddit served the Snoomoji "dizzy_face"
          When I go back to the posts
          And I tap the post "Media thread"
          And I scroll to the comment "Here is a GIF"
          Then the comment "Here is a GIF" shows 1 GIF
          When I scroll to the comment "Here is an image link"
          # The image takes the bare link's place: the link is dropped from the text.
          Then the comment "Here is an image link" shows 1 image
          And the comment "Here is an image link" shows no link
          When I scroll to the comment by u/e2e_snapper
          # Reddit sends an image uploaded in a comment twice over: a bare preview.redd.it link in its text, and an entry in its media_metadata. It shows once.
          Then the comment by u/e2e_snapper shows 1 image
          And the comment by u/e2e_snapper shows no picture twice
          When I scroll to the comment by u/e2e_captioner
          Then the comment by u/e2e_captioner shows 1 image
          And the comment by u/e2e_captioner shows "Look above" under its image
          When I tap "Look above" in the comment by u/e2e_captioner
          # A tap on the text after the image collapses the comment, as a tap anywhere on it does.
          Then the comment by u/e2e_captioner shows "1 hidden comment"
          When I tap "Look above" in the comment by u/e2e_captioner
          Then the comment by u/e2e_captioner hides no comment
          When I scroll to the comment by u/e2e_gifster
          Then the comment by u/e2e_gifster shows 1 GIF
          When I scroll to the comment "Two pictures"
          Then the comment "Two pictures" shows 2 images
          And the comment "Two pictures" shows no picture twice
          When I scroll to the comment "Mine and a link"
          # Both show, once each: the image uploaded in the comment and the image the link points to.
          Then the comment "Mine and a link" shows 2 images
          And the comment "Mine and a link" shows no picture twice
          When I scroll to the comment "Here is a video"
          Then the comment "Here is a video" shows a video
          # "Full width by default" is off: the video's preview starts at up to 200×200.
          And the video of the comment "Here is a video" fits in 200×200
          When I tap the video of the comment "Here is a video"
          # A video that has ended shows its player's controls, with its position at its length.
          Then the video of the comment "Here is a video" played to "00:10" of "00:10"
          # Once it plays, the video grows to the comment's width.
          And the video of the comment "Here is a video" fills the comment's width
          When I tap "Shrink video" on the video of the comment "Here is a video"
          Then the video of the comment "Here is a video" fits in 200×200
          When I tap "Enlarge video" on the video of the comment "Here is a video"
          Then the video of the comment "Here is a video" fills the comment's width
          When I tap "Full screen" on the video of the comment "Here is a video"
          Then the video fills the screen
          # The video is wider than high: the full screen turns the phone sideways.
          And the screen is turned sideways
          When I tap "Exit full screen"
          Then the video of the comment "Here is a video" fills the comment's width
          When I tap "Full screen" on the video of the comment "Here is a video"
          And I tap Back
          Then the video of the comment "Here is a video" fills the comment's width
          When I scroll to the comment "Here is a video link"
          And I tap the video of the comment "Here is a video link"
          Then the video of the comment "Here is a video link" played to "00:10" of "00:10"
          When I scroll to the comment "Just text"
          Then the comment "Just text" shows no image
          When I scroll to the comment "Here is an album"
          # An Imgur album shows one image at a time, with its place in the album over it.
          Then the comment "Here is an album" shows 1 image
          And the comment "Here is an album" shows "1 / 3"
          When I swipe the image of the comment "Here is an album" to the left
          Then the comment "Here is an album" shows "2 / 3"
          When I scroll to the comment "One picture"
          Then the comment "One picture" shows 1 image
          And the comment "One picture" shows no counter
          When I go back to the posts
          And I tap the post "A picture in text"
          Then the post's text "Look at this" shows 1 image
          And the image starts where the post's text starts
          When I go back to the posts
          And I tap the post "A picture first"
          Then the post's text "Above is my photo" shows 1 image
          And the post's text "Above is my photo" shows no picture twice
          # The image takes its link's place: the text after the link shows under it.
          And the post's text "Above is my photo" shows under its image
          # "Full width by default" is off, but an image in a post starts at full width.
          And the image of the post's text fills the text's width
          When I tap "Slide Show View" in the toolbar
          # The slide show shows a text post's text in a card, with its media in the same places.
          Then the post's text "Above is my photo" shows 1 image
          And the post's text "Above is my photo" shows under its image
          When I tap "Detail View" in the toolbar
          And I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          Then the settings show "Show images", "Full width by default", "Long press to download", "Load images only on Wi-Fi", "Load images only when tapped" and "Play videos in comments", in this order
          When I tap "Show images"
          And I go back to the posts
          And I tap the post "Weekly thread"
          Then the comment "Here is an image" shows no image
          # Emotes are part of the text: they show whatever "Show images" says.
          And the comment "Love it" shows 1 emote after its text
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I tap "Show images"
          And I go back to the posts
          And I tap the post "Weekly thread"
          Then the comment "Here is an image" shows 1 image
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I tap "Full width by default"
          And I go back to the posts
          And I tap the post "Media thread"
          # Not "Here is an image": the patch keeps the size an image's taps chose over the default.
          Then the image of the comment "Another image" fills the comment's width
          # "Full width by default" stays on: the next rounds don't depend on an image's size.
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I tap "Long press to download"
          And I go back to the posts
          And I tap the post "Weekly thread"
          And I long press the image of the comment "Here is an image"
          # Not on the screen: the test reads the phone's files. Only the image the first long press saved is there.
          Then Downloads/BaconReader holds the image of the comment "Here is an image"
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I tap "Load images only when tapped"
          And I go back to the posts
          And I tap the post "Weekly thread"
          # The phone is on Wi-Fi: with "Load images only when tapped", an image waits for a tap there too.
          Then the comment "Here is an image" shows "Tap to load image"
          And the comment "Here is an image" shows no image
          # Emotes are part of the text: they load without a tap.
          And the comment "Love it" shows 1 emote after its text
          When I tap "Tap to load image" in the comment "Here is an image"
          Then the comment "Here is an image" shows 1 image
          When I go back to the posts
          And I tap the post "Media thread"
          And I scroll to the comment "Here is a video"
          # A video's first frame waits for the tap too: it shows its play button.
          Then the comment "Here is a video" shows a video
          When I tap the video of the comment "Here is a video"
          Then the video of the comment "Here is a video" played to "00:10" of "00:10"
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          # Off again: the next rounds load images without a tap.
          And I tap "Load images only when tapped"
          And I tap "Play videos in comments"
          And I go back to the posts
          And I tap the post "Media thread"
          Then the comment "Here is a video" shows no video
          When I go back to the posts
          And I tap the post "YouTube thread"
          Then the comment "Bare link" shows "@e2ekitchen - Cooking pasta at home"
          And the comment "From a minute in" shows "@e2ekitchen - Cooking pasta at home (from 1:23)"
          And the comment "A Short" shows "@e2ekitchen - Short clip [Short]"
          # A link written with its own words keeps them.
          And the comment "Written link" shows "my video"
          # YouTube has no title for a channel: the patch shows its @handle.
          And the comment "Channel link" shows "@e2ekitchen [Channel]"
          # YouTube has no title for a removed video: the link stays as Reddit shows it.
          And the comment "Removed link" shows the address of the YouTube video "Gone video"
          # "Show YouTube thumbnails" is off by default.
          And the comment "Bare link" shows no thumbnail
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          Then the settings show "Show YouTube video titles", "Show YouTube thumbnails", "Show X posts" and "Show Bluesky posts", in this order
          When I tap "Show YouTube thumbnails"
          And I go back to the posts
          And I tap the post "YouTube thread"
          # The thumbnail is drawn in the comment's text, on its own line under the link.
          Then the comment "Bare link" shows a thumbnail under its link
          # On the setup page: the fake YouTube records what BaconReader asked for.
          And YouTube served the thumbnail of "Cooking pasta at home"
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I tap "Show YouTube video titles"
          And I go back to the posts
          And I tap the post "YouTube thread"
          Then the comment "Bare link" shows the address of the YouTube video "Cooking pasta at home"
          When I go back to the posts
          And I tap the post "X thread"
          Then the comment "Plain X post" shows the post "E2E Writer @e2ewriter · Oct 2, 2025" saying "Just setting up my fake account"
          # The photo is drawn in the comment's text, on its own line under the post.
          And the comment "X photo" shows the post "E2E Writer @e2ewriter · Oct 2, 2025" saying "A photo from the beach", with a picture
          # On the setup page: the fake X records what BaconReader asked for. The patch asks X for the small photo.
          And X served the small photo of "A photo from the beach"
          When I scroll to the comment "X video"
          # A video shows its still, with a play badge.
          Then the comment "X video" shows the post "E2E Writer @e2ewriter · Oct 2, 2025" saying "A clip of the match", with a picture
          When I scroll to the comment "Long X post"
          # X's embed service cuts a long post: the patch ends it with "…".
          Then the comment "Long X post" shows the post "E2E Writer @e2ewriter · Oct 2, 2025", its text ending with "…"
          When I scroll to the comment "Missing X post"
          # X has no such post: the link stays as Reddit shows it.
          Then the comment "Missing X post" shows its link's address
          And the comment "Written X link" shows "their post"
          When I go back to the posts
          And I tap the post "Bluesky thread"
          Then the comment "Plain Bluesky post" shows the post "E2E Poster @e2eposter.bsky.social · Oct 2, 2025" saying "Hello from Bluesky"
          And the comment "Bluesky photos" shows the post "E2E Poster @e2eposter.bsky.social · Oct 2, 2025" saying "Photos of the park", with a picture
          When I scroll to the comment "Bluesky video"
          Then the comment "Bluesky video" shows the post "E2E Poster @e2eposter.bsky.social · Oct 2, 2025" saying "Watch this", with a picture
          When I scroll to the comment "Bluesky link card"
          Then the comment "Bluesky link card" shows the post "E2E Poster @e2eposter.bsky.social · Oct 2, 2025" saying "Read this page", with a picture
          When I scroll to the comment "Bluesky gallery"
          Then the comment "Bluesky gallery" shows the post "E2E Poster @e2eposter.bsky.social · Oct 2, 2025" saying "A gallery of photos", with a picture
          When I scroll to the comment "Missing Bluesky post"
          Then the comment "Missing Bluesky post" shows its link's address
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I tap "Show X posts"
          And I tap "Show Bluesky posts"
          And I go back to the posts
          And I tap the post "X thread"
          Then the comment "Plain X post" shows its link's address
          When I go back to the posts
          And I tap the post "Bluesky thread"
          Then the comment "Plain Bluesky post" shows its link's address
        """)]
    public async Task EmbedCommentImagesShowsTheMediaOfCommentsAndPostTextsAndFollowsItsSettings(Screen screen)
    {
        // Given
        Reddit.HasAPost("Weekly thread", "e2e");
        Reddit.ThePost("Weekly thread").HasACommentWithAnImage("Here is an image");
        Reddit.ThePost("Weekly thread").HasACommentWithTheSnoomoji("Love it", "grin");
        Reddit.ThePost("Weekly thread").HasACommentWithAnEmoteOfItsSubreddit("Stonks");
        Reddit.HasAPost("Media thread", "e2e");
        Reddit.ThePost("Media thread").HasACommentWithAnImage("Another image");
        Reddit.ThePost("Media thread").HasACommentWithAGif("Here is a GIF");
        Reddit.ThePost("Media thread").HasACommentWithALinkToAnImage("Here is an image link");
        Reddit.ThePost("Media thread").HasACommentByWithOnlyAnImage("e2e_snapper");
        Reddit.ThePost("Media thread").HasACommentByWithAnImageAndThenTheText("e2e_captioner", "Look above");
        Reddit.ThePost("Media thread").TheCommentBy("e2e_captioner").HasAReply("Nice photo");
        Reddit.ThePost("Media thread").HasACommentByWithOnlyAGif("e2e_gifster");
        Reddit.ThePost("Media thread").HasACommentWithDifferentImages("Two pictures", 2);
        Reddit.ThePost("Media thread").HasACommentWithAnImageAndALinkToAnotherImage("Mine and a link");
        Reddit.ThePost("Media thread").HasACommentWithAVideo("Here is a video");
        Reddit.ThePost("Media thread").HasACommentWithALinkToAVideo("Here is a video link");
        Reddit.ThePost("Media thread").HasAComment("Just text");
        Reddit.ImgurHasAnAlbumOf("Trip", 3);
        Reddit.ImgurHasAnAlbumOf("Single", 1);
        Reddit.ThePost("Media thread").HasACommentWithALinkToTheImgurAlbum("Here is an album", "Trip");
        Reddit.ThePost("Media thread").HasACommentWithALinkToTheImgurAlbum("One picture", "Single");
        Reddit.HasAPostWithTheTextAndAnImage("A picture in text", "e2e", "Look at this");
        Reddit.HasAPostWithAnImageAndThenTheText("A picture first", "e2e", "Above is my photo");
        Reddit.YouTubeHasAVideo("Cooking pasta at home", "@e2ekitchen");
        Reddit.YouTubeHasAShort("Short clip", "@e2ekitchen");
        Reddit.YouTubeHasRemovedItsVideo("Gone video");
        Reddit.HasAPost("YouTube thread", "e2e");
        Reddit.ThePost("YouTube thread").HasACommentWithABareLinkToTheYouTubeVideo("Bare link", "Cooking pasta at home");
        Reddit.ThePost("YouTube thread").HasACommentWithABareShortLinkToTheYouTubeVideoAt("From a minute in", "Cooking pasta at home", 83);
        Reddit.ThePost("YouTube thread").HasACommentWithABareLinkToTheYouTubeShort("A Short", "Short clip");
        Reddit.ThePost("YouTube thread").HasACommentWithTheLinkToTheYouTubeVideo("Written link", "my video", "Cooking pasta at home");
        Reddit.ThePost("YouTube thread").HasACommentWithABareLinkToTheYouTubeChannel("Channel link", "@e2ekitchen");
        Reddit.ThePost("YouTube thread").HasACommentWithABareLinkToTheYouTubeVideo("Removed link", "Gone video");
        Reddit.XHasAPost("E2E Writer", "@e2ewriter", "Just setting up my fake account");
        Reddit.XHasAPost("E2E Writer", "@e2ewriter", "A photo from the beach", XMedia.Photo);
        Reddit.XHasAPost("E2E Writer", "@e2ewriter", "A clip of the match", XMedia.Video);
        Reddit.XHasALongPost("E2E Writer", "@e2ewriter", "This is a very long post");
        Reddit.HasAPost("X thread", "e2e");
        Reddit.ThePost("X thread").HasACommentWithABareLinkToTheXPost("Plain X post", "Just setting up my fake account");
        Reddit.ThePost("X thread").HasACommentWithABareLinkToTheXPost("X photo", "A photo from the beach");
        Reddit.ThePost("X thread").HasACommentWithABareLinkToTheXPost("X video", "A clip of the match");
        Reddit.ThePost("X thread").HasACommentWithABareLinkToTheXPost("Long X post", "This is a very long post");
        Reddit.ThePost("X thread").HasACommentWithABareLinkToAnXPostXDoesntHave("Missing X post");
        Reddit.ThePost("X thread").HasACommentWithTheLinkToTheXPost("Written X link", "their post", "Just setting up my fake account");
        Reddit.BlueskyHasAPost("E2E Poster", "@e2eposter.bsky.social", "Hello from Bluesky");
        Reddit.BlueskyHasAPost("E2E Poster", "@e2eposter.bsky.social", "Photos of the park", BlueskyEmbed.Images);
        Reddit.BlueskyHasAPost("E2E Poster", "@e2eposter.bsky.social", "Watch this", BlueskyEmbed.Video);
        Reddit.BlueskyHasAPost("E2E Poster", "@e2eposter.bsky.social", "Read this page", BlueskyEmbed.External);
        Reddit.BlueskyHasAPost("E2E Poster", "@e2eposter.bsky.social", "A gallery of photos", BlueskyEmbed.Gallery);
        Reddit.HasAPost("Bluesky thread", "e2e");
        Reddit.ThePost("Bluesky thread").HasACommentWithABareLinkToTheBlueskyPost("Plain Bluesky post", "Hello from Bluesky");
        Reddit.ThePost("Bluesky thread").HasACommentWithABareLinkToTheBlueskyPost("Bluesky photos", "Photos of the park");
        Reddit.ThePost("Bluesky thread").HasACommentWithABareLinkToTheBlueskyPost("Bluesky video", "Watch this");
        Reddit.ThePost("Bluesky thread").HasACommentWithABareLinkToTheBlueskyPost("Bluesky link card", "Read this page");
        Reddit.ThePost("Bluesky thread").HasACommentWithABareLinkToTheBlueskyPost("Bluesky gallery", "A gallery of photos");
        Reddit.ThePost("Bluesky thread").HasACommentWithABareLinkToABlueskyPostBlueskyDoesntHave("Missing Bluesky post");
        Reddit.TheTestAccountIsLoggedIn();
        await Phone.BaconReader.OpenAsync();

        // When
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Weekly thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Here is an image");

        // Then
        // "Full width by default" is off: an image starts at up to 200×200.
        var image = await Phone.BaconReader.Detail.Comments.ReadAsync("Here is an image");
        var imagePictures = await Phone.BaconReader.Detail.Comments.ReadPicturesAsync("Here is an image");
        var small = await Phone.BaconReader.Detail.Comments.ReadLayoutAsync("Here is an image");
        Asserting.That(image).ShowsImages(1);
        Asserting.That(imagePictures).ShowsNoPictureTwice();
        Asserting.That(small).TheImageFitsIn200By200();

        // When
        await Phone.BaconReader.Detail.Comments.ClickImageAsync("Here is an image");
        await Phone.BaconReader.Detail.Comments.WaitUntilImageResizedAsync("Here is an image");

        // Then
        var fullWidth = await Phone.BaconReader.Detail.Comments.ReadLayoutAsync("Here is an image");
        Asserting.That(fullWidth).TheImageFillsTheCommentsWidth();

        // When
        await Phone.BaconReader.Detail.Comments.ClickImageAsync("Here is an image");
        await Phone.BaconReader.Detail.Comments.WaitUntilImageResizedAsync("Here is an image");

        // Then
        var smallAgain = await Phone.BaconReader.Detail.Comments.ReadLayoutAsync("Here is an image");
        Asserting.That(smallAgain).TheImageFitsIn200By200();

        // When
        await Phone.BaconReader.Detail.Comments.DoubleClickImageAsync("Here is an image");
        await Phone.BaconReader.ImageViewer.WaitUntilShownAsync();

        // Then
        var viewer = await Phone.BaconReader.ImageViewer.ReadLayoutAsync();
        Asserting.That(viewer).FillsTheScreen();

        // When
        await Phone.BaconReader.ImageViewer.ClickBackAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Here is an image");
        await Phone.BaconReader.Detail.Comments.LongClickImageAsync("Here is an image");
        await Phone.Downloads.WaitUntilImageSavedAsync();

        // Then
        // BaconReader shows "Downloading image…" for a moment, but UiAutomator2 doesn't see that toast: the test can't check it.
        // Not on the screen: the test reads the phone's files.
        var downloads = await Phone.Downloads.ReadAsync();
        var commentsImage = Reddit.ReadTheImageOfTheComment("Here is an image");
        Asserting.That(downloads).HoldsTheImage(commentsImage);

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Love it");
        await Reddit.WaitUntilTheSnoomojiIsServedAsync("grin");
        await Reddit.WaitUntilTheSnoomojiIsServedAsync("dizzy_face");

        // Then
        // Reddit sends the same placeholder, "dizzy_face", for every emote: the patch finds a Snoomoji's GIF from its name.
        // On the setup page: the fake Reddit records what BaconReader asked for.
        var loveIt = await Phone.BaconReader.Detail.Comments.ReadAsync("Love it");
        var grin = Reddit.ReadRequestsForTheSnoomoji("grin");
        var stonks = await Phone.BaconReader.Detail.Comments.ReadAsync("Stonks");
        var placeholder = Reddit.ReadRequestsForTheSnoomoji("dizzy_face");
        Asserting.That(loveIt).ShowsEmotesAfterItsText("Love it", 1);
        Asserting.That(grin).WasServed();
        Asserting.That(stonks).ShowsEmotesAfterItsText("Stonks", 1);
        // A subreddit's emote can't be found from its name: it shows Reddit's placeholder.
        Asserting.That(placeholder).WasServed();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Media thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Here is a GIF");
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Here is a GIF");

        // Then
        var gif = await Phone.BaconReader.Detail.Comments.ReadAsync("Here is a GIF");
        Asserting.That(gif).ShowsGifs(1);

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Here is an image link");
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Here is an image link");

        // Then
        // The image takes the bare link's place: the link is dropped from the text.
        var imageLink = await Phone.BaconReader.Detail.Comments.ReadAsync("Here is an image link");
        Asserting.That(imageLink)
            .ShowsImages(1)
            .ShowsNoLink();

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentByAsync("e2e_snapper");
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownByAsync("e2e_snapper");

        // Then
        // Reddit sends an image uploaded in a comment twice over: a bare preview.redd.it link in its text, and an entry in its media_metadata. It shows once.
        var onlyAnImage = await Phone.BaconReader.Detail.Comments.ReadByAsync("e2e_snapper");
        var onlyAnImagePictures = await Phone.BaconReader.Detail.Comments.ReadPicturesByAsync("e2e_snapper");
        Asserting.That(onlyAnImage).ShowsImages(1);
        Asserting.That(onlyAnImagePictures).ShowsNoPictureTwice();

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentByAsync("e2e_captioner");
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownByAsync("e2e_captioner");

        // Then
        var imageFirst = await Phone.BaconReader.Detail.Comments.ReadByAsync("e2e_captioner");
        Asserting.That(imageFirst)
            .ShowsImages(1)
            .ShowsUnderItsMedia("Look above");

        // When
        await Phone.BaconReader.Detail.Comments.ClickTextUnderMediaByAsync("e2e_captioner", "Look above");
        await Phone.BaconReader.Detail.Comments.WaitUntilCollapsedByAsync("e2e_captioner");

        // Then
        // A tap on the text after the image collapses the comment, as a tap anywhere on it does.
        var captionerCollapsed = await Phone.BaconReader.Detail.Comments.ReadCollapsedByAsync("e2e_captioner");
        Asserting.That(captionerCollapsed).ShowsHidden("1 hidden comment");

        // When
        await Phone.BaconReader.Detail.Comments.ClickTextUnderMediaByAsync("e2e_captioner", "Look above");
        await Phone.BaconReader.Detail.Comments.WaitUntilExpandedByAsync("e2e_captioner");

        // Then
        var captionerExpanded = await Phone.BaconReader.Detail.Comments.ReadCollapsedByAsync("e2e_captioner");
        Asserting.That(captionerExpanded).HidesNoComment();

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentByAsync("e2e_gifster");
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownByAsync("e2e_gifster");

        // Then
        var onlyAGif = await Phone.BaconReader.Detail.Comments.ReadByAsync("e2e_gifster");
        Asserting.That(onlyAGif).ShowsGifs(1);

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Two pictures");
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Two pictures");

        // Then
        var twoPictures = await Phone.BaconReader.Detail.Comments.ReadAsync("Two pictures");
        var twoPicturesShown = await Phone.BaconReader.Detail.Comments.ReadPicturesAsync("Two pictures");
        Asserting.That(twoPictures).ShowsImages(2);
        Asserting.That(twoPicturesShown).ShowsNoPictureTwice();

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Mine and a link");
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Mine and a link");

        // Then
        // Both show, once each: the image uploaded in the comment and the image the link points to.
        var mineAndALink = await Phone.BaconReader.Detail.Comments.ReadAsync("Mine and a link");
        var mineAndALinkPictures = await Phone.BaconReader.Detail.Comments.ReadPicturesAsync("Mine and a link");
        Asserting.That(mineAndALink).ShowsImages(2);
        Asserting.That(mineAndALinkPictures).ShowsNoPictureTwice();

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Here is a video");
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Here is a video");

        // Then
        var video = await Phone.BaconReader.Detail.Comments.ReadAsync("Here is a video");
        // "Full width by default" is off: the video's preview starts at up to 200×200.
        var preview = await Phone.BaconReader.Detail.Comments.ReadVideoLayoutAsync("Here is a video");
        Asserting.That(video).ShowsAVideo();
        Asserting.That(preview).TheVideoFitsIn200By200();

        // When
        await Phone.BaconReader.Detail.Comments.ClickVideoAsync("Here is a video");
        await Phone.BaconReader.Detail.Comments.WaitUntilVideoEndedAsync("Here is a video");

        // Then
        // A video that has ended shows its player's controls, with its position at its length.
        var played = await Phone.BaconReader.Detail.Comments.ReadVideoAsync("Here is a video");
        // Once it plays, the video grows to the comment's width.
        var playing = await Phone.BaconReader.Detail.Comments.ReadVideoLayoutAsync("Here is a video");
        Asserting.That(played).PlayedTo("00:10", "00:10");
        Asserting.That(playing).TheVideoFillsTheCommentsWidth();

        // When
        await Phone.BaconReader.Detail.Comments.ClickVideoButtonAsync("Here is a video", new VideoButton.ShrinkVideo());
        await Phone.BaconReader.Detail.Comments.WaitUntilVideoResizedAsync("Here is a video");

        // Then
        var shrunk = await Phone.BaconReader.Detail.Comments.ReadVideoLayoutAsync("Here is a video");
        Asserting.That(shrunk).TheVideoFitsIn200By200();

        // When
        await Phone.BaconReader.Detail.Comments.ClickVideoButtonAsync("Here is a video", new VideoButton.EnlargeVideo());
        await Phone.BaconReader.Detail.Comments.WaitUntilVideoResizedAsync("Here is a video");

        // Then
        var enlarged = await Phone.BaconReader.Detail.Comments.ReadVideoLayoutAsync("Here is a video");
        Asserting.That(enlarged).TheVideoFillsTheCommentsWidth();

        // When
        await Phone.BaconReader.Detail.Comments.ClickVideoButtonAsync("Here is a video", new VideoButton.FullScreen());
        await Phone.BaconReader.VideoFullScreen.WaitUntilShownAsync();

        // Then
        var fullScreen = await Phone.BaconReader.VideoFullScreen.ReadLayoutAsync();
        Asserting.That(fullScreen).FillsTheScreen();
        // The video is wider than high: the full screen turns the phone sideways.
        Asserting.That(fullScreen).IsSideways();

        // When
        await Phone.BaconReader.VideoFullScreen.ClickAsync(new VideoButton.ExitFullScreen());
        await Phone.BaconReader.VideoFullScreen.WaitUntilClosedAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilVideoSettledAsync("Here is a video");

        // Then
        var afterExit = await Phone.BaconReader.Detail.Comments.ReadVideoLayoutAsync("Here is a video");
        Asserting.That(afterExit).TheVideoFillsTheCommentsWidth();

        // When
        await Phone.BaconReader.Detail.Comments.ClickVideoButtonAsync("Here is a video", new VideoButton.FullScreen());
        await Phone.BaconReader.VideoFullScreen.WaitUntilShownAsync();
        await Phone.BaconReader.VideoFullScreen.ClickBackAsync();
        await Phone.BaconReader.VideoFullScreen.WaitUntilClosedAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilVideoSettledAsync("Here is a video");

        // Then
        var afterBack = await Phone.BaconReader.Detail.Comments.ReadVideoLayoutAsync("Here is a video");
        Asserting.That(afterBack).TheVideoFillsTheCommentsWidth();

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Here is a video link");
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Here is a video link");
        await Phone.BaconReader.Detail.Comments.ClickVideoAsync("Here is a video link");
        await Phone.BaconReader.Detail.Comments.WaitUntilVideoEndedAsync("Here is a video link");

        // Then
        var linkPlayed = await Phone.BaconReader.Detail.Comments.ReadVideoAsync("Here is a video link");
        Asserting.That(linkPlayed).PlayedTo("00:10", "00:10");

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Just text");

        // Then
        var justText = await Phone.BaconReader.Detail.Comments.ReadAsync("Just text");
        Asserting.That(justText).ShowsNoImage();

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Here is an album");
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Here is an album");

        // Then
        // An Imgur album shows one image at a time, with its place in the album over it.
        var album = await Phone.BaconReader.Detail.Comments.ReadAsync("Here is an album");
        Asserting.That(album)
            .ShowsImages(1)
            .ShowsTheAlbumCounter("1 / 3");

        // When
        await Phone.BaconReader.Detail.Comments.SwipeAlbumAsync("Here is an album");
        await Phone.BaconReader.Detail.Comments.WaitUntilAlbumCounterShownAsync("Here is an album", "2 / 3");

        // Then
        var swiped = await Phone.BaconReader.Detail.Comments.ReadAsync("Here is an album");
        Asserting.That(swiped).ShowsTheAlbumCounter("2 / 3");

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("One picture");
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("One picture");

        // Then
        var onePicture = await Phone.BaconReader.Detail.Comments.ReadAsync("One picture");
        Asserting.That(onePicture)
            .ShowsImages(1)
            .ShowsNoAlbumCounter();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("A picture in text");
        await Phone.BaconReader.Detail.PostText.WaitUntilMediaShownAsync();

        // Then
        var postText = await Phone.BaconReader.Detail.PostText.ReadAsync();
        var postTextLayout = await Phone.BaconReader.Detail.PostText.ReadLayoutAsync();
        Asserting.That(postText).ShowsTheTextWithImages("Look at this", 1);
        Asserting.That(postTextLayout).TheImageStartsWhereTheTextStarts();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("A picture first");
        await Phone.BaconReader.Detail.PostText.WaitUntilMediaShownAsync();

        // Then
        var pictureFirst = await Phone.BaconReader.Detail.PostText.ReadAsync();
        var pictureFirstPictures = await Phone.BaconReader.Detail.PostText.ReadPicturesAsync();
        var pictureFirstLayout = await Phone.BaconReader.Detail.PostText.ReadLayoutAsync();
        Asserting.That(pictureFirst).ShowsTheTextWithImages("Above is my photo", 1);
        Asserting.That(pictureFirstPictures).ShowsNoPictureTwice();
        // The image takes its link's place: the text after the link shows under it.
        // "Full width by default" is off, but an image in a post starts at full width.
        Asserting.That(pictureFirstLayout)
            .ShowsUnderItsImage("Above is my photo")
            .TheImageFillsTheTextsWidth();

        // When
        await Phone.BaconReader.SlideShow.ClickSlideShowViewAsync();
        await Phone.BaconReader.SlideShow.WaitUntilSlideShowShownAsync();
        await Phone.BaconReader.Detail.PostText.WaitUntilMediaShownAsync();

        // Then
        // The slide show shows a text post's text in a card, with its media in the same places.
        var slideShowText = await Phone.BaconReader.Detail.PostText.ReadAsync();
        var slideShowLayout = await Phone.BaconReader.Detail.PostText.ReadLayoutAsync();
        Asserting.That(slideShowText).ShowsTheTextWithImages("Above is my photo", 1);
        Asserting.That(slideShowLayout).ShowsUnderItsImage("Above is my photo");

        // When
        await Phone.BaconReader.SlideShow.ClickDetailViewAsync();
        await Phone.BaconReader.SlideShow.WaitUntilDetailViewShownAsync();
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.ShowImages(), new PatchSetting.PlayVideosInComments());

        // Then
        var settings = await Phone.BaconReader.PatchesSettings.ReadAsync();
        Asserting.That(settings).ShowsTheSettings(
            new PatchSetting.ShowImages(),
            new PatchSetting.FullWidthByDefault(),
            new PatchSetting.LongPressToDownload(),
            new PatchSetting.LoadImagesOnlyOnWiFi(),
            new PatchSetting.LoadImagesOnlyWhenTapped(),
            new PatchSetting.PlayVideosInComments());

        // When
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.ShowImages());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Weekly thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();

        // Then
        var noImage = await Phone.BaconReader.Detail.Comments.ReadAsync("Here is an image");
        var emoteWithoutImages = await Phone.BaconReader.Detail.Comments.ReadAsync("Love it");
        Asserting.That(noImage).ShowsNoImage();
        // Emotes are part of the text: they show whatever "Show images" says.
        Asserting.That(emoteWithoutImages).ShowsEmotesAfterItsText("Love it", 1);

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.ShowImages());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Weekly thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Here is an image");

        // Then
        var imageAgain = await Phone.BaconReader.Detail.Comments.ReadAsync("Here is an image");
        Asserting.That(imageAgain).ShowsImages(1);

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.FullWidthByDefault());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Media thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Another image");

        // Then
        // Not "Here is an image": the patch keeps the size an image's taps chose over the default.
        var fullWidthByDefault = await Phone.BaconReader.Detail.Comments.ReadLayoutAsync("Another image");
        Asserting.That(fullWidthByDefault).TheImageFillsTheCommentsWidth();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.LongPressToDownload());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Weekly thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Here is an image");
        await Phone.BaconReader.Detail.Comments.LongClickImageAsync("Here is an image");
        await Phone.Downloads.WaitUntilNoImageSavedAsync();

        // Then
        // Not on the screen: the test reads the phone's files. Only the image the first long press saved is there.
        var downloadsAgain = await Phone.Downloads.ReadAsync();
        Asserting.That(downloadsAgain).HoldsTheImage(commentsImage);

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.LoadImagesOnlyWhenTapped());
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.LoadImagesOnlyWhenTapped());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Weekly thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaPromptShownAsync("Here is an image", new MediaPrompt.TapToLoadImage());

        // Then
        // The phone is on Wi-Fi: with "Load images only when tapped", an image waits for a tap there too.
        var waitingForATap = await Phone.BaconReader.Detail.Comments.ReadAsync("Here is an image");
        var emoteWithoutATap = await Phone.BaconReader.Detail.Comments.ReadAsync("Love it");
        Asserting.That(waitingForATap).ShowsTheMediaPrompt(new MediaPrompt.TapToLoadImage());
        Asserting.That(waitingForATap).ShowsNoImage();
        // Emotes are part of the text: they load without a tap.
        Asserting.That(emoteWithoutATap).ShowsEmotesAfterItsText("Love it", 1);

        // When
        await Phone.BaconReader.Detail.Comments.ClickMediaPromptAsync("Here is an image", new MediaPrompt.TapToLoadImage());
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Here is an image");

        // Then
        var loadedByATap = await Phone.BaconReader.Detail.Comments.ReadAsync("Here is an image");
        Asserting.That(loadedByATap).ShowsImages(1);

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Media thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Here is a video");
        await Phone.BaconReader.Detail.Comments.WaitUntilMediaShownAsync("Here is a video");

        // Then
        // A video's first frame waits for the tap too: it shows its play button.
        var videoWaitingForATap = await Phone.BaconReader.Detail.Comments.ReadAsync("Here is a video");
        Asserting.That(videoWaitingForATap).ShowsAVideo();

        // When
        await Phone.BaconReader.Detail.Comments.ClickVideoAsync("Here is a video");
        await Phone.BaconReader.Detail.Comments.WaitUntilVideoEndedAsync("Here is a video");

        // Then
        var playedAfterATap = await Phone.BaconReader.Detail.Comments.ReadVideoAsync("Here is a video");
        Asserting.That(playedAfterATap).PlayedTo("00:10", "00:10");

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        // Off again: the next rounds load images without a tap.
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.LoadImagesOnlyWhenTapped());
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.LoadImagesOnlyWhenTapped());
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.PlayVideosInComments());
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.PlayVideosInComments());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Media thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Here is a video");

        // Then
        var noVideo = await Phone.BaconReader.Detail.Comments.ReadAsync("Here is a video");
        Asserting.That(noVideo).ShowsNoVideo();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("YouTube thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilLinkShownAsync("Bare link", "@e2ekitchen - Cooking pasta at home");
        await Phone.BaconReader.Detail.Comments.WaitUntilLinkShownAsync("From a minute in", "@e2ekitchen - Cooking pasta at home (from 1:23)");
        await Phone.BaconReader.Detail.Comments.WaitUntilLinkShownAsync("A Short", "@e2ekitchen - Short clip [Short]");
        await Phone.BaconReader.Detail.Comments.WaitUntilLinkTitlesLoadedAsync("Removed link");

        // Then
        var bareLink = await Phone.BaconReader.Detail.Comments.ReadAsync("Bare link");
        var fromAMinuteIn = await Phone.BaconReader.Detail.Comments.ReadAsync("From a minute in");
        var aShort = await Phone.BaconReader.Detail.Comments.ReadAsync("A Short");
        // A link written with its own words keeps them.
        var writtenLink = await Phone.BaconReader.Detail.Comments.ReadAsync("Written link");
        // YouTube has no title for a channel: the patch shows its @handle.
        var channelLink = await Phone.BaconReader.Detail.Comments.ReadAsync("Channel link");
        // YouTube has no title for a removed video: the link stays as Reddit shows it.
        var removedLink = await Phone.BaconReader.Detail.Comments.ReadAsync("Removed link");
        var goneVideo = Reddit.ReadTheYouTubeVideo("Gone video");
        Asserting.That(bareLink).ShowsTheLink("@e2ekitchen - Cooking pasta at home");
        Asserting.That(fromAMinuteIn).ShowsTheLink("@e2ekitchen - Cooking pasta at home (from 1:23)");
        Asserting.That(aShort).ShowsTheLink("@e2ekitchen - Short clip [Short]");
        Asserting.That(writtenLink).ShowsTheLink("my video");
        Asserting.That(channelLink).ShowsTheLink("@e2ekitchen [Channel]");
        Asserting.That(removedLink).ShowsTheAddressOf(goneVideo);
        // "Show YouTube thumbnails" is off by default.
        Asserting.That(bareLink).ShowsNoThumbnail();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.ShowYouTubeVideoTitles(), new PatchSetting.ShowBlueskyPosts());

        // Then
        var linkSettings = await Phone.BaconReader.PatchesSettings.ReadAsync();
        Asserting.That(linkSettings).ShowsTheSettings(
            new PatchSetting.ShowYouTubeVideoTitles(),
            new PatchSetting.ShowYouTubeThumbnails(),
            new PatchSetting.ShowXPosts(),
            new PatchSetting.ShowBlueskyPosts());

        // When
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.ShowYouTubeThumbnails());
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.ShowYouTubeThumbnails());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("YouTube thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilThumbnailInTextShownAsync("Bare link");
        await Reddit.WaitUntilTheYouTubeThumbnailOfTheVideoIsServedAsync("Cooking pasta at home");

        // Then
        // The thumbnail is drawn in the comment's text, on its own line under the link.
        var withThumbnail = await Phone.BaconReader.Detail.Comments.ReadAsync("Bare link");
        // On the setup page: the fake YouTube records what BaconReader asked for.
        var thumbnail = Reddit.ReadRequestsForTheYouTubeThumbnailOf("Cooking pasta at home");
        Asserting.That(withThumbnail).ShowsAThumbnailUnderItsLink();
        Asserting.That(thumbnail).Served();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.ShowYouTubeVideoTitles());
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.ShowYouTubeVideoTitles());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("YouTube thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilLinkTitlesLoadedAsync("Bare link");

        // Then
        var titleOff = await Phone.BaconReader.Detail.Comments.ReadAsync("Bare link");
        var cookingVideo = Reddit.ReadTheYouTubeVideo("Cooking pasta at home");
        Asserting.That(titleOff).ShowsTheAddressOf(cookingVideo);

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("X thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilLinkShownAsync("Plain X post", "E2E Writer @e2ewriter · Oct 2, 2025");
        await Phone.BaconReader.Detail.Comments.WaitUntilThumbnailInTextShownAsync("X photo");
        await Reddit.WaitUntilThePhotoOfTheXPostIsServedAsync("A photo from the beach");

        // Then
        var plainXPost = await Phone.BaconReader.Detail.Comments.ReadAsync("Plain X post");
        // The photo is drawn in the comment's text, on its own line under the post.
        var xPhoto = await Phone.BaconReader.Detail.Comments.ReadAsync("X photo");
        // On the setup page: the fake X records what BaconReader asked for. The patch asks X for the small photo.
        var xPhotoRequests = Reddit.ReadRequestsForThePhotoOfTheXPost("A photo from the beach");
        Asserting.That(plainXPost).ShowsThePost("E2E Writer @e2ewriter · Oct 2, 2025", "Just setting up my fake account");
        Asserting.That(xPhoto).ShowsThePostWithAPicture("E2E Writer @e2ewriter · Oct 2, 2025", "A photo from the beach");
        Asserting.That(xPhotoRequests).ServedTheSmallPhoto();

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("X video");
        await Phone.BaconReader.Detail.Comments.WaitUntilThumbnailInTextShownAsync("X video");

        // Then
        // A video shows its still, with a play badge.
        var xVideo = await Phone.BaconReader.Detail.Comments.ReadAsync("X video");
        Asserting.That(xVideo).ShowsThePostWithAPicture("E2E Writer @e2ewriter · Oct 2, 2025", "A clip of the match");

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Long X post");
        await Phone.BaconReader.Detail.Comments.WaitUntilLinkShownAsync("Long X post", "E2E Writer @e2ewriter · Oct 2, 2025");

        // Then
        // X's embed service cuts a long post: the patch ends it with "…".
        var longXPost = await Phone.BaconReader.Detail.Comments.ReadAsync("Long X post");
        Asserting.That(longXPost).ShowsThePostEndingWith("E2E Writer @e2ewriter · Oct 2, 2025", "…");

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Missing X post");
        await Phone.BaconReader.Detail.Comments.WaitUntilLinkTitlesLoadedAsync("Missing X post");

        // Then
        // X has no such post: the link stays as Reddit shows it.
        var missingXPost = await Phone.BaconReader.Detail.Comments.ReadAsync("Missing X post");
        var missingXLink = Reddit.ReadTheLinkToTheMissingXPost();
        var writtenXLink = await Phone.BaconReader.Detail.Comments.ReadAsync("Written X link");
        Asserting.That(missingXPost).ShowsTheAddressOf(missingXLink);
        Asserting.That(writtenXLink).ShowsTheLink("their post");

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Bluesky thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilLinkShownAsync("Plain Bluesky post", "E2E Poster @e2eposter.bsky.social · Oct 2, 2025");
        await Phone.BaconReader.Detail.Comments.WaitUntilThumbnailInTextShownAsync("Bluesky photos");

        // Then
        var plainBlueskyPost = await Phone.BaconReader.Detail.Comments.ReadAsync("Plain Bluesky post");
        var blueskyPhotos = await Phone.BaconReader.Detail.Comments.ReadAsync("Bluesky photos");
        Asserting.That(plainBlueskyPost).ShowsThePost("E2E Poster @e2eposter.bsky.social · Oct 2, 2025", "Hello from Bluesky");
        Asserting.That(blueskyPhotos).ShowsThePostWithAPicture("E2E Poster @e2eposter.bsky.social · Oct 2, 2025", "Photos of the park");

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Bluesky video");
        await Phone.BaconReader.Detail.Comments.WaitUntilThumbnailInTextShownAsync("Bluesky video");

        // Then
        var blueskyVideo = await Phone.BaconReader.Detail.Comments.ReadAsync("Bluesky video");
        Asserting.That(blueskyVideo).ShowsThePostWithAPicture("E2E Poster @e2eposter.bsky.social · Oct 2, 2025", "Watch this");

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Bluesky link card");
        await Phone.BaconReader.Detail.Comments.WaitUntilThumbnailInTextShownAsync("Bluesky link card");

        // Then
        var blueskyLinkCard = await Phone.BaconReader.Detail.Comments.ReadAsync("Bluesky link card");
        Asserting.That(blueskyLinkCard).ShowsThePostWithAPicture("E2E Poster @e2eposter.bsky.social · Oct 2, 2025", "Read this page");

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Bluesky gallery");
        await Phone.BaconReader.Detail.Comments.WaitUntilThumbnailInTextShownAsync("Bluesky gallery");

        // Then
        var blueskyGallery = await Phone.BaconReader.Detail.Comments.ReadAsync("Bluesky gallery");
        Asserting.That(blueskyGallery).ShowsThePostWithAPicture("E2E Poster @e2eposter.bsky.social · Oct 2, 2025", "A gallery of photos");

        // When
        await Phone.BaconReader.Detail.Comments.ScrollToCommentAsync("Missing Bluesky post");
        await Phone.BaconReader.Detail.Comments.WaitUntilLinkTitlesLoadedAsync("Missing Bluesky post");

        // Then
        var missingBlueskyPost = await Phone.BaconReader.Detail.Comments.ReadAsync("Missing Bluesky post");
        var missingBlueskyLink = Reddit.ReadTheLinkToTheMissingBlueskyPost();
        Asserting.That(missingBlueskyPost).ShowsTheAddressOf(missingBlueskyLink);

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.ShowXPosts());
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.ShowXPosts());
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.ShowBlueskyPosts());
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.ShowBlueskyPosts());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("X thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilLinkTitlesLoadedAsync("Plain X post");

        // Then
        var xPostsOff = await Phone.BaconReader.Detail.Comments.ReadAsync("Plain X post");
        var plainXLink = Reddit.ReadTheLinkToTheXPost("Just setting up my fake account");
        Asserting.That(xPostsOff).ShowsTheAddressOf(plainXLink);

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Bluesky thread");
        await Phone.BaconReader.Detail.Comments.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilLinkTitlesLoadedAsync("Plain Bluesky post");

        // Then
        var blueskyPostsOff = await Phone.BaconReader.Detail.Comments.ReadAsync("Plain Bluesky post");
        var plainBlueskyLink = Reddit.ReadTheLinkToTheBlueskyPost("Hello from Bluesky");
        Asserting.That(blueskyPostsOff).ShowsTheAddressOf(plainBlueskyLink);
    }
}
