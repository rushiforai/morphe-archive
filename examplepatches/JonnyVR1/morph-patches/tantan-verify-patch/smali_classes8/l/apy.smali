.class public final Ll/apy;
.super Ll/kg2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/apy$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u0007\u0018\u0000 \u001c2\u00020\u0001:\u0001\u001dB\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u000f\u0010\u000c\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\u000bJ\u000f\u0010\r\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000bJ\u000f\u0010\u000e\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000bJ+\u0010\u0014\u001a\u00020\t2\u0012\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00100\u000f2\u0006\u0010\u0013\u001a\u00020\u0012H\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u0016\u0010\u000bJ\u000f\u0010\u0018\u001a\u00020\u0017H\u0016\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u000f\u0010\u001a\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u001a\u0010\u001b\u00a8\u0006\u001e"
    }
    d2 = {
        "Ll/apy;",
        "Ll/kg2;",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "",
        "pageType",
        "modeType",
        "<init>",
        "(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V",
        "",
        "r",
        "()V",
        "q",
        "v",
        "f0",
        "Ll/pf60;",
        "",
        "pair",
        "",
        "bundle",
        "j0",
        "(Ll/pf60;Z)V",
        "B",
        "",
        "M",
        "()I",
        "I",
        "()Ljava/lang/String;",
        "Companion",
        "a",
        "buzz_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Ll/apy$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/apy$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/apy$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/apy;->Companion:Ll/apy$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
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
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1, p2, p3}, Ll/kg2;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public B()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/kg2;->B()V

    .line 2
    .line 3
    .line 4
    const-string v0, "p_buzz_memoji_connecting"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/kg2;->h0(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public I()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Ll/kq3;->INSTANCE:Ll/kq3;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/kq3;->m()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public M()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public f0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/kg2;->f0()V

    .line 2
    .line 3
    .line 4
    const-string v0, "p_intl_buzz_memoji_waiting"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/kg2;->h0(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public j0(Ll/pf60;Z)V
    .locals 1
    .param p1    # Ll/pf60;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2}, Ll/kg2;->j0(Ll/pf60;Z)V

    .line 5
    .line 6
    .line 7
    sget-object p1, Ll/haw;->Companion:Ll/haw$a;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/haw$a;->a()Ll/haw;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p2}, Ll/haw;->v0()Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    iget v0, p2, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingMemojiBuzz:I

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/kg2;->L()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-ne v0, p0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    invoke-static {v0, p0}, Lkotlin/ranges/a;->b(II)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    iput p0, p2, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingMemojiBuzz:I

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/haw$a;->a()Ll/haw;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ll/haw;->A0()Lrx/subjects/a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    :goto_0
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/kg2;->q()V

    .line 2
    .line 3
    .line 4
    const-string v0, "p_buzz_memoji_searching"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/kg2;->h0(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public r()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/kg2;->r()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kg2;->X()Lv/VText;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget v1, Ll/d9c0;->m:I

    .line 9
    .line 10
    invoke-static {v1}, Ll/k3d0;->a(I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/kg2;->a0()Lv/VImage;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget v1, Ll/ebc0;->a:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/kg2;->P()Lv/VText;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v1, Ll/ebc0;->o0:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/kg2;->W()Lv/VText;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget v1, Ll/ebc0;->q0:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/kg2;->c0()Lv/VText;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const/4 v1, -0x1

    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/kg2;->b0()Lv/VText;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/kg2;->V()Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzCircleCountdownView;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    sget v1, Ll/d9c0;->f:I

    .line 64
    .line 65
    invoke-static {v1}, Ll/k3d0;->a(I)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    sget v2, Ll/d9c0;->e:I

    .line 70
    .line 71
    invoke-static {v2}, Ll/k3d0;->a(I)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    sget v3, Ll/qa00;->g:I

    .line 76
    .line 77
    int-to-float v3, v3

    .line 78
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzCircleCountdownView;->d(IIF)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ll/kg2;->Y()Lv/VDraweeView;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Ll/wlj;

    .line 90
    .line 91
    const/4 v1, 0x0

    .line 92
    invoke-virtual {v0, v1}, Ll/wlj;->E(Landroid/graphics/drawable/Drawable;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Ll/kg2;->Y()Lv/VDraweeView;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Ll/wlj;

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Ll/kg2;->Y()Lv/VDraweeView;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    const/high16 v2, 0x430c0000    # 140.0f

    .line 117
    .line 118
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 123
    .line 124
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 125
    .line 126
    invoke-virtual {p0}, Ll/kg2;->Y()Lv/VDraweeView;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 131
    .line 132
    .line 133
    const-string v0, "memojiBuzz"

    .line 134
    .line 135
    invoke-virtual {p0, v0}, Ll/kg2;->z(Ljava/lang/String;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-eqz v0, :cond_4

    .line 140
    .line 141
    sget-object v0, Ll/haw;->Companion:Ll/haw$a;

    .line 142
    .line 143
    invoke-virtual {v0}, Ll/haw$a;->a()Ll/haw;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-virtual {v2}, Ll/haw;->G0()Lrx/subjects/a;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-virtual {v2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    check-cast v2, Ll/pf60;

    .line 156
    .line 157
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 158
    .line 159
    .line 160
    const/4 v3, 0x0

    .line 161
    const/4 v4, 0x2

    .line 162
    invoke-static {p0, v2, v3, v4, v1}, Ll/kg2;->y(Ll/kg2;Ll/pf60;ZILjava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0, v2}, Ll/kg2;->A(Ll/pf60;)Z

    .line 166
    .line 167
    .line 168
    move-result v3

    .line 169
    if-eqz v3, :cond_3

    .line 170
    .line 171
    invoke-virtual {p0}, Ll/kg2;->K()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    const-string v4, "passive"

    .line 176
    .line 177
    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result v3

    .line 181
    if-nez v3, :cond_0

    .line 182
    .line 183
    invoke-virtual {p0}, Ll/apy;->v()V

    .line 184
    .line 185
    .line 186
    goto :goto_2

    .line 187
    :cond_0
    iget-object v3, v2, Ll/pf60;->b:Ljava/lang/Object;

    .line 188
    .line 189
    instance-of v4, v3, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;

    .line 190
    .line 191
    if-eqz v4, :cond_1

    .line 192
    .line 193
    check-cast v3, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;

    .line 194
    .line 195
    goto :goto_0

    .line 196
    :cond_1
    move-object v3, v1

    .line 197
    :goto_0
    if-eqz v3, :cond_2

    .line 198
    .line 199
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/LoveBuzzPushData;->channelToken:Ljava/lang/String;

    .line 200
    .line 201
    goto :goto_1

    .line 202
    :cond_2
    move-object v3, v1

    .line 203
    :goto_1
    invoke-virtual {p0, v3}, Ll/kg2;->E(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    goto :goto_2

    .line 207
    :cond_3
    invoke-virtual {p0}, Ll/apy;->B()V

    .line 208
    .line 209
    .line 210
    :goto_2
    invoke-virtual {p0, v2}, Ll/kg2;->n0(Ll/pf60;)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {v0}, Ll/haw$a;->a()Ll/haw;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-virtual {p0}, Ll/haw;->G0()Lrx/subjects/a;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    const-string v0, "intl.text.lovebuzz.close.notify"

    .line 222
    .line 223
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 228
    .line 229
    .line 230
    return-void

    .line 231
    :cond_4
    const-string v0, "p_buzz_memoji_searching"

    .line 232
    .line 233
    invoke-virtual {p0, v0}, Ll/kg2;->h0(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    return-void
.end method

.method public v()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/kg2;->v()V

    .line 2
    .line 3
    .line 4
    const-string v0, "p_intl_buzz_memoji_paired"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/kg2;->h0(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    sget-object p0, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 10
    .line 11
    const-string v0, "memojiBuzz"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/nbw;->o(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
