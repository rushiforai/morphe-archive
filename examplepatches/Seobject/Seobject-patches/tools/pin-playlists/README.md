# Pin playlists compatibility updater

This directory contains the local compatibility updater for the YouTube Music
`Pin playlists` patch.

## Default storage

The updater stores its persistent state here:

```text
C:\Projects\Patch Updaters\Pin Playlists
```

That directory contains:

- `baseline.json`
- `baseline-history\`
- `reports\`
- `decompiled-index\`

Downloaded JADX releases are installed here:

```text
C:\Projects\JADX\vX.X.X
```

Versioned YouTube Music sources are written here:

```text
C:\Projects\YouTube Music\Decompiled\YouTubeMusic_x.xx.xx
```

## Commands

Read-only compatibility scan:

```powershell
.\update-pin-playlists.ps1
```

Read-only regression test that hides all known symbols:

```powershell
.\update-pin-playlists.ps1 -SimulateRename
```

Apply confident additive symbol updates, build the patch bundle, and patch-test
the APK:

```powershell
.\update-pin-playlists.ps1 -ApplyAndVerify
```

After manually installing and runtime-testing the verification APK:

```powershell
.\update-pin-playlists.ps1 -PromoteBaseline
```

Choose a specific APK:

```powershell
.\update-pin-playlists.ps1 -Apk "C:\path\to\youtube-music.apk"
```

Override any storage root:

```powershell
.\update-pin-playlists.ps1 `
    -StateRoot "D:\Patch Updaters\Pin Playlists" `
    -JadxRoot "D:\JADX" `
    -DecompileRoot "D:\YouTube Music\Decompiled"
```

The updater never commits, pushes, tags, or releases.