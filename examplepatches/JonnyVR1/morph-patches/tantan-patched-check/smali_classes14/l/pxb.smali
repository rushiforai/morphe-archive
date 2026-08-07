.class public Ll/pxb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/fxb;",
        ">;"
    }
.end annotation


# static fields
.field public static f:I = 0x438

.field public static g:I = 0x438


# instance fields
.field public a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;

.field public b:Ll/fxb;

.field public c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

.field public d:Lv/VProgressBar;

.field public e:Lv/VButton_FakeShadow;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pxb;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/pxb;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pxb;->q(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b(Ll/pxb;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pxb;->m([I)V

    return-void
.end method

.method public static synthetic c(Ll/pxb;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pxb;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/pxb;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pxb;->p()V

    return-void
.end method

.method public static synthetic e(Ll/pxb;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pxb;->n(Landroid/net/Uri;)V

    return-void
.end method

.method public static bridge synthetic f(Ll/pxb;)Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pxb;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/pxb;)Lv/VProgressBar;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pxb;->d:Lv/VProgressBar;

    return-object p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pxb;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pxb;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pxb;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/pxb;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->y()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/fxb;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pxb;->j(Ll/fxb;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    sget v0, Ll/hec0;->o:I

    .line 2
    .line 3
    invoke-virtual {p1, v0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget p2, Ll/wcc0;->n:I

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    check-cast p2, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 14
    .line 15
    iput-object p2, p0, Ll/pxb;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 16
    .line 17
    sget p2, Ll/wcc0;->D:I

    .line 18
    .line 19
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    check-cast p2, Lv/VProgressBar;

    .line 24
    .line 25
    iput-object p2, p0, Ll/pxb;->d:Lv/VProgressBar;

    .line 26
    .line 27
    sget p2, Ll/wcc0;->d0:I

    .line 28
    .line 29
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    check-cast p2, Lv/VButton_FakeShadow;

    .line 34
    .line 35
    iput-object p2, p0, Ll/pxb;->e:Lv/VButton_FakeShadow;

    .line 36
    .line 37
    sget-object p0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 38
    .line 39
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 40
    .line 41
    .line 42
    return-object p1
.end method

.method public j(Ll/fxb;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pxb;->b:Ll/fxb;

    .line 2
    .line 3
    return-void
.end method

.method public k(Ll/ewb;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pxb;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->n(Ll/ewb;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/h9n;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/pxb;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->m()Ll/bwb;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/svb;

    .line 16
    .line 17
    invoke-direct {v1, v0}, Ll/svb;-><init>(Ll/bwb;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/bwb;->C(Ll/fwb;)Ll/bwb;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0, v3}, Ll/bwb;->O(Z)Ll/bwb;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0, v2}, Ll/bwb;->N(Z)Ll/bwb;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/q11;

    .line 33
    .line 34
    const/4 v2, 0x4

    .line 35
    const/4 v4, 0x5

    .line 36
    invoke-direct {v1, v2, v4}, Ll/q11;-><init>(II)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ll/bwb;->x(Ll/q11;)Ll/bwb;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0, v3}, Ll/bwb;->E(Z)Ll/bwb;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/bwb;->b()V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/pxb;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 51
    .line 52
    new-instance v1, Ll/hxb;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/hxb;-><init>(Ll/pxb;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v0, v1}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->m()Ll/bwb;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const/high16 v1, 0x40000000    # 2.0f

    .line 66
    .line 67
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-virtual {v0, v1}, Ll/bwb;->z(I)Ll/bwb;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0, v3}, Ll/bwb;->O(Z)Ll/bwb;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/q11;

    .line 80
    .line 81
    invoke-direct {v1, v2, v2}, Ll/q11;-><init>(II)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ll/bwb;->x(Ll/q11;)Ll/bwb;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0, v3}, Ll/bwb;->E(Z)Ll/bwb;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Ll/bwb;->b()V

    .line 93
    .line 94
    .line 95
    :goto_0
    iget-object v0, p0, Ll/pxb;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->l()Ll/wvb;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    sget v1, Ll/pxb;->f:I

    .line 102
    .line 103
    sget v2, Ll/pxb;->g:I

    .line 104
    .line 105
    invoke-virtual {v0, v1, v2}, Ll/wvb;->p(II)Ll/wvb;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    const v1, 0x3ca3d70a    # 0.02f

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, v1}, Ll/wvb;->v(F)Ll/wvb;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    const/high16 v1, 0x40c00000    # 6.0f

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ll/wvb;->t(F)Ll/wvb;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    const v1, 0x3e4ccccd    # 0.2f

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ll/wvb;->u(F)Ll/wvb;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    sget-object v1, Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;->CENTER_INSIDE:Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Ll/wvb;->q(Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;)Ll/wvb;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v0}, Ll/wvb;->b()V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ll/pxb;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 139
    .line 140
    new-instance v1, Ljava/io/File;

    .line 141
    .line 142
    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->setImageUri(Landroid/net/Uri;)V

    .line 150
    .line 151
    .line 152
    iget-object p1, p0, Ll/pxb;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 153
    .line 154
    new-instance v0, Ll/jxb;

    .line 155
    .line 156
    invoke-direct {v0, p0}, Ll/jxb;-><init>(Ll/pxb;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->setCropSaveCompleteListener(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$c;)V

    .line 160
    .line 161
    .line 162
    iget-object p1, p0, Ll/pxb;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 163
    .line 164
    new-instance v0, Ll/lxb;

    .line 165
    .line 166
    invoke-direct {v0, p0}, Ll/lxb;-><init>(Ll/pxb;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->setInvalidCroppingListener(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$e;)V

    .line 170
    .line 171
    .line 172
    iget-object p1, p0, Ll/pxb;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 173
    .line 174
    new-instance v0, Ll/nxb;

    .line 175
    .line 176
    invoke-direct {v0, p0}, Ll/nxb;-><init>(Ll/pxb;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->setErrorListener(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$d;)V

    .line 180
    .line 181
    .line 182
    iget-object p1, p0, Ll/pxb;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 183
    .line 184
    new-instance v0, Ll/pxb$a;

    .line 185
    .line 186
    invoke-direct {v0, p0}, Ll/pxb$a;-><init>(Ll/pxb;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->setImageLoadListener(Ll/tvb$a;)V

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Ll/pxb;->e:Lv/VButton_FakeShadow;

    .line 193
    .line 194
    new-instance v0, Ll/oxb;

    .line 195
    .line 196
    invoke-direct {v0, p0}, Ll/oxb;-><init>(Ll/pxb;)V

    .line 197
    .line 198
    .line 199
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 200
    .line 201
    .line 202
    return-void
.end method

.method public final synthetic m([I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v0, p1, v0

    .line 3
    .line 4
    sget v1, Ll/qa00;->m:I

    .line 5
    .line 6
    sub-int/2addr v0, v1

    .line 7
    int-to-float v0, v0

    .line 8
    const v1, 0x3f4ccccd    # 0.8f

    .line 9
    .line 10
    .line 11
    div-float/2addr v0, v1

    .line 12
    float-to-int v0, v0

    .line 13
    const/4 v1, 0x1

    .line 14
    aget p1, p1, v1

    .line 15
    .line 16
    sub-int/2addr p1, v0

    .line 17
    div-int/lit8 p1, p1, 0x2

    .line 18
    .line 19
    iget-object v0, p0, Ll/pxb;->e:Lv/VButton_FakeShadow;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    sget v1, Ll/qa00;->q:I

    .line 26
    .line 27
    add-int/2addr v0, v1

    .line 28
    if-le p1, v0, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Ll/pxb;->e:Lv/VButton_FakeShadow;

    .line 31
    .line 32
    sub-int/2addr p1, v1

    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    sub-int/2addr p1, v0

    .line 38
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    const/high16 v0, 0x42500000    # 52.0f

    .line 43
    .line 44
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-lt p1, v1, :cond_1

    .line 49
    .line 50
    iget-object p0, p0, Ll/pxb;->e:Lv/VButton_FakeShadow;

    .line 51
    .line 52
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    sub-int/2addr p1, v0

    .line 57
    div-int/lit8 p1, p1, 0x2

    .line 58
    .line 59
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 60
    .line 61
    .line 62
    :cond_1
    return-void
.end method

.method public final synthetic n(Landroid/net/Uri;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pxb;->b:Ll/fxb;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/fxb;->x0(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic p()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pxb;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    sget p0, Lcom/p1/mobile/putong/account/R$string;->S:I

    .line 7
    .line 8
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic q(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pxb;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    instance-of p0, p1, Lcom/p1/mobile/android/ui/cropiwa/TooLargeException;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    sget p0, Lcom/p1/mobile/putong/account/R$string;->d0:I

    .line 11
    .line 12
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final synthetic s(Landroid/view/View;)V
    .locals 9

    .line 1
    iget-object p1, p0, Ll/pxb;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/data/SignUpData;->getNonNullPhoneNumber()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "phone_num"

    .line 12
    .line 13
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->getSignUpType()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const-string v3, "signup_source"

    .line 26
    .line 27
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const/4 v4, 0x1

    .line 32
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    const-string v5, "upload_image_cnt"

    .line 37
    .line 38
    invoke-static {v5, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v6

    .line 42
    const-string v7, "magic_used"

    .line 43
    .line 44
    const-string v8, "no"

    .line 45
    .line 46
    invoke-static {v7, v8}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    filled-new-array {v0, v2, v6, v7}, [Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v2, "e_imagepage_signup_edit_done_button"

    .line 55
    .line 56
    invoke-static {v2, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Ll/h9n;->c()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_0

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/pxb;->act()Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/data/SignUpData;->getNonNullPhoneNumber()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    sget-object v1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 82
    .line 83
    invoke-virtual {v1}, Lcom/p1/mobile/putong/account/api/a;->c1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 88
    .line 89
    invoke-static {v3, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-static {v5, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    filled-new-array {v0, v1, v2}, [Ll/pf60;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    const-string v1, "e_imagepage_signup_start_button"

    .line 102
    .line 103
    invoke-static {v1, p1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 104
    .line 105
    .line 106
    :cond_0
    iget-object p1, p0, Ll/pxb;->b:Ll/fxb;

    .line 107
    .line 108
    invoke-virtual {p1}, Ll/fxb;->z0()Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-eqz p1, :cond_1

    .line 113
    .line 114
    iget-object p1, p0, Ll/pxb;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;

    .line 115
    .line 116
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;->pageId()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    const-string v0, "e_pre_signup_picture_start_button"

    .line 121
    .line 122
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    :cond_1
    iget-object p0, p0, Ll/pxb;->b:Ll/fxb;

    .line 126
    .line 127
    invoke-virtual {p0}, Ll/fxb;->u0()V

    .line 128
    .line 129
    .line 130
    return-void
.end method
