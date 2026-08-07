.class public Ll/qvw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/qvw$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/fvw;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/ImageView;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/view/SurfaceView;

.field public g:Landroid/widget/ImageView;

.field public h:Landroid/widget/TextView;

.field public i:Lcom/p1/mobile/putong/core/ui/verification/ManualFaceVerificationAct;

.field public j:Ll/fvw;

.field public k:Ll/qvw$a;

.field public l:Ll/l0m;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/verification/ManualFaceVerificationAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qvw;->i:Lcom/p1/mobile/putong/core/ui/verification/ManualFaceVerificationAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/qvw;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qvw;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/qvw;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qvw;->k()V

    return-void
.end method

.method public static synthetic c(Ll/qvw;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qvw;->l()V

    return-void
.end method

.method public static synthetic d(Ll/qvw;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qvw;->j(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_avatar_verification_video_refuse"

    .line 2
    .line 3
    const-string v0, "p_avatar_verification_video"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/qvw;->i:Lcom/p1/mobile/putong/core/ui/verification/ManualFaceVerificationAct;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qvw;->i:Lcom/p1/mobile/putong/core/ui/verification/ManualFaceVerificationAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    const-string p0, "ManuelPicVerificationPreview"

    .line 2
    .line 3
    invoke-static {p0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "ManuelPicVerificationRECORDING"

    .line 7
    .line 8
    invoke-static {p0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/rvw;->b(Ll/qvw;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Ll/fvw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qvw;->j:Ll/fvw;

    .line 2
    .line 3
    return-void
.end method

.method public i(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/qvw;->i:Lcom/p1/mobile/putong/core/ui/verification/ManualFaceVerificationAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/gvw;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/gvw;-><init>(Ll/qvw;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/qvw;->b:Landroid/widget/TextView;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-static {v1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/qvw;->c:Landroid/widget/TextView;

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/qvw;->d:Landroid/widget/TextView;

    .line 48
    .line 49
    const/4 v2, 0x2

    .line 50
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/qvw;->e:Landroid/widget/TextView;

    .line 62
    .line 63
    const/4 v2, 0x3

    .line 64
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/qvw;->h:Landroid/widget/TextView;

    .line 76
    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    iget-object v2, p0, Ll/qvw;->i:Lcom/p1/mobile/putong/core/ui/verification/ManualFaceVerificationAct;

    .line 83
    .line 84
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Wm:I

    .line 89
    .line 90
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string v2, " 5"

    .line 98
    .line 99
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    const-string v2, "5"

    .line 107
    .line 108
    filled-new-array {v2}, [Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    const-string v3, "#d74d37"

    .line 117
    .line 118
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    sget-object v4, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 123
    .line 124
    invoke-static {v0, v2, v3, v4}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    .line 130
    .line 131
    invoke-static {}, Ll/be00;->a()Ll/l0m;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    iput-object p1, p0, Ll/qvw;->l:Ll/l0m;

    .line 136
    .line 137
    new-instance v0, Ll/hvw;

    .line 138
    .line 139
    invoke-direct {v0, p0}, Ll/hvw;-><init>(Ll/qvw;)V

    .line 140
    .line 141
    .line 142
    invoke-interface {p1, v0}, Ll/n0m;->D(Ll/epw;)V

    .line 143
    .line 144
    .line 145
    invoke-static {}, Ll/qow;->A()Ll/qow;

    .line 146
    .line 147
    .line 148
    move-result-object v7

    .line 149
    new-instance p1, Ll/crf0;

    .line 150
    .line 151
    const/high16 v0, 0x43930000    # 294.0f

    .line 152
    .line 153
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 154
    .line 155
    .line 156
    move-result v2

    .line 157
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    invoke-direct {p1, v2, v0}, Ll/crf0;-><init>(II)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v7, p1}, Ll/qow;->X(Ll/crf0;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v7, v1}, Ll/qow;->E(I)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v7, v1}, Ll/qow;->C(I)V

    .line 171
    .line 172
    .line 173
    const/16 p1, 0x1e

    .line 174
    .line 175
    invoke-virtual {v7, p1}, Ll/qow;->V(I)V

    .line 176
    .line 177
    .line 178
    const/high16 p1, 0x800000

    .line 179
    .line 180
    invoke-virtual {v7, p1}, Ll/qow;->U(I)V

    .line 181
    .line 182
    .line 183
    new-instance p1, Ll/crf0;

    .line 184
    .line 185
    const/16 v0, 0x2d0

    .line 186
    .line 187
    const/16 v1, 0x500

    .line 188
    .line 189
    invoke-direct {p1, v0, v1}, Ll/crf0;-><init>(II)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v7, p1}, Ll/qow;->F(Ll/crf0;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v7, p1}, Ll/qow;->R(Ll/crf0;)V

    .line 196
    .line 197
    .line 198
    new-instance v2, Ll/qvw$a;

    .line 199
    .line 200
    iget-object v4, p0, Ll/qvw;->i:Lcom/p1/mobile/putong/core/ui/verification/ManualFaceVerificationAct;

    .line 201
    .line 202
    iget-object v6, p0, Ll/qvw;->l:Ll/l0m;

    .line 203
    .line 204
    move-object v3, p0

    .line 205
    move-object v5, p2

    .line 206
    invoke-direct/range {v2 .. v7}, Ll/qvw$a;-><init>(Ll/qvw;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/l0m;Ll/qow;)V

    .line 207
    .line 208
    .line 209
    iput-object v2, v3, Ll/qvw;->k:Ll/qvw$a;

    .line 210
    .line 211
    iget-object p0, v3, Ll/qvw;->f:Landroid/view/SurfaceView;

    .line 212
    .line 213
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    iget-object p1, v3, Ll/qvw;->k:Ll/qvw$a;

    .line 218
    .line 219
    invoke-interface {p0, p1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 220
    .line 221
    .line 222
    iget-object p0, v3, Ll/qvw;->a:Landroid/widget/ImageView;

    .line 223
    .line 224
    new-instance p1, Ll/ivw;

    .line 225
    .line 226
    invoke-direct {p1, v3}, Ll/ivw;-><init>(Ll/qvw;)V

    .line 227
    .line 228
    .line 229
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 230
    .line 231
    .line 232
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/fvw;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qvw;->f(Ll/fvw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qvw;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic j(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Ll/qvw;->l:Ll/l0m;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/qvw;->l:Ll/l0m;

    .line 14
    .line 15
    invoke-interface {p1}, Ll/l0m;->j()V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/qvw;->l:Ll/l0m;

    .line 19
    .line 20
    invoke-interface {p1}, Ll/n0m;->a()V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Ll/qvw;->i:Lcom/p1/mobile/putong/core/ui/verification/ManualFaceVerificationAct;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public final synthetic k()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qvw;->g:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qvw;->i:Lcom/p1/mobile/putong/core/ui/verification/ManualFaceVerificationAct;

    .line 2
    .line 3
    new-instance v1, Ll/jvw;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/jvw;-><init>(Ll/qvw;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
