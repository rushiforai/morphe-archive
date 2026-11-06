// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on the chat.</summary>
public static class ChatPageSnapshotAssertions
{
    /// <summary>The chat shows <paramref name="text"/>.</summary>
    public static AssertingThat<ChatPageSnapshot> Shows(this AssertingThat<ChatPageSnapshot> that, string text)
    {
        var texts = that.InstanceToAssert.Texts;
        Assert.True(
            texts.Contains(text),
            $"The chat shows {(texts.IsEmpty ? "nothing" : string.Join(", ", texts.Select(shown => $"\"{shown}\"")))}, but \"{text}\" was expected.");
        return that;
    }
}
