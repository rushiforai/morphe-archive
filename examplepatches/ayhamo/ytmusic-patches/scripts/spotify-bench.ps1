# The phone's part of spec/automix/spotify-benchmark.md (rules 4 and 5), offline: nothing plays.
#   1. Each song of the bench's key.json: its bench/audio/<videoId>.<ext> decoded by ffmpeg at its own
#      rate to 16-bit stereo WAV under work/scratch/bench-wav (standing in for the phone's MediaCodec;
#      the phone's own fold and resampler run in the test).
#   2. SpotifyBenchTest in the tools image, with the analysis natives (analysis-natives.ps1, built when
#      missing): it writes bench/phone/<videoId>.json and bench/phone/plans.json.
#   3. The decoded WAVs are removed again (-KeepWav keeps them for a rerun).
# The extension's spotify_bench.mjs scores the result. -Redo analyses songs already written again.
# -Threads songs at once (about 0.8 GB each); -OutDir another folder under the bench; -Only only those
# songs (comma-separated, plans.json not written).
param(
    [string]$Bench = "D:\Programs\Projects\YT Clients\research\spotify-mixes\bench",
    [switch]$Redo,
    [int]$Threads = 6,
    [string]$OutDir = "phone",
    [string]$Only = "",
    [switch]$KeepWav
)
$ErrorActionPreference = "Stop"
$root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$natives = Join-Path $root "work\scratch\analysis-natives"
$wav = Join-Path $root "work\scratch\bench-wav"
$exports = Split-Path $Bench -Parent
$keyFile = Join-Path $Bench "key.json"
if (-not (Test-Path $keyFile)) { throw "no $keyFile yet: the PC writes it (spotify_bench.mjs)" }
if (-not (Get-Command ffmpeg -ErrorAction SilentlyContinue)) { throw "ffmpeg not on PATH" }
if (-not (Test-Path (Join-Path $natives "libbitchord_analysis.so"))) { & (Join-Path $PSScriptRoot "analysis-natives.ps1") -Out $natives }

$key = Get-Content $keyFile -Raw -Encoding UTF8 | ConvertFrom-Json
$ids = $key.songs.PSObject.Properties.Name
if ($Only) { $ids = $Only.Split(",") }
New-Item -ItemType Directory -Force $wav | Out-Null
$decoded = 0; $noAudio = 0
foreach ($id in $ids) {
    $out = Join-Path $wav "$id.wav"
    if ((-not $Redo) -and (Test-Path (Join-Path $Bench "$OutDir\$id.json"))) { continue }
    if (Test-Path $out) { continue }
    $src = Get-ChildItem (Join-Path $Bench "audio") -Filter "$id.*" -ErrorAction SilentlyContinue |
        Where-Object { $_.Extension -notin ".part", ".ytdl", ".json" } | Select-Object -First 1
    if (-not $src) { $noAudio++; continue }
    & ffmpeg -v error -nostdin -y -i $src.FullName -vn -ac 2 -c:a pcm_s16le $out
    if ($LASTEXITCODE -ne 0) { Remove-Item $out -ErrorAction SilentlyContinue; Write-Warning "$id : ffmpeg failed"; continue }
    $decoded++
}
Write-Host "decoded $decoded songs ($noAudio of the key's $($ids.Count) have no audio yet)"

# The token goes to Docker through the environment (-e NAME with no value), never on a command
# line where process listings would show it. A GITHUB_TOKEN already set is put back afterwards.
$hadToken = Test-Path Env:GITHUB_TOKEN
$oldToken = $env:GITHUB_TOKEN
$env:GITHUB_TOKEN = (gh auth token)
if ($LASTEXITCODE -ne 0 -or -not $env:GITHUB_TOKEN) {
    if ($hadToken) { $env:GITHUB_TOKEN = $oldToken } else { Remove-Item Env:GITHUB_TOKEN -ErrorAction SilentlyContinue }
    throw "gh auth token failed: log in with gh auth login (read:packages scope)"
}
try {
docker run --rm -e GITHUB_ACTOR=ayhamo -e GITHUB_TOKEN `
    -e AUTOMIX_NATIVES=/natives -e SPOTIFY_BENCH=/bench -e BENCH_WAV=/wav -e SPOTIFY_EXPORTS=/exports `
    -e BENCH_THREADS=$Threads -e BENCH_OUT=$OutDir -e TEST_HEAP="$([Math]::Max(2, [Math]::Ceiling($Threads * 1.2)))g" `
    $(if ($Only) { "-e"; "BENCH_IDS=$Only" }) `
    $(if ($Redo) { "-e"; "BENCH_REDO=1" }) `
    -v "${natives}:/natives:ro" -v "${Bench}:/bench" -v "${wav}:/wav:ro" -v "${exports}:/exports:ro" `
    -v "${root}:/repo" -v "$root\work\gradle-home:/gradle" -w /repo/bundle ytm-patches-tools `
    sh -c "sh ./gradlew :extensions:extension:testDebugUnitTest --tests '*SpotifyBenchTest' --no-daemon --console=plain -i > /tmp/bench.log 2>&1; c=`$?; grep -E 'spotify bench|: [0-9.]+ s, |left out|failed|FAILED|SKIPPED|Exception' /tmp/bench.log; exit `$c"
$code = $LASTEXITCODE
} finally {
    if ($hadToken) { $env:GITHUB_TOKEN = $oldToken } else { Remove-Item Env:GITHUB_TOKEN -ErrorAction SilentlyContinue }
}
if (-not $KeepWav) { Remove-Item -Recurse -Force $wav }
if ($code -ne 0) { throw "SpotifyBenchTest failed" }
