# Sezzle Android App Hidden Feature Flags & Cohort Catalog

**Target Package:** `com.sezzle.sezzlemobile`  
**Analyzed Version:** `5.3.9` (VersionCode: `1889`)  
**Target Runtime:** React Native Fabric / Hermes Bytecode v98 (`assets/index.android.bundle`) & Dalvik (`base.apk`)  

---

## Executive Summary & Architecture

The Sezzle Android application uses a multi-tiered feature gating architecture to control rollouts, test experimental fintech products, conduct A/B tests, and conceal internal developer tools. Feature gating operates across two primary mechanisms:

```
                          [ Sezzle Backend / API ]
                                     |
                +--------------------+--------------------+
                |                                         |
                v                                         v
     [ Dynamic Feature Flags ]                  [ User Cohorts & Tags ]
  - String / JSON / Bool Properties       - Membership Arrays (`userCohorts`)
  - Redux Store: `featureFlags`           - Evaluated via `checkIfUserIsIn*Cohort`
  - Sagas: `FEATURE_FLAGS_UPDATED`        - Debugger Gating (`DG_COHORT`)
                |                                         |
                +--------------------+--------------------+
                                     |
                                     v
                       [ React Native Hooks & Views ]
               - `use*Enabled` / `use*Feature` / `use*Gate`
               - Component Conditional Mounting & Routing
```

1. **User Cohort Membership (`userCohorts` / `userCohortTags`)**:
   - The primary mechanism for significant feature gates and A/B test routing.
   - The server delivers an array of assigned cohort identifiers on session initialization (`/v1/cohort/search`, `/v1/cohort/action`).
   - Sagas and React hooks query membership via strongly typed helper predicates (`checkIfUserIsIn<Feature>Cohort` and `isIn<CohortTag>`). Overriding these cohorts changes not only what the UI renders, but what network endpoints sagas query.

2. **Dynamic Feature Flags (`getDynamicFeatureFlag` / `getStaticFeatureFlag`)**:
   - Managed via Redux state under `state.featureFlags` (`FEATURE_FLAGS_PATH`).
   - Provides granular feature switches, numerical thresholds (e.g., `CASH_ADVANCE_MAX_AMOUNT`), timeout constants (`GAMESHOW_REQUEST_TIMEOUT_MS`), and UI behavior flags.

3. **Cohort Debugger & Internal Overrides (`DG_COHORT`)**:
   - An internal on-device debugging tool (`CohortDebuggerService`) that allows developers to stage and fake membership into any catalog cohort, forcing the app to reload with gated features activated.
   - Access is strictly gated by the protected server cohort `DG_COHORT`.

---

## Top 10 Most Interesting Hidden Feature Flags

### 1. Live Interactive Video Trivia & Gameshow (`checkIfUserIsInGameshowCohort`)
- **Control Hook / Predicate:** `useGameshowEnabled`, `useGameshowEnabledIgnoreCohort`, `checkIfUserIsInGameshowCohort`
- **Internal Route / Component:** `EarnTabParamList:GameshowVideoScreen`, `GameshowEntryCard`, `GameshowStatsRow`, `GameshowDebuggerService`
- **Associated Constants / Endpoints:** `?gameId=`, `GAMESHOW_REQUEST_TIMEOUT_MS`, `gameshow-dev-mock`, `fullStoryGameshowThreshold`
- **Mechanics & Findings:**
  - Sezzle contains a full interactive live video game show built into the Earn/Rewards tab where users answer real-time trivia questions to win Sezzle Cash and loyalty rewards.
  - Implements a dedicated video screen (`GameshowVideoScreenContent`) supporting live question streaming, countdown clocks (`formatGameshowCountdown`, `formatGameshowStartTime`), request signals (`createGameshowRequestSignal`), and round-by-round statistics.
  - Includes an internal mock runner (`GameshowDebugger`) used by internal employees (`"Sezzle employees within the gameshow experiment"`) to simulate live trivia rounds on demand.

---

### 2. Sezzle Mobile MVNO Cellular Carrier Plan (`useIsSezzleMobilePlanEnabled`)
- **Control Hook / Predicate:** `useIsSezzleMobilePlanEnabled`, `checkIfUserIsInSezzleMobilePlanMemberCohort`, `checkIfUserIsInSezzleMobilePlanWaitlistCohort`, `checkIfUserIsInSezzleMobilePlanWaitlistPreviewCohort`
- **Internal Route / Component:** `MobilePlanSection`, `useIsNativePortInEnabled`, `useIsNewSezzleMobilePhonePlanLandingEnabled`, `useIsSezzleMobileFailedPaymentEnabled`
- **Associated Constants & Strings:** `join_line_plain`, `join_line_price`, `join_line_cta`, `.portingAccountNumberRequiredOrInvalid`, `.portingAccountPinRequiredOrInvalid`, `.portingAddressRequiredOrInvalid`
- **Mechanics & Findings:**
  - Sezzle developed an embedded mobile virtual network operator (MVNO) phone plan offering, allowing users to purchase monthly cellular service financed through Sezzle installment payments.
  - Features an entire native phone number porting flow (`portingBillingPinRequiredOrInvalid`, `portingDeclined`, `portingPendingOtherProvider`) to transfer existing numbers from AT&T, Verizon, T-Mobile, etc.
  - Gated across three progressive rollout tiers: active plan members (`MemberCohort`), waitlist entrants (`WaitlistCohort`), and landing page preview users (`WaitlistPreviewCohort`).

---

### 3. On-Device Cohort Debugger & Feature Override Tool (`DG_COHORT`)
- **Control Hook / Predicate:** `isInDGCohort`, `DG_COHORT`
- **Internal Route / Component:** `CohortDebuggerContent`, `CohortDebuggerServiceClass`, `CohortOverrideBanner.tsx`, `CohortRow.tsx`
- **Associated Constants & Strings:** `COHORT_CATALOG`, `COHORTS FAKED?`, `applyCohortOverridePayload`, `clearCohortOverride`, `readCohortOverride`
- **Mechanics & Findings:**
  - An internal administrative panel bundled into production builds that lists the entire `COHORT_CATALOG` with descriptions of every experimental fintech product in the app.
  - Allows internal developers to toggle ("fake") any cohort on or off, injecting local state overrides (`applyCohortOverridePayload`) and forcing an app reload to preview experimental features without server-side assignments.
  - Access is locked behind `DG_COHORT` ("Internal DG cohort (see DG_COHORT in utils/generic.ts)"). The codebase specifically notes: *"This cohort is what grants access to this debugger, so it can never be overridden. The app always receives its true server value, which is why revoking it server-side reliably locks the tool."*

---

### 4. AI Shopping Assistant & Support Chatbot (`checkIfUserIsInAIShoppingAssistantTreatmentCohort`)
- **Control Hook / Predicate:** `checkIfUserIsInAIShoppingAssistantTreatmentCohort`, `checkIfUserIsInAISupportChatbotCohort`, `useAssistantAmazonA2AEnabled`, `useSupportChatbotEnabled`
- **Internal Route / Component:** `ChatbotNavigator`, `ChatbotStack`, `ChatbotStack/ChatHome`, `ChatWelcomeView`, `ConversationsList`, `OrdersList`
- **Associated Constants / Endpoints:** `/shoppingassistant-proxy`, `CHATBOT_CONVERSATIONS`, `CHATBOT_CONVERSATION_HISTORY`, `DEFAULT_SUPPORTBOT_CONVERSATION_PATH`
- **Mechanics & Findings:**
  - An LLM-powered conversational agent embedded across two distinct surfaces:
    1. **AI Shopping Assistant:** Recommends products, finds merchant deals, compares prices, and executes Amazon App-to-App handoffs based on natural language queries (`"Chat with the Sezzle Assistant for personalized recommendations, helpful tips, product details, and more!"`).
    2. **AI Support Chatbot:** Automated support agent that resolves customer order disputes, manages payment reschedule inquiries, and escalates to human agents when needed.

---

### 5. Knot API Automated Merchant Card Switcher (`useKnotCardSwitcherEnabled`)
- **Control Hook / Predicate:** `useKnotCardSwitcherEnabled`, `useKnotActivationModalEnabled`, `useKnotActivationModalGate`
- **Internal Route / Component:** `KnotActivationModal`, `KnotEducationScreen`, `KnotEntryBanner`, `KnotMerchantStack`, `react-native-knotapi`
- **Associated Constants / Endpoints:** `/v1/shopper/knot/sessions`, `/v1/shopper/knot/switch-status`, `KNOT_SWITCH_STATUS_QUERY_KEY`
- **Mechanics & Findings:**
  - Integrates the **Knot API** SDK (`react-native-knotapi`) to allow users to automatically update their payment card across hundreds of merchant subscriptions (Netflix, DoorDash, Spotify, Amazon, Uber) with 1 click.
  - Upon virtual card issuance or renewal, Knot initiates background credential switching sessions (`/v1/shopper/knot/sessions`), routing users through bank-grade encrypted merchant login flows to swap out old cards for Sezzle Virtual Cards automatically.

---

### 6. P2P Socialization, Community Feed, & Leaderboards (`useShowSocialization`)
- **Control Hook / Predicate:** `useShowSocialization`, `useShowFriendship`, `useToggleFeedLike`, `useIsProfilePictureUploadEnabled`, `checkIfUserIsInSezzleSendCohort`
- **Internal Route / Component:** `socializationFeatures.leaderboard`, `socializationFeatures.displayNameModalV2`, `socializationFeatures.avatarPromptModal`, `P2PPaymentsFeature`
- **Associated Constants & Strings:** `socializationFeatures.leaderboard.monthlySummary.rank`, `sezzleSend.paymentPlan`, `syncContacts`, `findDuplicateContact`
- **Mechanics & Findings:**
  - Transforms Sezzle into a social payment network: includes a public purchase activity feed with like buttons (`toggleFeedLike`), friend discovery via address book syncing (`syncContacts`), customizable avatars, and display names (`displayNameModalV2`).
  - Includes a gamified monthly ranking leaderboard (`socializationFeatures.leaderboard.monthlySummary.rank`) tracking shopper activity with public/private profile controls.
  - Integrates **Sezzle Send (P2P)**: Allows users to transfer money directly to friends with installment payment funding options (`sezzleSend.paymentPlan.planEachNoFee`).

---

### 7. Instant Direct Cash Advance & Cash Advance V2 (`checkIfUserIsInCashAdvanceCohort`)
- **Control Hook / Predicate:** `useCashAdvanceEnabled`, `useCashAdvanceEntryEnabled`, `checkIfUserIsInCashAdvanceCohort`, `checkIfUserIsInCashAdvanceV2EligibleCohort`
- **Associated Constants / Endpoints:** `CASH_ADVANCE_MAX_AMOUNT`, `AMOUNT_REQUEST_SUCCESS_HTU_CLICKED`
- **Mechanics & Findings:**
  - A short-term liquidity fintech product providing instant cash advances directly deposited into the user's linked bank account, up to `CASH_ADVANCE_MAX_AMOUNT`.
  - The V2 cohort (`CashAdvanceV2EligibleCohort`) introduces dynamic eligibility scoring, instant disbursement options, and streamlined multi-installment repayment schedules.

---

### 8. WebBank FDIC-Insured High-Tier Balance Accounts (`checkIfUserIsInWebBankCohort`)
- **Control Hook / Predicate:** `checkIfUserIsInWebBankCohort`, `useWebBankFeature`, `checkIfUserIsInNewBalanceEligibleCohort`, `useNewBalanceEligibleCohort`
- **Internal Route / Component:** `useEnsureOriginalBalanceAccount`, `v2/hooks/useEnsureOriginalBalanceAccount.ts`
- **Associated Constants & Strings:** `WebBank-issued card tester cohort`, `POST /sezzle-balance/account { program: "original" }`
- **Mechanics & Findings:**
  - Transitions Sezzle from a purely virtual ledger to a bank-partnered neobank account via **WebBank**.
  - Codebase documentation reveals: *"Sezzle Balance tiering (MOBILE-13752): a user in NEITHER this cohort nor sezzle_send who has no Balance account triggers a live POST /sezzle-balance/account { program: "original" } on the Balance screen — this CREATES an account... Membership instead routes to WebBank account opening / upgrade."*
  - Unlocks WebBank-issued physical and virtual debit cards, FDIC insurance pass-through, and yield/rewards on parked balances.

---

### 9. Amazon Native App-to-App (A2A) 1-Click Checkout (`useAppToAppAndroidDeepLinkEnabled`)
- **Control Hook / Predicate:** `useAppToAppAndroidDeepLinkEnabled`, `useAppToAppAmpOnlyEnabled`, `useAssistantAmazonA2AEnabled`, `useAppToAppCTATest1Enabled`, `useAppToAppCTATest2Enabled`, `useAppToAppCTATest3Enabled`
- **Internal Route / Component:** `useAppToAppHiddenWebViewEnabled`, `useHiddenWebviewFixEnabled`
- **Associated Constants & Strings:** `checkIfUserIsInAnyAppToAppCTATestCohort`, `useHideFavoriteButtonForAmazonCollectionEnabled`
- **Mechanics & Findings:**
  - Replaces in-app WebView shopping for Amazon with direct Android native app-to-app deep linking.
  - Coordinates a background hidden WebView (`useAppToAppHiddenWebViewEnabled`) to capture session authentication, payment authorization, and affiliate attribution tokens before executing a native intent launch directly into the Amazon Shopping Android app.

---

### 10. Gamified Payment Streaks & Milestone Rewards (`usePaymentStreakFeature`)
- **Control Hook / Predicate:** `usePaymentStreakFeature`, `useShowPaymentStreaksBanner`, `checkIfUserIsInPaymentStreakVisibleCohort`
- **Internal Route / Component:** `paymentStreakCohort`, `getUsersPaymentStreakCohort`, `paymentStreakBenefitsWithLocale`
- **Associated Constants & Strings:** `paymentStreakBenefits`, `showPaymentStreaksBanner`
- **Mechanics & Findings:**
  - A behavioral gamification engine that tracks consecutive on-time installment payments.
  - Maintaining payment streaks unlocks tiered financial perks (`paymentStreakBenefits`), such as waived rescheduling fees (`useWaivedFeesFeature`), higher spending power limits, bonus cashback multipliers, and exclusive merchant discounts.

---

## Exhaustive Feature Flag & Cohort Inventory

### Category 1: Developer, Debugging, & QA Tools

| Feature Flag / Hook / Predicate | Gating Key / Cohort | Description & Functionality |
|---|---|---|
| `isInDGCohort` | `DG_COHORT` | Master developer cohort gating access to `CohortDebuggerService` and `httpDebugger`. |
| `checkIfUserIsInMobileEventAlertsCohort` | `MobileEventAlertsCohort` | Dispatches on-screen visual alert modals for every single Redux event/action triggered. |
| `httpMockAuthCohortSaga` / `responseOverrideAuthCohortSaga` | Auth Cohort Sagas | Intercepts HTTP authentication calls for mock responses and proxy routing. |
| `isAccountDetailMockEnabled` | `isAccountDetailMockEnabled` | Replaces live account balance and spending power API responses with static mock fixtures. |
| `isInstitutionsMockEnabled` | `isInstitutionsMockEnabled` | Mocks Plaid and Method financial institution list queries for offline development. |
| `useFPSTrackingEnabled` | `isFPSTrackingEnabled` | Renders a live real-time FPS and JS thread frame-drop monitor over the UI. |
| `useRageClickTrackingEnabled` | `isRageClickTrackingEnabled` | Detects repeated rapid user taps on unresponsive components and logs FullStory diagnostics. |
| `useShakeToFeedbackFeature` | `ShakeToFeedback` | Listens to device accelerometer shake gestures to trigger an internal bug reporting modal. |
| `useAppCheckAutoRefreshDebugTokenFixEnabled` | `AppCheckAutoRefreshDebugTokenFix` | Automatically injects and refreshes Firebase AppCheck debug tokens on emulator builds. |
| `isInstrumentationEnabled` | `isInstrumentationEnabled` | Enables deep performance profiling on React Native Fabric UI tree mounting. |

---

### Category 2: Financial Products, Credit, & Underwriting

| Feature Flag / Hook / Predicate | Gating Key / Cohort | Description & Functionality |
|---|---|---|
| `checkIfUserIsInCashAdvanceCohort` | `cash_advance` | Enables instant cash advance program up to `$CASH_ADVANCE_MAX_AMOUNT`. |
| `checkIfUserIsInCashAdvanceV2EligibleCohort` | `cash_advance_v2` | Gated rollout for V2 cash advances with automated recurring repayments and instant bank deposits. |
| `checkIfUserIsInPagayaEligibleCohort` | `pagaya_eligible` | Routes credit underwriting and spending power increases through the **Pagaya AI** credit network. |
| `checkIfUserIsInPagayaAmountTestCohort` | `pagaya_amount_test` | A/B test evaluating variable credit line ceilings generated by Pagaya algorithms. |
| `checkIfUserIsInMethodFiInstantLinkMobileCohort` | `method_fi_instant_link` | Connects **Method Financial** API for automated liability tracking and loan debt paydown. |
| `checkIfUserIsPlaidIdentityCohort` | `plaid_identity` | Evaluates user KYC verification via Plaid Identity rather than manual document upload. |
| `checkIfUserIsInWebBankCohort` | `webbank_cohort` | Upgrades users to WebBank FDIC-insured balance accounts with physical debit cards. |
| `checkIfUserIsInNewBalanceEligibleCohort` | `new_balance_eligible` | Activates redesigned Balance screen with interest-bearing savings buckets. |
| `useP2PPaymentsFeature` | `sezzle_send` | Enables peer-to-peer fund transfers funded by Sezzle Pay-in-4 installment plans. |
| `useMerchantSpendingPowerEnabled` | `merchant_spending_power` | Displays dynamic per-merchant spending limits rather than a single universal balance. |
| `useCounterOffersEnabled` | `counter_offers` | Generates alternative down-payment terms (e.g. 50% down) when standard Pay-in-4 is declined. |
| `useSplitOrderPayLaterFeature` | `split_order_pay_later` | Allows splitting high-ticket transactions across multiple cards and payment methods. |
| `useWaivedFeesFeature` | `waived_fees` | Suppresses account rescheduling and payment processing convenience fees. |
| `useSelfDeclaredAnnualIncomeEnabled` | `self_declared_income` | Collects self-reported income during checkout to recalculate instant spending limits. |
| `useIsOccupationCollectionEnabled` | `occupation_collection` | Gathers occupation and employment status for compliance and credit expansion. |

---

### Category 3: AI, Conversational, & Machine Learning

| Feature Flag / Hook / Predicate | Gating Key / Cohort | Description & Functionality |
|---|---|---|
| `checkIfUserIsInAIShoppingAssistantTreatmentCohort` | `ai_shopping_assistant` | Activates AI Shopping Companion for deal finding, item curation, and price matching. |
| `checkIfUserIsInAISupportChatbotCohort` | `ai_support_chatbot` | Unlocks conversational AI customer support agent with live order management capabilities. |
| `useAssistantAmazonA2AEnabled` | `assistant_amazon_a2a` | Enables AI Assistant to execute Amazon item deep-linking and cart synchronization. |
| `useSupportChatbotEnabled` | `support_chatbot` | Mounts dedicated `ChatbotStack` and chatbot home screen in Account / Help tab. |
| `useConversationQueryGate` | `conversation_query` | Streams token-by-token LLM conversational responses over WebSocket/SSE. |

---

### Category 4: Gamification, Social, & Community

| Feature Flag / Hook / Predicate | Gating Key / Cohort | Description & Functionality |
|---|---|---|
| `checkIfUserIsInGameshowCohort` | `gameshow_cohort` | Mounts live interactive video quiz show in Earn tab. |
| `useGameshowEnabledIgnoreCohort` | `gameshow_dev_override` | Forces gameshow participation regardless of server cohort assignment. |
| `useShowSocialization` | `socialization_feed` | Displays peer purchase activity, comments, and transaction likes. |
| `useShowFriendship` | `socialization_friends` | Allows adding friends, viewing friend profiles, and syncing phone contacts. |
| `useToggleFeedLike` | `feed_likes` | Enables liking and interacting with public purchase events on the social feed. |
| `usePaymentStreakFeature` | `payment_streaks` | Gamified streak counter awarding badges and fee waivers for consecutive on-time payments. |
| `useShowPaymentStreaksBanner` | `payment_streaks_banner` | Renders the animated streak progress banner on Home and Wallet tabs. |
| `useMarketingGiveawayOptIn` | `marketing_giveaway` | Enables in-app sweepstakes and giveaway registration flows. |
| `useShowArcadeDollarValue` | `arcade_dollar_value` | Displays arcade reward point balances directly as equivalent USD currency values. |
| `useShowAsAdjoePoints` / `useShowZogoAsPoints` | `points_conversion` | Converts third-party reward points (Adjoe/Zogo) into native Sezzle Points. |

---

### Category 5: Cellular, Hardware, & Telecom

| Feature Flag / Hook / Predicate | Gating Key / Cohort | Description & Functionality |
|---|---|---|
| `useIsSezzleMobilePlanEnabled` | `sezzle_mobile_plan` | Activates Sezzle Mobile carrier phone plan purchasing and monthly installment billing. |
| `checkIfUserIsInSezzleMobilePlanMemberCohort` | `mobile_member` | Dedicated dashboard and SIM management for active phone plan subscribers. |
| `checkIfUserIsInSezzleMobilePlanWaitlistCohort` | `mobile_waitlist` | Waitlist onboarding screen for users queued for mobile plan rollout. |
| `useIsNativePortInEnabled` | `native_port_in` | Native in-app porting interface for carrier telephone numbers. |
| `useIsSezzleMobileFailedPaymentEnabled` | `mobile_failed_payment` | Automated plan suspension warning and recovery UI for missed phone plan payments. |

---

### Category 6: E-Commerce, Merchant Integrations, & Search

| Feature Flag / Hook / Predicate | Gating Key / Cohort | Description & Functionality |
|---|---|---|
| `checkIfUserIsInUnifiedSearchTreatmentCohort` | `unified_search` | Global unified search indexing merchant products, gift cards, and affiliate stores. |
| `useProductTabInNavBarEnabled` | `product_nav_bar` | Adds a dedicated "Products" shopping tab to the primary bottom navigation bar. |
| `useShopProductMarketPlaceEnabled` | `shop_product_marketplace` | Converts store directory into a multi-merchant product marketplace with direct cart checkout. |
| `useProductPriceComparisionEnabled` | `price_comparison` | Compares prices for the same item across Target, Walmart, Amazon, and Best Buy in-app. |
| `useAutofillCouponsFeatureEnabled` | `autofill_coupons` | In-app browser automated coupon discovery and checkout code injection. |
| `useAmazonNavigationEnabled` | `amazon_navigation` | Specialized routing and header optimizations for the Amazon in-app browser experience. |
| `useAmazonSingleClickInterstitialEnabled` | `amazon_single_click` | 1-click interstitial for instant virtual card generation upon entering Amazon. |
| `useKnotCardSwitcherEnabled` | `knot_card_switcher` | 1-click automatic card updating across subscription merchants via Knot API. |
| `useAllStoresFeature` / `useAllStoresWebviewGate` | `all_stores_gate` | Unlocks full uncurated global merchant directory in the in-app browser. |
| `useCJAffiliationEnabled` / `useWebviewAffiliationEnabled`| `affiliate_tracking` | Injects CJ / Connexity affiliate commission tokens into browser navigation requests. |

---

### Category 7: Gift Cards & Anti-Scam Protections

| Feature Flag / Hook / Predicate | Gating Key / Cohort | Description & Functionality |
|---|---|---|
| `checkIfUserIsInGCMallTest` | `gc_mall_test` | Dedicated Gift Card Mall grid interface with category filtering and brand search. |
| `useGCMallTest1AEnabled` / `useGCMallTest1BEnabled` | `gc_mall_variants` | A/B testing gift card purchasing layouts (carousel vs. vertical grid). |
| `useGCScamAlertEnabled` | `gc_scam_alert` | Displays mandatory fraud and IRS/imposter scam warnings before high-value gift card purchases. |
| `useGiftCardRedesignFeature` | `gc_redesign` | Modernized digital gift card claim and redemption interface with animated barcode delivery. |
| `useGiftCardRedesignTermsAcknowledgementFeature` | `gc_terms_ack` | Requires explicit user checkbox consent to non-refundable gift card terms before charge. |

---

### Category 8: Card Products, Subscriptions, & Loyalty Tiers

| Feature Flag / Hook / Predicate | Gating Key / Cohort | Description & Functionality |
|---|---|---|
| `checkIfUserIsInAnywhereWithServiceFeeCohort` | `anywhere_service_fee` | Allows issuing Sezzle Anywhere Virtual Cards that include a flat per-transaction fee. |
| `checkIfUserIsInCAVCEligibleCohort` | `ca_vc_eligible` | Canadian Virtual Card program with cross-border CAD/USD currency conversion. |
| `checkIfUserIsInOnDemandCohort` | `on_demand` | Unlocks "On Demand" dynamic single-use card generation without upfront order approval. |
| `isInPremiumAnnualPayInFullCohortTag` | `premium_annual_pif` | Annual Sezzle Premium subscription offering with single upfront discounted payment. |
| `isInPremiumAnnualOnlyPayInFourCohortTag` | `premium_annual_pi4` | Annual Sezzle Premium subscription split into 4 installment payments. |
| `isInPremiumMonthlySevenDayTrialCohortTag` | `premium_7d_trial` | 7-day free trial on monthly Sezzle Premium subscription join modal. |
| `isInPremiumMonthlyThreeDayTrialCohortTag` | `premium_3d_trial` | 3-day free trial on monthly Sezzle Premium subscription join modal. |
| `useSubscriptionSaverPreviewTreatmentCohort` | `subscription_saver` | Displays estimated annual savings calculator during subscription checkout. |
| `useSingleUseCardByDefaultEnabled` | `single_use_by_default` | Automatically defaults in-store purchases to single-use virtual cards rather than multi-use. |
| `useUnlockVcViewV2Enabled` | `unlock_vc_v2` | Biometric-protected card detail reveal screen showing full PAN, CVV, and expiration. |

---

### Category 9: Authentication, Passkeys, & Security

| Feature Flag / Hook / Predicate | Gating Key / Cohort | Description & Functionality |
|---|---|---|
| `usePasskeyManagementFeature` | `passkey_management` | Enables FIDO2 / WebAuthn passwordless passkey registration and biometric authentication. |
| `usePushToVerifyFlowEnabled` | `push_to_verify` | Push-based multi-factor authentication (MFA) sending instant authorization prompts to the device. |
| `isInSeamlessLoginRollout` | `seamless_login` | Zero-tap authentication utilizing secure hardware-backed tokens to bypass OTP entry. |
| `useSimpleSignupOAuthFeature` | `simple_signup_oauth` | Streamlined 1-tap registration via Google Sign-In and Apple OAuth (`useAppleOAuthFeature`). |
| `useEmailOTPOAuthBackupFeature` | `email_otp_backup` | Fallback email OTP verification when SMS delivery fails or carrier verification is unavailable. |
| `useIsRecaptchaV3Enabled` | `recaptcha_v3` | Silent background Google reCAPTCHA v3 risk assessment during login and card addition. |
| `useIsOscilarEnabled` | `oscilar_fraud` | Real-time device fingerprinting and behavioral fraud analysis via Oscilar SDK. |
| `useIsSmpSecuritySettingsEnabled` | `smp_security_settings` | Advanced security dashboard for managing active sessions, trusted devices, and passkeys. |

---

### Category 10: UI/UX Modernization & Navigation

| Feature Flag / Hook / Predicate | Gating Key / Cohort | Description & Functionality |
|---|---|---|
| `useIsDarkModeEnabled` | `dark_mode` | Full application dark theme with dynamic cache management (`getDarkModeFeatureFlagCache`). |
| `useNewIllustrationsEnabled` | `new_illustrations` | Replaces legacy 2D iconography with modern 3D illustrated assets. |
| `useNewLandingScreenDefaultEnabled` | `new_landing_default` | Redesigned post-login landing dashboard prioritizing spending power and active payment schedules. |
| `useOrdersTabNextPhaseEnabled` | `orders_tab_next_phase` | Overhauled Orders tab with real-time package delivery tracking, receipt parsing, and dispute management. |
| `useGorhomBottomSheetEnabled` | `gorhom_bottom_sheet` | High-performance native bottom sheet modal transitions powered by `@gorhom/bottom_sheet`. |
| `useSpeedUpScrollEnabled` | `speed_up_scroll` | Optimized FlatList and ScrollView deceleration rates for faster catalog browsing. |
| `useLandingPageAnimationsEnabled` | `landing_animations` | Reanimated spring physics on spending power counters and card carousel mounting. |
| `useIsUSSpanishEnabled` | `us_spanish` | Full US Spanish localization override throughout the React Native bundle. |

---

### Category 11: In-App Marketing, Popovers, & Soft Opt-in Prompts

| Feature Flag / Hook / Predicate | Gating Key / Cohort | Description & Functionality |
|---|---|---|
| `useSelectPopupOffers` | `popup_offers` | Selects and serves in-session merchant discount popovers and promotional offer modals. |
| `useStoreOfferModalConfig` | `store_offer_modal` | Supplies banner and modal configuration for store-specific promotional discount popups. |
| `useWebviewDealsPopoverConfig` | `webview_deals_popover` | Controls floating merchant deals popover during in-app webview checkout sessions. |
| `useIsNewOfferModalEnabled` | `new_offer_modal` | Toggles rendering of the refreshed full-screen deal offer modal. |
| `useSingleMerchantDeal` | `single_merchant_deal` | Injects individual promotional merchant deals into browsing and store navigation stacks. |
| `useKnotActivationModalEnabled` | `knot_activation_modal` | Displays Knot merchant account auto-linking prompt dialogs to synchronize card details. |
| `useKnotActivationModalGate` | `knot_modal_gate` | Gates post-transaction Knot card-switching modals. |
| `useKnotBannerVisibility` | `knot_banner` | Controls visibility of persistent Knot promotional banners. |
| `useWalletMarketingMerchants` | `wallet_marketing` | Injects promotional merchant recommendations into wallet and payment method screens. |
| `useWalletEmptyStateMarketing` | `wallet_empty_marketing` | Renders marketing promotions and card affiliate links in empty wallet states. |
| `useOfferBoostBanner` | `offer_boost_banner` | Displays promotional boost banners on merchant store details screens. |
| `useConvertPointsToSpendBanner` | `points_to_spend_banner` | Promotional banner prompting users to convert points to spending power. |
| `usePlaytimeCampaigns` | `playtime_campaigns` | Fetches and renders Playtime rewards campaign listings in React Native UI. |
| `useTriviaGiveawayBanner` | `trivia_giveaway_banner` | Promotional banner advertising upcoming live trivia giveaway games. |
| `useTriviaLiveActivityPushToStart` | `trivia_push_to_start` | Push notification and live activity prompt encouraging users to join trivia games. |
| `useNotificationPermissions` | `notification_permissions` | Triggers pre-permission "Don't Miss Out!" marketing dialog before requesting OS notification access. |
| `NotificationPermissionModalV2` | `notification_modal_v2` | Full-screen soft opt-in dialog highlighting deals, price drops, and new feature alerts. |
| `useSyncPushPermissionWithBraze` | `braze_push_sync` | Syncs push notification permission status and tokens with Braze marketing backend. |

---

## Reverse Engineering & Patching Strategies

To modify or force any of these feature flags using Morphe patch definitions (`bytecodePatch` or `rawResourcePatch`):

### Strategy A: Hermes Bytecode Hook Modification (Recommended)
Because all React hooks compile to distinct functions in `assets/index.android.bundle` (HBC v98), any feature flag hook can be forced to return `true` or `false` by replacing its 4-byte prologue with:
- **Force Enable (`true`):** `LoadConstTrue r1` (`0x95 0x01`), `Ret r1` (`0x76 0x01`)
- **Force Disable (`false`):** `LoadConstFalse r1` (`0x96 0x01`), `Ret r1` (`0x76 0x01`)
- **Force Unmount (`undefined`):** `LoadConstUndefined r1` (`0x93 0x01`), `Ret r1` (`0x76 0x01`)

*Always invoke `editor.updateFooterHash()` after byte modification to recalculate the 20-byte SHA-1 footer digest.*

### Strategy B: Unlocking the On-Device Cohort Debugger
To unlock the built-in Cohort Debugger without server-side permission, the predicate `isInDGCohort` or `checkIfUserIsInAnyOfCohorts` can be patched in Hermes bytecode to return `true`. This mounts the `CohortDebuggerContent` panel in the app settings, allowing catalog cohorts (e.g. `gameshow_cohort`, `sezzle_mobile_plan`, `cash_advance_v2`, `webbank_cohort`, `ai_shopping_assistant`) to be activated interactively on device.

---

## Shipped Patch Cross-Reference

The Morphe patches developed in this repository directly target several of the feature gates cataloged above:

| Feature Area / Hook | Gating Mechanism | Shipped Morphe Patch | Patch File |
|---|---|---|---|
| **Development Settings** | `isInternalUser` / `eventAlerts` | [Unlock Developer Settings](patches.md#patch-unlock-developer-settings) | `patches/.../dev/UnlockDevSettingsPatch.kt` |
| **Receipt Scanner V2** | `useIsUpsideReceiptScanningEnabled` | [Unlock Receipt Scanner](patches.md#patch-unlock-receipt-scanner) | `patches/.../features/UnlockReceiptScannerPatch.kt` |
| **Launcher App Icons** | `userShouldSeeChangeAppIcon` | [Unlock Custom App Icons](patches.md#patch-unlock-custom-app-icons) | `patches/.../customization/UnlockCustomAppIconsPatch.kt` |
| **Non-AI Products Tab** | `useDiscoverTab` / `resolveShouldRenderProductsTab` | [Replace AI Discover with Products](patches.md#patch-replace-ai-discover-with-products) | `patches/.../navigation/ReplaceAiDiscoverWithProductsPatch.kt` |
| **Sezzle Mobile Cellular** | `useIsSezzleMobilePlanEnabled` | [Hide Sezzle Mobile](patches.md#patch-hide-sezzle-mobile) | `patches/.../navigation/HideSezzleMobilePatch.kt` |
| **Deals & Popovers** | `useSelectPopupOffers` / `useRoktGiveawaysEnabled` | [Remove Promos & Giveaways](patches.md#patch-remove-promos--giveaways) | `patches/.../navigation/RemovePromosAndGiveawaysPatch.kt` |
| **Rewards Navigation** | `useIsShowEarnTabEnabled` | [Remove Rewards](patches.md#patch-remove-rewards) | `patches/.../navigation/RemoveRewardsPatch.kt` |
| **Personal Finance Dashboard** | `StoreRoot` children composition | [Replace Shop with Home](patches.md#patch-replace-shop-with-home) | `patches/.../navigation/ReplaceShopWithHomePatch.kt` |
