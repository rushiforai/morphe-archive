#!/bin/bash
set -e
echo "Installing Android SDK..."
brew install --cask android-sdk
echo "SDK installed at:"
ls -d /Users/jonathon/Library/Android/sdk 2>/dev/null && echo "SUCCESS" || echo "FAILED"
