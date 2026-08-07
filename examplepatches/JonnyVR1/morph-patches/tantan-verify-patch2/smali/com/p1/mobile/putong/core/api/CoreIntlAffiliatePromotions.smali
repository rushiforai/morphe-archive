.class public Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;
.super Ll/dy6;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;
    }
.end annotation


# static fields
.field public static volatile o0:Z

.field public static final p0:Ll/jxd0;

.field public static final q0:Ll/jxd0;


# instance fields
.field public volatile R:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;",
            ">;"
        }
    .end annotation
.end field

.field public volatile S:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;",
            ">;"
        }
    .end annotation
.end field

.field public volatile T:Z

.field public volatile U:Z

.field public volatile V:Z

.field public final W:Ljava/lang/Object;

.field public X:Lrx/c;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;",
            ">;>;"
        }
    .end annotation
.end field

.field public final Y:Ll/byd0;

.field public final Z:Ll/jxd0;

.field public final a0:Ll/byd0;

.field public final b0:Ll/byd0;

.field public final c0:Ll/byd0;

.field public final d0:Ll/byd0;

.field public final e0:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public final f0:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public final g0:Lrx/subjects/ReplaySubject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/ReplaySubject<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public volatile h0:J

.field public volatile i0:J

.field public volatile j0:J

.field public volatile k0:J

.field public volatile l0:J

.field public volatile m0:J

.field public volatile n0:J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    const-string v2, "debug_mock_discount_promotion"

    .line 6
    .line 7
    invoke-direct {v0, v2, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->p0:Ll/jxd0;

    .line 11
    .line 12
    new-instance v0, Ll/jxd0;

    .line 13
    .line 14
    const-string v2, "debug_mock_free_trial_promotion"

    .line 15
    .line 16
    invoke-direct {v0, v2, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->q0:Ll/jxd0;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 5

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->R:Ljava/util/List;

    .line 7
    .line 8
    new-instance p1, Ljava/lang/Object;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->W:Ljava/lang/Object;

    .line 14
    .line 15
    new-instance p1, Ll/byd0;

    .line 16
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v1, "intl_promotion_me_tab_dot_clicked_hit_"

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-wide/16 v1, 0x0

    .line 40
    .line 41
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Y:Ll/byd0;

    .line 49
    .line 50
    new-instance p1, Ll/jxd0;

    .line 51
    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string v2, "intl_swipe_first_fullscreen_discount_auto_shown_"

    .line 55
    .line 56
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 75
    .line 76
    invoke-direct {p1, v0, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 77
    .line 78
    .line 79
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Z:Ll/jxd0;

    .line 80
    .line 81
    new-instance p1, Ll/byd0;

    .line 82
    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string v2, "intl_swipe_first_fullscreen_discount_last_auto_hit_"

    .line 86
    .line 87
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 106
    .line 107
    .line 108
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->a0:Ll/byd0;

    .line 109
    .line 110
    new-instance p1, Ll/byd0;

    .line 111
    .line 112
    new-instance v0, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string v2, "intl_affiliate_cd_remain_sec_"

    .line 115
    .line 116
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    const-wide/16 v2, -0x1

    .line 135
    .line 136
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    invoke-direct {p1, v0, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 141
    .line 142
    .line 143
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b0:Ll/byd0;

    .line 144
    .line 145
    new-instance p1, Ll/byd0;

    .line 146
    .line 147
    new-instance v0, Ljava/lang/StringBuilder;

    .line 148
    .line 149
    const-string v4, "intl_affiliate_cd_bound_hit_"

    .line 150
    .line 151
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 170
    .line 171
    .line 172
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->c0:Ll/byd0;

    .line 173
    .line 174
    new-instance p1, Ll/byd0;

    .line 175
    .line 176
    new-instance v0, Ljava/lang/StringBuilder;

    .line 177
    .line 178
    const-string v4, "intl_affiliate_client_dismiss_hit_"

    .line 179
    .line 180
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 184
    .line 185
    .line 186
    move-result-object v4

    .line 187
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v4

    .line 191
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 199
    .line 200
    .line 201
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->d0:Ll/byd0;

    .line 202
    .line 203
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->e0:Lrx/subjects/b;

    .line 208
    .line 209
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->f0:Lrx/subjects/b;

    .line 214
    .line 215
    const/4 p1, 0x1

    .line 216
    invoke-static {p1}, Lrx/subjects/ReplaySubject;->d(I)Lrx/subjects/ReplaySubject;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->g0:Lrx/subjects/ReplaySubject;

    .line 221
    .line 222
    iput-wide v2, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->h0:J

    .line 223
    .line 224
    invoke-static {}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->z4()V

    .line 225
    .line 226
    .line 227
    return-void
.end method

.method public static D4(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    :cond_0
    return-object p0
.end method

.method public static K4(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Z
    .locals 4
    .param p0    # Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->extraConfig:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;->countdown:J

    .line 6
    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    cmp-long p0, v0, v2

    .line 10
    .line 11
    if-lez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static Q3(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v2, 0x1

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    return v2

    .line 31
    :cond_1
    const-string v0, ":"

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-nez v3, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_2

    .line 48
    .line 49
    return v2

    .line 50
    :cond_2
    :goto_0
    return v1
.end method

.method public static R3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->l3(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Q3(Ljava/lang/String;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public static U3(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;Z)Z
    .locals 1
    .param p0    # Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->mainTitle:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->subtitle:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->buttonText:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->imgUrl:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->theme:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->seePoolHasUserMainTitle:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->seePoolNoUserMainTitle:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->seePoolHasUserSubtitle:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->seePoolNoUserSubtitle:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-nez p0, :cond_1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    return p1

    .line 79
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 80
    return p0
.end method

.method public static V3(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Z
    .locals 1
    .param p0    # Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "freeTrial"

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public static synthetic a3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static a4(J)Z
    .locals 2

    .line 1
    const-wide/32 v0, 0x1869f

    cmp-long v0, p0, v0

    if-eqz v0, :cond_1

    const-wide/32 v0, 0x15b38

    cmp-long p0, p0, v0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static synthetic b3()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->d0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    return-object v0
.end method

.method public static b4(Ljava/lang/String;)Z
    .locals 2
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    const-string v0, "discount"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    const-string v0, "freeTrial"

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return v1

    .line 27
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 28
    return p0
.end method

.method public static synthetic c3(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->j4(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic d3(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->i4(Ljava/util/concurrent/atomic/AtomicReference;)V

    return-void
.end method

.method public static d4(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;J)Z
    .locals 6

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->startTime:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    const/4 v5, 0x0

    .line 8
    if-lez v4, :cond_0

    .line 9
    .line 10
    cmp-long v0, p1, v0

    .line 11
    .line 12
    if-gez v0, :cond_0

    .line 13
    .line 14
    return v5

    .line 15
    :cond_0
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->endTime:J

    .line 16
    .line 17
    cmp-long p0, v0, v2

    .line 18
    .line 19
    if-lez p0, :cond_1

    .line 20
    .line 21
    cmp-long p0, p1, v0

    .line 22
    .line 23
    if-lez p0, :cond_1

    .line 24
    .line 25
    return v5

    .line 26
    :cond_1
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public static synthetic e3(Lcom/p1/mobile/putong/data/Envelope;)Ljava/util/List;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iapAffiliatePromotions:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iapAffiliatePromotions:Ljava/util/List;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 23
    .line 24
    return-object p0
.end method

.method public static synthetic f3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/a69;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/a69;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/b69;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/b69;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method public static synthetic g3(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->h4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic h3(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->g4()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i3(Ljava/util/List;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic j3(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->C3()V

    return-void
.end method

.method public static bridge synthetic k3(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->y4()V

    return-void
.end method

.method public static l3(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v1, ":"

    .line 24
    .line 25
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    sub-int/2addr v0, p1

    .line 54
    const/4 p1, 0x0

    .line 55
    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    :cond_2
    return-object p0
.end method

.method public static m3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    move-object p0, v0

    .line 7
    :goto_0
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    goto :goto_1

    .line 14
    :cond_1
    move-object p1, v0

    .line 15
    :goto_1
    if-eqz p2, :cond_2

    .line 16
    .line 17
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    goto :goto_2

    .line 22
    :cond_2
    move-object p2, v0

    .line 23
    :goto_2
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_4

    .line 28
    .line 29
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-eqz p2, :cond_3

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_3
    return-object p1

    .line 37
    :cond_4
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_5

    .line 42
    .line 43
    new-instance p0, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p1, ":"

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :cond_5
    return-object v0
.end method

.method public static z4()V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->o0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-class v0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    sget-boolean v1, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->o0:Z

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    monitor-exit v0

    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception v1

    .line 16
    goto :goto_0

    .line 17
    :cond_1
    invoke-static {}, Ll/sw0;->c()Ll/sw0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$a;

    .line 22
    .line 23
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$a;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ll/sw0;->b(Ll/sw0$c;)V

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    sput-boolean v1, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->o0:Z

    .line 31
    .line 32
    monitor-exit v0

    .line 33
    return-void

    .line 34
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    throw v1
.end method


# virtual methods
.method public final A3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
    .locals 7
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->s3()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    return-object v2

    .line 13
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 14
    .line 15
    .line 16
    move-result-wide v3

    .line 17
    const-wide/16 v5, 0x3e8

    .line 18
    .line 19
    div-long/2addr v3, v5

    .line 20
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_8

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 35
    .line 36
    if-nez v1, :cond_2

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v5}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->D4(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    const-string v6, "svip"

    .line 46
    .line 47
    invoke-virtual {v6, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    if-nez v5, :cond_3

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v5}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b4(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    if-nez v5, :cond_4

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_4
    invoke-static {v1, v3, v4}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->d4(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;J)Z

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    if-nez v5, :cond_5

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_5
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 71
    .line 72
    invoke-virtual {p0, v5, v6}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->X3(J)Z

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    if-eqz v5, :cond_6

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_6
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->displayConfig:Ljava/util/Map;

    .line 80
    .line 81
    if-eqz v5, :cond_1

    .line 82
    .line 83
    const-string v6, "promotionMainPage"

    .line 84
    .line 85
    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    if-nez v5, :cond_7

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_7
    return-object v1

    .line 93
    :cond_8
    return-object v2
.end method

.method public A4(JJ)V
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-gtz v2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {v0, v1, p3, p4}, Ljava/lang/Math;->max(JJ)J

    .line 9
    .line 10
    .line 11
    move-result-wide p3

    .line 12
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->i0:J

    .line 13
    .line 14
    iput-wide p3, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->h0:J

    .line 15
    .line 16
    return-void
.end method

.method public B3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->C3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final B4(Ljava/util/List;)V
    .locals 9
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Z3()Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    if-eqz v4, :cond_0

    .line 18
    .line 19
    goto/16 :goto_1

    .line 20
    .line 21
    :cond_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-nez v4, :cond_6

    .line 26
    .line 27
    invoke-static {}, Ll/pzi0;->o()J

    .line 28
    .line 29
    .line 30
    move-result-wide v4

    .line 31
    const-wide/16 v6, 0x3e8

    .line 32
    .line 33
    div-long/2addr v4, v6

    .line 34
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    if-eqz v6, :cond_6

    .line 43
    .line 44
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    check-cast v6, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 49
    .line 50
    if-nez v6, :cond_2

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    iget-object v7, v6, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v7}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->D4(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    const-string v8, "svip"

    .line 60
    .line 61
    invoke-virtual {v8, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v7

    .line 65
    if-nez v7, :cond_3

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    iget-object v7, v6, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {v7}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b4(Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result v7

    .line 74
    if-nez v7, :cond_4

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_4
    invoke-static {v6, v4, v5}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->d4(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;J)Z

    .line 78
    .line 79
    .line 80
    move-result v7

    .line 81
    if-nez v7, :cond_5

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_5
    iget-object v7, v6, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->displayConfig:Ljava/util/Map;

    .line 85
    .line 86
    if-eqz v7, :cond_1

    .line 87
    .line 88
    const-string v8, "promotionMainPage"

    .line 89
    .line 90
    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v7

    .line 94
    if-nez v7, :cond_7

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_6
    const/4 v6, 0x0

    .line 98
    :cond_7
    if-nez v6, :cond_8

    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b0:Ll/byd0;

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->c0:Ll/byd0;

    .line 106
    .line 107
    invoke-virtual {p0, v3}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->c0:Ll/byd0;

    .line 112
    .line 113
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    check-cast p1, Ljava/lang/Long;

    .line 118
    .line 119
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 120
    .line 121
    .line 122
    move-result-wide v4

    .line 123
    cmp-long p1, v4, v1

    .line 124
    .line 125
    if-eqz p1, :cond_9

    .line 126
    .line 127
    iget-wide v1, v6, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 128
    .line 129
    cmp-long p1, v1, v4

    .line 130
    .line 131
    if-eqz p1, :cond_9

    .line 132
    .line 133
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b0:Ll/byd0;

    .line 134
    .line 135
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->c0:Ll/byd0;

    .line 139
    .line 140
    invoke-virtual {p0, v3}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    :cond_9
    :goto_1
    return-void
.end method

.method public final C3()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->i0:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-lez v0, :cond_2

    .line 8
    .line 9
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->h0:J

    .line 10
    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-gez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b0:Ll/byd0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/lang/Long;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->h0:J

    .line 29
    .line 30
    cmp-long v0, v0, v2

    .line 31
    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->c0:Ll/byd0;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ljava/lang/Long;

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->i0:J

    .line 47
    .line 48
    cmp-long v0, v0, v2

    .line 49
    .line 50
    if-nez v0, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b0:Ll/byd0;

    .line 54
    .line 55
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->h0:J

    .line 56
    .line 57
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->c0:Ll/byd0;

    .line 65
    .line 66
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->i0:J

    .line 67
    .line 68
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    :cond_2
    :goto_0
    return-void
.end method

.method public C4()J
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->y3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;->values()[Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    array-length v1, v0

    .line 15
    const/4 v2, 0x0

    .line 16
    :goto_0
    if-ge v2, v1, :cond_2

    .line 17
    .line 18
    aget-object v3, v0, v2

    .line 19
    .line 20
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;->displayConfigKey:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->z3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    iget-wide v0, v3, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 29
    .line 30
    return-wide v0

    .line 31
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    const-wide/16 v0, 0x0

    .line 35
    .line 36
    return-wide v0
.end method

.method public D3(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;->displayConfigKey:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->z3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public E3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->y3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public E4(JJ)V
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-lez v2, :cond_1

    .line 6
    .line 7
    cmp-long v0, p3, v0

    .line 8
    .line 9
    if-gtz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->m0:J

    .line 13
    .line 14
    iput-wide p3, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->n0:J

    .line 15
    .line 16
    :cond_1
    :goto_0
    return-void
.end method

.method public F3(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)J
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->p3(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public final F4()Z
    .locals 1

    .line 1
    const-string p0, "intl_ft_revamp"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->j0(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "test1"

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    const-string v0, "test2"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public G3(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->displayConfig:Ljava/util/Map;

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p1, p2, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;->displayConfigKey:Ljava/lang/String;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public G4(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->K4(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public H3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->I3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->displayConfig:Ljava/util/Map;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public H4()Z
    .locals 6

    .line 1
    invoke-static {}, Ll/joa;->f4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->I3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    return v1

    .line 16
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Y:Ll/byd0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/lang/Long;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 25
    .line 26
    .line 27
    move-result-wide v2

    .line 28
    iget-wide v4, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 29
    .line 30
    cmp-long p0, v2, v4

    .line 31
    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_2
    return v1
.end method

.method public I3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
    .locals 7
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->s3()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    return-object v2

    .line 13
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 14
    .line 15
    .line 16
    move-result-wide v3

    .line 17
    const-wide/16 v5, 0x3e8

    .line 18
    .line 19
    div-long/2addr v3, v5

    .line 20
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_6

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 35
    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v5}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->D4(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    const-string v6, "svip"

    .line 46
    .line 47
    invoke-virtual {v6, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    if-nez v5, :cond_2

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v5}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b4(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    if-nez v5, :cond_3

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    invoke-static {v1, v3, v4}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->d4(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;J)Z

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    if-nez v5, :cond_4

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_4
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 71
    .line 72
    invoke-virtual {p0, v5, v6}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->X3(J)Z

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    if-eqz v5, :cond_5

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_5
    return-object v1

    .line 80
    :cond_6
    return-object v2
.end method

.method public I4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->w4()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/y59;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/y59;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/z59;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/z59;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Lrx/c;->subscribe(Ll/y20;Ll/y20;)Ll/kcg0;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public J3()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->y3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->endTime:J

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public J4(JJJ)V
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-lez v2, :cond_1

    .line 6
    .line 7
    cmp-long v2, p3, v0

    .line 8
    .line 9
    if-gtz v2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->j0:J

    .line 13
    .line 14
    iput-wide p3, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->l0:J

    .line 15
    .line 16
    invoke-static {v0, v1, p5, p6}, Ljava/lang/Math;->max(JJ)J

    .line 17
    .line 18
    .line 19
    move-result-wide p1

    .line 20
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->k0:J

    .line 21
    .line 22
    :cond_1
    :goto_0
    return-void
.end method

.method public K3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->F4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    new-instance v0, Ll/x59;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/x59;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v1, "iap_affiliate_promotions_googleplay"

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-virtual {p0, v1, v2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public L3(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->displayConfig:Ljava/util/Map;

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p1, "promotionMainPage"

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public M3(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 p0, 0x0

    return p0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions$IntlAffiliateDiscountEntryTab;->displayConfigKey:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->z3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public N3()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->y3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public O3()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->s3()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method public P3()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->A3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final S3()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->S:Ljava/util/List;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->T:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->U:Z

    .line 8
    .line 9
    return-void
.end method

.method public T3()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->I3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->V3(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public W3()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->V:Z

    .line 2
    .line 3
    return p0
.end method

.method public final X3(J)Z
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->d0:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    cmp-long p0, v0, v2

    .line 16
    .line 17
    if-lez p0, :cond_0

    .line 18
    .line 19
    cmp-long p0, p1, v2

    .line 20
    .line 21
    if-lez p0, :cond_0

    .line 22
    .line 23
    cmp-long p0, v0, p1

    .line 24
    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public Y3(J)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->X3(J)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final Z3()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public c4()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->y3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->V3(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public e4()Z
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->V:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->N3()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    return v1

    .line 14
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->E3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    return v1

    .line 21
    :cond_2
    iget-wide v2, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 22
    .line 23
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Y3(J)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_3

    .line 28
    .line 29
    return v1

    .line 30
    :cond_3
    iget-wide v2, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Z:Ll/jxd0;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const-wide/16 v4, 0x0

    .line 45
    .line 46
    cmp-long v4, v2, v4

    .line 47
    .line 48
    const/4 v5, 0x1

    .line 49
    if-lez v4, :cond_6

    .line 50
    .line 51
    if-eqz v0, :cond_4

    .line 52
    .line 53
    return v1

    .line 54
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->a0:Ll/byd0;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Ljava/lang/Long;

    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 63
    .line 64
    .line 65
    move-result-wide v6

    .line 66
    cmp-long p0, v2, v6

    .line 67
    .line 68
    if-eqz p0, :cond_5

    .line 69
    .line 70
    return v5

    .line 71
    :cond_5
    return v1

    .line 72
    :cond_6
    xor-int/lit8 p0, v0, 0x1

    .line 73
    .line 74
    return p0
.end method

.method public f4(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Z
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3e8

    .line 6
    .line 7
    div-long/2addr v0, v2

    .line 8
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->d4(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;J)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final synthetic g4()Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->R:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final synthetic h4(Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->R:Ljava/util/List;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->R:Ljava/util/List;

    .line 18
    .line 19
    :goto_0
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->V:Z

    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->R:Ljava/util/List;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->s4(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->t3()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic i4(Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lrx/c;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->o3(Lrx/c;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic j4(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lrx/c;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->o3(Lrx/c;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final k4(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->d0:Ll/byd0;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->f0:Lrx/subjects/b;

    .line 11
    .line 12
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {v0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->e0:Lrx/subjects/b;

    .line 20
    .line 21
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public l4(Lcom/p1/mobile/putong/core/data/Merchandise;)Z
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/core/data/Merchandise;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_7

    .line 3
    .line 4
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 5
    .line 6
    if-eqz p1, :cond_7

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->googleplay:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    return v0

    .line 22
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->y3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-eqz p0, :cond_7

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerId:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    goto :goto_0

    .line 56
    :cond_3
    const-string v1, ""

    .line 57
    .line 58
    :goto_0
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->V3(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_6

    .line 63
    .line 64
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-nez v2, :cond_6

    .line 69
    .line 70
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerId:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {p1, v2, p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->m3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    const/4 v3, 0x1

    .line 83
    if-nez v2, :cond_4

    .line 84
    .line 85
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-eqz p0, :cond_4

    .line 90
    .line 91
    return v3

    .line 92
    :cond_4
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->l3(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    if-eqz p0, :cond_5

    .line 101
    .line 102
    return v3

    .line 103
    :cond_5
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Q3(Ljava/lang/String;Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    return p0

    .line 108
    :cond_6
    invoke-static {v0, p1, v1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->R3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    return p0

    .line 113
    :cond_7
    :goto_1
    return v0
.end method

.method public m4(Lcom/p1/mobile/putong/core/data/Merchandise;)Z
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/core/data/Merchandise;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_7

    .line 3
    .line 4
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 5
    .line 6
    if-eqz p1, :cond_7

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->googleplay:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    return v0

    .line 22
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->A3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-eqz p0, :cond_7

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerId:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    goto :goto_0

    .line 56
    :cond_3
    const-string v1, ""

    .line 57
    .line 58
    :goto_0
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->V3(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_6

    .line 63
    .line 64
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-nez v2, :cond_6

    .line 69
    .line 70
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerId:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {p1, v2, p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->m3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    const/4 v3, 0x1

    .line 83
    if-nez v2, :cond_4

    .line 84
    .line 85
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-eqz p0, :cond_4

    .line 90
    .line 91
    return v3

    .line 92
    :cond_4
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->l3(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    if-eqz p0, :cond_5

    .line 101
    .line 102
    return v3

    .line 103
    :cond_5
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Q3(Ljava/lang/String;Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    return p0

    .line 108
    :cond_6
    invoke-static {v0, p1, v1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->R3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    return p0

    .line 113
    :cond_7
    :goto_1
    return v0
.end method

.method public n3()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->m0:J

    .line 4
    .line 5
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->n0:J

    .line 6
    .line 7
    return-void
.end method

.method public final n4(Ljava/util/List;)V
    .locals 6
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->d0:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    cmp-long v4, v0, v2

    .line 16
    .line 17
    if-nez v4, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Z3()Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-eqz v4, :cond_1

    .line 25
    .line 26
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->a4(J)Z

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-eqz v4, :cond_1

    .line 31
    .line 32
    :goto_0
    return-void

    .line 33
    :cond_1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-nez v4, :cond_3

    .line 38
    .line 39
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    :cond_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-eqz v4, :cond_3

    .line 48
    .line 49
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    check-cast v4, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 54
    .line 55
    if-eqz v4, :cond_2

    .line 56
    .line 57
    iget-wide v4, v4, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 58
    .line 59
    cmp-long v4, v4, v0

    .line 60
    .line 61
    if-nez v4, :cond_2

    .line 62
    .line 63
    return-void

    .line 64
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->d0:Ll/byd0;

    .line 65
    .line 66
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final o3(Lrx/c;)V
    .locals 2
    .param p1    # Lrx/c;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->W:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->X:Lrx/c;

    .line 5
    .line 6
    if-ne v1, p1, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->X:Lrx/c;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method

.method public o4(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->w3(J)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->f4(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->k4(J)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->r3(J)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->x3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    iget-wide p1, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 34
    .line 35
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->r3(J)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->e0:Lrx/subjects/b;

    .line 40
    .line 41
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final p3(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)J
    .locals 17
    .param p1    # Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    const-wide/16 v4, 0x3e8

    .line 10
    .line 11
    div-long v6, v2, v4

    .line 12
    .line 13
    iget-wide v8, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->endTime:J

    .line 14
    .line 15
    const-wide/16 v10, 0x0

    .line 16
    .line 17
    cmp-long v12, v8, v10

    .line 18
    .line 19
    if-lez v12, :cond_0

    .line 20
    .line 21
    mul-long/2addr v8, v4

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-wide v8, 0x1fffffffffffffffL

    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    :goto_0
    iget-object v12, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->extraConfig:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;

    .line 29
    .line 30
    if-eqz v12, :cond_8

    .line 31
    .line 32
    iget-wide v12, v12, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;->countdown:J

    .line 33
    .line 34
    cmp-long v14, v12, v10

    .line 35
    .line 36
    if-gtz v14, :cond_1

    .line 37
    .line 38
    goto/16 :goto_3

    .line 39
    .line 40
    :cond_1
    iget-object v14, v0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b0:Ll/byd0;

    .line 41
    .line 42
    invoke-virtual {v14}, Ll/azd0;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v14

    .line 46
    check-cast v14, Ljava/lang/Long;

    .line 47
    .line 48
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    iget-object v14, v0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->c0:Ll/byd0;

    .line 52
    .line 53
    invoke-virtual {v14}, Ll/azd0;->get()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v14

    .line 57
    check-cast v14, Ljava/lang/Long;

    .line 58
    .line 59
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->u3(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)V

    .line 63
    .line 64
    .line 65
    iget-object v14, v0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b0:Ll/byd0;

    .line 66
    .line 67
    invoke-virtual {v14}, Ll/azd0;->get()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v14

    .line 71
    check-cast v14, Ljava/lang/Long;

    .line 72
    .line 73
    invoke-virtual {v14}, Ljava/lang/Long;->longValue()J

    .line 74
    .line 75
    .line 76
    move-result-wide v14

    .line 77
    cmp-long v16, v14, v10

    .line 78
    .line 79
    if-gez v16, :cond_3

    .line 80
    .line 81
    iget-wide v14, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->endTime:J

    .line 82
    .line 83
    cmp-long v16, v14, v10

    .line 84
    .line 85
    if-lez v16, :cond_2

    .line 86
    .line 87
    sub-long/2addr v14, v6

    .line 88
    invoke-static {v10, v11, v14, v15}, Ljava/lang/Math;->max(JJ)J

    .line 89
    .line 90
    .line 91
    move-result-wide v14

    .line 92
    goto :goto_1

    .line 93
    :cond_2
    const-wide v14, 0x10624dd2f1a9fbL

    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    :goto_1
    invoke-static {v12, v13, v14, v15}, Ljava/lang/Math;->min(JJ)J

    .line 99
    .line 100
    .line 101
    move-result-wide v14

    .line 102
    :cond_3
    iget-wide v12, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->endTime:J

    .line 103
    .line 104
    cmp-long v16, v12, v10

    .line 105
    .line 106
    if-lez v16, :cond_4

    .line 107
    .line 108
    sub-long/2addr v12, v6

    .line 109
    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->max(JJ)J

    .line 110
    .line 111
    .line 112
    move-result-wide v6

    .line 113
    goto :goto_2

    .line 114
    :cond_4
    const-wide v6, 0x20c49ba5e353f7L

    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    :goto_2
    invoke-static {v14, v15, v6, v7}, Ljava/lang/Math;->min(JJ)J

    .line 120
    .line 121
    .line 122
    move-result-wide v6

    .line 123
    mul-long/2addr v4, v6

    .line 124
    add-long/2addr v4, v2

    .line 125
    iget-wide v12, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->endTime:J

    .line 126
    .line 127
    cmp-long v12, v12, v10

    .line 128
    .line 129
    if-lez v12, :cond_5

    .line 130
    .line 131
    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->min(JJ)J

    .line 132
    .line 133
    .line 134
    move-result-wide v4

    .line 135
    :cond_5
    iget-wide v12, v0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->j0:J

    .line 136
    .line 137
    iget-wide v14, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 138
    .line 139
    cmp-long v12, v12, v14

    .line 140
    .line 141
    if-nez v12, :cond_7

    .line 142
    .line 143
    iget-wide v12, v0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->k0:J

    .line 144
    .line 145
    cmp-long v12, v12, v6

    .line 146
    .line 147
    if-nez v12, :cond_7

    .line 148
    .line 149
    iget-wide v12, v0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->l0:J

    .line 150
    .line 151
    cmp-long v12, v12, v2

    .line 152
    .line 153
    if-lez v12, :cond_7

    .line 154
    .line 155
    iget-wide v12, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->endTime:J

    .line 156
    .line 157
    cmp-long v10, v12, v10

    .line 158
    .line 159
    iget-wide v11, v0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->l0:J

    .line 160
    .line 161
    if-lez v10, :cond_6

    .line 162
    .line 163
    invoke-static {v11, v12, v8, v9}, Ljava/lang/Math;->min(JJ)J

    .line 164
    .line 165
    .line 166
    move-result-wide v11

    .line 167
    :cond_6
    cmp-long v2, v11, v2

    .line 168
    .line 169
    if-lez v2, :cond_7

    .line 170
    .line 171
    return-wide v11

    .line 172
    :cond_7
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 173
    .line 174
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->j0:J

    .line 175
    .line 176
    iput-wide v6, v0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->k0:J

    .line 177
    .line 178
    iput-wide v4, v0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->l0:J

    .line 179
    .line 180
    return-wide v4

    .line 181
    :cond_8
    :goto_3
    return-wide v8
.end method

.method public p4()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->e0:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public q3(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->w3(J)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->f4(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    :goto_0
    return-void

    .line 22
    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->r3(J)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public q4()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->g0:Lrx/subjects/ReplaySubject;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final r3(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->d0:Ll/byd0;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b0:Ll/byd0;

    .line 11
    .line 12
    const-wide/16 v1, -0x1

    .line 13
    .line 14
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->c0:Ll/byd0;

    .line 22
    .line 23
    const-wide/16 v1, 0x0

    .line 24
    .line 25
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->f0:Lrx/subjects/b;

    .line 33
    .line 34
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {v0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->e0:Lrx/subjects/b;

    .line 42
    .line 43
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public r4()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->f0:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final s3()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->S3()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->R:Ljava/util/List;

    .line 5
    .line 6
    return-object p0
.end method

.method public final s4(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->n4(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->B4(Ljava/util/List;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final t3()V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->g0:Lrx/subjects/ReplaySubject;

    .line 2
    .line 3
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/ReplaySubject;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final t4()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
    .locals 6
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->s3()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-object v1

    .line 13
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    const-wide/16 v4, 0x3e8

    .line 18
    .line 19
    div-long/2addr v2, v4

    .line 20
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_7

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 35
    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v4}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->D4(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    const-string v5, "svip"

    .line 46
    .line 47
    invoke-virtual {v5, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-nez v4, :cond_3

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v4}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b4(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    if-nez v4, :cond_4

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_4
    invoke-static {v0, v2, v3}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->d4(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;J)Z

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-nez v4, :cond_5

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_5
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->displayConfig:Ljava/util/Map;

    .line 71
    .line 72
    if-eqz v4, :cond_1

    .line 73
    .line 74
    const-string v5, "promotionMainPage"

    .line 75
    .line 76
    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    if-nez v4, :cond_6

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_6
    return-object v0

    .line 84
    :cond_7
    return-object v1
.end method

.method public final u3(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)V
    .locals 12
    .param p1    # Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->K4(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    const-wide/16 v2, 0x3e8

    .line 13
    .line 14
    div-long/2addr v0, v2

    .line 15
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->extraConfig:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;

    .line 16
    .line 17
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;->countdown:J

    .line 18
    .line 19
    iget-wide v4, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->endTime:J

    .line 20
    .line 21
    const-wide/16 v6, 0x0

    .line 22
    .line 23
    cmp-long v8, v4, v6

    .line 24
    .line 25
    if-lez v8, :cond_1

    .line 26
    .line 27
    sub-long/2addr v4, v0

    .line 28
    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->max(JJ)J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const-wide v0, 0x10624dd2f1a9fbL

    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    :goto_0
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    iget-object v4, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->c0:Ll/byd0;

    .line 43
    .line 44
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    check-cast v4, Ljava/lang/Long;

    .line 49
    .line 50
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 51
    .line 52
    .line 53
    move-result-wide v4

    .line 54
    iget-object v8, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b0:Ll/byd0;

    .line 55
    .line 56
    invoke-virtual {v8}, Ll/azd0;->get()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v8

    .line 60
    check-cast v8, Ljava/lang/Long;

    .line 61
    .line 62
    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    .line 63
    .line 64
    .line 65
    move-result-wide v8

    .line 66
    iget-wide v10, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 67
    .line 68
    cmp-long v4, v4, v10

    .line 69
    .line 70
    if-nez v4, :cond_4

    .line 71
    .line 72
    cmp-long v4, v8, v6

    .line 73
    .line 74
    if-gez v4, :cond_2

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_2
    invoke-static {v8, v9, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 78
    .line 79
    .line 80
    move-result-wide v0

    .line 81
    cmp-long p1, v0, v8

    .line 82
    .line 83
    if-eqz p1, :cond_3

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b0:Ll/byd0;

    .line 86
    .line 87
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    :cond_3
    :goto_1
    return-void

    .line 95
    :cond_4
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b0:Ll/byd0;

    .line 96
    .line 97
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->c0:Ll/byd0;

    .line 105
    .line 106
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 107
    .line 108
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public u4(J)J
    .locals 4

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-lez v2, :cond_1

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->m0:J

    .line 8
    .line 9
    cmp-long p1, v2, p1

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->n0:J

    .line 15
    .line 16
    return-wide p0

    .line 17
    :cond_1
    :goto_0
    return-wide v0
.end method

.method public v3(Lcom/p1/mobile/putong/core/data/Merchandise;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/core/data/Merchandise;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 6
    .line 7
    if-eqz p1, :cond_a

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 10
    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->googleplay:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->s3()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_3

    .line 32
    .line 33
    return-object v0

    .line 34
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    :cond_4
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_a

    .line 47
    .line 48
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 53
    .line 54
    if-nez v1, :cond_5

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_5
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v2}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->D4(Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    const-string v3, "svip"

    .line 64
    .line 65
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-nez v2, :cond_6

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_6
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v2}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b4(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-nez v2, :cond_7

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_7
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->displayConfig:Ljava/util/Map;

    .line 82
    .line 83
    if-eqz v2, :cond_4

    .line 84
    .line 85
    const-string v3, "promotionMainPage"

    .line 86
    .line 87
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    if-nez v2, :cond_8

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_8
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 95
    .line 96
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    if-eqz v2, :cond_9

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_9
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-static {v2, p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Q3(Ljava/lang/String;Ljava/lang/String;)Z

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-eqz v2, :cond_4

    .line 114
    .line 115
    return-object v1

    .line 116
    :cond_a
    :goto_1
    return-object v0
.end method

.method public v4()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->W:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->X:Lrx/c;

    .line 6
    .line 7
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->V:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->w4()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw p0
.end method

.method public w3(J)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->s3()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-object v1

    .line 13
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-wide v2, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 32
    .line 33
    cmp-long v2, v2, p1

    .line 34
    .line 35
    if-nez v2, :cond_1

    .line 36
    .line 37
    return-object v0

    .line 38
    :cond_2
    return-object v1
.end method

.method public w4()Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->F4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->R:Ljava/util/List;

    .line 11
    .line 12
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->V:Z

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->R:Ljava/util/List;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->s4(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->t3()V

    .line 20
    .line 21
    .line 22
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->R:Ljava/util/List;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->W:Ljava/lang/Object;

    .line 43
    .line 44
    monitor-enter v0

    .line 45
    :try_start_0
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->V:Z

    .line 46
    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    new-instance v1, Ll/t59;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/t59;-><init>(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Lrx/c;->defer(Ll/pcj;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {p0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    monitor-exit v0

    .line 67
    return-object p0

    .line 68
    :catchall_0
    move-exception p0

    .line 69
    goto :goto_0

    .line 70
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->X:Lrx/c;

    .line 71
    .line 72
    if-eqz v2, :cond_2

    .line 73
    .line 74
    monitor-exit v0

    .line 75
    return-object v2

    .line 76
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->K3()Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    new-instance v3, Ll/u59;

    .line 81
    .line 82
    invoke-direct {v3, p0}, Ll/u59;-><init>(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2, v3}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v2}, Lrx/c;->publish()Ll/ax5;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    new-instance v3, Ljava/util/concurrent/atomic/AtomicReference;

    .line 94
    .line 95
    invoke-direct {v3}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v2, v1}, Ll/ax5;->a(I)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    new-instance v2, Ll/v59;

    .line 103
    .line 104
    invoke-direct {v2, p0, v3}, Ll/v59;-><init>(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v1, v2}, Lrx/c;->doOnCompleted(Ll/x20;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    new-instance v2, Ll/w59;

    .line 112
    .line 113
    invoke-direct {v2, p0, v3}, Ll/w59;-><init>(Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v1, v2}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v3, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->X:Lrx/c;

    .line 124
    .line 125
    monitor-exit v0

    .line 126
    return-object v1

    .line 127
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 128
    throw p0
.end method

.method public final x3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
    .locals 9
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->s3()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    return-object v2

    .line 13
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 14
    .line 15
    .line 16
    move-result-wide v3

    .line 17
    const-wide/16 v5, 0x3e8

    .line 18
    .line 19
    div-long/2addr v3, v5

    .line 20
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_7

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 35
    .line 36
    if-nez v1, :cond_2

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v5}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->D4(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    const-string v6, "svip"

    .line 46
    .line 47
    invoke-virtual {v6, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    if-nez v5, :cond_3

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v5}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b4(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    if-nez v5, :cond_4

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_4
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->endTime:J

    .line 64
    .line 65
    const-wide/16 v7, 0x0

    .line 66
    .line 67
    cmp-long v7, v5, v7

    .line 68
    .line 69
    if-lez v7, :cond_1

    .line 70
    .line 71
    cmp-long v5, v3, v5

    .line 72
    .line 73
    if-gez v5, :cond_5

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_5
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 77
    .line 78
    invoke-virtual {p0, v5, v6}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->X3(J)Z

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    if-eqz v5, :cond_6

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_6
    return-object v1

    .line 86
    :cond_7
    return-object v2
.end method

.method public x4()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b0:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0
.end method

.method public final y3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
    .locals 6
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->s3()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-object v1

    .line 13
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    const-wide/16 v4, 0x3e8

    .line 18
    .line 19
    div-long/2addr v2, v4

    .line 20
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_7

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 35
    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v4}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->D4(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    const-string v5, "svip"

    .line 46
    .line 47
    invoke-virtual {v5, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-nez v4, :cond_3

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v4}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b4(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    if-nez v4, :cond_4

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_4
    invoke-static {v0, v2, v3}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->d4(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;J)Z

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-nez v4, :cond_5

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_5
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->displayConfig:Ljava/util/Map;

    .line 71
    .line 72
    if-eqz v4, :cond_1

    .line 73
    .line 74
    const-string v5, "promotionMainPage"

    .line 75
    .line 76
    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    if-nez v4, :cond_6

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_6
    return-object v0

    .line 84
    :cond_7
    return-object v1
.end method

.method public final y4()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->C3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->t4()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->e0:Lrx/subjects/b;

    .line 11
    .line 12
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 19
    .line 20
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->X3(J)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->e0:Lrx/subjects/b;

    .line 27
    .line 28
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    invoke-static {v0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->K4(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->e0:Lrx/subjects/b;

    .line 41
    .line 42
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b0:Ll/byd0;

    .line 49
    .line 50
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Ljava/lang/Long;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 57
    .line 58
    .line 59
    move-result-wide v1

    .line 60
    const-wide/16 v3, 0x0

    .line 61
    .line 62
    cmp-long v5, v1, v3

    .line 63
    .line 64
    if-gez v5, :cond_3

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->e0:Lrx/subjects/b;

    .line 67
    .line 68
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_3
    invoke-static {}, Ll/pzi0;->o()J

    .line 75
    .line 76
    .line 77
    move-result-wide v5

    .line 78
    const-wide/16 v7, 0x3e8

    .line 79
    .line 80
    div-long/2addr v5, v7

    .line 81
    iget-wide v7, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->endTime:J

    .line 82
    .line 83
    cmp-long v3, v7, v3

    .line 84
    .line 85
    if-lez v3, :cond_4

    .line 86
    .line 87
    add-long/2addr v5, v1

    .line 88
    cmp-long v1, v5, v7

    .line 89
    .line 90
    if-ltz v1, :cond_4

    .line 91
    .line 92
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 93
    .line 94
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->r3(J)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->e0:Lrx/subjects/b;

    .line 99
    .line 100
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final z3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
    .locals 12
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->s3()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    return-object v2

    .line 13
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 14
    .line 15
    .line 16
    move-result-wide v3

    .line 17
    const-wide/16 v5, 0x3e8

    .line 18
    .line 19
    div-long/2addr v3, v5

    .line 20
    const-string v1, "newSee"

    .line 21
    .line 22
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const-string v5, "oldVisitor"

    .line 27
    .line 28
    const-string v6, "oldSee"

    .line 29
    .line 30
    const-string v7, "oldLike"

    .line 31
    .line 32
    const/4 v8, 0x1

    .line 33
    const/4 v9, 0x0

    .line 34
    if-nez v1, :cond_2

    .line 35
    .line 36
    const-string v1, "newLike"

    .line 37
    .line 38
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_2

    .line 43
    .line 44
    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-nez v1, :cond_2

    .line 49
    .line 50
    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_2

    .line 55
    .line 56
    const-string v1, "newVisitor"

    .line 57
    .line 58
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-nez v1, :cond_2

    .line 63
    .line 64
    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_2

    .line 69
    .line 70
    const-string v1, "swipeCardPage"

    .line 71
    .line 72
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    move v1, v9

    .line 80
    goto :goto_1

    .line 81
    :cond_2
    :goto_0
    move v1, v8

    .line 82
    :goto_1
    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v6

    .line 86
    if-nez v6, :cond_4

    .line 87
    .line 88
    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    if-nez v6, :cond_4

    .line 93
    .line 94
    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    if-eqz v5, :cond_3

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_3
    move v8, v9

    .line 102
    :cond_4
    :goto_2
    move-object v5, v2

    .line 103
    :goto_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 104
    .line 105
    .line 106
    move-result v6

    .line 107
    if-ge v9, v6, :cond_f

    .line 108
    .line 109
    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v6

    .line 113
    check-cast v6, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 114
    .line 115
    if-nez v6, :cond_5

    .line 116
    .line 117
    goto :goto_6

    .line 118
    :cond_5
    iget-object v7, v6, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {v7}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->D4(Ljava/lang/String;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v7

    .line 124
    const-string v10, "svip"

    .line 125
    .line 126
    invoke-virtual {v10, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 127
    .line 128
    .line 129
    move-result v7

    .line 130
    if-nez v7, :cond_6

    .line 131
    .line 132
    goto :goto_6

    .line 133
    :cond_6
    iget-object v7, v6, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 134
    .line 135
    invoke-static {v7}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->b4(Ljava/lang/String;)Z

    .line 136
    .line 137
    .line 138
    move-result v7

    .line 139
    if-nez v7, :cond_7

    .line 140
    .line 141
    goto :goto_6

    .line 142
    :cond_7
    invoke-static {v6, v3, v4}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->d4(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;J)Z

    .line 143
    .line 144
    .line 145
    move-result v7

    .line 146
    if-nez v7, :cond_8

    .line 147
    .line 148
    goto :goto_6

    .line 149
    :cond_8
    iget-wide v10, v6, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 150
    .line 151
    invoke-virtual {p0, v10, v11}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->X3(J)Z

    .line 152
    .line 153
    .line 154
    move-result v7

    .line 155
    if-eqz v7, :cond_9

    .line 156
    .line 157
    goto :goto_6

    .line 158
    :cond_9
    iget-object v7, v6, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->displayConfig:Ljava/util/Map;

    .line 159
    .line 160
    if-eqz v7, :cond_a

    .line 161
    .line 162
    invoke-interface {v7, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v7

    .line 166
    check-cast v7, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;

    .line 167
    .line 168
    goto :goto_4

    .line 169
    :cond_a
    move-object v7, v2

    .line 170
    :goto_4
    invoke-static {v7, v1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->U3(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;Z)Z

    .line 171
    .line 172
    .line 173
    move-result v7

    .line 174
    if-nez v7, :cond_b

    .line 175
    .line 176
    goto :goto_6

    .line 177
    :cond_b
    if-nez v8, :cond_c

    .line 178
    .line 179
    goto :goto_5

    .line 180
    :cond_c
    if-nez v5, :cond_d

    .line 181
    .line 182
    move-object v5, v6

    .line 183
    :cond_d
    invoke-static {v6}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->K4(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Z

    .line 184
    .line 185
    .line 186
    move-result v7

    .line 187
    if-eqz v7, :cond_e

    .line 188
    .line 189
    :goto_5
    return-object v6

    .line 190
    :cond_e
    :goto_6
    add-int/lit8 v9, v9, 0x1

    .line 191
    .line 192
    goto :goto_3

    .line 193
    :cond_f
    return-object v5
.end method
