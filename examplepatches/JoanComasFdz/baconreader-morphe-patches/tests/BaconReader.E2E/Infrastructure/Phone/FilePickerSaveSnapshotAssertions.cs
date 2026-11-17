// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>What a test checks on Android's file picker, when it saves a file.</summary>
public static class FilePickerSaveSnapshotAssertions
{
    /// <summary>The picker offers to save <paramref name="name"/> in <paramref name="folder"/>.</summary>
    public static AssertingThat<FilePickerSaveSnapshot> Shows(this AssertingThat<FilePickerSaveSnapshot> that, string name, string folder)
    {
        var shown = that.InstanceToAssert;
        Assert.True(
            shown.Name == name && shown.Folder == folder,
            $"Android's file picker shows \"{shown.Name}\" in \"{shown.Folder}\", but \"{name}\" in \"{folder}\" was expected.");
        return that;
    }
}
