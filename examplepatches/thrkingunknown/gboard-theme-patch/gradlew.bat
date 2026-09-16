@rem Gradle Wrapper
@echo off
if defined JAVA_HOME (
    set "JAVA_EXE=%JAVA_HOME%\bin\java.exe"
) else (
    set "JAVA_EXE=java.exe"
)
"%JAVA_EXE%" -Dorg.gradle.appname=gradlew -jar "%DIRNAME%gradle\wrapper\gradle-wrapper.jar" %*
