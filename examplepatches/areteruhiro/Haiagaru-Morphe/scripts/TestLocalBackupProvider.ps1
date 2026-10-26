$ErrorActionPreference='Stop'
$env:JAVA_TOOL_OPTIONS='-Xmx160m -XX:+UseSerialGC -XX:ActiveProcessorCount=1'
$files=@(Get-ChildItem scripts/local-backup-provider -Recurse -Filter *.java | ForEach-Object FullName)
javac -encoding UTF-8 -d build/local-backup-provider-tests @files extensions/chmate/src/main/java/app/morphe/extension/chmate/LocalBackupDocuments.java extensions/chmate/src/main/java/app/morphe/extension/chmate/LocalBackupRetention.java scripts/LocalBackupRetentionTest.java
if($LASTEXITCODE -ne 0){exit $LASTEXITCODE}
java -cp build/local-backup-provider-tests app.morphe.extension.chmate.LocalBackupProviderTest
if($LASTEXITCODE -ne 0){exit $LASTEXITCODE}
java -cp build/local-backup-provider-tests app.morphe.extension.chmate.LocalBackupRetentionTest
exit $LASTEXITCODE

