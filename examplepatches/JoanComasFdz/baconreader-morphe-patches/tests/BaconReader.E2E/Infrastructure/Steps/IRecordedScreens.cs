// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.E2E.Infrastructure.Steps;

/// <summary>
/// The two screens a recording shows (<see cref="GherkinMarking"/>): the fake Reddit's setup page, in Chrome
/// (<see cref="Device.SetupPage"/>), and the app.
/// </summary>
public interface IRecordedScreens
{
    /// <summary>Brings the setup page in front of the app.</summary>
    void ShowSetupPage();

    /// <summary>Brings the app back in front of the setup page, as it was.</summary>
    void ShowApp();

    /// <summary>
    /// Waits until the setup page shows what the fake has now, or gives up after a while and says so, and says how long
    /// to hold on it to read what it shows as new (<see cref="GherkinMarking.ReadingTime"/>).
    /// </summary>
    TimeSpan WaitUntilSetupPageShowsTheFake();
}
