// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>What a test checks of the uploads Imgur got.</summary>
public static class ImgurUploadsSnapshotAssertions
{
    /// <summary>Imgur got an upload with the content type <paramref name="contentType"/>, and took it.</summary>
    public static AssertingThat<ImgurUploadsSnapshot> GotTheUploadWithTheContentType(this AssertingThat<ImgurUploadsSnapshot> that, string contentType)
    {
        var uploads = that.InstanceToAssert.Uploads;
        Assert.True(
            uploads.Any(upload => upload.ContentType == contentType && upload.Accepted),
            $"Imgur got no upload with the content type \"{contentType}\" that it took; it got: {(uploads.IsEmpty ? "no upload" : string.Join(", ", uploads.Select(upload => $"\"{upload.ContentType ?? "no content type"}\" ({(upload.Accepted ? "taken" : "refused")})")))}.");
        return that;
    }
}
