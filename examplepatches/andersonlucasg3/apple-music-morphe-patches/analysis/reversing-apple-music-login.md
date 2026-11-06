# Engenharia reversa — login do Apple Music 7.0.0 em APK re-assinado

Pesquisa de 2026-11-05. Fontes públicas + DEX local (`.pipeline/patched/classes3.dump`).
Cada afirmação abaixo tem link ou número de linha; o que não foi verificado está marcado **UNVERIFIED**.

---

## 0. Correção do diagnóstico atual (ler primeiro)

O `HANDOFF.md` conclui que o re-sign quebra "atestado (Play Integrity/FairPlay ADI)" e que
seria preciso "bypass de atestação server-side". A evidência pública **não sustenta** isso:

| Fato | Evidência |
|---|---|
| `-45061` = `kADINotProvisioned` ("ADI machine not provisioned, expected pre-init") — erro de **estado**, não de assinatura | [lazyeel/perun `RESEARCH.md`](https://github.com/lazyeel/perun/blob/HEAD/RESEARCH.md), tabela linha 17: "−45061 = kADINotProvisioned per prior ADI research" |
| A identidade da máquina ADI é **inventada**, não derivada de hardware: `uniqueDeviceIdentifier = randomUUID()`, `adiIdentifier = 8 bytes aleatórios`, `localUserUUID = 32 bytes aleatórios` | [OpenTagViewer `docs/anisette-native-android.md`](https://github.com/parawanderer/OpenTagViewer/blob/HEAD/docs/anisette-native-android.md) §"The device identity is invented, not derived" |
| Provisionamento ADI **funciona em app Android comum, sem root**, contra os servidores vivos da Apple, rodando num Galaxy S25 arm64/Android 16 (`provisioned: session 1458087437 completed`, `ADIGetLoginCode = 0`) | mesmo doc, §7 "provisioning works end to end" |
| Não há atestação de hardware a derrotar: "there is no hardware attestation to defeat and nothing to extract from a real device. Every public Anisette server in use today runs on invented identity" | mesmo doc, §"invented identity" |
| `commerceAuthenticationFailed` **não é** um erro de anisette: existe só como constante de enum de código de erro, em `AMSException$ErrorCode` e no espelho nativo `AppleMediaServicesCore$AccountsErrorCode` | `.pipeline/patched/classes3.dump:2263548`, `:2316557` |

Ou seja: `commerceAuthenticationFailed` é o código genérico de falha de conta devolvido pelo
estado nativo de Accounts; o `-45061` do `libCoreADI` é a causa subjacente. É uma falha de
**provisionamento/ordem de init**, não de assinatura de APK. O controle do handoff (APK original
só re-assinado falha igual) é compatível com isso — o que quebra não é o atestado do ADI, é o
caminho de código que leva o app a provisionar.

**Consequência prática:** não vale insistir em fazer o `libCoreADI` nativo funcionar. O app tem
uma costura Java documentada abaixo (§4) por onde se injeta anisette sem tocar em `libCoreADI`.

> Ressalva honesta: existem duas leituras para "expected pre-init" — (a) "chamada feita antes do
> init obrigatório" e (b) "máquina não provisionada". Ambas apontam para estado/ordem, nenhuma
> para assinatura. **UNVERIFIED**: qual das duas o build Android do `libCoreADI` usa de fato.

---

## 1. Mods públicos de Apple Music Android com login funcionando

**Não existe.** O que existe é layout/compatibilidade, não login.

| Projeto | O que faz | Aplicável? |
|---|---|---|
| [coolzoojoker/apple-music-android-landscape-patcher](https://github.com/coolzoojoker/apple-music-android-landscape-patcher) — 14★, chinês, foco em **carro/TV** | Reconstrói o **6.5.0 (1580)** com assinatura local (v1+v2+v3), corrige "rede com fio detectada como offline", layout landscape, barra imersiva no perfil `car-*` | **Não para login.** `gh search code` no repo por `登录` e `anisette` → **0 resultados**. Nenhuma menção a login/anisette/ADI. Útil como referência de re-sign + head unit. |
| [megarohas/apple-music-android-tv](https://github.com/megarohas/apple-music-android-tv) | Wrapper do **web player** num WebView ("no DRM hacks") | Não — contorna o app nativo, não resolve nosso caso |
| [Dazaike/cider-patcher](https://github.com/Dazaike/cider-patcher) | Patch smali no Cider para login com `Music-User-Token` manual | Não — outro cliente, mas o padrão "token manual em vez de anisette" é uma ideia de fallback |
| XDA / fóruns | Nada específico de Apple Music + anisette | — |

Sinal indireto, **UNVERIFIED**: o patcher acima entrega Apple Music re-assinado para TVs/carros e
só faz sentido se o app for usável — mas ele **não afirma** que o login funciona, e não há issue
confirmando. Hipótese testável e barata em §6-C.

---

## 2. `libCoreADI` / `libCoreFP` / `libstoreservicescore` — engenharia reversa pública

| Achado | Detalhe | Fonte |
|---|---|---|
| Família de erros **-45xxx** é do ADI; **-42xxx** = FairPlay; **-44xxx** = Absinthe (NAC) | tabela de prefixos | [Dadoum/Provision `docs/ADI.md`](https://github.com/Dadoum/Provision/blob/HEAD/docs/ADI.md) |
| `libCoreADI.so` exporta **só 3 símbolos**: `JNI_OnLoad`, `cvu8io98wun`, `vdfut768ig` — é feita para ser carregada por uma JVM Android | os dois nomes embaralhados são os entry points reais, ofuscados "com todas as técnicas de FairPlay" | OpenTagViewer §3; `docs/ADI.md` |
| A superfície útil está em `libstoreservicescore.so`: **11 funções ADI** com nomes embaralhados (`ADILoadLibraryWithPath`=`kq56gsgHG6`, `ADISetAndroidID`=`Sph98paBcz`, `ADISetProvisioningPath`=`nf92ngaK92`, `ADIProvisioningStart`=`rsegvyrt87`, `ADIProvisioningEnd`=`uv5t6nhkui`, `ADIOTPRequest`=`qi864985u0`, `ADISynchronize`=`tn46gtiuhw`, `ADIProvisioningErase`=`p435tmhbla`, …) | nomes **não são estáveis entre builds** | OpenTagViewer §4 |
| **Ninguém neutralizou os checks** — e não há checks de assinatura/GMS no ADI para neutralizar. O gate é estado de provisionamento | "the outcome gates on missing provisioned state, not on any forgeable input", ~200 probes cirúrgicos | perun `RESEARCH.md` |
| Erros documentados da família | `-45001` parâmetros inválidos (comprimentos de identidade), `-45018` `invalidInputDataParamHeader`, `-45026` `emptySession`, `-45034` (0xffff5016) gate de flags, `-45061` `kADINotProvisioned`, `-45075` estado do `libstoreservicescore` dimensionado errado sob glibc | OpenTagViewer §7; perun |
| RE do CoreADI Windows (não Android, mas mesma família de erros) | [ionescu007/Blackwood-4NT](https://github.com/ionescu007/Blackwood-4NT); [lazyeel/perun](https://github.com/lazyeel/perun) | — |

**Aplicável?** Sim, como *diagnóstico*: `-45061` fecha a questão "é assinatura?" → **não é**.
E sim como *arquitetura*: o ADI só precisa de (identidade inventada persistida) + (profile
provisionado). Nada disso exige APK assinado pela Apple.

---

## 3. Anisette V1.5 / AMD (`X-Apple-AMD`, `X-Apple-AMD-M`)

### Especificação (verificada em código, não em fórum)

| Header | Conteúdo |
|---|---|
| `X-Apple-AMD` | OTP da loja: Base64 de envelope de **24 bytes** = `u32 version=4` + `u32 len=16` + 16 bytes OTP. **Sem** trailer de plataforma |
| `X-Apple-AMD-M` | Base64 do **machine ID de 60 bytes** devolvido pelo provisionamento |
| `X-Apple-I-MD` | equivalente GrandSlam: envelope de **28 bytes** (`version=5`, `len=16`, OTP, trailer de plataforma: Mac/iPhone `1`, Windows `2`, **Android `4`**) |
| `X-Apple-I-MD-M` | Base64 do machine ID de 60 bytes |
| `X-Apple-I-MD-RINFO` | routing info salvo do provisionamento |
| `X-Apple-AMD-Action` / `X-Apple-MD-Action` | **o servidor** manda a ação; o cliente responde com `X-Apple-AMD-Data` / `X-Apple-MD-Data` (Base64) |

Fonte: [apple-auth `docs/formats.md`](https://github.com/apple-auth/apple-auth/blob/HEAD/docs/formats.md) §"OTP envelopes and anisette headers"; e a própria implementação da Apple em
[`NSHTTPURLResponse(AMSAnisette).m`](https://github.com/EthanArbuckle/iPhone17-1_18.2_22C152_Restore/blob/HEAD/System/Library/PrivateFrameworks/AppleMediaServices.framework/NSHTTPURLResponse%28AMSAnisette%29.m),
que decide o tipo por `X-Apple-MD-Action` (=V1) vs `X-Apple-AMD-Action` (=V1.5).

**Relação AMD ↔ `X-Apple-I-MD`:** mesmo material (machine ID + OTP por contador de 30 s), envelope
e versão diferentes, e **profiles ADI separados**. `adi.pb` tem record `profile` = `-2`
(GrandSlam) ou `-1` (Store), e o `secondary` muda: 400 B Mac/iPhone, 208 B Windows, **384 B
Android**, e **272 B** para o profile Store. Store **não usa** ADI de GrandSlam.

No app, o seletor é `EncodeHTTPRequestTask$AnisetteType`: `None=0`, `V1=1`, `V1_5=2`
(`.pipeline/patched/classes3.dump:2494812`). Confirma que V1.5 é um modo por requisição.

### Servidores públicos: **nenhum entrega AMD**

`Dadoum/anisette-v3-server` e `SideStore/omnisette-server` só falam **anisette-v1 (provision) e
v3** — GrandSlam. `AMD` aparece 0× no README do omnisette e 1× no do anisette-v3 (num contexto
não relacionado). Isso confirma o achado do handoff: `ani.sidestore.io` **não pode** suprir o
passo de commerce.

### Quem entrega AMD, hoje

| Projeto | Status | Aplicável? |
|---|---|---|
| **[apple-auth/apple-auth](https://github.com/apple-auth/apple-auth)** — **MIT**, C++20, "runs without emulating Apple libraries" | Implementa Android ADI nativo (`src/adi/android.cpp`: estado de 384 B, hash próprio derivado de SHA-256, recuperação de chave AES-128), provisionamento SPIM→CPIM→PTM, container `adi.pb`, **headers Store `X-Apple-AMD`/`X-Apple-AMD-M`**, protocolo `android-music`, e **`X-Apple-ActionSignature` (SAP v2)** | **Sim — é o achado central.** Reimplementação limpa, licença permissiva, sem libs da Apple |
| [lbr77/anisette-js](https://github.com/lbr77/anisette-js) | Rust+WASM emulando Unicorn/ARM64 para rodar os `.so` **reais** da Apple; provisiona e gera headers | Parcial: API exposta é `X-Apple-I-MD`; tem ponte low-level (`WasmBridge`) que poderia chamar o store profile. **UNVERIFIED** se emite AMD |
| [parawanderer/OpenTagViewer](https://github.com/parawanderer/OpenTagViewer) | Prova que provisionamento ADI roda **dentro de um app Android** sem root (`app/src/main/cpp/adi.cpp`) | Sim, como prova de viabilidade e como código de referência de init |

---

## 4. `IAnisetteProvider` / `INativeAnisetteProvider` — contrato real, lido do DEX

Isto **não é especulação**: está no `classes3.dump` do próprio 7.0.0.

### `com.apple.mediaservices.amskit.fairplay.INativeAnisetteProvider` (interface, 6 métodos)
`classes3.dump:2460350`. Nomes mangled por value class; o tipo real é `long` (o `ADISessionId`).

```
dispose-VKZWuLQ(J)V
eraseProvisioning-VKZWuLQ(J) Expected
startProvisioning-4PLdz1A(J, byte[] spim) Expected   -> StartProvisionResponse(DataBuffer) = CPIM
finishProvisioning-E0BElUM(J, byte[] ptm, byte[] tk) Expected
request-VKZWuLQ(J) Expected                          -> OTPResponse(DataBuffer)
synchronize-4PLdz1A(J, byte[] sim) Expected          -> SyncResponse(DataBuffer)
```

Mapeia 1:1 no ADI nativo: `startProvisioning`→`ADIProvisioningStart`, `finishProvisioning`→
`ADIProvisioningEnd`, `request`→`ADIOTPRequest`, `synchronize`→`ADISynchronize`,
`eraseProvisioning`→`ADIProvisioningErase`.

### `com.apple.mediaservices.amskit.fairplay.IAnisetteProvider` (interface, 4 métodos, Kotlin/coroutines)
`classes3.dump:2455364` — nível mais alto, recebe `MediaAccount`/`AccountIdentity`,
`AnisetteType`, `Bag`, `AndroidBundleInfo`:

```
eraseProvisioning-4PLdz1A(long, Continuation)
provisioning(byte[] spim, MediaAccount, AnisetteType, Bag, AndroidBundleInfo, Continuation)
request-4PLdz1A(long, Continuation)
synchronize(byte[] sim, AccountIdentity, AnisetteType, Bag, AndroidBundleInfo, Continuation)
```

### Como o app escolhe — e é aqui que se injeta
`AnisetteProviderOption` é sealed com duas variantes (`classes3.dump:2458032`):
`AnisetteProvider(IAnisetteProvider)` e `BuiltInAnisetteProvider(INativeAnisetteProvider)`.
Em `AMSKit.<init>`, o app faz `AnisetteProviderAdaptor(provider)` **ou**
`NativeAnisetteProviderAdaptor(nativeProvider)` e passa para
`Session.setAnisetteProvider(...)` (`classes3.dump:2272521`–`:2272536`,
`AmsApiBuilder.nativeAnisetteProvider` em `:2238647`).

**Portanto: implementar `INativeAnisetteProvider` em Java/Kotlin e injetá-lo no `AMSKit`
substitui o `libCoreADI` por completo — o AMSCore nativo passa a usar os nossos bytes.**
O `AnisetteProvider` de fábrica (`classes3.dump:2455399`) só delega para
`amsKit.getAnisetteProvider$AMSKit_fullRelease()`.

Bônus: existe caminho separado e plugável para FPDI —
`MakeDlopenFPDIProviderKt.loadFPDIProvider(Session, libraryName)` →
`makeDlopenNativeFairPlayDeviceIdentityProvider` (`classes3.dump:2460423`), ou seja
`libCoreFP` também é carregada por nome em runtime.

---

## 5. `adi.pb` sem root — é device-bound?

**Não é bound a hardware.** É bound a um `hardware_hash` de **20 bytes gerados aleatoriamente**,
guardado no `identity.json` ao lado do `adi.pb` — "the client generates its identifiers and
binding randomly when creating a device" (apple-auth `docs/formats.md`).

O que **realmente** amarra o arquivo:

1. **`hardware_hash`** do `identity.json` — precisa ir junto com o `adi.pb`. Pair, não arquivo solto.
2. **Plataforma**: `secondary` de 384 B + trailer `4` para Android; 208 B Windows; 400 B Mac/iPhone.
3. **Protocolo**: profile `-1` (Store) vs `-2` (GrandSlam), `secondary` de 272 B no Store.

**Por isso semear `adi.pb` do iTunes Windows falha:** é profile/plataforma errados *e* o
`hardware_hash` do `identity.json` não corresponde. Se for semeado um par
`identity.json`(platform `android`, `version 4`) + `adi.pb` Android coerente, o binding fecha.

Formato: envelope `u32 version(3)` + `u32 P` + prefixo + IV 16 B + corpo AES-128-CBC + tag 20 B;
corpo = `u32 body_version=1`, `u32 outer_tag`, `u32 record_area_length`, e records
`profile`(8) / `profile_data`(60) / `secondary` / `encrypted_seed`(32) / `option`(4, opcional) /
`extra_data`(8). Detalhe completo em apple-auth `docs/formats.md`.

E é gerável sem root de três formas:
- **dentro do app** (OpenTagViewer fez, S25, sem root);
- **por emulação dos `.so` reais** (anisette-js);
- **por reimplementação** (apple-auth, `src/adi/provisioning.cpp` + `src/adi/android.cpp`).

---

## 6. As 3 abordagens mais promissoras

### A. Substituir o provider de anisette no `INativeAnisetteProvider` (recomendada)

Não portar cripto, não emular lib: transformar os 6 métodos num **cliente HTTP** de um serviço
ADI-primitivo próprio. O contrato é byte-in/byte-out e o app já faz as idas à Apple —
`startProvisioning(spim)` recebe o SPIM e precisa devolver o CPIM; `finishProvisioning(ptm,tk)`
fecha; `request()` devolve o OTP de 30 s. Um servidor baseado em **apple-auth** (MIT) guarda o
profile Android e responde a essas quatro operações.

- **Aplicável?** Sim. Não depende de root, de GMS, de assinatura, nem de API 29.
- **Implementar:** (1) subir apple-auth no PC/servidor, criar identity `android` + provisionar;
  (2) expor `POST /adi/start|finish|otp|sync` sobre `src/adi/*`; (3) no patch Morphe, trocar o
  objeto em `AnisetteProviderOption`/`AmsApiBuilder.nativeAnisetteProvider` por uma
  implementação Java que chama esse serviço.
- **Testar primeiro (barato):** confirmar que o app chega a `startProvisioning` com SPIM não-vazio.
  Se chegar, A funciona. Se não chegar, o bloqueio é antes — ver C.

### B. Fazer o ADI nativo provisionar de verdade (mais barato de testar, menos robusto)

Seguir o que o OpenTagViewer provou: init na ordem certa
(`ADILoadLibraryWithPath` → `ADISetAndroidID` → `ADISetProvisioningPath` →
`ADIProvisioningStart` → GSA → `ADIProvisioningEnd`), com comprimentos de identidade exatos
(errado ⇒ `-45001`) e diretório de provisionamento gravável.

- **Implementar:** logar o **return code de cada uma** das 11 chamadas e o caminho passado a
  `ADISetProvisioningPath`; verificar se algum arquivo nasce nesse diretório. Se `adi.pb` nunca é
  escrito, o app não está tentando provisionar (e aí o problema é decisão do app, não do ADI).
- **Cuidado:** `gsa.apple.com` não valida contra o trust store do Android (cadeia na "Apple Root
  CA" antiga). Native com libcurl próprio **ignora** `network_security_config.xml` — o
  `domain-config` para `gsd.apple.com` do patch atual não cobre isso.

### C. Testar o 6.5.0 re-assinado e diferenciar o caminho de anisette

Hipótese barata e decisiva: o patcher chinês entrega 6.5.0 re-assinado para carros/TV e o produto
só faz sentido se logar. Se 6.5.0 logar e 7.0.0 não, o delta entre as versões **é** a resposta.

- **Implementar:** instalar 6.5.0 re-assinado, tentar login, capturar log. Se logar, diffar
  `AnisetteType`/provider entre as versões (`AnisetteType.V1` vs `V1_5` é o suspeito nº 1:
  6.5.0 pode usar só V1, que os servidores públicos suprem).
- **UNVERIFIED**: não há declaração pública de que 6.5.0 re-assinado loga.

---

## 7. O que **não** fazer

- Não gastar mais tempo tentando fazer o `ani.sidestore.io` servir V1.5/AMD — ele não implementa
  AMD por design (protocolo v1/v3 é GrandSlam).
- Não semear `adi.pb` do iTunes Windows: plataforma e profile errados.
- Não procurar "bypass de atestação": não há atestação de hardware no ADI. O que existe é
  provisionamento válido ou ausência dele.
- Não instalar CA no head unit (restrição já registrada no handoff).
