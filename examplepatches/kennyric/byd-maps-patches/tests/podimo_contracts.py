"""Podimo 3.7.0 guest-playback and Android Auto browse contracts; contains no tokens.

Pinpoints derive from the independent decode of the supplied base.apk
(SHA-256 c37488fccefba89da0e870401d2c1954d7b499edb9d703fe007d1edbec745499)
and from the 3.7.0 smali analysis in this repository.

Playback gate: ks/w (UserAccessValidator). Its helpers e() PREMIUM,
f(Z) PREMIUM_ONLY and g(Z) PREMIUM_PLUS compare the stored profile plan and
return ur.j success or ur.i BAD_ACCESS_LEVEL failure; d(fi0/y0) does the same
for premium/exclusive podcasts. Replacing the four validator helpers with the
success result swaps every derived Premium button for the existing play button
and lets the play action reach the app's own playback query.

Guest route: vr/d (GraphQL urlsMap) maps production to the Android gateway
host; the website production host graphql.podimo.com is the host verified to
sign full premium episode audio for fresh FREE guest sessions.

Android Auto browse: is/k is the section tree Android Auto receives (For you /
Your Library / Discover, offline library when the network state service is
offline), zz/a maps the for-you and discover GraphQL responses into that tree,
and hs/c gates every media-browser caller through a certificate-pinned
allowlist before the tree lookup. The show-grid patch regroups the for-you
episode sections into grids of podcast series folders (drill-in loads the
show's episodes through the app's own paginated query), hides the empty
library tab for guests, and serves the section tree to every caller.
"""

APP = 'com.podimo'
VERSION = '3.7.0'
VERSION_CODE = 944
MIN_SDK = 32
SIGNATURE = '266752dd10abf83baa6f9696e9df25ce443125ba6b72b806a544a57486dd5481'
BASE_SHA256 = 'c37488fccefba89da0e870401d2c1954d7b499edb9d703fe007d1edbec745499'

PATCH_NAMES = {
    'Unlock Premium playback', 'Guest session playback host', 'Android Auto show grid browse',
}

VALIDATOR = 'ks/w'
URLS = 'vr/d'

# (class, smali signature, apktool .locals, real-instruction count) pinned from the decode.
UNLOCK = [
    (VALIDATOR, 'e()Lur/k;', 4, 21),
    (VALIDATOR, 'f(Z)Lur/k;', 3, 34),
    (VALIDATOR, 'g(Z)Lur/k;', 5, 49),
    (VALIDATOR, 'd(Lfi0/y0;)Lur/k;', 3, 36),
]
URL_CTOR = (URLS, '<init>()V', 5, 19)

# Top-left profile-menu promotion pill: yv/b.a maps the promotion state
# (tv.d "Become a member", tv.g "Start free trial", tv.h "Try free trial")
# to wv.a(visible, text) and already constructs the invisible wv.a(false, "")
# for unknown states. The unlock patch overwrites the banner register v9 with
# that invisible banner right before the wv/f pill row is assembled.
BANNER = ('yv/b', 'a(Ltv/k;Lwv/e;)Lwv/f;', 11, 64)

# Android Auto show grid browse hooks, pinned from the same decode.
FOR_YOU_MAPPER = ('zz/a', 'invoke(Ljava/lang/Object;)Ljava/lang/Object;', 34, 549)
ROOT_BROWSE = ('is/k', 'a(ILjava/lang/String;)Lxj/f0;', 8, 128)
CALLER_GATE = ('hs/c', 'a(ILjava/lang/String;)Lhs/b;', 2, 18)

CAR_BROWSE = 'Lpatches/podimo/CarBrowse;'
TREE_FILTER = f'{CAR_BROWSE}->filter(Ljava/lang/Object;)Ljava/lang/Object;'
ROOT_TABS = f'{CAR_BROWSE}->rootTabs(Ljava/lang/Object;Ljava/util/ArrayList;)Ljava/util/ArrayList;'
TREE_FOR = f'{CAR_BROWSE}->treeFor(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;'
FILTER_CALL = 'Lzz/f;->e(Ljava/util/List;)Ljava/util/List;'
LIBRARY_RESULT = 'Lv9/u;->e(Ljava/util/List;Lv9/m1;)Lv9/u;'

# Dexlib2 register totals (locals + parameters + this) the patch contracts pin;
# every parameter of the pinned methods occupies a single register slot.
REGISTER_TOTALS = {
    f'{VALIDATOR}->e()Lur/k;': 5,
    f'{VALIDATOR}->f(Z)Lur/k;': 5,
    f'{VALIDATOR}->g(Z)Lur/k;': 7,
    f'{VALIDATOR}->d(Lfi0/y0;)Lur/k;': 5,
    f'{URLS}-><init>()V': 6,
    f'{BANNER[0]}->{BANNER[1]}': 14,
    f'{FOR_YOU_MAPPER[0]}->{FOR_YOU_MAPPER[1]}': 36,
    f'{ROOT_BROWSE[0]}->{ROOT_BROWSE[1]}': 11,
    f'{CALLER_GATE[0]}->{CALLER_GATE[1]}': 5,
}
GATEWAY_URL = 'https://graphql.pdm-gateway.com/graphql'
WEBSITE_URL = 'https://graphql.podimo.com/graphql'

# The validator's typed success result, as constructed by every allowed branch.
SUCCESS_RESULT = [
    'new-instance v0, Lur/j;',
    'sget-object v1, Lks/k;->a:Lks/k;',
    'invoke-direct {v0, v1}, Lur/j;-><init>(Ljava/lang/Object;)V',
    'return-object v0',
]

# The invisible banner the unlock patch splices into the pill builder, right
# before the wv/f row construction; exactly the app's own unknown-state branch.
HIDDEN_BANNER = [
    'new-instance v9, Lwv/a;',
    'const/4 v0, 0x0',
    'const-string p1, ""',
    'invoke-direct {v9, v0, p1}, Lwv/a;-><init>(ZLjava/lang/String;)V',
]

# Chain-of-custody for the swap claim: each row exists in the original DEX.
CHAIN = [
    # Play-button gating reads the same user access validator's plan.
    (VALIDATOR, 'e()Lur/k;', ['Lks/w;->b()Ltu/f;', 'Lls/d;->d:Lls/d;']),
    # The play gates construct the same success result they are pinned to return.
    (VALIDATOR, 'd(Lfi0/y0;)Lur/k;', ['Lks/k;->a:Lks/k;', 'Lur/j;-><init>(Ljava/lang/Object;)V']),
    # The for-you/discover mapper feeds the browse tree through the tree filter.
    (FOR_YOU_MAPPER[0], FOR_YOU_MAPPER[1], [FILTER_CALL]),
    # The online root serves its tab list through the media3 library result.
    (ROOT_BROWSE[0], ROOT_BROWSE[1], [LIBRARY_RESULT]),
    # The caller gate consults the certificate-pinned package validator.
    (CALLER_GATE[0], CALLER_GATE[1], ['Lcom/google/firebase/messaging/x;->p(ILjava/lang/String;)Z']),
    # The tree data source loads a podcast's episodes by podcast UUID.
    ('zz/f', 'a(Ljava/lang/String;ILc00/c;Lww0/c;)Ljava/lang/Object;',
     ['Luo0/q;-><init>(Ljava/lang/String;ILtd/u0;)V']),
    # Episode rows expose the podcast id their series folder is keyed by.
    ('zz/f', 'g(Ljava/util/ArrayList;Lmr0/a;)Ljava/util/ArrayList;',
     ['Lcom/podimo/dto/AudioPlayerEpisodeItem;->getPodcastId()Ljava/lang/String;']),
    # The section tree's tabs include the library tab the patch may hide.
    ('d00/i', '<init>(Landroid/content/Context;Lzz/f;Lhq/b;)V',
     ['const-string p2, "secondTab"']),
]

PODCAST_ID = 'de0a4a96-8275-4ace-82ac-ed7b21a31f2d'
EPISODE_IDS = ['00938995-fbae-4d28-ac16-37e6ea95073b', '4a37970d-4f7e-4f9f-ae95-f00e407e1576']

# Methods each patch may touch, in atv_smali inventory key form. The show-grid
# patch additionally installs the CarBrowse extension classes; patched output
# may add those and nothing else.
EXTENSION_PREFIXES = ('Lpatches/podimo/CarBrowse;->', 'Lnl/johninnl/podimo/car/')
PATCH_METHODS = {
    'Unlock Premium playback': [
        f'L{VALIDATOR};->e()Lur/k;',
        f'L{VALIDATOR};->f(Z)Lur/k;',
        f'L{VALIDATOR};->g(Z)Lur/k;',
        f'L{VALIDATOR};->d(Lfi0/y0;)Lur/k;',
        f'L{BANNER[0]};->{BANNER[1]}',
    ],
    'Guest session playback host': [
        f'L{URLS};-><init>()V',
    ],
    'Android Auto show grid browse': [
        f'L{FOR_YOU_MAPPER[0]};->{FOR_YOU_MAPPER[1]}',
        f'L{ROOT_BROWSE[0]};->{ROOT_BROWSE[1]}',
        f'L{CALLER_GATE[0]};->{CALLER_GATE[1]}',
    ],
}
