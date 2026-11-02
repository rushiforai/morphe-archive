// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.VsCodeExtension.E2E.Infrastructure.Vocabulary;

/// <summary>
/// A recording of a scenario in the release: one push of a PR's GIFs (and MP4s, unless <paramref name="HasMp4s"/> is
/// false, like the PRs from before the MP4s), one run per screen its scenario is played on. "PR #109 · V1".
/// </summary>
public sealed record Recording(int Pr, int Version, bool HasMp4s = true);
