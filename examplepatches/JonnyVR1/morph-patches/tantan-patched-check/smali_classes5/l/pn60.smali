.class public final Ll/pn60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/j2m;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0012\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\u0008\u0010\t\u001a\u0004\u0018\u00010\u0008\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u001f\u0010\u0011\u001a\u00020\u00102\u0006\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000f\u001a\u00020\u000eH\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\u0012R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0011\u0010\u0013\u001a\u0004\u0008\u0014\u0010\u0015R\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0016\u0010\u0017\u001a\u0004\u0008\u0018\u0010\u0019R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001a\u0010\u001b\u001a\u0004\u0008\u001c\u0010\u001dR\u0019\u0010\t\u001a\u0004\u0018\u00010\u00088\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001e\u0010\u001f\u001a\u0004\u0008 \u0010!\u00a8\u0006\""
    }
    d2 = {
        "Ll/pn60;",
        "Ll/j2m;",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "purchaseType",
        "",
        "from",
        "Ll/ndb0;",
        "mediator",
        "<init>",
        "(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V",
        "Ll/jn60;",
        "paymentHandlerData",
        "Ll/l5;",
        "paymentComponent",
        "",
        "a",
        "(Ll/jn60;Ll/l5;)Z",
        "Lcom/p1/mobile/android/app/Act;",
        "getAct",
        "()Lcom/p1/mobile/android/app/Act;",
        "b",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "getPurchaseType",
        "()Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "c",
        "Ljava/lang/String;",
        "getFrom",
        "()Ljava/lang/String;",
        "d",
        "Ll/ndb0;",
        "getMediator",
        "()Ll/ndb0;",
        "pay_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/putong/core/data/PurchaseType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final c:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public final d:Ll/ndb0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Ll/ndb0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/pn60;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iput-object p2, p0, Ll/pn60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    iput-object p3, p0, Ll/pn60;->c:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p4, p0, Ll/pn60;->d:Ll/ndb0;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic b(Ll/pn60;Lcom/p1/mobile/putong/core/data/Merchandise;Ll/l5;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/pn60;->e(Ll/pn60;Lcom/p1/mobile/putong/core/data/Merchandise;Ll/l5;)V

    return-void
.end method

.method public static synthetic c(Ll/l5;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/pn60;->f(Ll/l5;)V

    return-void
.end method

.method public static synthetic d(Ll/pn60;Ll/jn60;Ll/l5;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/pn60;->g(Ll/pn60;Ll/jn60;Ll/l5;)V

    return-void
.end method

.method public static final e(Ll/pn60;Lcom/p1/mobile/putong/core/data/Merchandise;Ll/l5;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pn60;->d:Ll/ndb0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/ndb0;->X(I)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Ll/pn60;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    new-instance p1, Ll/on60;

    .line 13
    .line 14
    invoke-direct {p1, p2}, Ll/on60;-><init>(Ll/l5;)V

    .line 15
    .line 16
    .line 17
    const-wide/16 v0, 0xfa

    .line 18
    .line 19
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static final f(Ll/l5;)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {p0, v0}, Ll/l5;->x(Ljava/lang/Integer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static final g(Ll/pn60;Ll/jn60;Ll/l5;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pn60;->d:Ll/ndb0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->q()Ll/lib0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/pn60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, p1, p0, v1}, Ll/lib0;->t(Ll/jn60;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1}, Ll/jn60;->a()Lcom/p1/mobile/putong/data/PayMethod;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p2, p0}, Ll/l5;->D(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public a(Ll/jn60;Ll/l5;)Z
    .locals 6
    .param p1    # Ll/jn60;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/l5;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/pta;->k()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/tab0;->z()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x0

    .line 20
    if-eqz v1, :cond_9

    .line 21
    .line 22
    iget-object v1, p0, Ll/pn60;->c:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/purchase/e;->x(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_9

    .line 29
    .line 30
    sget-object v1, Ll/g6b;->Companion:Ll/g6b$a;

    .line 31
    .line 32
    iget-object v3, p0, Ll/pn60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 33
    .line 34
    invoke-virtual {v1, v3}, Ll/g6b$a;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-nez v3, :cond_9

    .line 39
    .line 40
    iget-object v3, p0, Ll/pn60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 41
    .line 42
    invoke-virtual {v1, v3}, Ll/g6b$a;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    if-nez v0, :cond_9

    .line 49
    .line 50
    :cond_0
    invoke-virtual {p1}, Ll/jn60;->b()Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->n()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    goto :goto_0

    .line 65
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    :goto_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget-object v1, p0, Ll/pn60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 74
    .line 75
    invoke-static {v1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    const/4 v3, 0x1

    .line 80
    if-nez v1, :cond_2

    .line 81
    .line 82
    iget-object v1, p0, Ll/pn60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 83
    .line 84
    invoke-static {v1}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eqz v1, :cond_3

    .line 89
    .line 90
    :cond_2
    iget-object v1, p0, Ll/pn60;->c:Ljava/lang/String;

    .line 91
    .line 92
    sget-object v4, Ll/cok0;->a:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_3

    .line 99
    .line 100
    move v1, v3

    .line 101
    goto :goto_1

    .line 102
    :cond_3
    move v1, v2

    .line 103
    :goto_1
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 104
    .line 105
    const-string v5, "svip"

    .line 106
    .line 107
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    if-eqz v4, :cond_4

    .line 112
    .line 113
    const-string v4, "lowPriceFirstTime12MSVIP"

    .line 114
    .line 115
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/core/data/Merchandise;->isBelongPromotion(Ljava/lang/String;)Z

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    if-eqz v4, :cond_4

    .line 120
    .line 121
    move v4, v3

    .line 122
    goto :goto_2

    .line 123
    :cond_4
    move v4, v2

    .line 124
    :goto_2
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    if-eqz v5, :cond_9

    .line 129
    .line 130
    if-nez v1, :cond_9

    .line 131
    .line 132
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-eqz v1, :cond_5

    .line 137
    .line 138
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    if-eqz v1, :cond_9

    .line 143
    .line 144
    invoke-virtual {p1}, Ll/jn60;->a()Lcom/p1/mobile/putong/data/PayMethod;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    const-string v5, "alipay"

    .line 149
    .line 150
    invoke-static {v1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-eqz v1, :cond_9

    .line 155
    .line 156
    if-nez v4, :cond_9

    .line 157
    .line 158
    :cond_5
    iget-object v1, p0, Ll/pn60;->d:Ll/ndb0;

    .line 159
    .line 160
    const/4 v4, 0x0

    .line 161
    if-eqz v1, :cond_7

    .line 162
    .line 163
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->o()Ll/pbb0;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    if-eqz v1, :cond_7

    .line 168
    .line 169
    invoke-virtual {v1}, Ll/pbb0;->l()Z

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    if-ne v1, v3, :cond_7

    .line 174
    .line 175
    iget-object v1, p0, Ll/pn60;->d:Ll/ndb0;

    .line 176
    .line 177
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->o()Ll/pbb0;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    if-eqz v1, :cond_6

    .line 182
    .line 183
    iget v5, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 184
    .line 185
    invoke-virtual {v1, v5}, Ll/pbb0;->h(I)Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    goto :goto_3

    .line 190
    :cond_6
    move-object v1, v4

    .line 191
    goto :goto_3

    .line 192
    :cond_7
    iget-object v1, p0, Ll/pn60;->d:Ll/ndb0;

    .line 193
    .line 194
    if-eqz v1, :cond_6

    .line 195
    .line 196
    iget v5, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 197
    .line 198
    invoke-virtual {v1, v5}, Ll/ndb0;->Z(I)Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    :goto_3
    if-eqz v1, :cond_9

    .line 203
    .line 204
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->p()I

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    iget-object v2, p0, Ll/pn60;->a:Lcom/p1/mobile/android/app/Act;

    .line 213
    .line 214
    iget-object v5, p0, Ll/pn60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 215
    .line 216
    invoke-static {v2, v1, v5}, Ll/bn60;->P(Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/CharSequence;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    iget-object v5, p0, Ll/pn60;->d:Ll/ndb0;

    .line 221
    .line 222
    if-eqz v5, :cond_8

    .line 223
    .line 224
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->q()Ll/lib0;

    .line 225
    .line 226
    .line 227
    move-result-object v5

    .line 228
    if-eqz v5, :cond_8

    .line 229
    .line 230
    invoke-virtual {v5}, Ll/lib0;->e()Lorg/json/JSONObject;

    .line 231
    .line 232
    .line 233
    move-result-object v4

    .line 234
    :cond_8
    new-instance v5, Ll/mn60;

    .line 235
    .line 236
    invoke-direct {v5, p0, v0, p2}, Ll/mn60;-><init>(Ll/pn60;Lcom/p1/mobile/putong/core/data/Merchandise;Ll/l5;)V

    .line 237
    .line 238
    .line 239
    new-instance v0, Ll/nn60;

    .line 240
    .line 241
    invoke-direct {v0, p0, p1, p2}, Ll/nn60;-><init>(Ll/pn60;Ll/jn60;Ll/l5;)V

    .line 242
    .line 243
    .line 244
    invoke-static {v2, v1, v4, v5, v0}, Ll/bn60;->W(Lcom/p1/mobile/android/app/Act;Ljava/lang/CharSequence;Lorg/json/JSONObject;Ll/x20;Ll/x20;)V

    .line 245
    .line 246
    .line 247
    return v3

    .line 248
    :cond_9
    return v2
.end method
