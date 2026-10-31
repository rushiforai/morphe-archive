{ pkgs, ... }:

{
  # The extension is an Android library built by the Morphe Gradle plugin. Only the SDK
  # platform and build tools are needed.
  android = {
    enable = true;
    platforms.version = [ "36" ];
    buildTools.version = [ "36.0.0" ];

    emulator.enable = false;
    systemImages.enable = false;
    ndk.enable = false;
    googleTVAddOns.enable = false;
    sources.enable = false;
  };

  languages.java = {
    enable = true;
    jdk.package = pkgs.jdk21;
  };

  packages = [ pkgs.gh ];

  enterShell = ''
    # Morphe's Gradle plugin and patcher are published to GitHub Packages.
    export GITHUB_ACTOR="''${GITHUB_ACTOR:-$(gh api user --jq .login 2>/dev/null)}"
    export GITHUB_TOKEN="''${GITHUB_TOKEN:-$(gh auth token 2>/dev/null)}"
  '';
}
