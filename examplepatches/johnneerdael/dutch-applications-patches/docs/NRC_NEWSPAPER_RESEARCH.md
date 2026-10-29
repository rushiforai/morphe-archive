# NRC digital newspaper delivery

Target: original NRC 5.12.24/626 (`com.twipemobile.nrc`), investigated with the leanrea workflow on 2026-10-28. This follow-up used local shipped code and two low-volume guest requests. No device, emulator, account login, purchase, receipt or fabricated authenticated session was used. Raw responses, decompiled source, identifiers and URLs containing identifiers remain in the private temporary evidence directory, outside Git.

## Finding

**Seen:** the anonymous feed supplies edition metadata and server `has_access=false` for every one of its 60 issue records. The original guest POST to the newest issue's supplied asset-discovery URL returns HTTP401 with only `{"detail":"Access denied"}`. It does not return the archive links or any newspaper files. Changing the native non-subscriber screen therefore has no demonstrated path to a complete newspaper in this guest state.

**Inferred:** newspaper delivery requires a publisher session accepted by the backend and whatever issue grant the backend applies. **Unknown:** whether a free registered account receives any editions, which subscription grants a particular issue, and how a genuine entitled session behaves. The guest401 alone does not prove a paid subscription is required. Those cases were not probed, and no account or entitlement is invented by these patches.

The user's subsequent request is handled by a separate default-enabled `Hide newspaper tab` control. It removes Krant and routes retired newspaper destinations to Nieuws. Newspaper access and transport remain unchanged; users can omit that control when they want the original newspaper navigation for a genuine account.

## Native client gate and real transport

Seen in the shipped original symbols:

1. `NRCFrontPageActivity.j1(NRCIssueState)` admits `issue.hasAccess` or an already `Downloaded` state to the reader; otherwise it pushes `NRCNonSubscriberFragment`. `NRCIssueState.Companion.deriveState` maps real `NRCFeedEntity.hasAccess` to `Downloadable` or `Purchasable`. `IssueDto` -> `IssueMapper` -> issue/feed entity preserves the server access flag.
2. `NRCApi.getFeed-bF_tnkI` GETs `api/2/` with `phone_id`. `getIssuesForMonth-x9uljoc` GETs `api/2/issues` with the same identifier and month/year. The backend host is `nh-apps-backend.nrc.nl`. The app's device identifier has a shipped random-UUID fallback; the guest probe used a newly generated identifier through that allowed shape, without borrowing a user's identity.
3. `NRCSessionInterceptor.intercept` reads the genuine `UserRepository.observeUserSession` value. Only an existing session adds the publisher cookie and `X-NRCNL-Session-ID`. The probe omitted both. Session refresh, login, account storage and purchase requests were not replaced or invoked.
4. `AssetRepositoryImpl.getAssetUrls` calls `NRCApi.getAsset`, an actual **POST** to the supplied URL with no purchase body. The separate `getAssetFromNotification` is GET; it was not substituted for the normal download request. `sendInAppPurchase-IdeofQI` is a distinct purchase operation and was not used.
5. `AssetMapper` maps the asset DTO's links into `AssetLinks`. `AssetRepositoryImpl.S` requests **both** `webp` and `content` archive URLs through streaming `NRCFileApi.getFile`. Its internal `issue` progress header is removed before the network request by the original file interceptor. `AssetRepositoryImpl.L` checks both responses, decompresses them with `GzipSource`, and extracts TAR entries. Metadata repositories then map the content metadata/page frames and WebP files into the reader. A cover or issue listing is not this completed transport.

No successful archive manifest, pair of archives, extraction, final page or actual newspaper body was received in the guest probe. Consequently no newspaper-unlock patch was implemented. The existing article control concerns independently received online article HTML and supplies no missing newspaper archive.

## Sanitized guest evidence

| Original operation | Observed result | Saved payload SHA256 |
| --- | --- | --- |
| Feed GET with fresh guest phone identifier | HTTP200; 40,986 bytes; 60 issues; all `has_access=false`; latest issue date 2026-10-28, revision2; asset-discovery URLs present | `3ee5c52ecde21daa6f8f288b819efeeedb22130cc64d6e8223d3d757e2776f8a` |
| POST newest issue's unmodified supplied asset-discovery URL using that same guest identity | HTTP401; 26 bytes; access-denied JSON; no archive-link keys and no files | `544bc38e2d87b2f32cc7e518607a01cb2bde3d6348b9bbdec0f41e7846705dac` |

The boolean feed `session` field is not an authenticated account token. No value from the feed's authentication/link fields is published or repurposed as a signed credential. Private evidence files are `re/expanded-nrc/newspaper/guest-feed.json`, `guest-assets-response.json` and their header summaries under the local temporary directory. These requests establish the observed guest failure, not universal behavior for all account states or future servers.

## Comparison with shipped Volkskrant and Trouw

**Seen:** both DPG artifacts use `nl.persgroep.edition.domaindata.edition.data.datasource.remote.PapersApi`: available paper metadata comes from `/papers/v2` (with a legacy `/papers/v1`); classic newspaper downloads stream `/papers/v1/classic/{classicPaperId}`; digital editions use `/v4/mobile-editions/{digitalPaperId}`. `ClassicPaperDownloadUseCase` delegates to the original edition repository and IO flow. `ClassicPaperLocalDataSourceImpl` saves the streamed response in `newspapers/<id>` and uses `classicPaper.pdf` plus `publication.json` for the classic reader. This differs from NRC's asset-discovery POST and paired compressed WebP/content archives.

**Seen in this repository:** the released Volkskrant and Trouw full-article patches change the online `MarketingTemplatesRouter.resolveTemplate` result. They do not replace `PapersApi`, classic newspaper downloads or a newspaper entitlement. The user's working DPG experience therefore does not demonstrate that NRC has received a complete edition behind its local screen. No DPG account session or transport was copied into NRC, and no DPG network probe was needed for this code/protocol comparison.

## Navigation follow-up

The new control filters the matching ordered bottom-menu/root factories, retaining Nieuws, Podcasts, Puzzels and Meer with original item objects and callbacks. It normalizes `READER` destinations, including the old edition-result callback, to NEWS. Initial FragNav selection is NEWS. Legacy five-stack navigation state is rebuilt through the original controller cleanup without clearing the Activity Bundle; marked four-tab state restores normally. The original non-subscriber gate, real account/session, file transport and billing remain available when that control is omitted.

Static/emitted verification and parent FULL validation cover the patch contracts. Device startup, rotation/restoration, manual login, audio and genuine entitled offline-newspaper tests remain unperformed in this task.
