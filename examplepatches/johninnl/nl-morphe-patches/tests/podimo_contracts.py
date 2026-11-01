"""Podimo 3.5.1 guest-playback contracts; contains no tokens or signed URL values.

Pinpoints derive from the independent decode of the supplied base.apk
(SHA-256 411e8bb62c8f35eb625a7ae9625dbf485603c0bfeba35706a76823033d8d6216)
and from analysis/REPORT.md in the Podimo download.

Playback gate: id/h0 (UserAccessValidator). Its private helpers
m() PREMIUM, n(Z) PREMIUM_ONLY and p(Z) PREMIUM_PLUS compare the stored
profile plan and return Sc.b$b success or Sc.b$a BAD_ACCESS_LEVEL failure;
f(Kq/x) does the same for exclusive podcasts. The episode play-button state
builder Yf/c computes isAvailable from the same validator via g0.c/e, and
Yf/f.a maps isAvailable=false to Lag/l.LOCKED, which the row compositor
renders as the Premium pill (string "Premium") instead of the existing play
button. Replacing the four validator helpers with the success result swaps
every derived Premium button for the existing play button and lets the play
action reach PlaybackByPodcastEpisode.

Guest route: Tc/c$c (GraphQL urlsMap) maps production to the Android
gateway host; the website production host graphql.podimo.com is the host
verified to sign full premium episode audio for fresh FREE guest sessions.
"""

APP = 'com.podimo'
VERSION = '3.5.1'
VERSION_CODE = 941
MIN_SDK = 26
SIGNATURE = '266752dd10abf83baa6f9696e9df25ce443125ba6b72b806a544a57486dd5481'
BASE_SHA256 = '411e8bb62c8f35eb625a7ae9625dbf485603c0bfeba35706a76823033d8d6216'

PATCH_NAMES = {'Unlock Premium playback', 'Guest session playback host'}

VALIDATOR = 'id/h0'
URLS = 'Tc/c$c'

# (class, smali signature, apktool .locals, real-instruction count) pinned from the decode.
UNLOCK = [
    (VALIDATOR, 'm()LSc/b;', 4, 21),
    (VALIDATOR, 'n(Z)LSc/b;', 4, 34),
    (VALIDATOR, 'p(Z)LSc/b;', 4, 44),
    (VALIDATOR, 'f(LKq/x;)LSc/b;', 3, 39),
]
URL_CTOR = (URLS, '<init>(Ljava/util/Map;ILkotlin/jvm/internal/k;)V', 1, 20)

# Top-left profile-menu promotion pill: Ze/b.h maps the promo state (Ue/d$a "Become a
# member", Ue/d$d "Start free trial", Ue/d$e "Try free trial") to Xe.a(visible, text) and
# already constructs the invisible Xe.a(false, "") for unknown states.
BANNER = ('Ze/b', 'h(LUe/d;)LXe/a;', 4, 37)

# Dexlib2 register totals (locals + parameters + this) the patch contracts pin;
# every parameter of the pinned methods occupies a single register slot.
REGISTER_TOTALS = {
    f'{VALIDATOR}->m()LSc/b;': 5,
    f'{VALIDATOR}->n(Z)LSc/b;': 6,
    f'{VALIDATOR}->p(Z)LSc/b;': 6,
    f'{VALIDATOR}->f(LKq/x;)LSc/b;': 5,
    f'{URLS}-><init>(Ljava/util/Map;ILkotlin/jvm/internal/k;)V': 5,
    f'{BANNER[0]}->{BANNER[1]}': 6,
}
GATEWAY_URL = 'https://graphql.pdm-gateway.com/graphql'
WEBSITE_URL = 'https://graphql.podimo.com/graphql'

# The validator's typed success result, as constructed by the FREE branch of g().
SUCCESS_RESULT = [
    'new-instance v0, LSc/b$b;',
    'sget-object v1, Lid/E$a;->a:Lid/E$a;',
    'invoke-direct {v0, v1}, LSc/b$b;-><init>(Ljava/lang/Object;)V',
    'return-object v0',
]

# The invisible banner prefix the unlock patch inserts into the pill builder: exactly
# the app's own unknown-state branch (Ze/b.h :cond_2).
HIDDEN_BANNER = [
    'new-instance v0, LXe/a;',
    'const/4 v1, 0x0',
    'const-string v2, ""',
    'invoke-direct {v0, v1, v2}, LXe/a;-><init>(ZLjava/lang/String;)V',
    'return-object v0',
]

# Chain-of-custody for the swap claim: each row exists in the original DEX.
CHAIN = [
    # Play-button state: LOCKED comes only from isAvailable=false.
    ('Yf/f', 'a(LYf/e;)Lag/k;', ['LYf/e;->i()Z', 'Lag/l;->b:Lag/l;', 'Lag/l;->a:Lag/l;']),
    # Row state builder reads the same user access validator.
    ('Yf/c', 'c(Lcom/podimo/dto/AudioPlayerItem;LAy/f;)Ljava/lang/Object;',
     ['Lid/g0;->c(Lid/g0;Lcom/podimo/dto/AudioPlayerItem;Lid/C;ILjava/lang/Object;)LSc/b;', 'LSc/b;->c()Z']),
    # The compositor renders string "Premium" (0x7f1406ad) on the LOCKED branch.
    ('Eq/y0', 'x0(LH0/m;LVy/c;LKy/a;LKy/a;LKy/l;LKy/a;LKy/a;ZLo0/q;II)V',
     ['Lag/l;->b:Lag/l;', 'const v4, 0x7f1406ad']),
    # Icon catalog maps READY/LISTENED/LOCKED to play/checkmark/lock icons.
    ('tf/a', 'd(Ltf/D;)I', ['Lqf/a;->l:I', 'Lqf/a;->i:I']),
    # Startup registers the fresh guest session before any playback.
    ('uq/o$g', 'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;',
     ['LDb/n;-><init>(LDb/f;)V', 'LGb/c;->c(LGb/b;LHb/a;LAy/f;)Ljava/lang/Object;']),
    # Guest mutation keeps source: MOBILE and the token is used verbatim.
    ('St/c$a', 'a()Ljava/lang/String;', ['guestSessionRegister(deviceId: $deviceId, region: $region, source: MOBILE, locale: $locale)']),
    # The top-left pill renders the promotion strings through Xe.a (visible, text).
    ('Ze/b', 'h(LUe/d;)LXe/a;', ['const v3, 0x7f14074e', 'const-string v1, ""']),
]

PODCAST_ID = 'de0a4a96-8275-4ace-82ac-ed7b21a31f2d'
EPISODE_IDS = ['00938995-fbae-4d28-ac16-37e6ea95073b', '4a37970d-4f7e-4f9f-ae95-f00e407e1576']

# Methods each patch may touch, in atv_smali inventory key form.
PATCH_METHODS = {
    'Unlock Premium playback': [
        f'L{VALIDATOR};->m()LSc/b;',
        f'L{VALIDATOR};->n(Z)LSc/b;',
        f'L{VALIDATOR};->p(Z)LSc/b;',
        f'L{VALIDATOR};->f(LKq/x;)LSc/b;',
        f'L{BANNER[0]};->{BANNER[1]}',
    ],
    'Guest session playback host': [
        f'L{URLS};-><init>(Ljava/util/Map;ILkotlin/jvm/internal/k;)V',
    ],
}
