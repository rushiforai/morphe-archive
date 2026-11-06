// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>What a test checks of the requests BaconReader sent Imgflip.</summary>
public static class ImgflipSnapshotAssertions
{
    /// <summary>Imgflip served the thumbnail of every template the grid showed: it answered 200 to a request for each.</summary>
    public static AssertingThat<ImgflipThumbnailsSnapshot> ServedEveryThumbnail(this AssertingThat<ImgflipThumbnailsSnapshot> that)
    {
        var missing = that.InstanceToAssert.Templates.Where(template => !template.Statuses.Contains(200)).Select(template => $"\"{template.Name}\"").ToList();
        Assert.True(
            that.InstanceToAssert.Templates.Length > 0 && missing.Count == 0,
            $"Imgflip didn't serve the thumbnails of {(missing.Count == 0 ? "any template" : string.Join(", ", missing))}, but every template shown was expected.");
        return that;
    }

    /// <summary>Imgflip served the template at full size: it answered 200 to a request for its full image.</summary>
    public static AssertingThat<ImgflipTemplateRequestsSnapshot> ServedItAtFullSize(this AssertingThat<ImgflipTemplateRequestsSnapshot> that)
    {
        var snapshot = that.InstanceToAssert;
        Assert.True(
            snapshot.Statuses.Contains(200),
            $"Imgflip didn't serve the template \"{snapshot.Name}\" at full size; it was asked {(snapshot.Statuses.IsEmpty ? "nothing" : string.Join(", ", snapshot.Statuses))}.");
        return that;
    }
}
