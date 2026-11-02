// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Diagnostics;

namespace BaconReader.E2E.Infrastructure.Device;

/// <summary>Runs the command-line tools the scenarios need around the app (adb, java for Morphe Desktop) and reads their output.</summary>
public static class Commands
{
    /// <summary>What a command printed and how it ended.</summary>
    public sealed record Ran(int ExitCode, string Output, string Error)
    {
        public bool Succeeded => ExitCode == 0;
    }

    /// <summary>Runs <paramref name="file"/> with <paramref name="arguments"/> and waits for it to end.</summary>
    public static async Task<Ran> RunAsync(string file, params string[] arguments)
    {
        var start = new ProcessStartInfo(file)
        {
            RedirectStandardOutput = true,
            RedirectStandardError = true,
            UseShellExecute = false,
        };
        foreach (var argument in arguments)
        {
            start.ArgumentList.Add(argument);
        }

        using var process = Process.Start(start) ?? throw new InvalidOperationException($"{file} didn't start.");
        var output = process.StandardOutput.ReadToEndAsync();
        var error = process.StandardError.ReadToEndAsync();
        await process.WaitForExitAsync();
        return new Ran(process.ExitCode, await output, await error);
    }

    /// <summary>Runs <paramref name="file"/> and fails, with what it printed, unless it succeeds.</summary>
    public static async Task<string> RunOrFailAsync(string file, params string[] arguments)
    {
        var ran = await RunAsync(file, arguments);
        return ran.Succeeded
            ? ran.Output
            : throw new InvalidOperationException(
                $"{file} {string.Join(' ', arguments)} ended with {ran.ExitCode}:\n{ran.Output}\n{ran.Error}".TrimEnd());
    }

    /// <summary>Runs a shell command on the phone (adb -s <c>E2E_ADB_SERIAL</c> shell) and returns what it printed.</summary>
    public static async Task<string> ShellAsync(string command) =>
        (await RunOrFailAsync("adb", "-s", E2EDevice.AdbSerial, "shell", command)).Replace("\r\n", "\n").Trim();

    /// <summary>Runs adb against the phone (adb -s <c>E2E_ADB_SERIAL</c> …).</summary>
    public static Task<string> AdbAsync(params string[] arguments) =>
        RunOrFailAsync("adb", ["-s", E2EDevice.AdbSerial, .. arguments]);
}
