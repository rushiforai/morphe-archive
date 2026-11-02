// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2ETools.Core;

namespace BaconReader.E2ETools.Hosting;

/// <summary>
/// Impure boundary: record.sh's output folder (its <c>scenarios.json</c>, <c>what-changed.md</c> and recordings), the
/// files the e2e scripts name, the folder each upload is staged in, and the console.
/// </summary>
public static class E2EFiles
{
    public static Result<string, string> ReadScenariosJson(string outFolder)
    {
        var path = Path.Combine(outFolder, "scenarios.json");
        try
        {
            return new Result<string, string>.Ok(File.ReadAllText(path));
        }
        catch (Exception exception) when (exception is FileNotFoundException or DirectoryNotFoundException)
        {
            return new Result<string, string>.Error($"{path} is missing: record.sh didn't get as far as recording (see its output above).");
        }
        catch (Exception exception) when (exception is IOException or UnauthorizedAccessException)
        {
            return new Result<string, string>.Error($"Cannot read {path}: {exception.Message}");
        }
    }

    /// <summary>A file's text; an error naming it when it can't be read.</summary>
    public static Result<string, string> ReadFile(string path)
    {
        try
        {
            return new Result<string, string>.Ok(File.ReadAllText(path));
        }
        catch (Exception exception) when (exception is IOException or UnauthorizedAccessException)
        {
            return new Result<string, string>.Error($"Cannot read {path}: {exception.Message}");
        }
    }

    public static Result<Unit, string> WriteFile(string path, string text)
    {
        try
        {
            File.WriteAllText(path, text);
            return new Result<Unit, string>.Ok(new Unit.Value());
        }
        catch (Exception exception) when (exception is IOException or UnauthorizedAccessException)
        {
            return new Result<Unit, string>.Error($"Cannot write {path}: {exception.Message}");
        }
    }

    /// <summary>The text a session gave push-gifs.sh <c>--message</c>, as it is; empty when it gave none.</summary>
    public static Result<string, string> ReadWhatChanged(string outFolder)
    {
        var path = Path.Combine(outFolder, "what-changed.md");
        try
        {
            return new Result<string, string>.Ok(File.Exists(path) ? File.ReadAllText(path) : "");
        }
        catch (Exception exception) when (exception is IOException or UnauthorizedAccessException)
        {
            return new Result<string, string>.Error($"Cannot read {path}: {exception.Message}");
        }
    }

    /// <summary>Which of each run's GIF and MP4 are on disk.</summary>
    public static ImmutableArray<(ScenarioEntry Entry, RecordedFiles Files)> FindRecordedFiles(string outFolder, ImmutableArray<ScenarioEntry> entries) =>
        [.. entries.Select(entry => (entry, new RecordedFiles(
            File.Exists(Path.Combine(outFolder, entry.Gif)),
            entry.Mp4 is Optional<string>.Some mp4 && File.Exists(Path.Combine(outFolder, mp4.Value)))))];

    /// <summary>
    /// A new folder holding each file under its asset name (gh uploads a file by its name); the caller deletes it with
    /// <see cref="DeleteStaging"/>.
    /// </summary>
    public static Result<ImmutableArray<string>, string> StageUpload(string outFolder, string staging, ImmutableArray<UploadFile> files)
    {
        try
        {
            Directory.CreateDirectory(staging);
            return new Result<ImmutableArray<string>, string>.Ok([.. files.Select(file =>
            {
                var target = Path.Combine(staging, file.Asset);
                File.Copy(Path.Combine(outFolder, file.Path), target, overwrite: true);
                return target;
            })]);
        }
        catch (Exception exception) when (exception is IOException or UnauthorizedAccessException)
        {
            return new Result<ImmutableArray<string>, string>.Error($"Cannot stage the upload in {staging}: {exception.Message}");
        }
    }

    public static string CreateStagingPath() => Path.Combine(Path.GetTempPath(), $"e2e-upload-{Guid.NewGuid():N}");

    public static void DeleteStaging(string staging)
    {
        if (Directory.Exists(staging))
        {
            Directory.Delete(staging, recursive: true);
        }
    }

    public static void Report(string line) => Console.WriteLine(line);

    public static void ReportAll(IEnumerable<string> lines)
    {
        foreach (var line in lines)
        {
            Console.WriteLine(line);
        }
    }

    public static void ReportError(string message) => Console.Error.WriteLine(message);
}
