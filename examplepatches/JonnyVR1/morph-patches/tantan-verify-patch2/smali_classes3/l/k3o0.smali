.class public Ll/k3o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/f3o0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Lv/VDraweeView;

.field public d:Landroid/widget/ImageView;

.field public e:Lv/VLinear;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lcom/google/android/material/tabs/TabLayout;

.field public j:Landroid/view/View;

.field public k:Landroidx/viewpager/widget/ViewPager;

.field public l:Lv/VDraweeView;

.field public m:Ll/f3o0;

.field public n:Landroid/app/Dialog;

.field public final o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;",
            ">;"
        }
    .end annotation
.end field

.field public r:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/k3o0;->o:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/k3o0;->p:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/k3o0;->q:Ljava/util/List;

    .line 24
    .line 25
    return-void
.end method

.method private B()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k3o0;->a:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/h3o0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/h3o0;-><init>(Ll/k3o0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/k3o0;->d:Landroid/widget/ImageView;

    .line 12
    .line 13
    new-instance v1, Ll/i3o0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/i3o0;-><init>(Ll/k3o0;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Ll/k3o0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k3o0;->w(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic b(Ll/k3o0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k3o0;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/k3o0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k3o0;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/k3o0;Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k3o0;->v(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;)V

    return-void
.end method

.method public static bridge synthetic e(Ll/k3o0;Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k3o0;->q(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    return-void
.end method

.method public static bridge synthetic f(Ll/k3o0;Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k3o0;->s(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    return-void
.end method

.method private l(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/k3o0;->m:Ll/f3o0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->eh:I

    .line 10
    .line 11
    invoke-static {v2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    xor-int/lit8 p1, p1, 0x1

    .line 20
    .line 21
    invoke-direct {v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;-><init>(Landroid/content/Context;I)V

    .line 22
    .line 23
    .line 24
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 25
    .line 26
    sget v1, Ll/bnl0;->e:I

    .line 27
    .line 28
    invoke-direct {p1, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    new-instance p1, Ll/j3o0;

    .line 35
    .line 36
    invoke-direct {p1, p0}, Ll/j3o0;-><init>(Ll/k3o0;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->setItemClickAction(Ll/y20;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/k3o0;->q:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method private m(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/k3o0;->m:Ll/f3o0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 16
    .line 17
    sget v1, Ll/bnl0;->f:I

    .line 18
    .line 19
    const/high16 v2, 0x42100000    # 36.0f

    .line 20
    .line 21
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-direct {p1, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 29
    .line 30
    .line 31
    const/high16 p1, 0x41400000    # 12.0f

    .line 32
    .line 33
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    invoke-static {v0, v1, v2, p1, v2}, Ll/bnl0;->n(Landroid/view/View;IIII)V

    .line 43
    .line 44
    .line 45
    const/16 p1, 0x11

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setGravity(I)V

    .line 48
    .line 49
    .line 50
    const/high16 p1, 0x41600000    # 14.0f

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Ll/k3o0;->p:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method private n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k3o0;->p:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/k3o0;->q:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/k3o0;->i:Lcom/google/android/material/tabs/TabLayout;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->removeAllTabs()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/k3o0;->o:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/k3o0;->o:Ljava/util/List;

    .line 22
    .line 23
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->eh:I

    .line 24
    .line 25
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/k3o0;->o:Ljava/util/List;

    .line 33
    .line 34
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->lh:I

    .line 35
    .line 36
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/k3o0;->o:Ljava/util/List;

    .line 44
    .line 45
    new-instance v1, Ll/g3o0;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/g3o0;-><init>(Ll/k3o0;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private q(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Ll/k3o0;->q:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ge v0, v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/k3o0;->k(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p1, p0, Ll/k3o0;->q:Ljava/util/List;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;

    .line 27
    .line 28
    iget-object p0, p0, Ll/k3o0;->r:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;->haveMedals:Ljava/util/List;

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->w(Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;

    .line 41
    .line 42
    iget-object p0, p0, Ll/k3o0;->r:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;->haveNotMedals:Ljava/util/List;

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallListView;->w(Ljava/util/List;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private s(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/k3o0;->q:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-ge v0, v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/k3o0;->k(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method private u(I)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/k3o0;->n:Landroid/app/Dialog;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/k3o0;->m:Ll/f3o0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, v0, v1}, Ll/k3o0;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/c0s;

    .line 21
    .line 22
    iget-object v2, p0, Ll/k3o0;->m:Ll/f3o0;

    .line 23
    .line 24
    invoke-direct {v1, v2, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Ll/k3o0;->n:Landroid/app/Dialog;

    .line 28
    .line 29
    iget-object v3, p0, Ll/k3o0;->b:Landroid/widget/RelativeLayout;

    .line 30
    .line 31
    const/high16 v0, 0x41c00000    # 24.0f

    .line 32
    .line 33
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    neg-int v7, v1

    .line 38
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v8

    .line 42
    const/4 v4, 0x0

    .line 43
    const/4 v5, 0x0

    .line 44
    const/4 v6, 0x0

    .line 45
    invoke-static/range {v3 .. v8}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 46
    .line 47
    .line 48
    invoke-direct {p0}, Ll/k3o0;->B()V

    .line 49
    .line 50
    .line 51
    invoke-direct {p0}, Ll/k3o0;->n()V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/k3o0;->b:Landroid/widget/RelativeLayout;

    .line 55
    .line 56
    invoke-static {}, Ll/bnl0;->w0()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    int-to-float v1, v1

    .line 61
    const v2, 0x3f333333    # 0.7f

    .line 62
    .line 63
    .line 64
    mul-float/2addr v1, v2

    .line 65
    float-to-int v1, v1

    .line 66
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/k3o0;->k:Landroidx/viewpager/widget/ViewPager;

    .line 70
    .line 71
    new-instance v1, Ll/b3o0;

    .line 72
    .line 73
    iget-object v2, p0, Ll/k3o0;->o:Ljava/util/List;

    .line 74
    .line 75
    iget-object v3, p0, Ll/k3o0;->q:Ljava/util/List;

    .line 76
    .line 77
    invoke-direct {v1, v2, v3}, Ll/b3o0;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/k3o0;->i:Lcom/google/android/material/tabs/TabLayout;

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->clearOnTabSelectedListeners()V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/k3o0;->i:Lcom/google/android/material/tabs/TabLayout;

    .line 89
    .line 90
    iget-object v1, p0, Ll/k3o0;->k:Landroidx/viewpager/widget/ViewPager;

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Ll/k3o0;->i:Lcom/google/android/material/tabs/TabLayout;

    .line 96
    .line 97
    new-instance v1, Ll/k3o0$a;

    .line 98
    .line 99
    invoke-direct {v1, p0}, Ll/k3o0$a;-><init>(Ll/k3o0;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 103
    .line 104
    .line 105
    invoke-direct {p0}, Ll/k3o0;->z()V

    .line 106
    .line 107
    .line 108
    :cond_0
    invoke-virtual {p0, p1}, Ll/k3o0;->A(I)V

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Ll/k3o0;->l:Lv/VDraweeView;

    .line 112
    .line 113
    iget-object v0, p0, Ll/k3o0;->r:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;->userAvatar:Ljava/lang/String;

    .line 116
    .line 117
    const-string v1, "context_single_room"

    .line 118
    .line 119
    invoke-static {v1, p1, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Ll/k3o0;->c:Lv/VDraweeView;

    .line 123
    .line 124
    sget-object v0, Ll/zft;->L:Ljava/lang/String;

    .line 125
    .line 126
    invoke-static {v1, p1, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Ll/k3o0;->g:Lv/VText;

    .line 130
    .line 131
    new-instance v0, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    const-string v1, " "

    .line 134
    .line 135
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    iget-object v1, p0, Ll/k3o0;->r:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;

    .line 139
    .line 140
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;->haveMedalNum:I

    .line 141
    .line 142
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    .line 151
    .line 152
    iget-object p1, p0, Ll/k3o0;->h:Lv/VText;

    .line 153
    .line 154
    new-instance v0, Ljava/lang/StringBuilder;

    .line 155
    .line 156
    const-string v1, "/"

    .line 157
    .line 158
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    iget-object p0, p0, Ll/k3o0;->r:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;

    .line 162
    .line 163
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;->medalSum:I

    .line 164
    .line 165
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method private synthetic x(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k3o0;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k3o0;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private z()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/k3o0;->i:Lcom/google/android/material/tabs/TabLayout;

    .line 3
    .line 4
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_3

    .line 9
    .line 10
    iget-object v1, p0, Ll/k3o0;->i:Lcom/google/android/material/tabs/TabLayout;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v2, p0, Ll/k3o0;->p:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v1}, Ll/k3o0;->k(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    if-nez v0, :cond_1

    .line 33
    .line 34
    iget-object v1, v1, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 35
    .line 36
    sget v2, Ll/qa00;->j:I

    .line 37
    .line 38
    invoke-static {v1, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    iget-object v2, p0, Ll/k3o0;->i:Lcom/google/android/material/tabs/TabLayout;

    .line 43
    .line 44
    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    add-int/lit8 v2, v2, -0x1

    .line 49
    .line 50
    if-ne v0, v2, :cond_2

    .line 51
    .line 52
    iget-object v1, v1, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 53
    .line 54
    sget v2, Ll/qa00;->j:I

    .line 55
    .line 56
    invoke-static {v1, v2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 57
    .line 58
    .line 59
    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_3
    return-void
.end method


# virtual methods
.method public A(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k3o0;->k:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/k3o0;->i:Lcom/google/android/material/tabs/TabLayout;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-direct {p0, p1}, Ll/k3o0;->q(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public C(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k3o0;->r:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;->haveMedalNum:I

    .line 4
    .line 5
    if-lez p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p1, 0x1

    .line 10
    :goto_0
    invoke-direct {p0, p1}, Ll/k3o0;->u(I)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/k3o0;->n:Landroid/app/Dialog;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Ll/k3o0;->n:Landroid/app/Dialog;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/l3o0;->b(Ll/k3o0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/f3o0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/k3o0;->j(Ll/f3o0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j(Ll/f3o0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k3o0;->m:Ll/f3o0;

    .line 2
    .line 3
    return-void
.end method

.method public k(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Landroid/widget/TextView;

    .line 13
    .line 14
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->isSelected()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    sget p1, Ll/n9c0;->M0:I

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    sget p1, Ll/n9c0;->m1:I

    .line 26
    .line 27
    :goto_0
    invoke-static {v0, p1}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k3o0;->n:Landroid/app/Dialog;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/k3o0;->n:Landroid/app/Dialog;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k3o0;->m:Ll/f3o0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f3o0;->O3(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic w(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k3o0;->m(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/k3o0;->l(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
