<h1 align="center">
  <img src=".github/assets/logo.png" alt="Logo" width="200" />
  <br />Slick for Android
</h1>
<h3 align="center">Native <a href="https://github.com/3kh0/slick">Slick</a> mods for Slack on Android via Morphe</h3>

<p align="center">
  <a href="https://morphe.software/add-source?github=3kh0/slick-morphe&name=Slick%20Android">
    <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
  </a>
</p>

Slack should not be awful to use on Android. Let's fix that!

## Features

- Silent typing: don't send typing indicators
- Message logger: keep deleted messages and edit history
- AMOLED theme: true black dark mode for the night owls
- Custom font: choose Lexend or your own TTF/OTF
- Show pronouns next to message timestamps
- Who reacted next to reaction counts
- Anonymous file names for uploads
- Last seen: latest message activity per person
- Cache cleaner: manage Slack's cache and storage
- Feature flags: turn Slack features and experiments on or off

Open your profile in the top right, then **Preferences > Slick settings**. The older profile menu also has a direct **Slick settings** shortcut.

## Build from source

You will wanna nab a copy of JDK 21+ on Linux or macOS. I made a few handy scripts that will all the goodies into `work/`.

```sh
export JAVA_HOME=/path/to/your/awesome/jdk
bash build.sh   # writes dist/slick-android-0.0.0-dev.mpp
bash lint.sh    # format and lint (--fix to apply!)
```

## License

GPLv3, see [`LICENSE`](LICENSE). Lexend is under the [SIL Open Font License 1.1](fonts/Lexend-OFL.txt). The feature flags patch and general inspiration are from [`HagiaHaya/morphe-patches`](https://github.com/HagiaHaya/morphe-patches) (GPLv3).
