// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.VsCodeExtension.E2E.Infrastructure.Workbench;

/// <summary>What a test checks on the recording panel.</summary>
public static class RecordingPanelSnapshotAssertions
{
    /// <summary>The panel's editor tab is titled <paramref name="tab"/>.</summary>
    public static AssertingThat<RecordingPanelSnapshot> HasEditorTab(this AssertingThat<RecordingPanelSnapshot> that, string tab)
    {
        Assert.True(that.InstanceToAssert.EditorTab == tab, $"The panel's tab is titled \"{that.InstanceToAssert.EditorTab}\", but \"{tab}\" was expected.");
        return that;
    }

    /// <summary>The panel's title is <paramref name="title"/>.</summary>
    public static AssertingThat<RecordingPanelSnapshot> HasTitle(this AssertingThat<RecordingPanelSnapshot> that, string title)
    {
        Assert.True(that.InstanceToAssert.Title == title, $"The panel's title is \"{that.InstanceToAssert.Title}\", but \"{title}\" was expected.");
        return that;
    }

    /// <summary>The line under the title reads <paramref name="about"/> (class · domain folder · PR and version).</summary>
    public static AssertingThat<RecordingPanelSnapshot> Reads(this AssertingThat<RecordingPanelSnapshot> that, string about)
    {
        Assert.True(that.InstanceToAssert.About == about, $"The panel reads \"{that.InstanceToAssert.About}\", but \"{about}\" was expected.");
        return that;
    }

    /// <summary>The panel's tabs are exactly <paramref name="tabs"/>, in order, and <paramref name="selected"/> is the one selected.</summary>
    public static AssertingThat<RecordingPanelSnapshot> HasTabSelected(this AssertingThat<RecordingPanelSnapshot> that, string selected, params string[] tabs)
    {
        var shown = that.InstanceToAssert.Tabs;
        Assert.True(
            shown.Select(tab => tab.Text).SequenceEqual(tabs),
            $"The panel's tabs are {string.Join(", ", shown.Select(tab => $"\"{tab.Text}\""))}, but {string.Join(", ", tabs.Select(tab => $"\"{tab}\""))} was expected.");
        var chosen = shown.Where(tab => tab.Selected).Select(tab => tab.Text).ToArray();
        Assert.True(chosen.SequenceEqual([selected]), $"The panel's selected tab is {string.Join(", ", chosen.Select(tab => $"\"{tab}\""))}, but \"{selected}\" was expected.");
        return that;
    }

    /// <summary>The panel plays the MP4 <paramref name="asset"/>.</summary>
    public static AssertingThat<RecordingPanelSnapshot> Plays(this AssertingThat<RecordingPanelSnapshot> that, string asset)
    {
        var video = that.InstanceToAssert.Video;
        Assert.True(video is not null, $"The panel shows no video (its GIF is \"{that.InstanceToAssert.Gif}\"), but \"{asset}\" was expected to play.");
        Assert.True(video.Asset == asset, $"The panel's video is \"{video.Asset}\", but \"{asset}\" was expected.");
        Assert.True(video.Plays, $"The panel's video \"{video.Asset}\" doesn't play{(that.InstanceToAssert.Note is { } note ? $" (\"{note}\")" : "")}.");
        return that;
    }

    /// <summary>The panel plays the MP4 <paramref name="asset"/> of the release <paramref name="release"/>.</summary>
    public static AssertingThat<RecordingPanelSnapshot> Plays(this AssertingThat<RecordingPanelSnapshot> that, string asset, string release)
    {
        that.Plays(asset);
        Assert.True(that.InstanceToAssert.Video!.Release == release, $"The panel's video comes from the release \"{that.InstanceToAssert.Video.Release}\", but \"{release}\" was expected.");
        return that;
    }

    /// <summary>The panel's video shows the browser's controls: play and pause, seeking, fullscreen.</summary>
    public static AssertingThat<RecordingPanelSnapshot> HasVideoControls(this AssertingThat<RecordingPanelSnapshot> that)
    {
        var video = that.InstanceToAssert.Video;
        Assert.True(video is not null, "The panel shows no video, but one with its controls was expected.");
        Assert.True(video.Controls, $"The panel's video \"{video.Asset}\" shows no controls.");
        return that;
    }

    /// <summary>The panel shows the GIF <paramref name="asset"/>, and no video.</summary>
    public static AssertingThat<RecordingPanelSnapshot> ShowsGif(this AssertingThat<RecordingPanelSnapshot> that, string asset)
    {
        Assert.True(that.InstanceToAssert.Video is null, $"The panel shows the video \"{that.InstanceToAssert.Video?.Asset}\", but the GIF \"{asset}\" was expected.");
        Assert.True(that.InstanceToAssert.Gif == asset, $"The panel's GIF is \"{that.InstanceToAssert.Gif}\", but \"{asset}\" was expected.");
        return that;
    }

    /// <summary>"Open in e2e player ↗" shows and goes to <paramref name="url"/>.</summary>
    public static AssertingThat<RecordingPanelSnapshot> LinksToThePlayer(this AssertingThat<RecordingPanelSnapshot> that, string url)
    {
        Assert.True(that.InstanceToAssert.PlayerLink == url, $"\"Open in e2e player ↗\" goes to \"{that.InstanceToAssert.PlayerLink ?? "(not shown)"}\", but \"{url}\" was expected.");
        return that;
    }

    /// <summary>"Open in e2e player ↗" doesn't show (the run has no MP4).</summary>
    public static AssertingThat<RecordingPanelSnapshot> HasNoPlayerLink(this AssertingThat<RecordingPanelSnapshot> that)
    {
        Assert.True(that.InstanceToAssert.PlayerLink is null, $"\"Open in e2e player ↗\" shows, going to \"{that.InstanceToAssert.PlayerLink}\", but it was expected not to.");
        return that;
    }

    /// <summary>"Recorded in" lists exactly <paramref name="versions"/>, in this order.</summary>
    public static AssertingThat<RecordingPanelSnapshot> ListsVersions(this AssertingThat<RecordingPanelSnapshot> that, params string[] versions)
    {
        var shown = that.InstanceToAssert.Versions.Select(version => version.Text).ToArray();
        Assert.True(
            shown.SequenceEqual(versions),
            $"\"Recorded in\" lists {string.Join(", ", shown.Select(v => $"\"{v}\""))}, but {string.Join(", ", versions.Select(v => $"\"{v}\""))} was expected.");
        return that;
    }

    /// <summary>"Recorded in" has <paramref name="version"/> picked, and only it.</summary>
    public static AssertingThat<RecordingPanelSnapshot> HasPicked(this AssertingThat<RecordingPanelSnapshot> that, string version)
    {
        var picked = that.InstanceToAssert.Versions.Where(v => v.Picked).Select(v => v.Text).ToArray();
        Assert.True(picked.SequenceEqual([version]), $"\"Recorded in\" has {string.Join(", ", picked.Select(v => $"\"{v}\""))} picked, but \"{version}\" was expected.");
        return that;
    }
}

/// <summary>What a test checks on where the panel is.</summary>
public static class RecordingPanelLayoutAssertions
{
    /// <summary>The panel shows beside the scenario file's editor: both show, the panel on its right, not over it.</summary>
    public static AssertingThat<RecordingPanelLayout> IsBesideTheCode(this AssertingThat<RecordingPanelLayout> that)
    {
        var (code, panel) = (that.InstanceToAssert.Code, that.InstanceToAssert.Panel);
        Assert.True(code is not null, "The scenario file's editor doesn't show next to the panel.");
        Assert.True(panel is not null, "The panel doesn't show.");
        Assert.True(panel.Left >= code.Right - 1, $"The panel starts at x = {panel.Left}, over the code, which ends at x = {code.Right}: it should be beside it.");
        return that;
    }
}
