# Generates patches-list.json for the GitHub source.
#
# Morphe Manager and third party tools read this file from the repository root
# to show the patch list without downloading the bundle. The schema matches
# MorpheApp/morphe-patches-template's PatchListGenerator output:
#
#   { NOTE, version, patches: [ { name, description, default, category,
#     compatiblePackages: [ { packageName, name, description, apkFileType,
#     appIconColor, signatures, formFactor, targets: [ { version,
#     versionCodes, isExperimental, minSdk, description } ] } ], options } ] }
#
# The version must match patches-bundle.json and the bundle manifest.
[CmdletBinding()]
param(
    [string]$Version = '1.2.4'
)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot '_common.ps1')
Set-Location $script:RepoRoot

# Both TV builds ship one versionCode for every ABI in their APKM.
$kickTargets = @(
    [ordered]@{
        version        = '1.9.0'
        versionCodes   = [ordered]@{
            ARM64_V8A   = 208
            ARMEABI_V7A = 208
            X86_64      = 208
            X86         = 208
        }
        isExperimental = $false
        minSdk         = $null
        description    = $null
    }
)

$twitchTargets = @(
    [ordered]@{
        version        = '13.0.0.2'
        versionCodes   = [ordered]@{
            ARM64_V8A   = 1100000018
            ARMEABI_V7A = 1100000018
            X86_64      = 1100000018
            X86         = 1100000018
        }
        isExperimental = $false
        minSdk         = $null
        description    = $null
    }
)

$kickTv = [ordered]@{
    packageName   = 'com.kick.mobile'
    name          = 'KICK: Live Streaming'
    description   = 'Patched tweaks by Sey for KICK (Android TV).'
    apkFileType   = 'APKM'
    appIconColor  = '#53FC18'
    signatures    = $null
    formFactor    = 'TV'
    targets       = $kickTargets
}

$twitchTv = [ordered]@{
    packageName   = 'tv.twitch.android.app'
    name          = 'Twitch (Android TV)'
    description   = 'Patched tweaks by Sey for Twitch (Android TV).'
    apkFileType   = 'APKM'
    appIconColor  = '#9146FF'
    signatures    = $null
    formFactor    = 'TV'
    targets       = $twitchTargets
}

$patches = @(
    [ordered]@{
        name               = 'CHAT SIZE'
        description        = 'Resize the chat in the VIDEO/CHAT view: default (100%), ' +
                             '125%, 90%, 85% and 80%. The video and the chat panel always ' +
                             'meet at the same edge. Requires the SEYTTINGS patch.'
        default            = $true
        category           = $null
        compatiblePackages = @($kickTv)
        options            = @()
    },
    [ordered]@{
        name               = 'CHAT TEXT SIZE'
        description        = 'Render chat messages with a larger, Twitch-like TV text ' +
                             'size. Pick 16 sp (default), 15 sp, 13 sp or the stock ' +
                             '11 sp in SEYTTINGS. Requires the SEYTTINGS patch.'
        default            = $true
        category           = $null
        compatiblePackages = @($kickTv)
        options            = @()
    },
    [ordered]@{
        name               = 'EMOTES'
        description        = 'Shows 7TV, BTTV and FFZ emotes in the KICK TV chat. ' +
                             'One toggle in SEYTTINGS enables or disables all providers. ' +
                             'Requires the SEYTTINGS patch.'
        default            = $true
        category           = $null
        compatiblePackages = @($kickTv)
        options            = @()
    },
    [ordered]@{
        name               = 'EXPAND CHAT'
        description        = 'Hides the "Join the Chat" footer in the VIDEO/CHAT view ' +
                             'and lets the chat fill the freed space. Toggle it in ' +
                             'SEYTTINGS. Requires the SEYTTINGS patch.'
        default            = $true
        category           = $null
        compatiblePackages = @($kickTv)
        options            = @()
    },
    [ordered]@{
        name               = 'HIDE PINNED'
        description        = 'Removes the pinned message card (and the ad banner ' +
                             'attached to it) from the top of the KICK TV chat. ' +
                             'Toggle it in SEYTTINGS. Requires the SEYTTINGS patch.'
        default            = $true
        category           = $null
        compatiblePackages = @($kickTv)
        options            = @()
    },
    [ordered]@{
        name               = 'SKIP 18+ WARNING'
        description        = 'Automatically accepts the 18+ mature content warning ' +
                             'when a stream opens, so the player starts without the ' +
                             'extra click. Toggle it in SEYTTINGS. Requires the ' +
                             'SEYTTINGS patch.'
        default            = $true
        category           = $null
        compatiblePackages = @($kickTv)
        options            = @()
    },
    [ordered]@{
        name               = 'SEYTTINGS'
        description        = 'Adds the red themed SEYTTINGS menu to KICK TV. ' +
                             'This is the base patch required by every KICK TV tweak.'
        default            = $true
        category           = $null
        compatiblePackages = @($kickTv)
        options            = @()
    },
    [ordered]@{
        name               = 'AMOLED'
        description        = 'Pure black theme for the Twitch TV chat and the bars above ' +
                             'and below the video. Replaces the dark greys with #000000. ' +
                             'One toggle in SEYTTINGS. Requires the SEYTTINGS patch.'
        default            = $true
        category           = $null
        compatiblePackages = @($twitchTv)
        options            = @()
    },
    [ordered]@{
        name               = 'AD BLOCK'
        description        = 'Skips Twitch ads by filtering stitched ad segments from the ' +
                             'HLS stream and switching to the same broadcast from an ' +
                             'ad-free player type. One toggle in SEYTTINGS. Requires the ' +
                             'SEYTTINGS patch.'
        default            = $true
        category           = $null
        compatiblePackages = @($twitchTv)
        options            = @()
    },
    [ordered]@{
        name               = 'EMOTES'
        description        = 'Shows 7TV, BTTV and FFZ emotes in the Twitch TV chat. ' +
                             'One toggle in SEYTTINGS enables or disables all providers. ' +
                             'Requires the SEYTTINGS patch.'
        default            = $true
        category           = $null
        compatiblePackages = @($twitchTv)
        options            = @()
    },
    [ordered]@{
        name               = 'EXPAND CHAT'
        description        = 'Hides the "Join the conversation" footer button and lets ' +
                             'the chat fill the full panel height. One toggle in SEYTTINGS. ' +
                             'Requires the SEYTTINGS patch.'
        default            = $true
        category           = $null
        compatiblePackages = @($twitchTv)
        options            = @()
    },
    [ordered]@{
        name               = 'HIDE PINNED'
        description        = 'Hides pinned chat messages on Twitch TV: the pinned ' +
                             'card, its "Pinned by" label, the pin badge and any ' +
                             'pinned highlight in the message list. One toggle in ' +
                             'SEYTTINGS. Requires the SEYTTINGS patch.'
        default            = $true
        category           = $null
        compatiblePackages = @($twitchTv)
        options            = @()
    },
    [ordered]@{
        name               = 'SKIP 18+ WARNING'
        description        = 'Automatically accepts the 18+ mature content warning ' +
                             'on Twitch TV, so a mature stream starts without the ' +
                             'extra click. One toggle in SEYTTINGS. Requires the ' +
                             'SEYTTINGS patch.'
        default            = $true
        category           = $null
        compatiblePackages = @($twitchTv)
        options            = @()
    },
    [ordered]@{
        name               = 'SEYTTINGS'
        description        = 'Adds the red themed SEYTTINGS menu to Twitch TV. ' +
                             'The Settings row opens a native patched-tweaks dialog. ' +
                             'This is the base patch required by every Twitch TV tweak.'
        default            = $true
        category           = $null
        compatiblePackages = @($twitchTv)
        options            = @()
    }
)

$list = [ordered]@{
    NOTE    = 'Do NOT manually edit this file. This file is automatically updated when ' +
              'semantic release (release.yml) runs. Manually editing this file can break ' +
              'your releases and break third party tools that use this file.'
    version = $Version
    patches = $patches
}

# ASCII keeps the file free of the UTF-8 BOM that Windows PowerShell 5 writes.
$outPath = Join-Path $script:RepoRoot 'patches-list.json'
$list | ConvertTo-Json -Depth 12 | Set-Content -Path $outPath -Encoding ASCII

Write-Host "Patch list written to: $outPath"
Write-Host "  version : $Version"
Write-Host "  patches : $((($patches | ForEach-Object { "$($_.compatiblePackages[0].packageName)/$($_.name)" }) -join ', '))"
