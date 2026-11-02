// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.VsCodeExtension.E2E.Infrastructure.Workbench;

/// <summary>
/// The parts of VS Code's own page the page objects find that have no role and accessible name to find them by
/// (E2E-TEST-CODE-RULES.md, rule c): VS Code's class names, all in this one place, so a VS Code update that renames one
/// changes one line. The extension's own panel is found by its data-testid and data-action attributes instead.
/// </summary>
public static class VsCodeDom
{
    /// <summary>The workbench, once VS Code has drawn it.</summary>
    public const string Workbench = ".monaco-workbench";

    /// <summary>The text editor of the scenario file (the editor group's editor; a webview holds none).</summary>
    public const string CodeEditor = ".editor-instance .monaco-editor";

    /// <summary>The editor's lines of code.</summary>
    public const string Lines = ".view-lines";

    /// <summary>One line of code (VS Code draws it as spans of tokens).</summary>
    public const string Line = ".view-line";

    /// <summary>A row of CodeLens items above a line.</summary>
    public const string CodeLens = ".codelens-decoration";

    /// <summary>A CodeLens item that runs a command (VS Code draws it as a link with no href, so it has no link role).</summary>
    public const string CodeLensCommand = "a";

    /// <summary>Any CodeLens item: a command's link, or a span for one that runs none.</summary>
    public const string CodeLensItem = "a, span";

    /// <summary>The title bar of the editor that has focus: its tabs and its buttons (an extension's among them).</summary>
    public const string EditorTitleBar = ".editor-group-container.active .title";

    /// <summary>An editor tab (the file's, the panel's).</summary>
    public const string EditorTab = ".tabs-container .tab";

    /// <summary>The editor tab of the editor that has focus.</summary>
    public const string ActiveEditorTab = ".tabs-container .tab.active";

    /// <summary>A webview's frame (the panel), drawn over its editor group, and the frame inside it that holds its page.</summary>
    public const string Webview = "iframe.webview.ready";

    /// <summary>The frame of a webview that holds the extension's page.</summary>
    public const string WebviewContent = "#active-frame";

    /// <summary>The Command Palette's input and its list of commands.</summary>
    public const string QuickInput = ".quick-input-widget";

    /// <summary>The Command Palette's text box.</summary>
    public const string QuickInputBox = ".quick-input-box input";
}
