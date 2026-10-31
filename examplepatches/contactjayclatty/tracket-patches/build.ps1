# Cross-platform build implementation: Python 3 and JDK 17+.
# Optional environment variables: MORPHE_JAR and R8_JAR (checksum-pinned inputs).
$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
if (Get-Command python -ErrorAction SilentlyContinue) {
    & python (Join-Path $Root 'build.py') @args
} elseif (Get-Command python3 -ErrorAction SilentlyContinue) {
    & python3 (Join-Path $Root 'build.py') @args
} else {
    throw 'Python 3 was not found.'
}
if ($LASTEXITCODE -ne 0) { throw "build.py exited $LASTEXITCODE" }
