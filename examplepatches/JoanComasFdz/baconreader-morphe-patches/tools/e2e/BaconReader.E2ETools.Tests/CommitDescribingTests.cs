// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2ETools.Core;

namespace BaconReader.E2ETools.Tests;

/// <summary>The post's "What changed" from the GIFs' commit message.</summary>
public sealed class CommitDescribingTests
{
    [Fact]
    public void The_body_shows_without_its_trailers() =>
        Assert.Equal(
            "Ports the poster.\n\nKeeps its tests.",
            CommitDescribing.DescribeCommit("Port the poster\n\nPorts the poster.\n\nKeeps its tests.\n\nCo-Authored-By: Someone <a@b.c>\nClaude-Session: https://x\n"));

    [Fact]
    public void A_message_with_no_body_shows_its_subject() =>
        Assert.Equal("Port the poster", CommitDescribing.DescribeCommit("Port the poster\n\nCo-Authored-By: Someone <a@b.c>\n"));

    [Fact]
    public void A_last_paragraph_that_isnt_all_trailers_stays() =>
        Assert.Equal("Why: it reads better.\nAnd more.", CommitDescribing.DescribeCommit("Subject\n\nWhy: it reads better.\nAnd more."));

    [Fact]
    public void An_empty_message_says_so() => Assert.Equal("_No commit message._", CommitDescribing.DescribeCommit(" \n"));
}
