.class public Ll/vyn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/pyn0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/ImageView;

.field public c:Landroid/widget/ImageView;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lcom/google/android/material/tabs/TabLayout;

.field public i:Landroid/view/View;

.field public j:Landroidx/viewpager/widget/ViewPager;

.field public k:Lv/VDraweeView;

.field public l:Landroid/widget/RelativeLayout;

.field public m:Lv/VDraweeView;

.field public n:Ll/pyn0;

.field public o:Ll/c0s;

.field public p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final r:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;",
            ">;"
        }
    .end annotation
.end field

.field public s:Ljava/lang/String;

.field public t:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;",
            ">;"
        }
    .end annotation
.end field


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
    iput-object v0, p0, Ll/vyn0;->p:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/vyn0;->q:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/vyn0;->r:Ljava/util/List;

    .line 24
    .line 25
    const-string v0, ""

    .line 26
    .line 27
    iput-object v0, p0, Ll/vyn0;->s:Ljava/lang/String;

    .line 28
    .line 29
    new-instance v0, Ll/vyn0$a;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/vyn0$a;-><init>(Ll/vyn0;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/vyn0;->t:Ll/y20;

    .line 35
    .line 36
    return-void
.end method

.method private synthetic A(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vyn0;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic B(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vyn0;->n:Ll/pyn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pyn0;->V3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic C(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vyn0;->n:Ll/pyn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pyn0;->T3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private G()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/vyn0;->h:Lcom/google/android/material/tabs/TabLayout;

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
    iget-object v1, p0, Ll/vyn0;->h:Lcom/google/android/material/tabs/TabLayout;

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
    iget-object v2, p0, Ll/vyn0;->q:Ljava/util/List;

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
    invoke-virtual {p0, v1}, Ll/vyn0;->m(Lcom/google/android/material/tabs/TabLayout$Tab;)V

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
    iget-object v2, p0, Ll/vyn0;->h:Lcom/google/android/material/tabs/TabLayout;

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

.method private K()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vyn0;->a:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/ryn0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ryn0;-><init>(Ll/vyn0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/vyn0;->b:Landroid/widget/ImageView;

    .line 12
    .line 13
    new-instance v1, Ll/syn0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/syn0;-><init>(Ll/vyn0;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/vyn0;->l:Landroid/widget/RelativeLayout;

    .line 22
    .line 23
    new-instance v1, Ll/tyn0;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/tyn0;-><init>(Ll/vyn0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/vyn0;->c:Landroid/widget/ImageView;

    .line 32
    .line 33
    new-instance v1, Ll/uyn0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/uyn0;-><init>(Ll/vyn0;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic a(Ll/vyn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vyn0;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/vyn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vyn0;->A(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/vyn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vyn0;->B(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/vyn0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vyn0;->C(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/vyn0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vyn0;->y(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic f(Ll/vyn0;)Ll/pyn0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vyn0;->n:Ll/pyn0;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/vyn0;Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vyn0;->v(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    return-void
.end method

.method public static bridge synthetic j(Ll/vyn0;Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vyn0;->w(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    return-void
.end method

.method private synthetic z(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vyn0;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public E(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vyn0;->l:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/vyn0;->m:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v0, "context_single_room"

    .line 22
    .line 23
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final F(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/vyn0;->f:Lv/VText;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, " "

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;->lightGiftCount:I

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/vyn0;->g:Lv/VText;

    .line 29
    .line 30
    new-instance v1, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v2, "/"

    .line 33
    .line 34
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;->totalGiftCount:I

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;->userAvatar:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_0

    .line 56
    .line 57
    iget-object v0, p0, Ll/vyn0;->s:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_0

    .line 64
    .line 65
    const-string v0, "context_single_room"

    .line 66
    .line 67
    iget-object p0, p0, Ll/vyn0;->k:Lv/VDraweeView;

    .line 68
    .line 69
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :cond_0
    return-void
.end method

.method public final H(Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vyn0;->h:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ne v0, p2, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/vyn0;->r:Ljava/util/List;

    .line 10
    .line 11
    iget-object p0, p0, Ll/vyn0;->h:Lcom/google/android/material/tabs/TabLayout;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;

    .line 22
    .line 23
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->e(Ljava/util/List;I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;I)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;->getVoiceGiftWallBrief()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/vyn0;->F(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/bean/VoiceGiftWallData;->getVoiceGiftWallList()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1, p2}, Ll/vyn0;->H(Ljava/util/List;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public J(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vyn0;->j:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/vyn0;->h:Lcom/google/android/material/tabs/TabLayout;

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
    invoke-virtual {p0, p1}, Ll/vyn0;->v(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public L(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vyn0;->x(I)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/vyn0;->o:Ll/c0s;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/vyn0;->o:Ll/c0s;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vyn0;->n:Ll/pyn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/pyn0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/vyn0;->l(Ll/pyn0;)V

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

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/wyn0;->b(Ll/vyn0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Ll/pyn0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vyn0;->n:Ll/pyn0;

    .line 2
    .line 3
    return-void
.end method

.method public m(Lcom/google/android/material/tabs/TabLayout$Tab;)V
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
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->isSelected()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 21
    .line 22
    sget v0, Ll/n9c0;->k:I

    .line 23
    .line 24
    invoke-static {p1, v0}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 30
    .line 31
    sget v0, Ll/n9c0;->l1:I

    .line 32
    .line 33
    invoke-static {p1, v0}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public n(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vyn0;->o:Ll/c0s;

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
    if-nez p1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-virtual {p0, p1}, Ll/vyn0;->J(I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final p(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/vyn0;->n:Ll/pyn0;

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
    invoke-direct {v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;-><init>(Landroid/content/Context;I)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/vyn0;->t:Ll/y20;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallListView;->setItemClickAction(Ll/y20;)V

    .line 27
    .line 28
    .line 29
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 30
    .line 31
    sget v1, Ll/bnl0;->e:I

    .line 32
    .line 33
    invoke-direct {p1, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/vyn0;->r:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final q(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vyn0;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 14
    .line 15
    sget v1, Ll/bnl0;->f:I

    .line 16
    .line 17
    const/high16 v2, 0x42100000    # 36.0f

    .line 18
    .line 19
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-direct {p1, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    .line 28
    .line 29
    const/high16 p1, 0x41400000    # 12.0f

    .line 30
    .line 31
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/4 v2, 0x0

    .line 36
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-static {v0, v1, v2, p1, v2}, Ll/bnl0;->n(Landroid/view/View;IIII)V

    .line 41
    .line 42
    .line 43
    const/16 p1, 0x11

    .line 44
    .line 45
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setGravity(I)V

    .line 46
    .line 47
    .line 48
    const/high16 p1, 0x41600000    # 14.0f

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ll/vyn0;->q:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final s()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vyn0;->q:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/vyn0;->r:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/vyn0;->h:Lcom/google/android/material/tabs/TabLayout;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->removeAllTabs()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/vyn0;->p:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/vyn0;->p:Ljava/util/List;

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
    iget-object v0, p0, Ll/vyn0;->p:Ljava/util/List;

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
    iget-object v0, p0, Ll/vyn0;->p:Ljava/util/List;

    .line 44
    .line 45
    new-instance v1, Ll/qyn0;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/qyn0;-><init>(Ll/vyn0;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vyn0;->o:Ll/c0s;

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
    iget-object p0, p0, Ll/vyn0;->o:Ll/c0s;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final v(Lcom/google/android/material/tabs/TabLayout$Tab;)V
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
    iget-object v1, p0, Ll/vyn0;->r:Ljava/util/List;

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
    invoke-virtual {p0, p1}, Ll/vyn0;->m(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iget-object p0, p0, Ll/vyn0;->n:Ll/pyn0;

    .line 27
    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 p1, 0x1

    .line 33
    :goto_0
    invoke-virtual {p0, p1}, Ll/pyn0;->U3(I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final w(Lcom/google/android/material/tabs/TabLayout$Tab;)V
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
    iget-object v1, p0, Ll/vyn0;->r:Ljava/util/List;

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
    invoke-virtual {p0, p1}, Ll/vyn0;->m(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final x(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/vyn0;->o:Ll/c0s;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/vyn0;->n:Ll/pyn0;

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
    invoke-virtual {p0, v0, v1}, Ll/vyn0;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/c0s;

    .line 21
    .line 22
    iget-object v2, p0, Ll/vyn0;->n:Ll/pyn0;

    .line 23
    .line 24
    invoke-direct {v1, v2, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Ll/vyn0;->o:Ll/c0s;

    .line 28
    .line 29
    invoke-direct {p0}, Ll/vyn0;->K()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/vyn0;->s()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/vyn0;->j:Landroidx/viewpager/widget/ViewPager;

    .line 36
    .line 37
    new-instance v1, Ll/lyn0;

    .line 38
    .line 39
    iget-object v2, p0, Ll/vyn0;->p:Ljava/util/List;

    .line 40
    .line 41
    iget-object v3, p0, Ll/vyn0;->r:Ljava/util/List;

    .line 42
    .line 43
    invoke-direct {v1, v2, v3}, Ll/lyn0;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/vyn0;->h:Lcom/google/android/material/tabs/TabLayout;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->clearOnTabSelectedListeners()V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/vyn0;->h:Lcom/google/android/material/tabs/TabLayout;

    .line 55
    .line 56
    iget-object v1, p0, Ll/vyn0;->j:Landroidx/viewpager/widget/ViewPager;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/vyn0;->h:Lcom/google/android/material/tabs/TabLayout;

    .line 62
    .line 63
    new-instance v1, Ll/vyn0$b;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/vyn0$b;-><init>(Ll/vyn0;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 69
    .line 70
    .line 71
    invoke-direct {p0}, Ll/vyn0;->G()V

    .line 72
    .line 73
    .line 74
    :cond_0
    iget-object v0, p0, Ll/vyn0;->l:Landroid/widget/RelativeLayout;

    .line 75
    .line 76
    const/4 v1, 0x0

    .line 77
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, p1}, Ll/vyn0;->J(I)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final synthetic y(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vyn0;->q(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/vyn0;->p(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
