{
  description = "onlynazril Patches: Kotlin + Gradle patch bundle for Android apps";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forEachSystem = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      # `nix develop` (or direnv) gives the toolchain the build and the release
      # scripts expect: Temurin 21 (AGENTS.md), Node LTS for semantic-release,
      # Python 3 for .github/scripts, and the helpers the tools use.
      #
      # Gradle is not listed on purpose: ./gradlew pins its own distribution.
      # The Android SDK is not listed either: AGP reads sdk.dir from
      # local.properties, which stays machine-local and untracked.
      devShells = forEachSystem (
        pkgs:
        let
          jdk = pkgs.temurin-bin-21;
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              jdk
              nodejs_22
              python3
              git
              gh
              jq
              curl
              unzip
              zip
            ];

            env.JAVA_HOME = jdk.home;

            shellHook = ''
              echo "onlynazril Patches dev shell"
              echo "  java:   $(java -version 2>&1 | head -n1)"
              echo "  node:   $(node --version)  npm: $(npm --version)"
              echo "  python: $(python3 --version)"
              echo
              echo "Build:  ./gradlew buildAndroid"
              echo "Bundle: patches/build/libs/patches-*.mpp"
              echo "Registry auth: set GITHUB_TOKEN, or gpr.user/gpr.key in ~/.gradle/gradle.properties."
            '';
          };
        }
      );

      formatter = forEachSystem (pkgs: pkgs.nixfmt);
    };
}
