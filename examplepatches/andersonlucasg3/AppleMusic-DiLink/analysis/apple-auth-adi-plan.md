# apple-auth → ADI Android: análise de código, formatos, algoritmo e plano de implementação

Pesquisa de 2026-11-05 sobre `apple-auth/apple-auth` (MIT, commit `98c862f`, tag **v0.1.3**),
clonado em `.pipeline/apple-auth`. Todo número abaixo foi **lido do código-fonte citado
(`caminho:linha`)** ou **medido em execução real** contra os servidores da Apple com o código
deste repositório. O que é inferência está marcado **UNVERIFIED**.

---

## 0. Sumário executivo

| Item | Resultado |
|---|---|
| Repo clonado/estudado | `.pipeline/apple-auth` (v0.1.3) |
| Build do apple-auth no Windows | **Feito por rota alternativa**: não há MSVC nesta máquina; usei **Zig 0.14.1 (`zig c++`, target `x86_64-windows-gnu`) + mbedTLS 2.28.8**, compilando só o *core* (`src/adi/*`, `src/crypto/*`) |
| Provisionamento real | **SIM — duas identidades provisionadas nos servidores vivos da Apple**. Android/GrandSlam (platform 4, 384 B): `spim` 347 → `cpim` 276 → `ptm` 487 → `tk` 16, `Status.ec=0`. **Store/AMD (profile -1, 272 B): `spim` 347 → `cpim` 260 → `settingInfo` 375 → `transportKey` 16, HTTP 200** (§15) |
| `adi.pb` gerado | Android: **620 B**, secondary **384 B**, profile **-2**. Store: **508 B**, secondary **272 B**, profile **-1**. Round-trip de import/OTP verificado nos dois |
| Port Java | **Escrito e VALIDADO nos dois**: `AmdOtp.java` (Android) e `StoreOtp.java` (Store) reproduzem **byte a byte** o OTP do C++ usando só `javax.crypto` |
| Rota recomendada | **Rota A híbrida** (identidade provisionada no PC, port on-device só de OTP/decodificação, **sem** a camada de container) |

Artefatos:

| Arquivo | Conteúdo |
|---|---|
| `.pipeline/apple-auth-identity/device-android-1/identity.json` | identidade (v4/android, hardware_hash, device_id, lu, RINFO) |
| `.pipeline/apple-auth-identity/device-android-1/adi.pb` | profile provisionado (620 B) |
| `.pipeline/apple-auth-identity/device-android-1/profile.json` | records **decodificados** (secondary 384 B, seed, seed cifrado, machine id, OTP de teste) |
| `.pipeline/apple-auth-identity/gen_identity.cpp` | driver que faz lookup→SPIM→CPIM→PTM e exporta os arquivos |
| `.pipeline/apple-auth-identity/build.ps1` | build completo (zig + mbedtls + core) |
| `.pipeline/apple-auth-identity/java/amd/{Tables,AmdOtp}.java` | port Java **Android** validado |
| `.pipeline/apple-auth-identity/java/amd/{StoreTables,StoreOtp}.java` | port Java **Store** validado (§15) |
| `.pipeline/apple-auth-identity/device-android-store/` | identidade **Store** (identity.json v1/guid, adi.pb 508 B, profile.json decodificado) |
| `.pipeline/apple-auth-identity/device-android-1/README.md` | como verificar o artefato em 2 comandos |
| `.pipeline/apple-auth-identity/run-1/` | respostas cruas (lookup/start/finish XML, CPIM b64) |

Valores da identidade de teste (gravados em `device-android-1/`):

```
identity.json:
  version          = 4
  platform         = "android"
  device_id        = F444E733-E291-4222-9535-1C07966B1295
  local_user_hash  = D62B93168AA98C0D381FE41A12CC6A1F843C0CA109CB49714265E98B498FEB3E
  hardware_hash    = 43abbf8d3477b5d618d8b6b12fd6321b98e759d4
  routing_info     = 84215040
adi.pb             = 620 bytes (version 3, prefix 32, ct 544, tag 20)
machine id (60 B)  = 39d4eacd64e02f4239e37cfa8bac97c9773be9e0f4d34b264cd2879c03d1a144
                     1c4eab8cf3c6b8fc7e8affe841231cb7f74678f672966e9e61fea8d1
seed (32 B)        = e35b1c0e06a39e59faeec573c2c2fe3e1be03a62fefa72d48be34b336c08772b
device key (16 B)  = 363e914f26643acb4e1a5361e3930ff8     (derivada do secondary)
OTP(counter 59797207) = 72140ab4b56c144ff76da94c47c69946
X-Apple-AMD        = AAAABAAAABByFAq0tWwUT/dtqUxHxplG
X-Apple-AMD-M      = OdTqzWTgL0I543z6i6yXyXc76eD000smTNKHnAPRoUQcTquM88a4/H6K/+hBIxy390Z49nKWbp5h/qjR
```

> **Achado central que muda o escopo do port:** no DEX do próprio app, o contrato de anisette
> devolve **OTP cru + machine ID**, não o envelope de header:
> `INativeAnisetteProvider$OTPResponse` tem exatamente dois campos, `mid` (`[B`) e `otp` (`[B`)
> (`.pipeline/patched/classes3.dump:2460042`, construtor em `:43c0cc`).
> Logo, **quem monta `X-Apple-AMD`/`X-Apple-AMD-M` é o AMSCore**, e o nosso provider Java só
> precisa entregar **16 bytes de OTP** + **60 bytes de mid**. As funções de envelope do apple-auth
> (`otp_envelope`, `docs/formats.md:144-164`) **não precisam ser portadas** — servem só para
> validação cruzada. *UNVERIFIED*: que o AMSCore aplique *versão 4 sem trailer* para `X-Apple-AMD`;
> ver §9 para o teste de 1 linha que confirma.

---

## 1. Mapa do código relevante (arquivos e funções)

| Arquivo | Funções-chave | Papel |
|---|---|---|
| `src/adi/core.cpp` | `Profile::Impl::Impl` (:173-199), `import_file` (:209-216), `otp` (:237-247), `otp_envelope` (:249-259), `machine_id_header` (:265-267), `export_file` (:273-291), `ProvisioningSession` (:303-401), `finish` (:413-425) | API pública do profile/ADI |
| `src/adi/state.cpp` | `parse_state_file` (:13-43), `serialize_state_body` (:45-92), `parse_state_body` (:102-163), `compute_state_file_tag` (:165-175), `decode_state_file_body` (:187-208), `encode_state_file_body` (:210-229), `encode_bound_state_file` (:231-261), `decode_bound_state_file` (:263-275), `decode_state_seed` (:277-292), `state_file_profile_hash` (:294-309), `hash_hardware_inputs` (:311-335) | container `adi.pb`, corpo, seed |
| `src/adi/key_derivation.cpp` | `prepare_file_key_buffer` (:6-26), `prepare_file_key_input` (:28-34), `assemble_file_key_md5_message` (:36-49), `mix_file_key_state` (:51-64), `diffuse_file_key_input` (:66-75), `fold_file_key_bytes` (:77-84), `mix_file_key_input` (:86-97), `reduce_file_key_state` (:99-106), `derive_state_file_tag_key` (:108-114), `derive_file_key_digest` (:116-126), `derive_state_file_body_key` (:128-139) | **file key** (binding a `hardware_hash`) |
| `src/adi/file_key/mutation.cpp` | `mutate_file_key_state` (:30-210) | camada não-linear da file key (211 linhas de aritmética fixa) |
| `src/adi/otp.cpp` | `compute_otp_mac` (:6-18), `decode_store_secondary` (:20-42), `decode_store_device_key` (:63-79), `arithmetic_hash*` (:81-159), `expand_arithmetic_digest` (:161-170), `store_counter_message` (:172-192), `generate_store_otp` (:202-209), `mix_gsa_key_state` (:211-240), `decode_gsa_secondary` (:265-285), `decode_gsa_device_key` (:287-292), `gsa_hash*` (:294-372), `generate_gsa_otp` (:382-388) | OTP GrandSlam (Mac/Windows) e Store |
| `src/adi/android.cpp` | `android_secondary_cipher_parameters` (:7-17), `mix_android_key_state` (:19-47), `decode_android_final_round_key` (:49-58), `decode_android_device_key` (:60-65), `android_hash_round/compress` (:70-115), `android_hash` (:117-144), `generate_android_otp` (:146-154) | **OTP Android (platform 4)** |
| `src/adi/parameters.cpp` | `response_key` (:191-210), `request()` (:212-228), `selector_source()` (:230-236), `end()` (:238-250), `state()` (:252-282), `store()` (:284-301) | tabelas de parâmetros (ofuscadas) |
| `src/adi/provisioning.cpp` | `decode_provisioning_spim_material` (:93-109), `decrypt_provisioning_end_payload` (:123-141), `has_provisioning_end_packet_format` (:169-181), `verify_provisioning_end_packet` (:192-202), `decrypt_authenticated_provisioning_end_packet` (:204-228), `make_provisioning_body` (:230-258), `encrypt_provisioning_input` (:260-275), `assemble_provisioning_cpim` (:277-288), `mix_provisioning_hardware_seed` (:297-336), `make_provisioning_hardware_seed/tag` (:338-404), `make_provisioning_payload` (:416-425), `make_provisioning_response*` (:427-465), `read_provisioning_challenge_fields` (:495-512), `make_provisioning_cpim` (:514-525), `make_provisioning_start_body` (:527-538), `verify_provisioning_profile_challenge` (:540-560), `begin_provisioning_profile` (:562-587), `make_provisioned_profile` (:589-618), `finish_provisioning_profile` (:620-653) | SPIM→CPIM→PTM |
| `src/crypto/crypto.cpp` | `expand_aes128_key` (:52-72), `recover_aes128_key` (:80-99), `encrypt/decrypt_aes128_block` (:110-129,144-150) | AES + inversão do key schedule |
| `src/client/client.cpp` | `describe_device` (:21-51), identidade nova (:294-313), `device_headers` (:407-431), `provision()` (:449-488), `headers()` (:490-498) | fluxo HTTP GrandSlam |
| `src/client/store.cpp` | `provision()` android-music (:569-624), `headers()` AMD (:626-639), `prepare_sap` (:641-668), `login` (:793-898), `request` assinado (:900-962) | fluxo Store/Apple Music |
| `src/sap/signing.hpp` | `request_digest` (:17-24), `assemble_signature` (:34-47), `request_authenticator` (:51-63), `sign_request` (:65-69) | `X-Apple-ActionSignature` |
| `src/client/transport.cpp` | `apple_root_hex` (:38-64), `apple_root_g3_hex` (:68-82), `build_trust_bundle` (:93-127) | TLS (Apple Root CA + G3) |
| `src/adi/data/*.hpp` | `tables.hpp`, `android_profile_data.hpp`, `android_hash_data.hpp`, `mac_*` | tabelas (todas ofuscadas com `data_mask`) |
| `src/data_mask.hpp` | `Stream::next` (:26-33), `decode` (:41-45) | ofuscação xorshift32 das tabelas |
| `docs/formats.md` | `identity.json` (:48-77), `adi.pb` (:87-142), envelopes (:144-164), SAP (:225-244) | documentação do formato |

Os comentários do repo confirmam o alvo: `src/adi/data/android_profile_data.hpp:9` —
*"Fixed arithmetic recovered from Android Apple Music 4.9.6 (x86_64)"*.

---

## 2. `identity.json`

Campos (docs/formats.md:54-64 + `src/client/client.cpp:298-312,376-385`):

| Campo | Tipo | Origem | Uso |
|---|---|---|---|
| `version` | int | `3` p/ Mac/iPhone, `2` Windows, **`4` Android** (client.cpp:299-302) | validação do schema |
| `platform` | string | `"mac"`, `"iphone"`, `"windows"`, `"android"` (client.cpp:21-42) | seleciona preset e a **plataforma do ADI** (`provisioning_platform()`, client.cpp:395-405) |
| `device_id` | UUID 36 chars | `device_uuid()` (client.cpp:156-163): 16 bytes aleatórios com version/variant bits, hex **maiúsculo** | `X-Mme-Device-Id` (client.cpp:419) |
| `hardware_hash` | **20 bytes em 40 hex** | `random_bytes(hardware.size())` (client.cpp:308) | **binding** do `adi.pb` (file key) |
| `local_user_hash` | Mac/iPhone: Base64(device_id); outros: 64 hex maiúsculos de SHA-256(32 bytes aleatórios) (client.cpp:305-312) | | `X-Apple-I-MD-LU` |
| `mac_device` / `iphone_device` | objeto | só nos presets correspondentes | `X-MMe-Client-Info` |
| `serial_number` | opcional | opção do chamador | `X-Apple-I-SRL-NO` |
| `routing_info` | string | **devolvido no finish** (`X-Apple-I-MD-RINFO`, client.cpp:480-484) | `X-Apple-I-MD-RINFO` |

Para Android o preset é (client.cpp:37-42):

```
client_info = "<Pixel 8> <Android;14;UQ1A.240205.004> <com.apple.AuthKit/1 (com.apple.android.music/4.9.6)>"
user_agent  = "AppleMusic/4.9.6"
application = "Music"
```

O `hardware_hash` **não é derivado de hardware**: é gerado aleatoriamente e guardado. Só existe
binding criptográfico entre `identity.json` e `adi.pb` por causa dele. `local_hardware_id()`
(core.cpp:93-137) só é usado quando o chamador não fornece hash.

---

## 3. `adi.pb` — layout exato

### 3.1 Envelope (state.cpp:13-43, 231-261; docs/formats.md:93-110)

Tudo **big-endian**:

| Offset | Tam | Campo |
|---|---|---|
| `0` | 4 | `version` do container (1 ou 3; o exportador grava **3**, core.cpp:165-171) |
| `4` | 4 | `P` = tamanho do prefixo (32 no export default) |
| `8` | `P` | prefixo aleatório (entra na file key) |
| `8+P` | 16 | IV do AES-CBC |
| `24+P` | `C` | corpo cifrado (múltiplo de 16) |
| `24+P+C` | 20 | tag SHA-1/AES |

Total = `44 + P + C`. **Medido** no artefato: `P=32`, `C=544`, **620 bytes**, `iv_off=40`,
`ct_off=56`, `tag_off=600`.

### 3.2 Corpo (state.cpp:45-92; docs/formats.md:111-138)

Antes da cifra, o corpo é XOR-ado com `field_mask` (16 B, `parameters::state().schema.field_mask`):

```
u32 body_version = 1
u32 outer_tag
u32 record_area_length = 532        (para secondary 384 e sem `option`)
[tag0 u32][len=8][profile i64]      -> 12..28    profile = -2 (GrandSlam)
[tag1 u32][len=60][profile_data]    -> 28..96    60 B = machine id
[tag2 u32][len=384][secondary]      -> 96..488   384 B = material do device key
[tag3 u32][len=32][encrypted_seed]  -> 488..528
[tag4 u32][len=4][option]           (opcional; ausente aqui)
[tag5 u32][len=8][extra_data]       -> 528..544
padding até múltiplo de 16          (aqui: 0, 544 % 16 == 0)
```

`record_area_length = 8+60+size(secondary)+32+8+5*8` (state.cpp:54-55) → 532 com 384.
Com `secondary` de 272 (Store) o total é 428+12 = 440 e o arquivo fica 524 B; com 208 (Windows) 376+12=388.

O `secondary` **seleciona o algoritmo** (state.cpp:49-51, core.cpp:181-198):
`400` = Mac/iPhone, `384` = **Android**, `208` = Windows, `272` = Store.

### 3.3 Cifra do corpo (state.cpp:187-229)

`encode_state_file_body`: para cada bloco, `prev = AES128_encrypt(plain ^ mask[i%16] ^ prev_anterior)`
(CBC onde o "plaintext" já leva o `state_body_output_mask`). `decode_state_file_body` faz o inverso.
A chave do corpo vem da file key (§4).

### 3.4 Tag (state.cpp:165-185)

`tag = AES128_encrypt_1block( SHA1(file[4 .. size-20]) )[0..20]`, com chave
`derive_state_file_tag_key(file_key_16)` (MD5 de uma mensagem base de 48 bytes + digest, key_derivation.cpp:108-114).

### 3.5 De onde vem cada campo do corpo

- **`profile_data` (60 B)** = `start_body[72..132]` (provisioning.cpp:613) = `hardware_tag` (20 B) ‖
  `first_nonce` (20 B) ‖ `second_nonce` (20 B) montados em `make_provisioning_body`
  (provisioning.cpp:243-256). Ou seja: **o machine ID é gerado no cliente**, não devolvido pelo servidor.
- **`secondary` (384 B)** = `payload[4..388]` do PTM (provisioning.cpp:616).
- **`encrypted_seed` (32 B)** = `start_body[4..36]` (provisioning.cpp:615), isto é o material
  cifrado que o servidor devolve no `spim`/aceita no `cpim`.

### 3.6 Binding ao `hardware_hash` — file key (key_derivation.cpp:116-126)

Cadeia completa (tudo determinístico, entrada = `hardware_hash20` ‖ `prefixo`):

1. `prepared = file_key_preparation_base` (255 B) ⊕ hardware nas posições 0..19 ⊕ prefixo em 20..20+P-1
   (key_derivation.cpp:6-26). Se houver `binding_word` (só para nomes `adi-<hash8>.pb`, state.cpp:294-309),
   `binding = word*0x01000193 + 0x5FD5F5E1` e XOR nos 4 primeiros bytes.
2. `input = prepared[0 .. 28+P)` (key_derivation.cpp:28-34).
3. `diffuse_file_key_input(input)` → estado de 319 bytes (round-robin do input) + `mix_file_key_state`
   1276 passos: `state[i] = (s[i] ^ rotl(s[i-13],3)) + rotl(s[i-57],5) - rotl(s[i-155],7)` em bytes
   (key_derivation.cpp:51-75).
4. `mutate_file_key_state` (mutation.cpp:30-210): 128 tabelas + biases, ~34 ramos de aritmética fixa
   (xor/shift/cubo/multiplicação em bytes), produz `state[319]`, `tables[128]`, `input[16]`.
5. `reduce_file_key_state`: fold de 64+64 bytes das tabelas e 319 do estado dentro do `input` de 16 B,
   depois `mix_file_key_input` 256 passos (key_derivation.cpp:99-106, 86-97).
6. `md5_message = prepared` com XOR de `file_key_input_to_hash_mask[i%16]` e os 16 primeiros bytes
   trocados por `reduced ^ file_key_reduction_to_hash_mask` (key_derivation.cpp:36-49).
7. `file_key = MD5(md5_message)` → 16 B.
8. `body_key = AES128_encrypt(file_key ^ input_whitening)[..] ^ output_whitening` com
   `program_key` (key_derivation.cpp:128-139).
9. `tag_key = MD5(state_file_tag_key_base_message ⊕ file_key)` (key_derivation.cpp:108-114).

> **Consequência prática para o port:** a camada do §3.6 + §3.3 + §3.4 (≈600 linhas + 5 tabelas grandes)
> existe **apenas** para amarrar o arquivo ao hardware do host. No aparelho ela é dispensável: basta
> embarcar os **records decodificados** (`secondary`, `encrypted_seed`, `profile_data`) — ver
> `profile.json` gerado e §11. Isso reduz o port de ~1.500 para ~450 linhas de Java.

---

## 4. Chave AES-128 do dispositivo (Android, `secondary` = 384)

`src/adi/android.cpp`:

1. **Decifrar o secondary** (`decode_gsa_secondary`, otp.cpp:265-285) com os parâmetros de
   `android_secondary_cipher_parameters()` (android.cpp:7-17, 80 bytes de `android_profile_data::secondary_cipher`):
   `key[0..16] ‖ iv[16..32] ‖ whitening[32..48] ‖ 4 mapas de 8 bytes [48..80]`.
   Por bloco: `plain = AES_decrypt(ct); out = maps[i%4].apply(plain[i] ^ prev_ct[i] ^ whitening[i])`
   (`prev_ct` = bloco cifrado anterior). **Não** há troca `i^3` (essa é só da variante Store, otp.cpp:37).
2. **Mix** (`mix_android_key_state`, android.cpp:19-47): XOR 0x46; `feedback = s378+s286+s106+s93`;
   `s74 -= feedback`; para cada uma das **368 posições** de `mixing_positions`:
   `switch (feedback & 3) {0: +=, 1: -=, 2: ^=, 3: no-op}` e `feedback = (feedback ^ value) + 0x1B`;
   XOR 0x46 no final.
3. **Última round key** (android.cpp:49-58):
   `rk[i] = key_offsets[i] ^ mixed[sources[i][0]] ^ map(mixed[sources[i][1]] ^ mixed[sources[i][2]])`
   com `map` = `LinearByteMap` (xor das bases cujos bits estão ligados).
4. **Inverter o key schedule** (`recover_aes128_key`, crypto.cpp:80-99): 10 rounds de
   `prev[4..15] = cur[i] ^ cur[i-4]`, `T = {S[prev13]^rc, S[prev14], S[prev15], S[prev12]}`,
   `prev[0..3] = cur[0..3] ^ T`, com rc = 01,02,04,08,10,20,40,80,1B,36 (de trás para frente).

**Vetor de teste medido**: `secondary` do artefato → device key `363e914f26643acb4e1a5361e3930ff8`.

### 4.1 Seed (`decode_state_seed`, state.cpp:277-292)

`seed[32] = AES128_CBC_decrypt(encrypted_seed, key=state().seed_cipher.key, iv=state().seed_cipher.iv)`,
sem padding, encadeando o **ciphertext** anterior. Valores decodificados desta build (dos
`parameters::state()` ofuscados com semente `0xE6788D9A`):

```
seed_cipher.key = e3cb8696dcd69240310091ae69ed2ac2
seed_cipher.iv  = 5c022d990dfaacbea694e44d35c33187
```

Vetor: `encrypted_seed` do artefato → seed `e35b1c0e06a39e59faeec573c2c2fe3e1be03a62fefa72d48be34b336c08772b`.

---

## 5. OTP Android — passo a passo

`generate_android_otp(seed32, counter, device_key16)` (android.cpp:146-154):

```
counter      = floor(unix_seconds / 30)            (core.cpp:139-144; uint32)
seed_hash    = android_hash(seed)                   -> 32 B
expanded     = expand_arithmetic_digest(seed_hash)  -> 64 B
counter_msg  = store_counter_message(seed, counter) -> 55 B
otp          = compute_otp_mac( { seed_hash,
                                  android_hash(expanded),
                                  android_hash(counter_msg) }, device_key )   -> 16 B
```

### 5.1 `android_hash` — SHA-256 "torto" (android.cpp:67-144)

Mesma estrutura Merkle-Damgård do SHA-256 (bloco 64 B, big-endian, padding `0x80` + comprimento
em 64 bits no fim, big-endian), mas com **estado inicial** e **64 constantes** próprios
(`android_hash_data::initial_state` / `round_constants`) e aritmética diferente:

```
round(state, m, k):
  sigma_e   = rotr(e,25) - rotr(e,6) - rotr(e,11)
  mixed_efg = (e+g) ^ (e+f) ^ g
  first     = h + sigma_e + mixed_efg + m + k
  sigma_a   = (rotr(a,2) - rotr(a,13)) ^ rotr(a,22)
  mixed_abc = (b^c) + ((a^b) ^ (a+c))
  second    = sigma_a ^ mixed_abc
  return { first+second, a, b, c, d+first, e, f, g }

schedule(oldest, w15, w7, w2):
  first  = (rotr(w15,7) ^ rotr(w15,18)) + (w15 >>> 3)
  second = (rotr(w2,17) - rotr(w2,19)) ^ (w2 >>> 10)
  return (first ^ w7 ^ second) - oldest

compress: state_out[i] = { s0-i0, s1+i1, s2+i2, s3+i3, s4^i4, s5-i5, s6+i6, s7^i7 }
digest  = estado (8 x u32) serializado big-endian
```

Toda a aritmética é **uint32 com wrap** (em Java: `int`, e `>>>` para shift lógico).

### 5.2 `expand_arithmetic_digest` (otp.cpp:161-170)

```
para i em 0..63:
  left  = (5*i + 7)      % 32
  right = (5*i*i + 9)    % 32
  expanded[i] = digest[left] ^ ((digest[right] + 42) & 0xFF)
```

### 5.3 `store_counter_message` (otp.cpp:172-192)

```
moduli = { 0x3B9ACF71, 0x9672BB99, 0x04251CD7, 0x345D3DA7 }   (decodificados de otp.cpp:174-176)
msg[55] = 0
para i em 0..3:
  r = counter(u32) % moduli[i](u32)      // divisão sem sinal!
  msg[2i] = r >> 8 ; msg[2i+1] = r
rolling = 0x6B532D89
para index em 0..95:
  dest  = (index+7) % 55
  mixed = ((rolling ^ 0x1A) & 0xFF) + seed[(index*2+1) % 32]
  msg[dest] ^= mixed & 0xFF
  rolling ^= (msg[dest] & 0xFF) * 0x5D809044      // u32 wrap
```

### 5.4 `compute_otp_mac` (otp.cpp:6-18)

```
state = 0^16
para cada hash (3 x 32 B):
  para cada metade de 16 B:
     state ^= metade
     state = AES128_ECB_encrypt(state, device_key)
otp = state
```

Custo: 6 AES + 3 hashes por OTP (≈ dezenas de µs em Java/ARM — irrelevante para 1 header a cada 30 s).

### 5.5 Comparação com as outras plataformas

| Plataforma | `secondary` | Hash do OTP | Envelope típico |
|---|---|---|---|
| Mac/iPhone | 400 | `gsa_hash` (otp.cpp:294-372) | `X-Apple-I-MD` v5 + trailer `1` |
| Windows | 208 | `gsa_hash` | `X-Apple-I-MD` v5 + trailer `2` |
| **Android** | **384** | **`android_hash`** | **v4/v5, trailer `4`** (o app decide) |
| Store | 272 | `arithmetic_hash` (otp.cpp:81-159) | `X-Apple-AMD` v4, 24 B |

`Profile::otp` decide por `platform()` e `kind()` (core.cpp:237-247); `otp_envelope` monta
**v5+trailer para `kind()==grandslam`** e **v4 sem trailer para Store** (core.cpp:249-259) — ou seja,
**para um profile Android (grandslam) o apple-auth só sabe produzir o envelope de 28 B**, não o
`X-Apple-AMD` de 24 B. Ver §9 (é o app que monta).

---

## 6. Headers

### 6.1 `X-Apple-AMD` (24 B) e `X-Apple-AMD-M` (60 B)

- `X-Apple-AMD` = Base64( `u32 4` ‖ `u32 16` ‖ OTP(16) ) — **sem** trailer. Gerado assim no
  artefato: `AAAABAAAABByFAq0tWwUT/dtqUxHxplG`.
- `X-Apple-AMD-M` = Base64( 60 B de `profile_data` ) = `profile.machine_id_header()`
  (core.cpp:265-267).
- `X-Apple-I-MD` (GrandSlam) = Base64( `u32 5` ‖ `u32 16` ‖ OTP(16) ‖ `u32 platform` ), platform
  `1` Mac/iPhone, `2` Windows, `4` Android → 28 B. Medido: `AAAABQAAABBmUMD5e7gNF4zeCHWrYtjQAAAABA==`.
- `X-Apple-I-MD-RINFO` vem do `identity.json` (`routing_info`, provisionado).

### 6.2 `X-Apple-ActionSignature` (SAP v2)

`sap/signing.hpp`:

```
blob     = session_blob (448 ou 464 B, específico de plataforma; SapPlatform::android = 66, core.hpp:117)
digest   = SHA1(blob ‖ body_da_requisição)                       (:17-24)
message  = digest zerado até 32 B                                (:27-32)
auth     = CBD-MAC inverso: prev = nonce; para cada bloco de 16:
             prev ^= message_blk; prev = AES128_decrypt(prev, session_key)   (:51-63)
assinatura = u8(2) ‖ nonce(16) ‖ auth(16) ‖ u32(len blob) ‖ blob   (:34-47)
header   = Base64(assinatura)
```

Ou seja: `X-Apple-ActionSignature` **não** depende do ADI — depende da sessão SAP (certificado +
setup negociados com `sign-sap-setup[-cert]` do bag; store.cpp:641-668). Numa implementação
on-device que só injeta anisette, a SAP continua sendo feita pelo **próprio app** (é nativo,
`libstoreservicescore`), logo nada a portar. Se algum dia precisarmos assinar do nosso lado:
`SapSession` em `src/sap/*` + `SapPlatform::android`.

---

## 7. Provisionamento SPIM → CPIM → PTM (fluxo real, medido)

### 7.1 Endpoints (client.cpp:449-488; store.cpp:569-624)

```
GET  https://gsa.apple.com/grandslam/GsService2/lookup        -> plist com `urls`
POST <urls.midStartProvisioning>   body = plist vazio          -> Response.spim
POST <urls.midFinishProvisioning>  body = {cpim: b64}          -> Response.{tk, ptm, X-Apple-I-MD-RINFO}
```

Valores devolvidos **na execução real de hoje** (`.pipeline/apple-auth-identity/run-1/lookup.xml`):

```
midStartProvisioning  = https://gsd.apple.com/grandslam/MidService/startMachineProvisioning
midFinishProvisioning = https://gsd.apple.com/grandslam/MidService/finishMachineProvisioning
syncMachine           = https://gsd.apple.com/grandslam/MidService/syncMachine
```

Para o fluxo **Store/AMD** (Apple Music Android em `StoreProtocol::android_music`) o finish não é
esse: usa o bag (`https://init.itunes.apple.com/bag.xml?ix=6`) → `amd-finish-provisioning`, com body
`{clientData: b64(cpim), guid}` e resposta `{transportKey, settingInfo}` (store.cpp:610-623); o
profile resultante é **Store (272 B)**, não Android.

### 7.2 Formatos binários (provisioning.cpp)

| Pacote | Tam | Layout |
|---|---|---|
| **SPIM** | **347** | `u32 4` ‖ `u32 240` ‖ material[240] ‖ digest_param[16] ‖ `u32 52` ‖ `u32 4` ‖ campo ecoado[60] ‖ ... ‖ `u32 0xED9281D8` ‖ tag[20] (leitura: :495-512, verificação: :540-560) |
| **CPIM** | **276** | `[0..3]=00 00 00 05` ‖ nonce[16] em 4..20 ‖ `[23]=160` ‖ response[192] em 24..216 ‖ eco[60] em 216..276 (:277-288) |
| **PTM** | 311/375/**487**/503 | `u32 4` ‖ nonce ‖ `u32 len` em 20 ‖ ciphertext ‖ `u32 0xED9281D8` ‖ tag[20] (:169-202) |
| corpo CPIM (plain) | 160 | `u32 32` ‖ selector cifrado[32] ‖ `u32 32` ‖ session_random[32] ‖ hardware_tag[20] ‖ nonce1[20] ‖ nonce2[20] ‖ dsid i64 ‖ u32 unix ‖ u32 platform ‖ padding[12] (:230-258) |

Detalhes relevantes:

- `platform` vai **em claro** no corpo (offset 144) e determina o tamanho do profile:
  `secondary = platform==1 ? 400 : platform==4 ? 384 : 208` (provisioning.cpp:596). **Medido**:
  com `platform = 4` o servidor devolveu `ptm` de **487 B** e o payload tinha 432 B
  (384+48) — a validação `make_provisioned_profile` (:589-618) passou.
- `dsid` = `-2` (GrandSlam) gravado como `0xFFFFFFFFFFFFFFFE` (:583, :250-253).
- O `spim` autentica com `parameters::end().authentication_key` (:540-560) — é isso que prova que o
  challenge é legítimo e que a nossa implementação está correta.
- `payload = { u32 384 ‖ secondary ‖ u32 32 ‖ session_random }` e o `session_random` do resposta tem
  de casar com o do corpo enviado (:604-610).
- O material do SPIM é AES-128-CBC decifrado com `request().response.response.spim` (:93-109), e daí
  sai a chave de resposta por matrizes afins + schedule de AES invertido (:65-91).
- O `hardware_tag` = `AES128_encrypt(SHA1(mix(hardware_hash)))[..20]` (:379-404) — é o que amarra o
  profile ao `hardware_hash` **no lado do servidor** também.

### 7.3 Headers/TLS exigidos (medido)

Para o MidService de **Android** (o que usamos):

```
User-Agent: AppleMusic/4.9.6
Content-Type: application/x-www-form-urlencoded        (client.cpp:418; o corpo é plist!)
X-Mme-Device-Id: <device_id>
X-Apple-I-MD-LU: <64 hex>                              (Android; para Mac é b64(device_id))
X-MMe-Client-Info: <Pixel 8> <Android;14;UQ1A.240205.004> <com.apple.AuthKit/1 (com.apple.android.music/4.9.6)>
X-Apple-Client-App-Name: Music
X-Apple-I-Client-Time: <UTC ISO8601>
X-Apple-I-TimeZone: UTC
X-Apple-Locale: en_US
```

**TLS**: `gsa.apple.com` / `gsd.apple.com` **não** estão no trust store do Windows/Android —
`curl` direto falha com `SEC_E_UNTRUSTED_ROOT`. A cadeia fecha em **Apple Root CA** e
**Apple Root CA – G3** (o repo embute as duas: `transport.cpp:38-82`, com o comentário
*"Android MidService provisioning uses this Apple Root CA G3 chain"* em `transport.cpp:66-67`).
Com `--cacert` contendo as duas raízes (que extraí para
`.pipeline/apple-auth-identity/apple-roots.pem`), as três requisições retornaram **HTTP 200**.

> Para o app isso não importa (o Play/Android não valida esse caminho no nosso fluxo atual, e o
> provisionamento é feito fora dele), mas se algum dia formos provisionar on-device por HTTP nativo,
> será preciso empacotar as duas raízes — o `network_security_config.xml` não cobre sockets nativos.

---

## 8. Rotas A e B

### Rota A — provisionar UMA identidade no PC e embarcar `identity.json` + `adi.pb`

**O que portar para Java (mínimo real, medido):**

| Peça | Origem | Linhas Java |
|---|---|---|
| decodificar seed | state.cpp:277-292 | ~15 |
| decodificar `secondary` (AES-CBC + 4 mapas) | android.cpp:7-17, otp.cpp:265-285 | ~40 |
| `mix_android_key_state` + round key + `recover_aes128_key` | android.cpp:19-58, crypto.cpp:80-99 | ~90 |
| `android_hash` (compress/schedule/round + padding) | android.cpp:67-144 | ~90 |
| `expand_arithmetic_digest` + `store_counter_message` + MAC | otp.cpp:6-18,161-192 | ~60 |
| tabelas decodificadas | `android_profile_data` + `android_hash_data` + `state().seed_cipher` | dados |
| **Total** | | **~300-450 linhas** |

**Não precisa portar**: file key (MD5 + 319-byte diffusion + 128 tabelas de mutação), container
`adi.pb`, tag SHA-1/AES, base64 de envelope, provisioning inteiro, SAP. Foi **exatamente isso** que
validei: `java/amd/AmdOtp.java` + `Tables.java` (gerados por `gen_tables.py`) reproduzem o OTP do
C++ byte a byte, usando só `javax.crypto`.

**Custo/risco:** identidade é um *segredo estático* dentro do APK (qualquer um extrai com jadx e
pode usar o machine ID para autenticar como "nosso" dispositivo — a Apple pode inclusive revogar).
Mitigação: uma identidade por instalação (pré-gerar N e sortear), ou Rota B no futuro.

### Rota B — provisionar on-device (first run, sem PC)

Exige portar **todo** o `provisioning.cpp` (≈1.000 linhas + `request_data` de 1.020 bytes e
`end_data` de 660 bytes), além de HTTP com as raízes da Apple empacotadas e do fluxo
`start`/`finish` do MidService. Ganhos: identidade única por instalação, nada estático no APK.
Custos: muito mais superfície para erro (matrizes afins, schedule de AES invertido, framing de
PTM), dependência de rede no first-run e de os endpoints `gsd.apple.com` continuarem acessíveis do
aparelho (hoje eles **não** são confiáveis a partir do trust store do Android).

### Recomendação

**Rota A**, com dois refinamentos:

1. **Não portar o container**: embarcar `profile.json` (records decodificados: `secondary`,
   `encrypted_seed`, `profile_data`) em vez de `adi.pb`. Isso elimina a file key, o MD5 e a
   mutação — a maior parte do risco de port. Se for preferível manter o `adi.pb` por fidelidade ao
   formato do app, ele também vai (620 B) e o código Java pode decodificá-lo depois (port extra de
   ~600 linhas).
2. **Deixar o app montar os headers**: `OTPResponse(mid, otp)` (DEX) → devolver OTP de 16 B + mid de
   60 B. Se o teste mostrar que o AMSCore espera o envelope no campo `otp`, trocar por 24 B
   (`AAAAB...`) é uma linha.

Rota B fica como evolução (first-run opcional) se a identidade estática se mostrar um problema
operacional (banimento/rate-limit).

---

## 9. Como confirmar o que o app espera no campo `otp` (teste de 1 minuto)

1. No provider Java, logar `otp.length` e `mid.length` (esperado: 16 e 60).
2. Capturar o header que sai: proxy local (já existe `.pipeline/proxy`) ou log do
   `EncodeHTTPRequestTask`; comparar `X-Apple-AMD` com o nosso
   `AAAABAAAAB...` (24 B) vs `AAAABQAAABB...` (28 B).
3. Se o app mandar `X-Apple-AMD` de 24 B decodificando para o OTP de 16 B que geramos → contrato
   confirmado, nada mais a fazer.
4. Teste negativo barato: enviar OTP de um counter errado (±2) e observar
   `commerceAuthenticationFailed` — confirma que o servidor valida o OTP e que o resto do caminho
   está certo.

> **Para `dsid -1` (passo de commerce) use a identidade Store** (§15): `mid` = 60 B do profile -1,
> `otp` = 16 B. Aqui não existe ambiguidade de envelope: o formato AMD (24 B, v4, sem trailer) é
> **idêntico** ao que o apple-auth produz para `kind()==store`, então devolver OTP cru ou envelope
> dá o mesmo header. A ambiguidade de envelope (24 vs 28 B) só existe no profile Android
> (`dsid -2`, `kind()==grandslam`).

---

## 10. Build no Windows — o que é necessário e o que foi feito

### 10.1 O que o repo pede (docs/usage.md:24-31)

```
Visual Studio 2022 + vcpkg:
cmake -S . -B build/windows -A x64 -DCMAKE_TOOLCHAIN_FILE="$env:VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake"
cmake --build build/windows --config Release
```

Dependências: **CMake ≥ 3.24**, **mbedTLS 2.28/3.6** (`cmake/FindMbedTLS.cmake`), e — só para o
cliente HTTP — `curl ≥ 7.85`, `nlohmann_json ≥ 3.10`, `libplist` (`unofficial-libplist` no vcpkg)
(CMakeLists.txt:29, 102-121). `APPLE_AUTH_WITH_CLIENT=OFF` remove curl/json/plist.

### 10.2 Situação desta máquina (medida)

| Requisito | Estado |
|---|---|
| CMake | ✅ `C:\Program Files\Microsoft Visual Studio\18\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe` (não está no PATH) |
| Ninja | ✅ no mesmo diretório |
| MSVC (`cl.exe`) | ❌ **ausente** — o VS 18 Community está sem o workload C++ (`VC\Tools\MSVC` não existe); sem `vcruntime.lib`/`libc++` não há como linkar |
| WSL | ❌ `WSL_E_HYPERV_NOT_INSTALLED` (virtualização desabilitada) |
| Zig | ✅ baixado (0.14.1) em `.pipeline/toolchain` — traz libc++/libc++abi e `lld-link` |
| mbedTLS | ✅ clonado `v2.28.8` em `.pipeline/apple-auth-identity/mbedtls` |

### 10.3 Build que funcionou (`build.ps1`)

```powershell
# 1) gera include/apple_auth/export.h (o CMake gera via GenerateExportHeader)
# 2) compila cada .cpp do core com zig (libc++), cada .c do mbedtls com zig cc
zig c++ -std=c++20 -O1 -I<aa>/include -I<gen> -I<aa>/src -I<mbedtls>/include -c src/adi/core.cpp -o obj/aa_adi_core.o
zig cc  -O1 -w -I<mbedtls>/include -c mbedtls/library/aes.c -o obj/mb_aes.o
# 3) link
zig c++ obj/*.o -o gen_identity.exe -ladvapi32 -lbcrypt -lws2_32
```

Notas que custaram tempo e ficam registradas:

- `src/api/c_api.cpp` e `src/sap/*` foram **omitidos** de propósito: puxam `mbedtls_x509`/RSA/ECP
  (cadeia enorme). O core (`Profile`, `ProvisioningSession`) não precisa deles.
- Conjunto mínimo de fontes mbedTLS: `aes aesni asn1parse base64 bignum cipher cipher_wrap ccm
  chacha20 chachapoly constant_time ctr_drbg des arc4 blowfish camellia aria entropy entropy_poll
  gcm hmac_drbg md md5 oid pkcs5 platform platform_util poly1305 ripemd160 sha1 sha256 sha512 timing`.
  (Faltando qualquer um: erro de link; a lista acima fecha.)
- Zig precisa de `TMP`/`TEMP` e caches graváveis (`ZIG_LOCAL_CACHE_DIR`/`ZIG_GLOBAL_CACHE_DIR`), senão
  falha com `Permission denied`.
- `-std=c++20` não pode ser passado aos `.c` (por isso os dois laços de compilação).

### 10.4 Provisionar sem interação

`gen_identity.exe <outdir> android <cacert.pem>` faz tudo sozinho (nenhum prompt):

```
lookup HTTP 200  -> start 200 (spim 347 B) -> finish 200 (ptm 487 B, tk 16 B, RINFO 84215040)
profile kind: grandslam platform: 4 ; adi.pb 620 B ; round trip ok
```

`gen_identity.exe dump <dir>` abre o `adi.pb` com o `hardware_hash` do `identity.json` e escreve
`profile.json` com os records decodificados (é o insumo do port Java).

> Sobre "gerar a identidade sem interação": **sim**, o MidService não pede Apple ID nem 2FA — o
> `dsid` é `-2` fixo. Só depende de rede e das duas raízes da Apple.

---

## 11. Port Java — assinaturas e pseudocódigo (validado)

Arquivos: `.pipeline/apple-auth-identity/java/amd/Tables.java` (gerado) e `AmdOtp.java`.
API sugerida para o patch:

```java
final class AppleAdiOtp {
    // construtor a partir dos records decodificados (recomendado) …
    AppleAdiOtp(byte[] secondary384, byte[] encryptedSeed32);
    // … ou a partir do adi.pb cru (exige o port do container; ver §3.6)
    static AppleAdiOtp fromProfileFile(byte[] adiPb, byte[] hardwareHash20);

    byte[] otp(long unixSeconds);        // 16 B, counter = unixSeconds/30
    byte[] machineId();                  // 60 B (profile_data)
    byte[] amdHeader(long unixSeconds);  // 24 B: 00 00 00 04 00 00 00 10 || otp
    String amdHeaderBase64(long unixSeconds);
    String machineIdBase64();
}
```

Pseudocódigo do núcleo (já em Java compilando, ver `AmdOtp.java:119-259`):

```java
byte[] deviceKey(byte[] secondary) {
    byte[] plain = aesCbcDecrypt(SECONDARY_KEY, SECONDARY_IV, secondary);   // + whitening + maps
    byte[] mixed = mix(plain);                                             // 368 posições
    byte[] rk = new byte[16];
    for (i) rk[i] = KEY_OFFSETS[i] ^ mixed[SRC[i][0]] ^ linear(KEY_MAP, mixed[SRC[i][1]] ^ mixed[SRC[i][2]]);
    return recoverAes128Key(rk);                                           // 10 rounds inversos
}

byte[] otp(byte[] seed, int counter, byte[] deviceKey) {
    byte[] h0 = androidHash(seed);
    byte[] h1 = androidHash(expand(h0));
    byte[] h2 = androidHash(counterMessage(seed, counter));
    byte[] state = new byte[16];
    for (byte[] h : new byte[][]{h0, h1, h2})
        for (int off = 0; off < 32; off += 16) {
            for (int i = 0; i < 16; i++) state[i] ^= h[off + i];
            state = aesEcbEncrypt(deviceKey, state);
        }
    return state;
}
```

**Validação executada** (`java -cp classes amd.AmdOtp device-android-1/profile.json`):

```
seed match    = true
device key    = 363e914f26643acb4e1a5361e3930ff8
otp           = 72140ab4b56c144ff76da94c47c69946   (16 bytes)
otp expected  = 72140ab4b56c144ff76da94c47c69946
OTP MATCH     = true
X-Apple-AMD   = AAAABAAAABByFAq0tWwUT/dtqUxHxplG
X-Apple-AMD-M = OdTqzWTgL0I543z6i6yXyXc76eD000smTNKHnAPRoUQcTquM88a4/H6K/+hBIxy390Z49nKWbp5h/qjR
```

Cuidados de port (todos exercitados no código acima):

- uint32 → `int` com wrap natural; shift lógico é `>>>`; `rotateRight` é `Integer.rotateRight`.
- `counter % moduli[i]` é **divisão sem sinal** (`Integer.toUnsignedLong`).
- `state[i] & 0xFF` em **toda** leitura de byte (senão o sinal do `byte` contamina a aritmética).
- A recuperação da chave é o *inverso* do schedule: não troque a ordem dos rounds.
- `android_hash` **não** é SHA-256 (constantes e round diferentes) — não tente JCE.

---

## 12. Riscos e pendências

| Risco | Impacto | Mitigação |
|---|---|---|
| A identidade de teste está neste repo/diretório e pode vazar | alto (qualquer um gera OTP do "nosso" device) | tratar `device-android-1/` como segredo; gerar identidade nova por build; não comitar |
| app espera envelope no campo `otp` (não OTP cru) | login falha | teste do §9; é troca de 1 linha |
| profile Android ≠ profile Store para o passo de commerce | `commerceAuthenticationFailed` persiste | **já resolvido**: identidade **Store** provisionada e port validado (§15); usar o profile -1 quando o app chamar com dsid -1 |
| `X-Apple-I-MD-RINFO` obrigatório em alguns fluxos | rejeição | já está no `identity.json` (84215040) |
| Apple pode revogar/limitar o machine ID | perda de login | manter 2-3 identidades provisionadas de reserva; Rota B como plano B |
| Provisionamento depende de `gsd.apple.com` fora do trust store padrão | falha em runtime on-device | provisionar no PC (Rota A) resolve |
| OTP é sensível a relógio (janela de 30 s) | falha intermitente | `System.currentTimeMillis()/1000`, sem NTP próprio |
| `hardware_hash` do `identity.json` precisa ir **junto** com o profile | profile não abre | embarcar os dois; nunca re-gerar um sem o outro |
| Port do container (se optarem por `adi.pb` em vez de `profile.json`) | ~600 linhas + 5 tabelas | evitar: usar os records decodificados |

**UNVERIFIED / não coberto**

- Que o AMSCore monte `X-Apple-AMD` v4 (24 B) e não v5: evidência indireta (o header do passo de
  commerce no app; `Documentation` do próprio repo separa os dois formatos).
- Que o app aceite um provider que devolva OTP cru: o DEX mostra `OTPResponse(mid, otp)`, mas não
  li o código nativo do AMSCore que consome esses bytes (fica em `.so`).
- Que a identidade provisionada hoje continue válida indefinidamente (a Apple não documenta TTL de
  profile ADI; a literatura pública indica que é permanente até `eraseProvisioning`).
- Não testei `login` completo (Apple ID + 2FA) — fora do escopo desta tarefa e desnecessário para
  validar o material ADI.

---

## 13. Comandos para reproduzir

```powershell
# build (zig + mbedtls + core)
cd .pipeline\apple-auth-identity; pwsh -NoProfile -File .\build.ps1

# provisionar uma identidade nova (Android, platform 4) — sem interação
.\gen_identity.exe .\device-android-2 android .\apple-roots.pem

# decodificar os records do adi.pb para profile.json (insumo do port)
.\gen_identity.exe dump .\device-android-1

# validar o port Java contra o OTP do C++
javac -d classes java\amd\Tables.java java\amd\StoreTables.java java\amd\AmdOtp.java java\amd\StoreOtp.java
java -cp classes amd.AmdOtp  device-android-1\profile.json       # Android / GrandSlam
java -cp classes amd.StoreOtp device-android-store\profile.json  # Store (-1)

# provisionar a identidade Store (bag ix=6 -> amd-finish-provisioning)
.\gen_identity.exe .\device-android-store store .\apple-roots.pem
.\gen_identity.exe dump .\device-android-store
```

## 14. Evidência de execução (registro)

```
lookup HTTP 200
start url: https://gsd.apple.com/grandslam/MidService/startMachineProvisioning
finish url: https://gsd.apple.com/grandslam/MidService/finishMachineProvisioning
start HTTP 200      spim bytes: 347
cpim bytes: 276
finish HTTP 200     ptm bytes: 487   tk bytes: 16   rinfo: 84215040
profile kind: grandslam platform: 4
machine id (base64): OdTqzWTgL0I543z6i6yXyXc76eD000smTNKHnAPRoUQcTquM88a4/H6K/+hBIxy390Z49nKWbp5h/qjR
adi.pb bytes: 620
round trip ok; counter=59797204
X-Apple-I-MD  (28B): AAAABQAAABBmUMD5e7gNF4zeCHWrYtjQAAAABA==
X-Apple-AMD    (24B): AAAABAAAABBmUMD5e7gNF4zeCHWrYtjQ
```

---

## 15. Profile **Store (-1)** — o que o passo de commerce (`dsid -1`) usa

Gerado com o mesmo driver (`gen_identity.exe <dir> store apple-roots.pem`), espelhando
`src/client/store.cpp:569-624` (`StoreProtocol::android_music`). **Artefatos em
`.pipeline/apple-auth-identity/device-android-store/`.**

### 15.1 Dois bugs do fluxo Store no apple-auth (descobertos na prática)

1. **`clientData` as a plist `<string>` é rejeitado.** O upstream monta
   `{clientData: base64(cpim), guid}` e `encode_plist` serializa a base64 como `<string>`
   (store.cpp:612-616). O endpoint vivo **exige `<data>`**; com `<string>` responde
   **HTTP 400** `{"errorMessage":"Try again later.","status":-1}`. Correção aplicada no driver:
   `<key>clientData</key><data>…</data>`. (Isso explica a ressalva de `docs/store.md:138-141`,
   que admite que o caminho Store nunca foi validado cold-start.)
2. **`Content-Type` duplicado também dá 400.** O cliente do repo adiciona o header em
   `common()`/`adi_headers` e o transporte poderia duplicá-lo; o servidor responde 400.
   Corrigido com um único `Content-Type: application/x-apple-plist`.

Extras medidos: corpo **JSON** → **415**; `guid` como `<data>` → 500; `clientData` como
`<string>` → 400. Só `<data>` + `<string>` (guid) + plist bare (sem envelope `Header/Request`)
retorna 200. O corpo **não** leva `Header`/`Request` (diferente do GSA).

### 15.2 Endpoints e mensagens (medidos)

```
GET  https://init.itunes.apple.com/bag.xml?ix=6        (UA do bag: "Music/6.0 Android/14 model/Pixel 8 build/1447 (dt:66)")
     -> amd-finish-provisioning = https://auth.itunes.apple.com/auth/v1/otp/1.5/finish
     -> amd-sync-machine        = https://auth.itunes.apple.com/auth/v1/otp/1.5/sync
     -> storeFrontId            = 143441          (bag NÃO tem "amd-start-provisioning")

GET  https://gsa.apple.com/grandslam/GsService2/lookup   (headers "akd", ver store.cpp:591-601)
POST <urls.midStartProvisioning>  body = plist {Header:{},Request:{}}        -> spim (347 B)
POST amd-finish-provisioning      body = plist {clientData:<data>, guid}    -> settingInfo (375 B) + transportKey (16 B)
```

Headers do finish: `User-Agent` do bag, `Content-Type: application/x-apple-plist`,
`Accept-Language: en-US`. Headers do lookup/start (control, store.cpp:591-601):
`User-Agent: akd/1.0`, `X-Mme-Device-Id`, `X-Apple-I-MD-LU = base64(device_id)`,
`X-Apple-Client-App-Name: akd`, `X-Apple-I-Client-Time`, `X-Apple-I-TimeZone: UTC`,
`X-Apple-Locale: en_US`, `X-MMe-Client-Info: <MacBookPro18,3> <macOS;13.1;22C65>
<com.apple.AuthKit/1 (com.apple.akd/1.0)>`.

`init.itunes.apple.com` e `auth.itunes.apple.com` usam CA pública (não precisam das raízes da
Apple); só `gsa/gsd.apple.com` precisam de `--cacert apple-roots.pem`.

### 15.3 Formato gerado

```
identity.json (schema Store = 1, store.cpp:444-457):
  version       = 1
  guid          = 12 hex maiúsculos (6 bytes)      -> campo "guid" do finish e das sessões Store
  device_id     = 36 chars hex com hífens          -> X-Mme-Device-Id / X-Apple-I-MD-LU(b64)
  hardware_hash = 40 hex (20 bytes aleatórios)     -> file key do adi.pb
  (NÃO existe routing_info: os headers de Store usam só X-Apple-AMD/-M, store.cpp:626-639)
adi.pb:
  total 508 B = u32 3 | u32 32 | prefix 32 | IV 16 | ciphertext 432 | tag 20
  body 432 B = header 12 + area 420
  area 420   = profile(8+8) + profile_data(8+60) + secondary(8+272) + encrypted_seed(8+32) + extra(8+8)
  profile = -1 (0xFFFF...FF), option ausente, extra_data 0000000000000000
```

### 15.4 Cadeia de chave e OTP da Store (difere do Android)

| Etapa | Função | Particularidade |
|---|---|---|
| secondary 272 → 272 decodificados | `decode_store_secondary` (otp.cpp:20-42) | **`output[offset + (index ^ 3)]`** (swap de byte) e CBC com `previous = ciphertext` |
| 272 → device key 16 | `decode_store_byte_maps` (otp.cpp:44-61) + `decode_store_device_key` (otp.cpp:63-79) | mapas afins derivados de `decoded[208..272]` (64 B) via `matrix_codecs`; `rk[b^3]` |
| seed | `decode_state_seed` (state.cpp:277) | **igual** ao Android (mesmas key/iv) |
| hash do OTP | `arithmetic_hash` (otp.cpp:81-159) | round/schedule/constantes **diferentes** do Android |
| mensagem do contador | `store_counter_message` (otp.cpp:172-192) | **igual** (mesmos `moduli`) |
| expansão | `expand_arithmetic_digest` (otp.cpp:161-170) | igual |
| MAC | `compute_otp_mac` (otp.cpp:6-18) | igual (6 AES) |

Fórmulas da Store (`arithmetic_hash`):

```
round: first  = h + rotr(e,25) + (rotr(e,6) ^ rotr(e,11)) + 2*g + e + (f ^ e) + m + k
       second = c - a - (a ^ c) + 2*b + rotr(a,2) - rotr(a,13) - rotr(a,22)
       -> { first+second, a, b, c, d+first, e, f, g }
schedule: first = rotr(w15,7) + rotr(w15,18) - (w15 >>> 3)
          second = rotr(w2,17) - rotr(w2,19) - (w2 >>> 10)
          return w7 - oldest + (first ^ second)
combine: { s0-i0, s1-i1, s2-i2, s3+i3, s4-i4, s5+i5, s6^i6, s7^i7 }
```

Tabelas decodificadas (sementes do `data_mask`): `store_data` (0x5D57A386),
`matrix_codecs` (0xA5B3BDDB, via visitante), `key_output_maps` (0xC9967E18),
`encoded_key_offsets` (0x37D0A4E6), `decoded_key_offsets` (0x4701AE68), `word_mask`
(0xC84575C4), `arithmetic_hash_initial_state` (0x1639292B),
`arithmetic_hash_round_constants` (0xB502C3DA). `gen_tables.py` já emite tudo em
`java/amd/StoreTables.java`.

### 15.5 Valores da identidade Store de teste

```
guid              = 4C98BE99D2B8
device_id         = 87086b80-b336-086d-de21-45fc9fd09c0f
hardware_hash     = 61d9d8936e27cc604dfa44604e2f3cf463c25093
adi.pb            = 508 bytes (secondary 272, profile -1)
seed (32 B)       = adcc628580a157ed5f8f761b9ffb09059a74ce741212ffd415d8dd46627019bb
device key (16 B) = 1a408e1da3cd6b968a66681c17d3ccde
mid (60 B)        = eShQ+kDr5bBSjVK/4+dlo17GRysC4Q4NzyIfoid211zuFx+aGbVQuloU4iLSVFodg7f2j2N37rrifHCx
counter 59797223  -> otp(hex) = 6db62777625e000063e80a344f4bd4d0
                     X-Apple-AMD (24 B) = AAAABAAAABBttid3Yl4AAGPoCjRPS9TQ
```

### 15.6 Validação do port Java (Store)

`java -cp classes amd.StoreOtp device-android-store\profile.json`:

```
kind          = store
seed match    = true
device key    = 1a408e1da3cd6b968a66681c17d3ccde
key match     = true
otp           = 6db62777625e000063e80a344f4bd4d0
OTP MATCH     = true
X-Apple-AMD   = AAAABAAAABBttid3Yl4AAGPoCjRPS9TQ
AMD MATCH     = true
X-Apple-AMD-M = eShQ+kDr5bBSjVK/4+dlo17GRysC4Q4NzyIfoid211zuFx+aGbVQuloU4iLSVFodg7f2j2N37rrifHCx
mid bytes     = 60
```

Regressão Android continua passando após a mudança (`AmdOtp` → `OTP MATCH = true`).

### 15.7 **Resposta explícita: o que o provider deve devolver para dsid -1**

| Campo de `OTPResponse(mid, otp)` | Valor | Observação |
|---|---|---|
| `mid` | **60 bytes** = `eShQ+…/qjR` (base64) | constante; é o `profile_data` do profile Store (vem do `clientData`/CPIM, não do servidor) |
| `otp` | **16 bytes**, rotativos a cada 30 s | ex. `6db62777625e000063e80a344f4bd4d0` no counter `59797223` |
| header `X-Apple-AMD` | **24 B** = `00 00 00 04` ‖ `00 00 00 10` ‖ otp | **no profile Store, o envelope do apple-auth (`otp_envelope`, core.cpp:249-259) já é exatamente isso** — nenhuma diferença entre "OTP cru" e "envelope" além dos 8 bytes de prefixo |
| header `X-Apple-AMD-M` | base64(mid) | |

Como o profile Store tem `kind()==store`, `Profile::otp_envelope` **não** adiciona o trailer de
plataforma (isso é só GrandSlam) — ao contrário do profile Android, onde o envelope do apple-auth
sai em v5/28 B. Ou seja: **para dsid -1 as duas leituras coincidem**; devolver `otp` cru e deixar
o AMSCore montar o header, ou devolver o envelope de 24 B, produz o **mesmo header**.

### 15.8 Risco novo encontrado: `synchronize` não está implementado no apple-auth

O bag expõe **`amd-sync-machine = https://auth.itunes.apple.com/auth/v1/otp/1.5/sync`** e o
contrato nativo tem `ADISynchronize` (e o DEX tem `INativeAnisetteProvider$SyncResponse`).
**Nenhuma linha do apple-auth chama/codifica esse endpoint** (grep por `syncMachine`/`synchronize`
em `src/`: 0 ocorrências). Se o servidor responder com `X-Apple-AMD-Action`/`X-Apple-MD-Action` no
meio do login, o app vai chamar `synchronize(sim)` no nosso provider — e hoje não temos material
para responder. Plano: (a) instrumentar o provider para logar quando `synchronize` é chamado e com
que bytes; (b) se for chamado, implementar `POST amd-sync-machine` com `{clientData:<data>, guid}`
(mesma forma do finish) e devolver o corpo como `SyncResponse`. **UNVERIFIED** se esse caminho é
exercitado no login só com AMD 1.5 (pode ser só para refresh de machine ID).
