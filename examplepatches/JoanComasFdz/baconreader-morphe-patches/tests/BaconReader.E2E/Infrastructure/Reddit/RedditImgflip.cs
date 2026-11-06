// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.FakeReddit.World;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>
/// Imgflip, which the fake Reddit answers too ("E2E fake Reddit" moves <c>https://i.imgflip.com/</c> to it), in the
/// Gherkins' words. "Fix meme templates" shows Imgflip's 100 most used templates, in a fixed order
/// (<see cref="Imgflip.Templates"/>).
/// </summary>
public sealed partial class Reddit
{
    /// <summary>"Imgflip has its meme templates": Imgflip serves every template the patch shows, as a thumbnail and at full size.</summary>
    public void ImgflipHasItsMemeTemplates() => world.Imgflip.AddTemplates();

    /// <summary>"Imgflip has removed its template "&lt;name&gt;"": its full image answers 404; its thumbnail still shows.</summary>
    public void ImgflipHasRemovedItsTemplate(string name) => world.Imgflip.RemoveTemplate(name);

    /// <summary>The place of the template <paramref name="name"/> in the meme templates' grid, from 0: the patch's order.</summary>
    public int ThePlaceOfTheTemplate(string name) =>
        Imgflip.Templates.ToList().FindIndex(template => template.Name == name) is var place and >= 0
            ? place
            : throw new InvalidOperationException($"The patch shows no template \"{name}\".");

    /// <summary>"Imgflip served the thumbnail of every template shown": for each of the first <paramref name="shown"/> templates, the statuses of the requests for its thumbnail.</summary>
    public ImgflipThumbnailsSnapshot ReadRequestsForTheThumbnailsOfTheFirstTemplates(int shown) =>
        new([.. Imgflip.Templates.Take(shown).Select(template => new ImgflipThumbnailRequests(template.Name, Statuses(template.ThumbnailPath)))]);

    /// <summary>"Imgflip served the template "&lt;name&gt;" at full size": the statuses of the requests for its full image.</summary>
    public ImgflipTemplateRequestsSnapshot ReadRequestsForTheTemplateAtFullSize(string name) =>
        new(name, Statuses(Template(name).FullPath));

    /// <summary>Waits until Imgflip served the thumbnails of the first <paramref name="shown"/> templates: the grid loads those it shows.</summary>
    public Task WaitUntilImgflipServedTheThumbnailsAsync(int shown) =>
        WaitUntilAsync(
            () => ReadRequestsForTheThumbnailsOfTheFirstTemplates(shown).Templates.All(template => template.Statuses.Contains(200)),
            TimeSpan.FromSeconds(15),
            $"Imgflip didn't serve the thumbnails of the first {shown} templates within 15 s.");

    /// <summary>Waits until Imgflip answered a request for the template <paramref name="name"/> at full size, whatever it answered.</summary>
    public Task WaitUntilImgflipAnsweredTheTemplateAsync(string name) =>
        WaitUntilAsync(
            () => !ReadRequestsForTheTemplateAtFullSize(name).Statuses.IsEmpty,
            TimeSpan.FromSeconds(15),
            $"BaconReader didn't ask Imgflip for the template \"{name}\" at full size within 15 s.");

    private ImmutableArray<int> Statuses(string path) =>
        [.. world.Requests.Where(request => request.Method == "GET" && request.Path == "/_media/" + path).Select(request => request.Status)];

    private static ImgflipTemplate Template(string name) =>
        Imgflip.FindTemplate(name) ?? throw new InvalidOperationException($"The patch shows no template \"{name}\".");
}

/// <summary>The statuses of the requests for a template's thumbnail, oldest first.</summary>
public sealed record ImgflipThumbnailRequests(string Name, ImmutableArray<int> Statuses);

/// <summary>The requests for the thumbnails of the templates the grid showed, in its order.</summary>
public sealed record ImgflipThumbnailsSnapshot(ImmutableArray<ImgflipThumbnailRequests> Templates);

/// <summary>The statuses of the requests for the template <c>Name</c> at full size, oldest first.</summary>
public sealed record ImgflipTemplateRequestsSnapshot(string Name, ImmutableArray<int> Statuses);
