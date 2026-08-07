.class public Ll/v8x$c;
.super Ll/cf60;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/v8x;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public final synthetic a:Ll/v8x;


# direct methods
.method public constructor <init>(Ll/v8x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v8x$c;->a:Ll/v8x;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/cf60;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/v8x;Ll/x8x;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/v8x$c;-><init>(Ll/v8x;)V

    return-void
.end method

.method public static synthetic j(Ll/v8x$c;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v8x$c;->k(Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v8x$c;->a:Ll/v8x;

    .line 2
    .line 3
    invoke-static {p0}, Ll/v8x;->O0(Ll/v8x;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/v8x$c;->a:Ll/v8x;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/kec0;->f7:I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    sget p1, Ll/adc0;->ja:I

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-virtual {p1, v1, v2, v1}, Lcom/p1/mobile/putong/core/ui/PictureView;->K(ZZZ)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Ll/v8x$c;->a:Ll/v8x;

    .line 34
    .line 35
    invoke-static {v1}, Ll/v8x;->O0(Ll/v8x;)Ljava/util/ArrayList;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Ll/v8x$b;

    .line 44
    .line 45
    iget-object v1, v1, Ll/v8x$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 46
    .line 47
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/ui/PictureView;->X(Lcom/p1/mobile/putong/data/Media;)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 51
    .line 52
    iget-object v3, p0, Ll/v8x$c;->a:Ll/v8x;

    .line 53
    .line 54
    invoke-static {v3}, Ll/v8x;->O0(Ll/v8x;)Ljava/util/ArrayList;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    check-cast v3, Ll/v8x$b;

    .line 63
    .line 64
    iget-object v3, v3, Ll/v8x$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 65
    .line 66
    invoke-static {v3}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    new-instance v4, Ll/w8x;

    .line 75
    .line 76
    invoke-direct {v4, p0}, Ll/w8x;-><init>(Ll/v8x$c;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v1, v3, v4}, Ll/g23;->e(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/hk70;)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Ll/v8x$c;->a:Ll/v8x;

    .line 83
    .line 84
    invoke-static {v1}, Ll/v8x;->O0(Ll/v8x;)Ljava/util/ArrayList;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    check-cast p2, Ll/v8x$b;

    .line 93
    .line 94
    iput-object p1, p2, Ll/v8x$b;->c:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 95
    .line 96
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/PictureView;->g:Lv/VFrame_ColorFilter;

    .line 97
    .line 98
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    iget-object p2, p0, Ll/v8x$c;->a:Ll/v8x;

    .line 102
    .line 103
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/PictureView;->setPlayerListener(Lv/VTexturePlayer$b;)V

    .line 104
    .line 105
    .line 106
    sget p1, Ll/adc0;->x1:I

    .line 107
    .line 108
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    check-cast p1, Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView;

    .line 113
    .line 114
    iget-object p0, p0, Ll/v8x$c;->a:Ll/v8x;

    .line 115
    .line 116
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView;->setChangeClickListener(Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView$a;)V

    .line 117
    .line 118
    .line 119
    return-object v0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    if-ne p1, p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public final synthetic k(Ljava/lang/String;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/v8x$c;->a:Ll/v8x;

    .line 2
    .line 3
    invoke-static {v0}, Ll/v8x;->O0(Ll/v8x;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Ll/v8x$c;->a:Ll/v8x;

    .line 10
    .line 11
    invoke-static {v0}, Ll/v8x;->O0(Ll/v8x;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ll/v8x$b;

    .line 30
    .line 31
    iget-object v2, v1, Ll/v8x$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 32
    .line 33
    invoke-static {v2}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    iput p2, v1, Ll/v8x$b;->b:I

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    iget-object p0, p0, Ll/v8x$c;->a:Ll/v8x;

    .line 51
    .line 52
    invoke-static {p0}, Ll/v8x;->Q0(Ll/v8x;)Ll/iam;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Ll/g9x;

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/g9x;->s()V

    .line 59
    .line 60
    .line 61
    :cond_2
    return-void
.end method
