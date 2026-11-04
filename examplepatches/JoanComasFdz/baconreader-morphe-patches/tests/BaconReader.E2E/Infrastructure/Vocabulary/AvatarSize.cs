// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>A choice of "Avatar size" ("Show user avatars"): Normal is as tall as the text, each next one bigger.</summary>
[Union]
public partial record AvatarSize
{
    public partial record Normal;
    public partial record Medium;
    public partial record Large;
    public partial record ExtraLarge;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

public static class AvatarSizeShowing
{
    private static readonly AvatarSize[] Listed =
        [new AvatarSize.Normal(), new AvatarSize.Medium(), new AvatarSize.Large(), new AvatarSize.ExtraLarge()];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this AvatarSize value) =>
        value.Match(
            normal => "Normal",
            medium => "Medium",
            large => "Large",
            extraLarge => "Extra large",
            unlisted => unlisted.Shown);

    /// <summary>The case the app's <paramref name="shown"/> text names, or <see cref="AvatarSize.Unlisted"/>.</summary>
    public static AvatarSize ReadAvatarSize(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new AvatarSize.Unlisted(shown);
}
