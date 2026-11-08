# search-spike

Spike isolado da análise [`analysis/search-feasibility.md`](../analysis/search-feasibility.md):
prova que um companion com `android:sharedUserId="com.apple.android"` (mesmo UID do engine) lê o
developer token do Apple Music e chama a busca de catálogo direto na `amp-api`.

O que ele faz, em ordem:

1. lê `files/datastore/encrypted_tokens.preferences_pb` do engine (mesmo UID);
2. abre a chave AES-256 no AndroidKeyStore, alias `music_token_store_key`;
3. decifra `key_api_token_musicAndroid` e `key_music_user_token` (AES/GCM);
4. chama `GET /v1/catalog/{br,us}/search?term=daft punk&types=songs&limit=3`;
5. repete sem `Music-User-Token` (controle) e sonda o caminho 2 (reflexão).

## Build

Precisa do cert Morphe (`.companion/morphe.p12`) — sem ele o APK não entra no UID compartilhado:

```powershell
pwsh -File search-spike/build.ps1     # aapt2 -> javac -> d8 -> zipalign -> apksigner
```

## Rodar

```powershell
adb install -r search-spike/search-spike.apk
adb shell am start -n com.anderson.searchspike/.MainActivity
adb logcat -s SPK
```

Evidências: `logs/tv-api-poc.txt` (TV, API 34) e `car-poc.png` (carro, API 29 — o logcat desse ROM
não expõe as linhas do app, então a tela do spike serve de prova).

Não commitar o APK nem o keystore; o app deve ser desinstalado depois do teste.
