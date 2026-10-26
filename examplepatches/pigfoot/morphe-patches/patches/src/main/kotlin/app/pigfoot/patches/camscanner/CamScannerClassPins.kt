package app.pigfoot.patches.camscanner

/**
 * Exact alternate DexPool encodings measured on the same qualified pristine inputs.
 * Patcher 2.0 changed its smali writer; these are not new app versions or learned pins.
 * Both readers produced identical decoded method graphs (2,826 per input).
 * Native byte hashes are never routed through this compatibility function.
 */
private val runtime2ClassPins = mapOf(
    // Lottery initialization WebView client, independently measured on pristine 72701.
    "424a01b5ab60296ce8794c67b559992f6c76545b0a19fe0e19d2061e94341fcb" to "e5ff5a7b1762abaf68ec714da5e1932940881164cc4d55ae17e25ab526b9238a",
    // Lcom/bytedance/sdk/openadsdk/ykq/ra$1;
    "06c417140a659f783554082dd6f9ee037b600956b01e6068b758d34350fefb66" to "cb59504e22bec08e63bf34c33538ae309554e036c2636a4d0a409d738f175f9b",
    // Lcom/google/ads/mediation/mintegral/rtb/MintegralRtbAppOpenAd;
    "082b906e32d03928fdbb182ff8401f246b28ed380ff86c1dce307912a2404938" to "4eb348a4533b6df706d9f29acf1f6fd159abee79df53faad79f3f1b372cca1d1",
    // Lcom/bytedance/sdk/openadsdk/api/interstitial/PAGInterstitialAd;
    "0b1adaf40864a3cf61d80b112275bcacc30b8040aa94481a69e6d201e9bafa83" to "f925a6a6a1c889a6dc7188d64ce14d8cdb305dcf33acb1dc1418c17a35e64b8a",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/admob/ad/AdMobNativeAd;
    "0fa51ca52e50bee2e169191d02f463c1b22a1b32e1a37f75ca7707ccb23f28f5" to "8051266dc662e569ac8fe0b53f0b868f03dd673c4572a35bb870c0bcbd259ba0",
    // Lcom/bytedance/sdk/openadsdk/adapter/PangleMediationAdapter;
    "1262931c144a0e278cf65872749e4bd79c4d32c503950ef7dee1fb87ac8b3b00" to "a810f44acbca42abe43531fde8ff2d08b4b0bd12d47abf7a3560e5e8185b0e7b",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/mintegral/ad/MintegralAppOpenInterstitialAd;
    "12b199f821b19e68492c7a4d41683f0c9e2f7becdf42d8b9504f8933db2d9381" to "10ec08fd1db3a58068be81ebb18a3ef75da654d3022320b8244830302906ab9e",
    // Lcom/bytedance/sdk/openadsdk/mediation/apw/ra/ci/ztx;
    "13779be5d4ae8d2cad18b5dd04db61c8bd276106e0d8b32496a527fb219ff513" to "3cd222d53ba2f3637018f3f2383325d2f1a831a6daaebc23537487db3587aa22",
    // Lcom/bytedance/sdk/openadsdk/api/open/PAGAppOpenAd;
    "14425648c7370535e8fa8e276b000651293888e1c44002d0300b7620bd0fc9ea" to "94082a74e7e5b0f6c1d1a0ba164e221672ebf99467ff6986675aecf7e8e1e4f6",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/admob/AdMobMediationAdapter;
    "16d3e08f04b222d68dd709bfcae278eaa438c0128c3c193bd15ea2913c9f7e2e" to "77c7425a825a2029af813de1bc644c27ca0a8ed0f5487922b5657e2fea13b547",
    // Lcom/intsig/crashapm/log/FabricUtils;
    "17339d9f7e313156cece65855d21c8033635e72ee7666463b8db9235e5b5c014" to "204b8cfda59f3bae1c56430f3b5bdc9e7840d2bac49df8cf6baf9ea93676abb4",
    // Lcom/google/ads/mediation/pangle/PangleMediationAdapter;
    "19d76f63a6679b6d9c58ad02aa3ba09deba91b98626991629dbe4b50e6e29ab8" to "e59f600b3b24893d397f8918da89b1524193fda2ffe43a1cf9d38ca6a6017c86",
    // Lcom/intsig/camscanner/gift/interval/IntervalTaskStateManager$getLotteryCode$1;
    "1b2984d2c03da7f980e1e5694a921f170e0e37954b5586c35c94f08f9f3b1e21" to "ca7685681be83bcd1b56a82545f91c781af95b18ff904c614ccafc75a96e7062",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/mintegral/ad/NativeBaseAd;
    "1b327f2010c98968d9904ea012dd8c35349b5a682a7343c69cf882694dc3bf03" to "5c3ed7e93c2318a9dcba9dc812e47185a49a9f1abb0a77605be56bc458acb712",
    // Lcom/bytedance/sdk/openadsdk/adapter/PangleNativeAd;
    "1beceeb9dbe389dabe1ef779c0d07a19bfe6c4a464293cabbc70095c8b50805f" to "2b5d1781376ea4f31e800c767e8a3ebd0e3e77857b21b242f8d664a3929dc981",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/vungle/ad/VungleNativeAd;
    "1d16aab1517d936664343d4f9de28e9cca0e50bb23ba4edd309ab6def60c9aaf" to "7849cbfc8d3c0a61550fe4ca50e68f664d4eee3357a7033edf05dcf443aee861",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/mintegral/ad/MintegralNativeAd;
    "1d75b9dd81b57091a1548a2895e8314f8b49ac29a43e8a6ba2c69a22699830a0" to "608f556d30c47f2dcac499a98d871b34130976e50c2247840015702b92371809",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/vungle/ad/VungleNativeBannerAd;
    "1e709c250a8702208c4e02bf76a38275c6c47304d8e6a729b9543b19ac64bb02" to "769a69912dd7a57e4d188177b5f09c02288a1f62c2de5e306840e34adcfe6195",
    // Lcom/bytedance/sdk/openadsdk/mediation/ge/ra$5;
    "1fa134f67cf62e90485e85120069f78ab5072b9b2bb081570217eda9b301a8e9" to "c22fd052ff8882bee0d441a4ce603f2740539e29d7897c68c735653eb935fd08",
    // Lcom/google/ads/mediation/mintegral/MintegralMediationAdapter;
    "20d46a18a71a49aa87d1be07fb4f9ea6a0c24e606d0e242c198e0f82ac7ae9a6" to "4ee0bc85fe6390acff83108ad2d4b3b9d459c6f82080eef783a73fd3900dbbca",
    // Lcom/bytedance/sdk/openadsdk/adapter/PangleBannerAd;
    "2256c425bbec859829457f8395fd37b5803c965cb3a4821c0b45a0459b43f975" to "2a82edac02a7b2e487bbe68331628df69f1d77835094adfe5fe5791dbd53fd1f",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/mintegral/ad/MintegralInterstitialRewardAd;
    "2b14f31cac547ab9175fb5b9bbde9a4c2f363d0ff4fa357927db2d32fe127eef" to "9f4ec61ed7370ec6ee507839abb2b220d8cb3fb3ae8f1a908565e9d394116a71",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/admob/ad/AdMobAppOpenAdImpl;
    "2eb3e27891b575793c19e17b99426bd3405d6ac6b3c592ebd37f5d47f089354c" to "3d80e6bf33d684e25cb698c5c5cf55a6f3374041dec97ca9a1d5f03aa853361a",
    // Lcom/intsig/logagent/LogAgent;
    "307db445468d2b2e5661b9fe5cc4e35eb7a37b471ffb14af9debc77a25dd8855" to "1793074f1d22b755d3362d865a6a0c0a757c6ac4bd2adbc95f00b338e3804f5b",
    // Lcom/intsig/camscanner/attention/WatchAdControl;
    "30bc95526fdbcc82ad214bdc01aab59035974e673e3e762b8769df7af883446c" to "b434dd1fb033c68003c89154776cef0d4e09cdf3d870918b12b53052c4b7c7e9",
    // Lcom/google/ads/mediation/vungle/VungleMediationAdapter;
    "32a1457a798ae9d5515722257711c61296ffbcf07fe4a8f1629b6e6d501049a5" to "4b8493ad5f0a9873cda4ea71d8a6f456be4ae4df52d42bbad9b523c4cfb91698",
    // Lcom/google/ads/mediation/vungle/rtb/VungleRtbRewardedAd;
    "3395d9d5e1cd9d39884653d24784c0ef2cfbce2737ead2abc672e673293ff838" to "7eee07988aaae7510be73ee9f16f91600bafbed45e571ce7b6dcbd71330f967e",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/vungle/VungleMediationAdapter;
    "3b19ab9f2a4c2e0b3c0c90f1f1dc312b20cb2588293e51481c95532d7c27a0d8" to "f7d3ee673f82fa6d4b37ab8c3232f53044d13be6af6e4d77a8c58ae79ae69c41",
    // Lcom/google/ads/mediation/vungle/renderers/VungleInterstitialAd;
    "3c885ae9ae34823718862bcab92e9d9561f1d7ca6f2b51da3002f4024f14b52a" to "825a8dc14a8062884b6aeacc8eb47f311a573a3f141b012754c7881ae2cf65ec",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/admob/ad/AdMobInterstitialRewardAdImpl;
    "3ce90d1bbb73b5b0673c503ddb34ed886e2a5911f3634d30ea3516d1f5cae603" to "cf2fcb6777b91969f5f3ff062e866b8ed40a34c55d742293c395d9bcf210a3d3",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/mintegral/ad/MintegralAppOpenAd;
    "3d0909ee2c431ca6cef8e4a376fa6f40fc4895f044b61e2e70b66a02b5789b1b" to "d6642d425a394fbad533cefefae47501fcf68def8c3507949c0623c1499d077b",
    // Lcom/google/ads/mediation/pangle/renderer/PangleRewardedAd;
    "422616acc64c133d632d8c21f9bdfe971a848cf9ee0caface0015536591d552a" to "b44d5785fda5baae558f1af6f3666167257ea8d49d95ae64659d56a34689e4c9",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/admob/ad/AdMobAppOpenInterstitialAdImpl;
    "429731a9f658e35bd42c9c2d6834c3c8b30beb56b0bc1b189398b1552bb331cd" to "570d1a2dabe66201cbddaf4221ddb68e88a52ee01c88427355676d4ba4545bec",
    // Lcom/google/ads/mediation/pangle/PangleSdkWrapper;
    "42c96fab6671c3f4d7e5a6381ac35fed85b1b27a804ae677d04a5aba4e4293a9" to "db86611252c1274308441190e18fed64f686b0c76ff6b0e9063d0d05e7210371",
    // Lcom/intsig/camscanner/util/PreferenceHelper;
    "43d37dfdb7bbbce18b7d998e295a0d285308c9f011b5a5700b56672f42925f15" to "cdfdba8c9cbbaff44bc36174be7b7bbe7b5ca48eb3507cde3310be210fbbc664",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/vungle/ad/VungleBannerAd;
    "473f97dc95faf807b4ea2a09b2447046268713b79c4cdd2b334db0848967a5af" to "5c2ef3997c9b5b372fea6215eb30a72b1aeef1462199d1ed013425bc5d239d9b",
    // Lcom/bytedance/sdk/openadsdk/mediation/apw/ra/ci/ci;
    "48b0c974d80e6317c49e16bdb0234481dfbc1f58b2ac16cdf172850980403c22" to "6be911212f1e7d0d86295292ed25c84dc6eceac49e58ee128a1e506028b692b8",
    // Lcom/google/ads/mediation/facebook/rtb/FacebookRtbInterstitialAd;
    "4985f561c3c2e26ddb8dee062cd4006931a6cdc568dd80517a27c53363cfbff6" to "9d756c92b91eb1be211c138ebb454e6fb4eb513b003daff626f3709437691f77",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/admob/ad/NativeBaseAd;
    "522be9b58d9193eb1b05af1e4cd85986d9875f4afb7513130c5b303d16ee7699" to "8f36bd98bb83d919c5730c37a599a121ed6ec53082c48273c3acf9e71e50efba",
    // Lcom/facebook/ads/AdView;
    "590551fd055a919dfbb9b188f54d0357da030f38699dad9c4db6bbf47aebf19b" to "6fab7a64f451855d127f2019c3041fd57290cc0e041dbb09d6d7d294b5e7d959",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/mintegral/ad/MintegralBannerAd;
    "5c374aaa75efb10db0d456642a4c424ba8c1c11adcc6b3598c70661f93464bae" to "adfe050fe6794c76f7a6cc7cbef0c87909b39de9b51d71bd160253afe8f3bd1e",
    // Lcom/google/android/gms/ads/mediation/Adapter;
    "5da8d1a26cf2c2e7c5c5d9c54d58b44333aa4b43b65c9e6174dec3ba07b12dfa" to "16d2aa72c1b1892f7551042cdf51d90b965853ad55089fecd04d1afc69f5af75",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/admob/ad/AdMobBannerAd;
    "663a9ff4746977ca63e9443cacbce73f753dc51343489436a16ecac3ba958e7d" to "1fedaf024eeb864c4c761d7306416b3b583aef1ab657d91347c73a439194aee8",
    // Lcom/intsig/camscanner/business/PirateAppControl;
    "684eb8031e5baa8bbba4d6e8081ee234c4dc985353f4f6f797a38a46318f9090" to "45f2a992c4419f473717f4db2c7c0f5d2cb33a9682e56cbeacfc745e1f7d4d17",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/vungle/ad/VungleInterstitialRewardAd;
    "6cb1219af46e0164a7427054a476650c3a10c656291c756fa38db97ca4a4caf4" to "1410f2a11a2c27de8e7d966105d453567669aedca4ed1d7adfa273400f91058d",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/vungle/ad/VungleAppOpenInterstitialAd;
    "6fd8e4d7372b7b4d995a3d3db8f61d8b49380e70d14e7e05dbbb58cb16968c8b" to "5755d2c90e7a9706a85e2b2ecde9a5a540c4780b083be74534d5d33e035ad6e8",
    // Lcom/intsig/comm/account_data/AccountPreference;
    "72eff0c4a0c914664415914eba6e08d6b048bdaee8c2f6c8d78103270c27a007" to "e366dc0fbe47c29b980279ae2ac5eec497a4517ecfb189aec9200dc85cfcfb39",
    // Lcom/intsig/tsapp/account/viewmodel/EmailLoginViewModel$fetchAndLoadApisByEmail$2;
    "73f649d182b3d4362ad9ded0a180b7a51db055df8a9ef164b566f7ee038e719a" to "a8347b025a658566226742f1291d455406db38838160a4b0580bcfecc8446bf8",
    // Lcom/google/ads/mediation/vungle/rtb/VungleRtbBannerAd;
    "75b7182f0a5616f8c9c57542f3bb58e438cff88d1afb5b38c5a69030af559c37" to "1b024466d706d5f96b9a791180d984c5adaa2e06f11ddfc3c4acd94bdaa09edb",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/mintegral/ad/MintegralRewardAd;
    "7675eaf3dedaf2cae14468e0db1658b98374b8d2f678c8061bf55c469c994a6d" to "6cfaf6a31805173893fcad0b99e0cc0bc97a5bd42a78d6cddada18c8dae62822",
    // Lcom/intsig/camscanner/attention/WatchAdControl$startLoadAd$1;
    "78b6a1963967a53fecc30bb55896f1422f86d249c3a57a4ad244b9f0d34cb52f" to "addfb300376c982667db788d5e51da4735b1f0433042f2a7de0ca1b35ea547a7",
    // Lcom/google/ads/mediation/pangle/renderer/PangleInterstitialAd;
    "7900f17be0bccfb5b7e780c8c2ecdc979e478e7281cde495973d613ac7decb9a" to "ec0c6f4274e1cb1bbb1ea7c1484954eaf9d971f3309f3bec78a92a8a3b22da77",
    // Lcom/bytedance/sdk/openadsdk/adapter/PangleAppOpenInterstitialAd;
    "79ee7e867b516317d14cf16afd0e82d7a947548cdb41a4055f9e3723bc1f7c95" to "9d5553b8b63317fd036ef037786971d2979e039c900ff10e35d30987ffcdfd5f",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/PAGMAdapter;
    "7ad67b69eb86a2c0affb77a3d1a4e2cd93f4f154701eb68fa62beb155307ae65" to "3af8623b6e6219dd3b12da7b77ff4b5174bf672082153c5fce438ff06cfb6e8d",
    // Lcom/google/ads/mediation/mintegral/rtb/MintegralRtbBannerAd;
    "7eb9427b5ad5e848d7b461b2f3b987188daa0faba7a2470e273dd4415d766d7f" to "bbb407dffe73485902aeee92bbbf7cf1149e383612dd0fd2f891b7395771ed99",
    // Lcom/bytedance/sdk/openadsdk/ykq/ra$4;
    "8099e0e23257f968aa2773a6541cb9d03969a01461ea7abcc19187892171f65e" to "bd6fa8fda9b3d6cf852ffadaed1c9c7a4f3ff5bb4b53e05e4a9809d5a58dfe2c",
    // Lcom/bytedance/sdk/openadsdk/mediation/ge/ra$2;
    "80ace370faf2d993947a541709457b0a9f15c88cbfed094d6feddcb14f95179d" to "fa6a3a766436967b77b3d748c03040181efe7da8ac6c32a9a14bed52b6923554",
    // Lcom/bytedance/sdk/openadsdk/adapter/PangleNativeBannerAd;
    "826d75ba4eb7aefa78e6ac395b3635ea8160e5b7743310df2794f3e373be3e69" to "8c8b5a2e0f7d9e082ebf86ae8a545471413330826bf1030db6d2906898f091db",
    // Lcom/intsig/camscanner/ads/csAd/CsAdUtil;
    "8618b6aa9bb7b50e71510ed37be97ca67843a3216f2154ea966c3afdefecb72d" to "cf828bf9e93ce70e49adf8f70164696bee5dbabe5b0a2107dee20d940dc4c99b",
    // Lcom/bytedance/sdk/openadsdk/ykq/ra$2;
    "86e3796088884470b2dd4610593f446a2d1e15ad8156c79152f4cb40846ad80e" to "4e26e8412f373d9081ad76062acb9131d564e043a1b35387fd0bb9661c738c4e",
    // Lcom/intsig/camscanner/ads/csAd/CsAdUtil;
    "880d2d28e8474f61857a187f34b0f965beec520821c362279eeb0b2b8e00df55" to "fe99d60982a8a8ce95b97e4cba37bc11f5a5b9145cd366ae370ec97d74976daa",
    // Lcom/bytedance/sdk/openadsdk/adapter/PangleInterstitialRewardAd;
    "8f515279d8ce0d47e357b880ee1b84b26f0119c84f1f6c630b34ae0cb2288d61" to "e43c4ef65cece0bcd780877aaee901465f2e69a9ba43403c8465590ec09f0c22",
    // Lcom/google/ads/mediation/mintegral/waterfall/MintegralWaterfallBannerAd;
    "8fba62dc9096f2218220796bd794769f736b227d8c62c99e3a94c8e7562e4723" to "2ff0d145cbaa0e01400523139336f46c83093e8fcb96ba2732e800b517d52928",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/admob/ad/AdMobAppOpenAdImpl;
    "95d92b889dd24e3f2cadcbaceb682141cc65f74dbfa292463e9fb6e4374c71b6" to "0f84439fdc30e3bb893d095a3a7a281c9e4105f76eb2614b233ccbe561e0d78c",
    // Lcom/facebook/ads/RewardedInterstitialAd;
    "972425ef507d4f6d0e298401fc40eda13acec50868dbddf4bf737a0244bdb1d0" to "a054e15732fe0ac248dbef3353099d4afe803e54c1ce8f6c7fcd3938c124f398",
    // Lcom/google/ads/mediation/mintegral/waterfall/MintegralWaterfallNativeAd;
    "9f141159159317bbcfd4908acfb8300b8e099c769812f50e545ca52fa15e0069" to "a82680c62d27ab78a7644efdbae15be4b3183afc86b435affbf60515e3f41439",
    // Lcom/bytedance/sdk/openadsdk/api/banner/PAGBannerAd;
    "9f736aafd0eb4ecba6ac32666c2d15a56a1cd09cfae12e97994d0b43383ed092" to "e75817344d1511efb4d2f9c3ca3aa3dbafd47265bf947b95aae759b187c8c698",
    // Lcom/intsig/crashapm/log/FabricUtils;
    "a158523a1f68de50dc65f4c8f98b60bf9e849d510d4f7fe17da518464351b3c0" to "933cb0731a9c8d68133ebd1355d840c801c9f90cab64aebc67d4bcf7d618fa47",
    // Lcom/bytedance/sdk/openadsdk/api/reward/PAGRewardedAd;
    "a3c3f203bf9aeb4eb430c984f8a61277a7a8535443d372752ca9d674cdc84c0d" to "1f45e67b779afbb0beada9d590b8be8d7130c0bf54d07b2ed661852d0e2383c6",
    // Lcom/intsig/camscanner/util/PreferenceHelper;
    "a465bf2c4bd9056b57760898aa9bce587eac432b50ffe5edcf167a77048b54bb" to "129b318299cdd156236ebf32684951ee52031084617d3ab86ba4de25ba8a8273",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/vungle/ad/VungleAppOpenAd;
    "a4739f584dd484fd9bd0522128b3439332ccc943f4fdfb166595dcff593a75f3" to "17f27cbcf23165d49410019a9b929f72cfd2ea577f8bc47c9aafb838b1712cd5",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/vungle/ad/VungleRewardAd;
    "a4876eeeeddb3327ff05c8a2aefb5f93c4bd989636340db6664321fe8ad19af3" to "a15afe5f0a5cdd63142985ec9a7cca4af097019f95d27934cf495a0edd8e1cbf",
    // Lcom/bytedance/sdk/openadsdk/api/nativeAd/PAGNativeAd;
    "a7d1ef80cdaeb531f700d98857d08dc3dd1c2a67c5f5b2fe5d45563b6603794a" to "843c3b65030e7d706664411feee40301ca54a4daf021cff05eba64aad2e4b0f6",
    // Lcom/google/ads/mediation/vungle/renderers/VungleAppOpenAd;
    "a8095ef7f6751e10cd7b79376534af4e99bfe7bd3da23d9b3ffb416dd41863d8" to "38d6f1dcfb77561fe8548747810f6828fc2b23fe912a9153225f071830bfa566",
    // Lcom/bytedance/sdk/openadsdk/mediation/ge/ra$4;
    "ab2456012f3f89bee193f867c36fd7ad18d3533e507a7c2e40c9ee108ee954c3" to "de390202f7000f274ccf6b0c5539aedde7dcf0d0baf444460d878603efe4fe84",
    // Lcom/google/ads/mediation/mintegral/waterfall/MintegralWaterfallInterstitialAd;
    "ad35d5dccef4a67d202c1ab5fc246da9a7517b3cba8d919177f0220fa92659be" to "45f16c914545383f23e208ed37c7c8535df5603203fab954966318ad3fe2649c",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/mintegral/ad/MintegralNativeBannerAd;
    "ad72696cad652a2eb2b891bcdbacb5303d915189a1b8641c877fa22b727fd99b" to "e198880cf51cc1b12b3cb20c47ae2afc03c38fba102190bece2ff9fcdb12bac8",
    // Lcom/intsig/advertisement/adapters/AbsPositionAdapter;
    "ae90d98595ed494c634735dc0f8a86836fa5a45bb6fa2c5e24027781a989607a" to "fa6dc6c2e7981689ca66769b7aae2c32a12dee7a6a1cc3bd8010048e0d83a1d1",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/admob/ad/AdMobNativeBannerAd;
    "b0a1c062de9a5156b290142917131a808f134c9dd112d5fa6ce87c34d73e2f99" to "7ef82bad0adec22c22d756a9b37cae2e46b85ad46c81bd2448bf3834f54f9dd8",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/admob/ad/AdMobInterstitialRewardInterstitialAdImpl;
    "b39d4c0767ed6afe39a0307101773fe70b2288188ed95da4b3a7fedfb8bc8556" to "ee1bb242d14821e915b0ef0fa95278ccc1a795fd28ae7d00f296dbf083ed253e",
    // Lcom/mbridge/msdk/video/signal/communication/BaseVideoCommunication;
    "b49f9efb61187a1305225b9fe01ae3e5c113d4b51b052a4b19bebf72f7971c67" to "db75e1ffa1a33a9a32dd406f5958b6f8311f66714825c3381ddbb969bdb6d6d3",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/admob/ad/AdMobRewardedAd;
    "b5304e3e32cc02ac5be050909376a63e475c9e2c01a79c5b5e0193a638ce898b" to "9cc20f9450fa5d6f0374ea5fa09aedea3fbf9b0fa1c9731c603d01d8152c0208",
    // Lcom/google/ads/mediation/facebook/FacebookRewardedAd;
    "b5d9d619fb6d755a511cf5565e9df87f11a0daa7ebbf3bc42c4d0ffa90ec655b" to "e4cf00cb9cf3f1f5fd4d0a07d023ed8a632bebd7cfaf679230b03fcd777893b1",
    // Lcom/intsig/tsapp/account/viewmodel/EmailLoginViewModel;
    "b73d99e71b95f75eaf8aa51182bbcc3497c703feac78424e1ad81ddd04a79162" to "8531b326bcad29aa9aa5143d648b1ce21504d6d7cb8921e75be84f19c5aba7f5",
    // Lcom/google/ads/mediation/mintegral/waterfall/MintegralWaterfallRewardedAd;
    "b7914b765be9d60067e1cdcc270e5458531ddef855f5f9873f1140d358c664e4" to "f9b2219b3432e55ec528d2583b609547553f7abed38ccee053684380e541df1d",
    // Lcom/google/ads/mediation/vungle/waterfall/VungleWaterfallBannerAd;
    "bc1b694bfd6a45ddcc998cda892446ef09a243029e4e031bd92d9c94fe9a5e1b" to "47b5ec70df2926d513dc9205fe33b0fa929833b622d21e07305448628630a4e5",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/admob/ad/AdMobInterstitialAdImpl;
    "bc50f26f48af50ed2a37269443b01fbeb62ded42b5b0b49fbccb586f465a2e98" to "6f92f208c87cf1e01017a3abb2d28b9ef262082463b2db2788354cdb00c1ddb1",
    // Lcom/intsig/camscanner/tsapp/sync/SyncUtil;
    "bd22326bdfffb992ea83d034fde62e153c041946df27d37a38bd12f0818b3ab7" to "790a9b7590c356108f958066730ee966c4747b19c6fb1fc4c8037133958aee0b",
    // Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;
    "be3f3ffd66b04f6f649d04e0cb65ccd6181299c49e3459832b6b08dbd20c2af6" to "2290dc7d50c2979b0b4d723e5ab08b3ea6a895612b4462df193051bece7cf2ed",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/vungle/ad/VungleInterstitialAd;
    "c191cf131834913b568f37f55a8edc8b657beecf8262426a149ea17c755daff7" to "d7b44de59dc551398c3ea32119b86297bfd875cf9f522834d3fe99343d330ef4",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/mintegral/ad/MintegralInterstitialAd;
    "c22d8dca7f6641dc550724e82b462047fa31cbfafbfc5d5e1b6a8d1f74893a7f" to "adc94dbfa61c0821194d40f3bdd506860245e5c470c83871c750e7186f9fd913",
    // Lcom/intsig/advertisement/listener/OnAdPositionListener;
    "c28fd08ec4d6a1f5512695f8eedacfc13f42045781e0bae3c037d82e0b444bd3" to "0093a0cd915d8064c6c45512688049b4811a593aeea6b647b61efa6e5af5fc69",
    // Lcom/bytedance/sdk/openadsdk/mediation/ge/ra$3;
    "c369a329a05391dfd776cd5eb7e594969fbe01abc5fffda273671eaa545f61b5" to "6f085714faa7eddb2a174205fdefaa693b7ff02943e0d5344921a17a41cdc197",
    // Lcom/google/firebase/crashlytics/FirebaseCrashlytics;
    "c3a9056128ca8cfa2936540dc677a4b59648771c50c7923c76192ad985a0c324" to "1782dd5f15a9d3b8995f1fed8056ba24e894f55127fb579bb61c64126f377d2d",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/admob/ad/NativeBaseAd;
    "c800c8ec442c426d5ce01ca5008997aac4a70f91f61e49cfd10ed55816f0ebaf" to "4e10d60464117217050a2b88c81de41a6228ec74bae3101c6aade69d1af19ca4",
    // Lcom/bytedance/sdk/openadsdk/adapter/PangleInterstitialAd;
    "c913ef29ddd9c812579af410a518c5b555ec3556130dc052635180aaa4b5ee97" to "d0757d06c8f8d708165abd8d36a257bb53c1bd8b4c3f5af01c29c5320187867c",
    // Lcom/bytedance/sdk/openadsdk/ykq/ra$3;
    "cd2afe95904ad074f418311fb04cb1f6d1fc1a507e25059be6147763f79bfa32" to "99ce1688ea4eaf834b8999611768037a1d927ae3972cfe57b62e44f37ddd7a07",
    // Lcom/bytedance/sdk/openadsdk/mediation/apw/ra/ci/ra;
    "cdababbc5564e83de34c76658d7c2985f3e2eea459457f74c69d688ec70e7e5d" to "e55308e7e08ccc85ebf6d03739809385df14e66fc41e20a918392f61922891d1",
    // Lcom/bytedance/sdk/openadsdk/ykq/ra$5;
    "cdf4ef8df47001a5fc7f7bfcca371bd20533f543e41dbc4668c8450d940abd30" to "0a8342619cc9bcffdbacd747ae49d4484ded7f384465c272781fd46c64ebb942",
    // Lcom/google/ads/mediation/mintegral/waterfall/MintegralWaterfallAppOpenAd;
    "d09d16f3638b778044e85acee5f3f90a402c583f5f7f3f18d581ec929dd77d24" to "78b09eb524016e649a851828c6d3c1f5ecf0adf2f0361b63d0b108bca984c652",
    // Lcom/intsig/camscanner/attention/O0〇OO8;
    "d0c8494a054cfd689932dae007c40f60a54ccad20a4ee10c8f5e2d68c4c994b8" to "5f5ba58c8bd130fc0c464e36a35cd85cd8e3c76d66ca499d84f25b7b142cfe26",
    // Lcom/facebook/ads/NativeAdBase;
    "d2d2cd91c818359083fd6bc56c9b17fe5e4abf3881c69015e11cb485f790725c" to "be66ca0bed27b665ab806425c69c55c0a545bce1037bc99c164fd7798a7f1bc2",
    // Lcom/intsig/log/LogAgentHelper;
    "d8e9a9f519678176dbe7918b0dfe294097f1e69261cc4484287fe1c89d96c5e4" to "df84ce88341e499819ace07cd55752c965f6110bf0c5ffc5878fbbc5851387e7",
    // Lcom/facebook/ads/InterstitialAd;
    "df2f86c4ff042e73ddb457724ce20d09542a4f3222763b890d581043302457fe" to "cc65d6da0a2826702489ebaf56c27b3767f6be1e6409aa1fb44b18136824adc7",
    // Lcom/google/ads/mediation/facebook/rtb/MetaRtbAppOpenAd;
    "df622ec6e394c997758d52afc1558a2e5aeb11827f7699798db1a05d2a3a7346" to "cd11784dfb511c252f1bb2f5379040020a3f55d515b352b69981d33178fbc867",
    // Lcom/intsig/camscanner/gift/interval/IntervalTaskStateManager;
    "e0e7732c666bef2fe6c89339da60ef9913be39ab64feaf23e51dd9d5f2dc87db" to "bc6e6d7ee1b86c86c119f90ee2b055c392c24e4823d239629103827847dd230b",
    // Lcom/facebook/ads/NativeAdsManager;
    "e147197fc682c1e361751e71311f890c7cb877d5af6473e0110da720c5dd8ec2" to "f6d4d66254abe1f0f09b02d223fca6bfcc7b943ea087ee5c85d247ea8bb3846c",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/mintegral/MintegralMediationAdapter;
    "e17808f5515dcc1ed8588665621492e6ded7c6dcd388bf3dff99480767fe821c" to "2e40721a34827e30ae1d8d860e508fc31125e653896fa086aff0c44328b917f0",
    // Lcom/intsig/tsapp/account/viewmodel/EmailLoginViewModel;
    "e2d0db1e14ccd538a167cf5db55ec360b6379d8f4fd37d3f8942048679cf8121" to "7d6801de0f9413e0ba3cc5635d7b63a66a992da9565e7db247941eb0041f887c",
    // Lcom/bytedance/sdk/openadsdk/adapter/PangleAppOpenAd;
    "e2fc7d8aaadf36800ae393d61a6a10eaf61966314ea5bed8b58965e132690219" to "60767b659cec301e06db85bcc8f0ac7acf3f348d39465cd28dc52d3036983d2e",
    // Lcom/bytedance/sdk/openadsdk/adapter/PangleRewardAd;
    "e3268de617516f738e560ce3cffa29b8bd9af00b6e5f13b9cd21367c6ad1c6b3" to "30fa1dbe0622c10d254e5c4c109bdfb280ebf1774ce23c8f0c8b123caa37cd3a",
    // Lcom/google/ads/mediation/mintegral/rtb/MintegralRtbNativeAd;
    "e527128b52067e837960f15549eba436f5fc995f53559d2e3696aa9f5724f5d4" to "07d87647b48f557b9765d375fb3907443d7bdaba4c81418ec9aec2914040a8df",
    // Lcom/google/firebase/analytics/FirebaseAnalytics;
    "e7f665aa1602efbc32dfbdb73cd9c9d84ff5ff3c864a3dda1f0d9ac9e8b12911" to "f1e48bd03e589a74688acb1040c733a82e26854dd1e49c61f400f5476320ac53",
    // Lcom/intsig/camscanner/web/WebAction;
    "e85fea052e53ee233018e8f37e39c89aa779c114ed122d4b1363f56857fb44ed" to "c600a8b26fc100c91c3cc68eede9928f7deb1a220e0791506ea9fd3cb4df3c13",
    // Lcom/intsig/log4a/Logger;
    "e9830b22312824c6f5d13377b0d8b07568b0bb956138ba778cf74a4af81a8a4c" to "60ece79b7a57ecf3fac550b950c6aa963ff004e304bc51012561a7c317d6d621",
    // Lcom/google/ads/mediation/mintegral/rtb/MintegralRtbInterstitialAd;
    "ea57162b1f631f0c6fd751b65e54e36188976014028faf20bd7e2bc6a06c3b4c" to "a2accee1a5f930a632e0405d8c19ebb61302ea57fd776c77b3fb786bfc4982e5",
    // Lcom/intsig/log/LogUtils;
    "ec3316ca94214adcdf622bb04bcb79acd30ccd572d413e487a474485f69c613e" to "53d8e54bc455bb884ff5a0426a19dea97c13b0e28b0cfd3861fec6a2185b6eb2",
    // Lcom/intsig/camscanner/attention/CallAppData;
    "eeccf2e5bde68ac429eb89d3c9b0037fac0d7675058967b8865863b6632c66b5" to "46a2f9e8c00ea1ee805fa28730f15fc6068c8ebcf38d1bd7f25c3758ae952d21",
    // Lcom/facebook/ads/RewardedVideoAd;
    "f02a1dc13bf5cb7d8cbdc3c06eeed42257ac79b57c367539ecfa00b1768407b6" to "02269be405e6310a2dc5aac4c3ecb4095cce8938bebba70fdd1520da14af2205",
    // Lcom/intsig/camscanner/tsapp/sync/SyncUtil;
    "f746af546d5156206733463104a4986ed680a6f912cf119f6e1b8890c95952ad" to "6ede3cfc051854f913e78173c991336c3d27bff276026ee48e8a1b12a0c7860c",
    // Lcom/google/ads/mediation/pangle/renderer/PangleAppOpenAd;
    "f9b453e2543c09d729210154e2c6bef3cb92301f2e73ccd86018d6bcb82577d2" to "bbfb1b1860c816e0b3fecc4be78a51d81a25e9f1dd97539e56cc8afce1318f1f",
    // Lcom/google/ads/mediation/mintegral/rtb/MintegralRtbRewardedAd;
    "fbcc972f41f51a34a4b64d65d913440dc96cae79bc795f5d1922ba9b5feb30a8" to "1b7622d36b0a3be5a0784f41feeb649a5fbdad746ba7a13ae0ef8862ee9242aa",
    // Lcom/intsig/comm/account_data/AccountPreference;
    "fd50859c64d48d64c1403215a3d5cfd411c415588dd3bb9ea119466c5279091d" to "f3e1ed610ee370212b7a6931f3c25a8e6dfe2ad972c8f6f5c52b0d7321d4240a",
    // Lcom/bytedance/sdk/openadsdk/mediation/adapter/admob/ad/AdMobRewardedInterstitialAd;
    "fda79c5aba46cfa4a3c1a18d433dcb9872d19c2a7cbcd7400cfd2d0079a2cf32" to "48a7843cc3258b989e9aaf6a8cc157bc6db1703e197bd238e830a167a58ff9e0",
    // Lcom/bytedance/sdk/openadsdk/mediation/ge/ra$1;
    "ff978133425fe1fe96552e47d1a96661888e40ccccef8aaf237c1895bf0fee68" to "1f08525f5735ad8444594efeb2f96ca73a059f2b0e90779181b17c6aaa1c3229",
    // Lcom/google/firebase/perf/FirebasePerformance;
    "ff97a9933b84537404148bd94daf0c7f22b03394cebcf8a0261a1467e9673ab5" to "d45c5ebc7fb32c54810e41793c32c83d9c0f3859969d2596552f8cd5e3a6ae58",
)

internal fun matchesCamScannerClassPin(expected: String, actual: String): Boolean =
    actual == expected || runtime2ClassPins[expected] == actual
