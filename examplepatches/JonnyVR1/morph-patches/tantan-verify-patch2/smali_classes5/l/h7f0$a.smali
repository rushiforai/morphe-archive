.class public final Ll/h7f0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/h7f0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J7\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u000c\u001a\u00020\nH\u0007\u00a2\u0006\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u0010"
    }
    d2 = {
        "Ll/h7f0$a;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "type",
        "Lcom/p1/mobile/putong/core/ui/purchase/d;",
        "purchaseSection",
        "Ll/x20;",
        "confirm",
        "pass",
        "",
        "d",
        "(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d;Ll/x20;Ll/x20;)V",
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


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/h7f0$a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ll/x20;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d;Ll/x20;Ll/x20;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/core/ui/purchase/d;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->o()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->q()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    const-string p0, ""

    .line 56
    .line 57
    :cond_1
    :goto_0
    new-instance p3, Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .line 61
    .line 62
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->J8:I

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {p2}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-nez v1, :cond_3

    .line 73
    .line 74
    invoke-static {p2}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-nez v1, :cond_3

    .line 79
    .line 80
    invoke-static {p2}, Ll/wib0;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-nez v1, :cond_3

    .line 85
    .line 86
    invoke-static {p2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-nez v1, :cond_3

    .line 91
    .line 92
    invoke-static {p2}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 93
    .line 94
    .line 95
    move-result p2

    .line 96
    if-eqz p2, :cond_2

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_2
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->I8:I

    .line 100
    .line 101
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 110
    .line 111
    .line 112
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->d9:I

    .line 113
    .line 114
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p1, v1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p3, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_3
    :goto_1
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->H8:I

    .line 127
    .line 128
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 137
    .line 138
    .line 139
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->e9:I

    .line 140
    .line 141
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-virtual {p1, v1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p3, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    :goto_2
    new-instance p0, Ll/th0$a;

    .line 153
    .line 154
    invoke-direct {p0, p1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 155
    .line 156
    .line 157
    sget v1, Ll/h9c0;->l:I

    .line 158
    .line 159
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    const/4 v1, 0x3

    .line 164
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    invoke-static {p2, p3, p1, v1}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-virtual {p0, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-virtual {p0, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    new-instance p1, Ll/e7f0;

    .line 181
    .line 182
    invoke-direct {p1, p4}, Ll/e7f0;-><init>(Ll/x20;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p0, p1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->K8:I

    .line 190
    .line 191
    invoke-virtual {p0, p1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    new-instance p1, Ll/f7f0;

    .line 196
    .line 197
    invoke-direct {p1, p5}, Ll/f7f0;-><init>(Ll/x20;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p0, p1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    new-instance p1, Ll/g7f0;

    .line 205
    .line 206
    invoke-direct {p1, p4}, Ll/g7f0;-><init>(Ll/x20;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {p0, p1}, Ll/th0$a;->l(Landroid/content/DialogInterface$OnCancelListener;)Ll/th0$a;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 218
    .line 219
    .line 220
    return-void
.end method
