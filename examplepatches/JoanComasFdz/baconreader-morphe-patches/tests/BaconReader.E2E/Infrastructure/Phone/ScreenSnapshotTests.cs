// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Drawing;
using BaconReader.E2E.Infrastructure.Device;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>
/// <see cref="ScreenSnapshot"/> reads UiAutomator2's page source: a view tree whose views carry their id, text,
/// description, bounds and whether they show. The source here has the shape of a comments screen's, two comments with
/// an image each.
/// </summary>
public sealed class ScreenSnapshotTests
{
    private static readonly string Id = $"{E2EDevice.Package}:id/";

    private static readonly string Source = $"""
        <?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
        <hierarchy index="0" class="hierarchy" rotation="0" width="1080" height="2340">
          <android.widget.FrameLayout index="0" class="android.widget.FrameLayout" bounds="[0,0][1080,2340]" displayed="true" resource-id="">
            <android.widget.ListView index="0" class="android.widget.ListView" resource-id="{Id}listView" bounds="[0,300][1080,2200]" displayed="true">
              <android.widget.LinearLayout index="0" class="android.widget.LinearLayout" resource-id="{Id}commentBodyContainer" bounds="[26,771][1054,1224]" displayed="true">
                <android.widget.TextView index="0" class="android.widget.TextView" resource-id="{Id}commentBody" text="Another image" content-desc="" bounds="[26,771][1054,830]" displayed="true" />
                <android.widget.ImageView index="1" class="android.widget.ImageView" resource-id="{Id}baconreader_patches_comment_image" bounds="[26,840][526,1224]" displayed="true" />
              </android.widget.LinearLayout>
              <android.widget.LinearLayout index="1" class="android.widget.LinearLayout" resource-id="{Id}commentBodyContainer" bounds="[26,1325][1054,1778]" displayed="true">
                <android.widget.TextView index="0" class="android.widget.TextView" resource-id="{Id}commentBody" text="Here is a GIF" content-desc="spoiler" bounds="[26,1325][1054,1384]" displayed="true" />
                <android.widget.ImageView index="1" class="android.widget.ImageView" resource-id="{Id}baconreader_patches_comment_image" bounds="[26,1394][26,1394]" displayed="false" />
              </android.widget.LinearLayout>
            </android.widget.ListView>
          </android.widget.FrameLayout>
        </hierarchy>
        """;

    [Fact]
    public void WithAppId_FindsEveryViewWithTheIdInTreeOrder()
    {
        var comments = ScreenSnapshot.Parse(Source).WithAppId("commentBodyContainer").ToList();

        Assert.Equal(["Another image", "Here is a GIF"], comments.Select(comment => comment.WithAppId("commentBody").Single().Text));
    }

    [Fact]
    public void WithAppId_OnAView_FindsOnlyTheViewsInsideIt()
    {
        var first = ScreenSnapshot.Parse(Source).WithAppId("commentBodyContainer").First();

        // A search from a comment's element in UiAutomator2 also found the next comment's views; the tree doesn't.
        var image = Assert.Single(first.WithAppId("baconreader_patches_comment_image"));
        Assert.Equal(Rectangle.FromLTRB(26, 840, 526, 1224), image.Bounds);
    }

    [Fact]
    public void Parse_ReadsTextDescriptionBoundsAndWhetherAViewShows()
    {
        var second = ScreenSnapshot.Parse(Source).WithAppId("commentBodyContainer").Last();
        var text = second.WithAppId("commentBody").Single();
        var image = second.WithAppId("baconreader_patches_comment_image").Single();

        Assert.Equal("spoiler", text.Description);
        Assert.Equal(new Point(540, 1354), text.Center);
        Assert.False(image.Displayed);
        Assert.Equal(0, image.Bounds.Height);
    }

    [Fact]
    public void FirstWithAppIdFrom_FindsTheViewInsideTheViewFirst_ElseTheNextAfterIt()
    {
        var screen = ScreenSnapshot.Parse(Source);
        var firstText = screen.WithAppId("commentBody").First();
        var firstComment = screen.WithAppId("commentBodyContainer").First();

        // The first comment's text has no image inside it: the next image in the tree is its comment's.
        Assert.Equal(Rectangle.FromLTRB(26, 840, 526, 1224), screen.FirstWithAppIdFrom(firstText, "baconreader_patches_comment_image")!.Bounds);
        Assert.Equal("Another image", screen.FirstWithAppIdFrom(firstComment, "commentBody")!.Text);
        Assert.Null(screen.FirstWithAppIdFrom(screen.WithAppId("baconreader_patches_comment_image").Last(), "commentBody"));
    }

    [Fact]
    public void Ancestors_GoFromTheParentUpToTheRoot()
    {
        var text = ScreenSnapshot.Parse(Source).WithAppId("commentBody").First();

        Assert.Equal(["commentBodyContainer", "listView", ""], text.Ancestors().Take(3).Select(view => view.ResourceId.Replace(Id, "", StringComparison.Ordinal)));
    }
}
