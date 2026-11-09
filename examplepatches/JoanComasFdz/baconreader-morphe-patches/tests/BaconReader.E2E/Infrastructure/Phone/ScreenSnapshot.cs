// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Drawing;
using System.Globalization;
using System.Xml.Linq;
using BaconReader.E2E.Infrastructure.Device;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>
/// The screen's views at one moment, read in one round trip: UiAutomator2's page source, its view tree as XML, parsed
/// here. A page object that asks the phone for each view, its bounds and its text pays a round trip each (~0.23 s from a
/// cloud session): finding a comment among 6 on the screen took 30 to 50 of them, 7 to 12 s. The page source of a
/// comments screen is ~59 KB and comes in ~0.65 s (measured on the Pixel 6 Pro, 2026-11-07), and has every view's id,
/// text, description, bounds and whether it shows.
/// </summary>
public sealed class ScreenSnapshot
{
    private ScreenSnapshot(ScreenNode root) => Root = root;

    /// <summary>The window's root view.</summary>
    public ScreenNode Root { get; }

    /// <summary>Reads the screen's views as they are now.</summary>
    public static ScreenSnapshot Take(AndroidDriver driver) => Parse(driver.PageSource);

    /// <summary>The views of a page source.</summary>
    public static ScreenSnapshot Parse(string pageSource) => new(ScreenNode.From(XDocument.Parse(pageSource).Root!, parent: null));

    /// <summary>
    /// The first view with the app's id <paramref name="id"/> inside <paramref name="view"/>, or else the first after it
    /// in the tree: what UiAutomator2's search from an element finds first.
    /// </summary>
    public ScreenNode? FirstWithAppIdFrom(ScreenNode view, string id) =>
        view.WithAppId(id).FirstOrDefault()
        ?? Root.Descendants().SkipWhile(node => node != view).Skip(1).FirstOrDefault(node => node.HasAppId(id));

    /// <summary>Every view of the screen with the app's id <paramref name="id"/>, in the order they are drawn in the tree.</summary>
    public IEnumerable<ScreenNode> WithAppId(string id) => Root.Descendants().Where(node => node.HasAppId(id));
}

/// <summary>One view of a <see cref="ScreenSnapshot"/>.</summary>
public sealed class ScreenNode
{
    private readonly List<ScreenNode> children = [];

    private ScreenNode(XElement element, ScreenNode? parent)
    {
        Parent = parent;
        ResourceId = element.Attribute("resource-id")?.Value ?? "";
        ClassName = element.Attribute("class")?.Value ?? "";
        Text = element.Attribute("text")?.Value ?? "";
        Description = element.Attribute("content-desc")?.Value ?? "";
        Displayed = element.Attribute("displayed")?.Value != "false";
        Bounds = ParseBounds(element.Attribute("bounds")?.Value);
    }

    /// <summary>The view it is in, or null for the root.</summary>
    public ScreenNode? Parent { get; }

    /// <summary>Its resource id, "com.onelouder.baconreader.premium:id/commentBody", or "".</summary>
    public string ResourceId { get; }

    /// <summary>Its class, "android.widget.TextView".</summary>
    public string ClassName { get; }

    /// <summary>The text it shows, or "".</summary>
    public string Text { get; }

    /// <summary>What it reads as to accessibility (content-desc), or "".</summary>
    public string Description { get; }

    /// <summary>Whether it shows on the screen.</summary>
    public bool Displayed { get; }

    /// <summary>Where it is on the screen, in pixels: only its part on the screen.</summary>
    public Rectangle Bounds { get; }

    /// <summary>The views right inside it.</summary>
    public IReadOnlyList<ScreenNode> Children => children;

    /// <summary>The center of its bounds, where a tap on it lands.</summary>
    public Point Center => new(Bounds.Left + (Bounds.Width / 2), Bounds.Top + (Bounds.Height / 2));

    /// <summary>Whether its resource id is the app's id <paramref name="id"/>.</summary>
    public bool HasAppId(string id) => ResourceId == $"{E2EDevice.Package}:id/{id}";

    /// <summary>Every view inside it, at any depth, in the order they are drawn in the tree.</summary>
    public IEnumerable<ScreenNode> Descendants()
    {
        foreach (var child in children)
        {
            yield return child;
            foreach (var descendant in child.Descendants())
            {
                yield return descendant;
            }
        }
    }

    /// <summary>The views inside it with the app's id <paramref name="id"/>.</summary>
    public IEnumerable<ScreenNode> WithAppId(string id) => Descendants().Where(node => node.HasAppId(id));

    /// <summary>The views it is in, from its parent up.</summary>
    public IEnumerable<ScreenNode> Ancestors()
    {
        for (var ancestor = Parent; ancestor is not null; ancestor = ancestor.Parent)
        {
            yield return ancestor;
        }
    }

    internal static ScreenNode From(XElement element, ScreenNode? parent)
    {
        var node = new ScreenNode(element, parent);
        node.children.AddRange(element.Elements().Select(child => From(child, node)));
        return node;
    }

    // UiAutomator2's bounds, "[left,top][right,bottom]".
    private static Rectangle ParseBounds(string? bounds)
    {
        var edges = (bounds ?? "").Split(['[', ']', ','], StringSplitOptions.RemoveEmptyEntries)
            .Select(edge => int.Parse(edge, CultureInfo.InvariantCulture))
            .ToArray();
        return edges.Length == 4 ? Rectangle.FromLTRB(edges[0], edges[1], edges[2], edges[3]) : Rectangle.Empty;
    }
}
