// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.FakeReddit.World;

/// <summary>
/// Imgflip, as "Fix meme templates" reaches it through "E2E fake Reddit": its images under
/// <c>&lt;base&gt;/_media/i.imgflip.com/</c> (<c>https://i.imgflip.com/</c>). The patch shows Imgflip's 100 most used
/// templates, a fixed list (<see cref="Templates"/>, in the patch's order), as their 250 px thumbnails,
/// <c>4/&lt;id&gt;.jpg</c>, and downloads a tapped one at full size, <c>&lt;id&gt;.jpg</c> or <c>.png</c>. Imgflip's
/// answers of 2026-11-05: a thumbnail is always a JPEG, a full template a JPEG or a PNG, and an image it doesn't have
/// <c>404</c> with an HTML page.
/// </summary>
public sealed class Imgflip
{
    /// <summary>The templates "Fix meme templates" shows, in its order: each one's file at full size, and its name on Imgflip.</summary>
    public static readonly IReadOnlyList<ImgflipTemplate> Templates =
    [
        new("30b1gx.jpg", "Drake Hotline Bling"),
        new("1g8my4.jpg", "Two Buttons"),
        new("1ur9b0.jpg", "Distracted Boyfriend"),
        new("3oevdk.jpg", "Bernie I Am Once Again Asking For Your Support"),
        new("3lmzyx.jpg", "UNO Draw 25 Cards"),
        new("22bdq6.jpg", "Left Exit 12 Off Ramp"),
        new("46e43q.png", "Always Has Been"),
        new("5c7lwq.png", "Anakin Padme 4 Panel"),
        new("28j0te.jpg", "Epic Handshake"),
        new("26jxvz.jpg", "Gru's Plan"),
        new("261o3j.jpg", "Running Away Balloon"),
        new("23ls.jpg", "Disaster Girl"),
        new("2fm6x.jpg", "Waiting Skeleton"),
        new("1c1uej.jpg", "Sad Pablo Escobar"),
        new("54hjww.jpg", "Trade Offer"),
        new("24y43o.jpg", "Change My Mind"),
        new("21uy0f.jpg", "Y'all Got Any More Of That"),
        new("1ihzfe.jpg", "X, X Everywhere"),
        new("9ehk.jpg", "Batman Slapping Robin"),
        new("345v97.jpg", "Woman Yelling At Cat"),
        new("3pdf2w.png", "Bernie Sanders Once Again Asking"),
        new("2odckz.jpg", "Marked Safe From"),
        new("1b42wl.jpg", "Bike Fall"),
        new("26am.jpg", "Ancient Aliens"),
        new("1otk96.jpg", "Mocking Spongebob"),
        new("1bij.jpg", "One Does Not Simply"),
        new("1o00in.jpg", "Is This A Pigeon"),
        new("2xscjb.png", "You Guys are Getting Paid"),
        new("2za3u1.jpg", "They're The Same Picture"),
        new("8d317n.png", "Absolute Cinema"),
        new("43a45p.png", "Buff Doge vs. Cheems"),
        new("72epa9.png", "0 days without (Lenny, Simpsons)"),
        new("1jwhww.jpg", "Expanding Brain"),
        new("46hhvr.jpg", "Mother Ignoring Kid Drowning In A Pool"),
        new("145qvv.jpg", "Squidward window"),
        new("gtj5t.jpg", "Oprah You Get A"),
        new("1wz1x.jpg", "This Is Where I'd Put My Trophy If I Had One"),
        new("2ybua0.png", "Tuxedo Winnie The Pooh"),
        new("64sz4u.png", "Megamind peeking"),
        new("3gdsh1.jpg", "George Bush 9/11"),
        new("19vcz0.jpg", "Pawn Stars Best I Can Do"),
        new("wxica.jpg", "This Is Fine"),
        new("1tl71a.jpg", "I Bet He's Thinking About Other Women"),
        new("8tw3vb.png", "Bell Curve"),
        new("4pn1an.png", "They don't know"),
        new("2tzo2k.jpg", "Soldier protecting sleeping child"),
        new("2gnnjh.jpg", "Monkey Puppet"),
        new("29v4rt.jpg", "Friendship ended"),
        new("5v6gwj.jpg", "Two guys on a bus"),
        new("3i7p.jpg", "Imagination Spongebob"),
        new("38el31.jpg", "Clown Applying Makeup"),
        new("1h7in3.jpg", "Roll Safe Think About It"),
        new("3eqjd8.jpg", "Spider Man Triple"),
        new("m78d.jpg", "Boardroom Meeting Suggestion"),
        new("58eyvu.png", "where monkey"),
        new("gk5el.jpg", "Hide the Pain Harold"),
        new("1yz6z4.jpg", "Types of Headaches meme"),
        new("1e7ql7.jpg", "Evil Kermit"),
        new("2reqtg.png", "Flex Tape"),
        new("3kwur5.jpg", "All My Homies Hate"),
        new("27qxmb.jpg", "You know, I'm something of a scientist myself"),
        new("1w7ygt.jpg", "Inhaling Seagull"),
        new("33e92f.jpg", "Three-headed Dragon"),
        new("1nck6k.jpg", "Sleeping Shaq"),
        new("434i5j.png", "A train hitting a school bus"),
        new("4acd7j.png", "Laughing Leo"),
        new("3po4m7.jpg", "Anime Girl Hiding from Terminator"),
        new("24zoa8.jpg", "No - Yes"),
        new("3vfrmx.jpg", "AJ Styles & Undertaker"),
        new("3qqcim.png", "Panik Kalm Panik"),
        new("2eeunw.jpg", "Scooby doo mask reveal"),
        new("1bip.jpg", "Bad Luck Brian"),
        new("3nx72a.png", "Grant Gustin over grave"),
        new("65939r.jpg", "Megamind no bitches"),
        new("2oo7h0.jpg", "Domino Effect"),
        new("1tkjq9.jpg", "spiderman pointing at spiderman"),
        new("1op9wy.jpg", "Whisper and Goosebumps"),
        new("2kbn1e.jpg", "Surprised Pikachu"),
        new("265k.jpg", "Third World Skeptical Kid"),
        new("28s2gu.jpg", "Who Killed Hannibal"),
        new("8k0sa.jpg", "Star Wars Yoda"),
        new("2cjr7j.jpg", "is this butterfly"),
        new("1yxkcp.jpg", "Blank Nut Button"),
        new("1qg8fp.jpg", "Grim Reaper Knocking Door"),
        new("1bgw.jpg", "Futurama Fry"),
        new("176h0h.jpg", "say the line bart! simpsons"),
        new("1bhw.jpg", "Grandma Finds The Internet"),
        new("bwu6w.jpg", "c'mon do something"),
        new("54d9lj.png", "Two Paths"),
        new("hlmst.jpg", "I'm The Captain Now"),
        new("1iruch.jpg", "Drake Blank"),
        new("1itoun.jpg", "Charlie Conspiracy (Always Sunny in Philidelphia)"),
        new("grr.jpg", "The Rock Driving"),
        new("39t1o.jpg", "Leonardo Dicaprio Cheers"),
        new("2896ro.jpg", "American Chopper Argument"),
        new("5youx3.jpg", "whe i'm in a competition and my opponent is"),
        new("21tqf4.jpg", "The Scroll Of Truth"),
        new("5o32tt.png", "Gus Fring we are not the same"),
        new("1ii4oc.jpg", "Trump Bill Signing"),
        new("44eggm.png", "Bugs bunny communist"),
    ];

    private const string ThumbnailFolder = "4/";

    private readonly HashSet<string> removed = [];
    private bool hasTemplates;

    internal Imgflip(RedditWorld world) => Sync = world.Sync;

    private object Sync { get; }

    /// <summary>Imgflip serves every template of <see cref="Templates"/>, as a thumbnail and at full size.</summary>
    public void AddTemplates()
    {
        lock (Sync)
        {
            hasTemplates = true;
        }
    }

    /// <summary>
    /// Imgflip no longer has the template <paramref name="name"/> at full size: that image answers 404, and its
    /// thumbnail, a file of its own, still shows in the grid.
    /// </summary>
    public ImgflipTemplate RemoveTemplate(string name)
    {
        var template = FindTemplate(name)
            ?? throw new ArgumentException($"Imgflip has no template \"{name}\" in the patch's list.", nameof(name));
        lock (Sync)
        {
            removed.Add(template.Id);
        }

        return template;
    }

    /// <summary>The template named <paramref name="name"/>, or null.</summary>
    public static ImgflipTemplate? FindTemplate(string name) => Templates.FirstOrDefault(template => template.Name == name);

    /// <summary>
    /// What Imgflip answers for <paramref name="path"/>, under <c>i.imgflip.com/</c>: a template's thumbnail or full
    /// image, <see cref="ImgflipAnswer.Missing"/> for one it doesn't have, or null for a path no template of the
    /// patch's list takes (the fake leaves it unhandled).
    /// </summary>
    internal ImgflipAnswer? Answer(string path)
    {
        var thumbnail = path.StartsWith(ThumbnailFolder, StringComparison.Ordinal);
        var file = thumbnail ? path[ThumbnailFolder.Length..] : path;
        var template = Templates.FirstOrDefault(found => thumbnail ? file == found.Id + ".jpg" : file == found.File);
        if (template is null || !hasTemplates)
        {
            return null;
        }

        if (!thumbnail && removed.Contains(template.Id))
        {
            return ImgflipAnswer.Missing;
        }

        var asset = thumbnail || template.File.EndsWith(".jpg", StringComparison.Ordinal) ? MediaAsset.Jpeg : MediaAsset.Png;
        return new ImgflipAnswer(new MediaFile(asset.ContentType, asset.Bytes));
    }

    internal void Reset()
    {
        removed.Clear();
        hasTemplates = false;
    }
}

/// <summary>A meme template on Imgflip: its file at full size (<c>30b1gx.jpg</c>) and its name.</summary>
public sealed record ImgflipTemplate(string File, string Name)
{
    /// <summary>Its id, the file's name without its extension.</summary>
    public string Id => File[..File.LastIndexOf('.')];

    /// <summary>Where Imgflip serves its thumbnail, under <c>i.imgflip.com/</c>.</summary>
    public string ThumbnailPath => $"i.imgflip.com/4/{Id}.jpg";

    /// <summary>Where Imgflip serves it at full size.</summary>
    public string FullPath => $"i.imgflip.com/{File}";
}

/// <summary>What Imgflip answers for one of its images: the file, or none (<see cref="Missing"/>, 404 with an HTML page).</summary>
internal sealed record ImgflipAnswer(MediaFile? File)
{
    public static readonly ImgflipAnswer Missing = new((MediaFile?)null);
}
