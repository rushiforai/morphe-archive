param([Parameter(ValueFromRemainingArguments=$true)][string[]]$Arguments)
$scope=$PSScriptRoot
$env:NO_UPDATE_NOTIFIER='1'
$env:CI='1'
$env:TMP="$scope\BuildCache\Temp";$env:TEMP=$env:TMP
$env:PLAYWRIGHT_BROWSERS_PATH="$scope\BuildCache\Browsers"
$env:PWTEST_DAEMON_SESSION_DIR="$scope\BuildCache\PlaywrightSessions"
$env:PLAYWRIGHT_CLI_INSTALLATION_FOR_TEST="$scope\BuildCache\PlaywrightRegistry"
$env:PLAYWRIGHT_MCP_OUTPUT_DIR="$scope\Personal-Patches\output\playwright"
$env:PLAYWRIGHT_MCP_ISOLATED='true'
$env:PLAYWRIGHT_MCP_BROWSER='chrome'
$env:LOCALAPPDATA="$scope\BuildCache\LocalAppData"
$env:APPDATA="$scope\BuildCache\AppData"
& "$scope\BuildCache\Npm\_npx\31e32ef8478fbf80\node_modules\.bin\playwright-cli.cmd" -s=ytmusic @Arguments
exit $LASTEXITCODE
