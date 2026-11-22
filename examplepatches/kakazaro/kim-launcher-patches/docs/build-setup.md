# Gradle authentication

This project's Morphe settings plugin requires GitHub Packages credentials during configuration, even when dependencies are cached.

1. Create a GitHub classic personal access token with the `read:packages` scope.
2. Add `gpr.user` for your GitHub username and `gpr.key` for the token to your user-level Gradle properties file. On Windows, the default path is `%USERPROFILE%\.gradle\gradle.properties`. If you set `GRADLE_USER_HOME`, use `gradle.properties` in that directory.
3. Keep the file outside the repository and restrict access to your user account and any build service that needs it.

The settings also accept `GITHUB_ACTOR` and `GITHUB_TOKEN` environment variables. Gradle properties take precedence. GitHub CLI login does not configure these values.

From the repository root, check configuration without building a bundle:

```powershell
.\gradlew.bat --no-daemon --console=plain help
```

If authentication fails, check that the token is valid and can read the required packages. `--offline` does not replace authentication.
