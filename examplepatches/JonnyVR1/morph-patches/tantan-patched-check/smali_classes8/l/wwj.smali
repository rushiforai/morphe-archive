.class public Ll/wwj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/VLinear;

.field public c:Lv/VFrame;

.field public d:Lv/VDraweeView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lv/VImage;

.field public l:Lcom/p1/mobile/android/app/Act;

.field public m:Landroid/view/View;

.field public n:Lcom/p1/mobile/android/app/Dialog;

.field public o:Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;

.field public p:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wwj;->l:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/wwj;->o:Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;

    .line 7
    .line 8
    iput-object p3, p0, Ll/wwj;->p:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ll/wwj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wwj;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/wwj;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wwj;->g(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic c(Ll/wwj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wwj;->f(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/wwj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wwj;->h(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/xwj;->b(Ll/wwj;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wwj;->n:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Dialog;->cancel()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic g(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    const-string v0, "e_presentwall_poster_save"

    .line 2
    .line 3
    iget-object v1, p0, Ll/wwj;->p:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/wwj;->l:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    const-string v1, ""

    .line 11
    .line 12
    invoke-static {v0, v1, p1}, Ll/i1k;->i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/graphics/Bitmap;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    const-string p1, "\u56fe\u7247\u5df2\u4fdd\u5b58\u5230\u76f8\u518c"

    .line 19
    .line 20
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Ll/wwj;->n:Lcom/p1/mobile/android/app/Dialog;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic h(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/wwj;->c:Lv/VFrame;

    .line 2
    .line 3
    invoke-static {p1}, Ll/i1k;->f(Landroid/view/View;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Ll/wwj;->l:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    new-instance v1, Ll/vwj;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/vwj;-><init>(Ll/wwj;Landroid/graphics/Bitmap;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/i1k;->d(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_presentwall_poster_share"

    .line 2
    .line 3
    iget-object v0, p0, Ll/wwj;->p:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/wwj;->c:Lv/VFrame;

    .line 9
    .line 10
    invoke-static {p1}, Ll/i1k;->f(Landroid/view/View;)Landroid/graphics/Bitmap;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p1, v0}, Ll/i1k;->j(Landroid/graphics/Bitmap;Z)Z

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/wwj;->n:Lcom/p1/mobile/android/app/Dialog;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final j(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x14

    .line 7
    .line 8
    invoke-static {v1}, Ll/qa00;->f(I)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/high16 v0, 0x43520000    # 210.0f

    .line 21
    .line 22
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    int-to-float v0, v0

    .line 27
    cmpl-float p1, p1, v0

    .line 28
    .line 29
    if-lez p1, :cond_0

    .line 30
    .line 31
    iget-object p1, p0, Ll/wwj;->f:Lv/VText;

    .line 32
    .line 33
    const/high16 v0, 0x41880000    # 17.0f

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/wwj;->g:Lv/VText;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public k()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/wwj;->h:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wwj;->o:Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;

    .line 4
    .line 5
    iget v1, v1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->totalGiftAmount:I

    .line 6
    .line 7
    invoke-static {v1}, Ll/i1k;->g(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "\u7d2f\u8ba1\u6536\u5230\u793c\u7269%s\u4e2a"

    .line 16
    .line 17
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/wwj;->o:Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;

    .line 25
    .line 26
    invoke-static {v0}, Ll/i1k;->h(Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;)Ll/bkj0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    iget-object v2, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v2, Ljava/lang/String;

    .line 35
    .line 36
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v2, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v2, Ljava/lang/CharSequence;

    .line 42
    .line 43
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_0

    .line 48
    .line 49
    iget-object v2, p0, Ll/wwj;->f:Lv/VText;

    .line 50
    .line 51
    iget-object v3, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast v3, Ljava/lang/CharSequence;

    .line 54
    .line 55
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    iget-object v2, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast v2, Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-object v2, p0, Ll/wwj;->f:Lv/VText;

    .line 67
    .line 68
    new-instance v3, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    iget-object v4, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast v4, Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    iget-object v4, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 81
    .line 82
    check-cast v4, Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    :goto_0
    iget-object v2, p0, Ll/wwj;->g:Lv/VText;

    .line 95
    .line 96
    iget-object v3, v0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 97
    .line 98
    check-cast v3, Ljava/lang/CharSequence;

    .line 99
    .line 100
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, v0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 104
    .line 105
    check-cast v0, Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p0, v0}, Ll/wwj;->j(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public l()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wwj;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/wwj;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/wwj;->m:Landroid/view/View;

    .line 13
    .line 14
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 15
    .line 16
    iget-object v1, p0, Ll/wwj;->d:Lv/VDraweeView;

    .line 17
    .line 18
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 21
    .line 22
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/wwj;->l:Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v1, p0, Ll/wwj;->m:Landroid/view/View;

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->P(Landroid/view/View;Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    sget v1, Ll/cgc0;->g:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Ll/wwj;->n:Lcom/p1/mobile/android/app/Dialog;

    .line 69
    .line 70
    iget-object v0, p0, Ll/wwj;->e:Lv/VText;

    .line 71
    .line 72
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 75
    .line 76
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/wwj;->b:Lv/VLinear;

    .line 86
    .line 87
    const/high16 v1, 0x41200000    # 10.0f

    .line 88
    .line 89
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    invoke-static {v0, v1}, Ll/i1k;->e(Landroid/view/View;I)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Ll/wwj;->k:Lv/VImage;

    .line 97
    .line 98
    new-instance v1, Ll/swj;

    .line 99
    .line 100
    invoke-direct {v1, p0}, Ll/swj;-><init>(Ll/wwj;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/wwj;->j:Lv/VText;

    .line 107
    .line 108
    new-instance v1, Ll/twj;

    .line 109
    .line 110
    invoke-direct {v1, p0}, Ll/twj;-><init>(Ll/wwj;)V

    .line 111
    .line 112
    .line 113
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/wwj;->i:Lv/VText;

    .line 117
    .line 118
    new-instance v1, Ll/uwj;

    .line 119
    .line 120
    invoke-direct {v1, p0}, Ll/uwj;-><init>(Ll/wwj;)V

    .line 121
    .line 122
    .line 123
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Ll/wwj;->o:Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;

    .line 127
    .line 128
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-eqz v0, :cond_0

    .line 133
    .line 134
    invoke-virtual {p0}, Ll/wwj;->k()V

    .line 135
    .line 136
    .line 137
    :cond_0
    const-string v0, "e_presentwall_poster"

    .line 138
    .line 139
    iget-object p0, p0, Ll/wwj;->p:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {v0, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    return-void
.end method
