// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.ComponentModel;
using System.Diagnostics;
using System.Text;
using BaconReader.E2ETools.Core;

namespace BaconReader.E2ETools.Hosting;

/// <summary>What a command answered: its exit code, what it wrote and what it said on error.</summary>
public sealed record CommandAnswer(int ExitCode, string Output, string Errors);

/// <summary>Impure boundary: a program run as a child process (gh, git), its input given and its output read whole.</summary>
public static class ChildProcesses
{
    private static readonly UTF8Encoding Utf8 = new(encoderShouldEmitUTF8Identifier: false);

    public static CommandAnswer RunCommand(string program, IReadOnlyList<string> arguments, Optional<string> input)
    {
        var start = new ProcessStartInfo(program)
        {
            RedirectStandardInput = true,
            RedirectStandardOutput = true,
            RedirectStandardError = true,
            UseShellExecute = false,
            StandardInputEncoding = Utf8,
            StandardOutputEncoding = Utf8,
            StandardErrorEncoding = Utf8,
        };
        foreach (var argument in arguments)
        {
            start.ArgumentList.Add(argument);
        }

        try
        {
            using var process = Process.Start(start)!;
            var errors = process.StandardError.ReadToEndAsync();
            process.StandardInput.Write(input.UnwrapOr(""));
            process.StandardInput.Close();
            var output = process.StandardOutput.ReadToEnd();
            process.WaitForExit();
            return new CommandAnswer(process.ExitCode, output, errors.Result);
        }
        catch (Win32Exception exception)
        {
            return new CommandAnswer(127, "", $"{program} couldn't start: {exception.Message}");
        }
    }
}
