.class public Lcom/p1/mobile/android/ui/cropiwa/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/gxb;",
        ">;"
    }
.end annotation


# static fields
.field public static e:I = 0x438

.field public static f:I = 0x438


# instance fields
.field public a:Lcom/p1/mobile/android/ui/cropiwa/CropperAct;

.field public b:Ll/gxb;

.field public c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

.field public d:Lv/VProgressBar;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/ui/cropiwa/CropperAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropperAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/ui/cropiwa/c;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/c;->p(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/ui/cropiwa/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/c;->n()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/ui/cropiwa/c;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/c;->m(Landroid/net/Uri;)V

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/android/ui/cropiwa/c;)Lcom/p1/mobile/android/ui/cropiwa/CropperAct;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropperAct;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/android/ui/cropiwa/c;)Lv/VProgressBar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->d:Lv/VProgressBar;

    return-object p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropperAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropperAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->l()Ll/wvb;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const v0, 0x3ca3d70a    # 0.02f

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/wvb;->u(F)Ll/wvb;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Ll/bnl0;->y0()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    int-to-float v0, v0

    .line 19
    const v1, 0x3f666666    # 0.9f

    .line 20
    .line 21
    .line 22
    mul-float/2addr v0, v1

    .line 23
    const/high16 v1, 0x44070000    # 540.0f

    .line 24
    .line 25
    div-float/2addr v0, v1

    .line 26
    invoke-virtual {p0, v0}, Ll/wvb;->t(F)Ll/wvb;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ll/wvb;->b()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public i(Ll/gxb;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->b:Ll/gxb;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gxb;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/c;->i(Ll/gxb;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    sget v0, Ll/gec0;->y:I

    .line 2
    .line 3
    invoke-virtual {p1, v0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget p2, Ll/vcc0;->C:I

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
    iput-object p2, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 16
    .line 17
    sget p2, Ll/vcc0;->h0:I

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
    iput-object p2, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->d:Lv/VProgressBar;

    .line 26
    .line 27
    return-object p1
.end method

.method public j(Ll/ewb;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->n(Ll/ewb;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->m()Ll/bwb;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->b:Ll/gxb;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/gxb;->j0()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x1

    .line 14
    const/4 v3, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->b:Ll/gxb;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/gxb;->k0()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    new-instance v1, Ll/svb;

    .line 26
    .line 27
    invoke-direct {v1, v0}, Ll/svb;-><init>(Ll/bwb;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/bwb;->C(Ll/fwb;)Ll/bwb;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0, v3}, Ll/bwb;->O(Z)Ll/bwb;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0, v2}, Ll/bwb;->N(Z)Ll/bwb;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/q11;

    .line 43
    .line 44
    const/4 v2, 0x4

    .line 45
    const/4 v4, 0x5

    .line 46
    invoke-direct {v1, v2, v4}, Ll/q11;-><init>(II)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ll/bwb;->x(Ll/q11;)Ll/bwb;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0, v3}, Ll/bwb;->E(Z)Ll/bwb;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Ll/bwb;->b()V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    invoke-virtual {v0, v3}, Ll/bwb;->O(Z)Ll/bwb;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/q11;

    .line 66
    .line 67
    invoke-direct {v1, v2, v2}, Ll/q11;-><init>(II)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ll/bwb;->x(Ll/q11;)Ll/bwb;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0, v3}, Ll/bwb;->E(Z)Ll/bwb;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ll/bwb;->b()V

    .line 79
    .line 80
    .line 81
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->l()Ll/wvb;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    sget v1, Lcom/p1/mobile/android/ui/cropiwa/c;->e:I

    .line 88
    .line 89
    sget v2, Lcom/p1/mobile/android/ui/cropiwa/c;->f:I

    .line 90
    .line 91
    invoke-virtual {v0, v1, v2}, Ll/wvb;->p(II)Ll/wvb;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const v1, 0x3ca3d70a    # 0.02f

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v1}, Ll/wvb;->v(F)Ll/wvb;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    const/high16 v1, 0x40c00000    # 6.0f

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Ll/wvb;->t(F)Ll/wvb;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    const v1, 0x3e4ccccd    # 0.2f

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v1}, Ll/wvb;->u(F)Ll/wvb;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    sget-object v1, Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;->CENTER_INSIDE:Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ll/wvb;->q(Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;)Ll/wvb;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v0}, Ll/wvb;->b()V

    .line 122
    .line 123
    .line 124
    new-instance v0, Ljava/io/File;

    .line 125
    .line 126
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 134
    .line 135
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->setImageUri(Landroid/net/Uri;)V

    .line 136
    .line 137
    .line 138
    if-nez v0, :cond_1

    .line 139
    .line 140
    new-instance v0, Ljava/lang/RuntimeException;

    .line 141
    .line 142
    new-instance v1, Ljava/lang/StringBuilder;

    .line 143
    .line 144
    const-string v2, "4.8.4 report imageUri null imageFilepath= "

    .line 145
    .line 146
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 160
    .line 161
    .line 162
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 163
    .line 164
    new-instance v0, Ll/ixb;

    .line 165
    .line 166
    invoke-direct {v0, p0}, Ll/ixb;-><init>(Lcom/p1/mobile/android/ui/cropiwa/c;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->setCropSaveCompleteListener(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$c;)V

    .line 170
    .line 171
    .line 172
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 173
    .line 174
    new-instance v0, Ll/kxb;

    .line 175
    .line 176
    invoke-direct {v0, p0}, Ll/kxb;-><init>(Lcom/p1/mobile/android/ui/cropiwa/c;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->setInvalidCroppingListener(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$e;)V

    .line 180
    .line 181
    .line 182
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 183
    .line 184
    new-instance v0, Ll/mxb;

    .line 185
    .line 186
    invoke-direct {v0, p0}, Ll/mxb;-><init>(Lcom/p1/mobile/android/ui/cropiwa/c;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->setErrorListener(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$d;)V

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 193
    .line 194
    new-instance v0, Lcom/p1/mobile/android/ui/cropiwa/c$a;

    .line 195
    .line 196
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/ui/cropiwa/c$a;-><init>(Lcom/p1/mobile/android/ui/cropiwa/c;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->setImageLoadListener(Ll/tvb$a;)V

    .line 200
    .line 201
    .line 202
    return-void
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->r()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic m(Landroid/net/Uri;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropperAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/content/Intent;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "path"

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropperAct;

    .line 21
    .line 22
    const/4 v1, -0x1

    .line 23
    invoke-virtual {p1, v1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropperAct;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropperAct;->finish()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic n()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropperAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    sget p0, Lcom/p1/mobile/android/R$string;->i7:I

    .line 7
    .line 8
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic p(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->a:Lcom/p1/mobile/android/ui/cropiwa/CropperAct;

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
    sget p0, Lcom/p1/mobile/android/R$string;->j7:I

    .line 11
    .line 12
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public q()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/c;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->y()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
