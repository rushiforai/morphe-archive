{
  description = "Development shell for emorphe-patches";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config = {
              allowUnfree = true;
              android_sdk.accept_license = true;
            };
          };
          androidPackages = pkgs.androidenv.composeAndroidPackages {
            buildToolsVersions = [ "36.0.0" ];
            platformVersions = [ "36" ];
            includeEmulator = false;
            includeSystemImages = false;
          };
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              androidPackages.androidsdk
              curl
              gh
              git
              jdk17
              jq
              nodejs_24
            ];

            shellHook = ''
              export JAVA_HOME="${pkgs.jdk17}"
              export ANDROID_HOME="${androidPackages.androidsdk}/libexec/android-sdk"
              export ANDROID_SDK_ROOT="$ANDROID_HOME"
              export GRADLE_USER_HOME="$PWD/.gradle"

              if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
                export GITHUB_ACTOR="$(gh api user --jq .login 2>/dev/null || true)"
                export GITHUB_TOKEN="$(gh auth token 2>/dev/null || true)"
              fi

              if [ -z "''${GITHUB_TOKEN:-}" ]; then
                echo "GitHub token is not exported. Run: gh auth refresh -h github.com -s read:packages"
              else
                echo "GitHub token exported for Gradle GitHub Packages access."
              fi
            '';
          };
        }
      );
    };
}
