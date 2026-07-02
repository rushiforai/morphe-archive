# Development Container

This Docker container provides a complete Android development environment for building Morphe patches.

## Building the Container

From the repository root directory:

```bash
docker build -t morphe-patches-dev -f dev-container/Dockerfile .
```

Or from the `dev-container` directory:

```bash
docker build -t morphe-patches-dev .
```

## Running the Container

### Interactive Mode

Run the container with your source code mounted and GitHub credentials:

```bash
docker run -it --rm \
  -v "$(pwd):/home/gradle/app" \
  -e GITHUB_ACTOR="your-github-username" \
  -e GITHUB_TOKEN="your-github-token" \
  morphe-patches-dev
```

On Windows (PowerShell):

```powershell
docker run -it --rm `
  -v "${PWD}:/home/gradle/app" `
  -e GITHUB_ACTOR="your-github-username" `
  -e GITHUB_TOKEN="your-github-token" `
  morphe-patches-dev
```

On Windows (Command Prompt):

```cmd
docker run -it --rm ^
  -v "%cd%:/home/gradle/app" ^
  -e GITHUB_ACTOR="your-github-username" ^
  -e GITHUB_TOKEN="your-github-token" ^
  morphe-patches-dev
```

**Note**: You can create a GitHub Personal Access Token (PAT) at: https://github.com/settings/tokens

### Using an Environment File

You can store your credentials in an `.env` file instead of passing them as command-line arguments.

Create a file named `.env` in your project root:

```
GITHUB_ACTOR=your-github-username
GITHUB_TOKEN=your-github-token
```

Then run the container with the `--env-file` flag:

```bash
docker run -it --rm \
  -v "$(pwd):/home/gradle/app" \
  --env-file .env \
  morphe-patches-dev
```

On Windows (PowerShell):

```powershell
docker run -it --rm `
  -v "${PWD}:/home/gradle/app" `
  --env-file .env `
  morphe-patches-dev
```

On Windows (Command Prompt):

```cmd
docker run -it --rm ^
  -v "%cd%:/home/gradle/app" ^
  --env-file .env ^
  morphe-patches-dev
```

**Important**: Add `.env` to your `.gitignore` file to avoid committing your credentials.

### Background Mode

To run in detached mode:

```bash
docker run -d --name morphe-dev \
  -v "$(pwd):/home/gradle/app" \
  -e GITHUB_ACTOR="your-github-username" \
  -e GITHUB_TOKEN="your-github-token" \
  morphe-patches-dev tail -f /dev/null
```

Then execute commands with:

```bash
docker exec -it morphe-dev /bin/bash
```

## Source Code Mounting

The container expects the source code to be mounted at:

```
/home/gradle/app
```

This is set as the working directory, so all Gradle commands will run from this location.

## Building the Project

Once inside the container, you can build the project using Gradle:

### Build All Patches

```bash
./gradlew build
```

### Build Specific Module

```bash
./gradlew :patches:build
```

### Clean Build

```bash
./gradlew clean build
```

### Generate Patch List

```bash
./gradlew :patches:generatePatchList
```

## Common Tasks

### Check Gradle Version

```bash
./gradlew --version
```

### List All Tasks

```bash
./gradlew tasks
```

### Run Tests

```bash
./gradlew test
```

## Environment Variables

The container sets the following environment variables:

- `ANDROID_HOME`: `/opt/android-sdk-linux`
- `ANDROID_SDK_ROOT`: Same as `ANDROID_HOME`
- `HOME`: `/home/gradle`
- `LANG`: `en_US.UTF-8`

### Required Environment Variables

You must pass the following environment variables when running the container:

- `GITHUB_ACTOR`: Your GitHub username (required for accessing GitHub packages)
- `GITHUB_TOKEN`: Your GitHub Personal Access Token (required for accessing GitHub packages)

These credentials are required because the project depends on GitHub Maven packages.

You can provide these variables either via:
- Command-line flags: `-e GITHUB_ACTOR="username" -e GITHUB_TOKEN="token"`
- Environment file: `--env-file .env` (see "Using an Environment File" section)

## Troubleshooting

### Permission Issues

If you encounter permission issues with Gradle files, ensure the gradlew script is executable:

```bash
chmod +x gradlew
```

### Installing Additional SDK Components

```bash
$ANDROID_HOME/cmdline-tools/bin/sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "platform-tools" "build-tools;34.0.0"
```