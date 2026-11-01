# Stockfish Native Binaries

The binaries are downloaded automatically by `.github/scripts/download_stockfish.sh`
(Stockfish 19) and bundled by the patch as `lib/<abi>/libstockfish.so`:

```
patches/src/main/resources/stockfish/arm64-v8a/stockfish    <- stockfish-android-arm64-universal
patches/src/main/resources/stockfish/armeabi-v7a/stockfish  <- stockfish-android-armv7-neon
```

SHA-256 of the release archives (verified by the script):

- arm64-universal: ebb24051aa4a222b4daaf049b882ecf1163d370c128fe02316602643f4d5e426
- armv7-neon:      47c34963f1cdf4a6af34c1b5294f7a4e2679b3eb52698c324855af2c6486024b
