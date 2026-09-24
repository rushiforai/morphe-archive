<#
.SYNOPSIS
    Capture the logcat lines that matter when testing the gallery redirect.

.DESCRIPTION
    Filters logcat down to the intent dispatch, the extension's own log tag, and
    the failure modes worth seeing (ActivityNotFoundException, SecurityException,
    permission denials).

    The single most useful line is ActivityTaskManager's START record: it shows
    the exact action, data URI, MIME type, flags and resolved component, which
    is enough to tell a working redirect from a broken one at a glance.

    A correct redirect looks like:
        ActivityTaskManager: START u0 {act=android.intent.action.VIEW
            dat=content://media/external/images/media/NNN typ=image/jpeg flg=0x1 ...}

    Note `typ=` being present: an implicit VIEW with no MIME type will NOT match
    a gallery whose filter declares image/*, and is the most likely cause of the
    wrong app opening.

.PARAMETER Serial
    Target a specific adb device when more than one is attached.

.PARAMETER Clear
    Clear the log buffer before watching.

.EXAMPLE
    .\tools\Watch-GalleryLaunch.ps1 -Clear
#>
[CmdletBinding()]
param(
    [string] $Serial,
    [switch] $Clear
)

$ErrorActionPreference = 'Stop'

$adbPrefix = @()
if ($Serial) { $adbPrefix = @('-s', $Serial) }

if ($Clear) {
    & adb @adbPrefix logcat -c
    Write-Host 'Log buffer cleared.'
}

$pattern = 'MorpheGalleryRedirect|ActivityTaskManager|ActivityManager|GoogleCamera|' +
           'ActivityNotFoundException|SecurityException|Permission Denial|' +
           'PackageManager|ResolverActivity|CameraService|CAM_'

Write-Host "Watching logcat for: $pattern"
Write-Host 'Tap the camera-roll thumbnail now. Ctrl+C to stop.'
Write-Host ''

& adb @adbPrefix logcat -v time | Select-String -Pattern $pattern
