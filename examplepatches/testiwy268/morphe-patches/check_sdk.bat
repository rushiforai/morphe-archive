@echo off
if exist "C:\Program Files (x86)\Android\android-sdk" echo FOUND at C:\Program Files (x86)\Android\android-sdk
if exist "%LOCALAPPDATA%\Android\Sdk" echo FOUND at %LOCALAPPDATA%\Android\Sdk
if exist "C:\Android\android-sdk" echo FOUND at C:\Android\android-sdk
if exist "C:\Users\AKHIL\AppData\Local\Android\Sdk" echo FOUND at local appdata
if not defined ANDROID_HOME echo ANDROID_HOME not set
if defined ANDROID_HOME echo ANDROID_HOME=%ANDROID_HOME%
if not defined ANDROID_SDK_ROOT echo ANDROID_SDK_ROOT not set
if defined ANDROID_SDK_ROOT echo ANDROID_SDK_ROOT=%ANDROID_SDK_ROOT%
