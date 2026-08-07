.class public Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;

.field public b:Landroid/widget/LinearLayout;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VPager;

.field public e:Lv/VRecyclerView;

.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/x20;

.field public i:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

.field public j:Z

.field public k:Ljava/lang/Runnable;

.field public l:Landroid/view/View;

.field public m:Ll/w0r;

.field public n:I

.field public final o:I

.field public p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;>;"
        }
    .end annotation
.end field

.field public q:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->j:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->k:Ljava/lang/Runnable;

    .line 9
    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->n:I

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p1}, Ll/r97;->q()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    const/4 p1, 0x2

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p1, 0x1

    .line 29
    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->o:I

    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->p:Ljava/util/List;

    .line 32
    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 34
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 35
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->j:Z

    const/4 p2, 0x0

    .line 36
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->k:Ljava/lang/Runnable;

    .line 37
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->n:I

    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object p1

    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object p1

    invoke-interface {p1}, Ll/r97;->q()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x2

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->o:I

    .line 39
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->p:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 40
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 41
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->j:Z

    const/4 p2, 0x0

    .line 42
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->k:Ljava/lang/Runnable;

    .line 43
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->n:I

    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object p1

    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object p1

    invoke-interface {p1}, Ll/r97;->q()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x2

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->o:I

    .line 45
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->p:Ljava/util/List;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->v(ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ljava/util/List;Ljava/lang/Throwable;)Ljava/util/List;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Ll/pf60;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->n()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p0, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->d()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 40
    .line 41
    return-object p0
.end method

.method public static synthetic d(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/rgj;->a(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->t(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f(Ljava/util/HashMap;Lcom/p1/mobile/putong/core/data/StickerBundle;)Ljava/util/List;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->packages:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/vz9;

    .line 4
    .line 5
    invoke-direct {v1, p1, p0}, Ll/vz9;-><init>(Lcom/p1/mobile/putong/core/data/StickerBundle;Ljava/util/HashMap;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic g(Ll/y20;Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic h(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->u(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/data/StickerBundle;Ljava/util/HashMap;Ljava/lang/String;)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic k(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->q(Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, p0, p1, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->p7(Landroid/view/View;Ljava/lang/Object;Lcom/p1/mobile/putong/data/Media;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;Ljava/util/List;Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->s(Ljava/util/List;Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->n:I

    return-void
.end method


# virtual methods
.method public final A(I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->c:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move v1, v0

    .line 8
    :goto_0
    const/4 v2, 0x2

    .line 9
    if-ge v1, v2, :cond_3

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->f:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget v3, Ll/kec0;->fe:I

    .line 18
    .line 19
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->c:Landroid/widget/LinearLayout;

    .line 20
    .line 21
    invoke-virtual {v2, v3, v4, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    sget v3, Ll/edc0;->G1:I

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    sget v4, Ll/ibc0;->W3:I

    .line 32
    .line 33
    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 34
    .line 35
    .line 36
    if-ne v1, p1, :cond_0

    .line 37
    .line 38
    const/4 v4, 0x1

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    move v4, v0

    .line 41
    :goto_1
    invoke-virtual {v3, v4}, Landroid/view/View;->setActivated(Z)V

    .line 42
    .line 43
    .line 44
    sget v3, Ll/edc0;->o1:I

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    check-cast v3, Lv/VDraweeView;

    .line 51
    .line 52
    if-nez v1, :cond_1

    .line 53
    .line 54
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 55
    .line 56
    sget v5, Ll/ibc0;->Z6:I

    .line 57
    .line 58
    invoke-virtual {v4, v3, v5}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 59
    .line 60
    .line 61
    goto :goto_3

    .line 62
    :cond_1
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 63
    .line 64
    invoke-static {}, Ll/gra;->z()Z

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    if-eqz v5, :cond_2

    .line 69
    .line 70
    sget v5, Ll/dbc0;->jf:I

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_2
    sget v5, Ll/ibc0;->g2:I

    .line 74
    .line 75
    :goto_2
    invoke-virtual {v4, v3, v5}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 76
    .line 77
    .line 78
    :goto_3
    new-instance v3, Ll/uz9;

    .line 79
    .line 80
    invoke-direct {v3, p0, v1}, Ll/uz9;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;I)V

    .line 81
    .line 82
    .line 83
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->c:Landroid/widget/LinearLayout;

    .line 87
    .line 88
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 89
    .line 90
    .line 91
    add-int/lit8 v1, v1, 0x1

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_3
    return-void
.end method

.method public B(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/x20;Lcom/p1/mobile/putong/newui/view/MessageInputEditView;Landroid/view/View;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/x20;",
            "Lcom/p1/mobile/putong/newui/view/MessageInputEditView;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->g:Ll/y20;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->h:Ll/x20;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->i:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->l:Landroid/view/View;

    .line 10
    .line 11
    sget-object v5, Ll/oze;->d:Ljava/util/ArrayList;

    .line 12
    .line 13
    new-instance v0, Ll/w0r;

    .line 14
    .line 15
    new-instance v3, Ll/pz9;

    .line 16
    .line 17
    invoke-direct {v3, p5}, Ll/pz9;-><init>(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->i:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 21
    .line 22
    new-instance v6, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    const/4 v8, 0x0

    .line 28
    move-object v1, p1

    .line 29
    move-object v2, p2

    .line 30
    move-object v7, p3

    .line 31
    invoke-direct/range {v0 .. v8}, Ll/w0r;-><init>(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/y20;Landroid/widget/EditText;Ljava/util/ArrayList;Ljava/util/List;Ll/x20;Z)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->m:Ll/w0r;

    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->d:Lv/VPager;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->d:Lv/VPager;

    .line 42
    .line 43
    new-instance p2, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$a;

    .line 44
    .line 45
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$a;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->r()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->x()V

    .line 55
    .line 56
    .line 57
    new-instance p1, Ll/wz9;

    .line 58
    .line 59
    invoke-direct {p1, p0}, Ll/wz9;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->w(Ll/y20;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final C(Ljava/util/List;Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;>;",
            "Lcom/p1/mobile/putong/core/data/CoreData;",
            ")",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p2, :cond_1

    .line 3
    .line 4
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 5
    .line 6
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    check-cast p2, Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserSticker;->new_()Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    :goto_1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p2, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 36
    .line 37
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/data/StickerPackage;->new_()Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 42
    .line 43
    iput-object p2, v0, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 44
    .line 45
    const-string p2, "custom_stickers"

    .line 46
    .line 47
    iput-object p2, v0, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_3

    .line 54
    .line 55
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Ll/pf60;

    .line 60
    .line 61
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 62
    .line 63
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_3

    .line 68
    .line 69
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, Ll/pf60;

    .line 74
    .line 75
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast v1, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    if-eqz p2, :cond_3

    .line 86
    .line 87
    invoke-interface {p1, p0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/data/StickerBundle;->new_()Lcom/p1/mobile/putong/core/data/StickerBundle;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-static {p2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    invoke-interface {p1, p0, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    return-object p1
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/i0a;->a(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final q(Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/CoreData;",
            ")",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 23
    .line 24
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    .line 31
    .line 32
    new-instance v1, Ll/sz9;

    .line 33
    .line 34
    invoke-direct {v1, v0}, Ll/sz9;-><init>(Ljava/util/HashMap;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p1, v1}, Ll/jyb;->w(Ljava/util/List;Ll/qcj;)Ljava/util/ArrayList;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_5

    .line 50
    .line 51
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Ll/pf60;

    .line 56
    .line 57
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 58
    .line 59
    if-nez v2, :cond_2

    .line 60
    .line 61
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    iget-object v2, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast v2, Lcom/p1/mobile/putong/core/data/StickerBundle;

    .line 68
    .line 69
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/StickerBundle;->id:Ljava/lang/String;

    .line 70
    .line 71
    const-string v3, "4"

    .line 72
    .line 73
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-nez v2, :cond_3

    .line 78
    .line 79
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_3
    iget-object v2, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast v2, Lcom/p1/mobile/putong/core/data/StickerBundle;

    .line 86
    .line 87
    const-string v3, "purchased"

    .line 88
    .line 89
    invoke-static {v3}, Lcom/p1/mobile/putong/data/BundleStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/BundleStatus;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/StickerBundle;->status:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 94
    .line 95
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->f:Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    iget-object v2, v2, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 106
    .line 107
    const-string v3, "zh"

    .line 108
    .line 109
    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    if-eqz v3, :cond_4

    .line 118
    .line 119
    const-string v3, "CN"

    .line 120
    .line 121
    invoke-virtual {v2}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    if-nez v2, :cond_1

    .line 130
    .line 131
    :cond_4
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 132
    .line 133
    move-object v2, v1

    .line 134
    check-cast v2, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 135
    .line 136
    check-cast v1, Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 137
    .line 138
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 139
    .line 140
    new-instance v3, Ll/tz9;

    .line 141
    .line 142
    invoke-direct {v3}, Ll/tz9;-><init>()V

    .line 143
    .line 144
    .line 145
    invoke-static {v1, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    iput-object v1, v2, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_5
    return-object p1
.end method

.method public final r()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->l:Landroid/view/View;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->f:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;-><init>(Landroid/view/View;Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->q:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;

    .line 11
    .line 12
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->f:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    const/4 v2, 0x4

    .line 17
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->e:Lv/VRecyclerView;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->e:Lv/VRecyclerView;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->q:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic s(Ljava/util/List;Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->C(Ljava/util/List;Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public setActivatedTab(I)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->c:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_2

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->c:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget v3, Ll/edc0;->G1:I

    .line 18
    .line 19
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_1

    .line 28
    .line 29
    if-ne v1, p1, :cond_0

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    move v3, v0

    .line 34
    :goto_1
    invoke-virtual {v2, v3}, Landroid/view/View;->setActivated(Z)V

    .line 35
    .line 36
    .line 37
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    return-void
.end method

.method public setViewGone(I)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    const/16 p1, 0x8

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->b:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->e:Lv/VRecyclerView;

    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    if-ne p1, v0, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->b:Landroid/widget/LinearLayout;

    .line 24
    .line 25
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->e:Lv/VRecyclerView;

    .line 29
    .line 30
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    const/4 v2, 0x2

    .line 35
    if-ne p1, v2, :cond_2

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->b:Landroid/widget/LinearLayout;

    .line 38
    .line 39
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->e:Lv/VRecyclerView;

    .line 43
    .line 44
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-void
.end method

.method public final synthetic t(Ljava/util/List;)Lrx/c;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->q()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/qz9;

    .line 26
    .line 27
    invoke-direct {v1, p0, p1}, Ll/qz9;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance v0, Ll/rz9;

    .line 35
    .line 36
    invoke-direct {v0, p1}, Ll/rz9;-><init>(Ljava/util/List;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_0
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public final synthetic u(Landroid/util/Pair;)V
    .locals 0

    .line 1
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->z(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic v(ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->d:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-ne p2, p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->d:Lv/VPager;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final w(Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;>;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/z;->S:Lcom/p1/mobile/putong/core/api/z$b;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/mof0;->k()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ll/a0a;

    .line 14
    .line 15
    invoke-direct {v2}, Ll/a0a;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    new-instance v2, Ll/b0a;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Ll/b0a;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    new-instance v2, Ll/c0a;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Ll/c0a;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v2}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    new-instance v0, Ll/d0a;

    .line 45
    .line 46
    invoke-direct {v0, p1}, Ll/d0a;-><init>(Ll/y20;)V

    .line 47
    .line 48
    .line 49
    new-instance p1, Ll/e0a;

    .line 50
    .line 51
    invoke-direct {p1}, Ll/e0a;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public x()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/z;->k3()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/yz9;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/yz9;-><init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/zz9;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/zz9;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public y(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->p:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/xz9;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/xz9;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->m:Ll/w0r;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-interface {p1, v1, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {v0, p1}, Ll/w0r;->V(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->d:Lv/VPager;

    .line 24
    .line 25
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->n:I

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 28
    .line 29
    .line 30
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->n:I

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->A(I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public z(Ljava/util/List;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NotifyDataSetChanged"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->q:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->M(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->q:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
