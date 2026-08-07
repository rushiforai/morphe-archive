.class public Ll/q020;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/c020;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Landroid/content/Context;

.field public b:Ll/c020;

.field public c:Lv/VRecyclerView;

.field public d:Landroid/view/View;

.field public e:Landroid/widget/TextView;

.field public f:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public g:Z

.field public h:Landroid/view/View;

.field public i:Lv/VButton;

.field public j:Lv/VImage;

.field public k:Ll/xx10;

.field public l:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;",
            ">;"
        }
    .end annotation
.end field

.field public m:Landroidx/constraintlayout/widget/Group;

.field public n:Landroidx/constraintlayout/widget/Group;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/q020;->l:Ljava/util/HashMap;

    .line 10
    .line 11
    iput-object p1, p0, Ll/q020;->a:Landroid/content/Context;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/q020;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q020;->C(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/q020;Ll/a020;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q020;->I(Ll/a020;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/q020;Ll/a020;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q020;->H(Ll/a020;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/q020;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q020;->A(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/q020;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q020;->B(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/q020;Ll/a020;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q020;->G(Ll/a020;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/a020;Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a020;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;Ll/d3q;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    check-cast p1, Ll/a020;

    .line 2
    .line 3
    iget-object p1, p1, Ll/a020;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic k(Ll/q020;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q020;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ljava/util/ArrayList;Ll/d3q;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/a020;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/a020;

    .line 6
    .line 7
    iget-boolean v0, p1, Ll/a020;->c:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Ll/a020;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic m(Ll/q020;ZLl/d3q;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q020;->F(ZLl/d3q;)V

    return-void
.end method

.method public static synthetic n(ZLl/d3q;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/a020;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/a020;

    .line 6
    .line 7
    iput-boolean p0, p1, Ll/a020;->b:Z

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    iput-boolean p0, p1, Ll/a020;->c:Z

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic p(Ll/q020;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q020;->E(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic A(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q020;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic B(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/q020;->j:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/q020;->j:Lv/VImage;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-virtual {p0, p1}, Ll/q020;->J(Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/q020;->U()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic C(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q020;->K()V

    .line 2
    .line 3
    .line 4
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

.method public final synthetic E(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q020;->b:Ll/c020;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/c020;->v2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic F(ZLl/d3q;)V
    .locals 1

    .line 1
    instance-of v0, p2, Ll/a020;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p2, Ll/a020;

    .line 6
    .line 7
    iput-boolean p1, p2, Ll/a020;->c:Z

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p2, p1}, Ll/q020;->W(Ll/a020;Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final synthetic G(Ll/a020;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q020;->R(Ll/a020;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic H(Ll/a020;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q020;->L(Ll/a020;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic I(Ll/a020;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q020;->T(Ll/a020;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final J(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q020;->f:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/m020;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/m020;-><init>(Ll/q020;Z)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/q020;->f:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final K()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/q020;->g:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-boolean v2, p0, Ll/q020;->g:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/q020;->j:Lv/VImage;

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/view/View;->setSelected(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/q020;->h:Landroid/view/View;

    .line 15
    .line 16
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/q020;->d:Landroid/view/View;

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/q020;->e:Landroid/widget/TextView;

    .line 25
    .line 26
    sget v1, Lcom/p1/mobile/putong/live/external/R$string;->f:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/q020;->k:Ll/xx10;

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ll/xx10;->E(Z)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object v0, p0, Ll/q020;->e:Landroid/widget/TextView;

    .line 38
    .line 39
    sget v3, Lcom/p1/mobile/putong/live/external/R$string;->e:I

    .line 40
    .line 41
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(I)V

    .line 42
    .line 43
    .line 44
    iput-boolean v1, p0, Ll/q020;->g:Z

    .line 45
    .line 46
    iget-object v0, p0, Ll/q020;->h:Landroid/view/View;

    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/q020;->d:Landroid/view/View;

    .line 52
    .line 53
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/q020;->k:Ll/xx10;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ll/xx10;->E(Z)V

    .line 59
    .line 60
    .line 61
    :goto_0
    iget-boolean v0, p0, Ll/q020;->g:Z

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Ll/q020;->Q(Z)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/q020;->l:Ljava/util/HashMap;

    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final L(Ll/a020;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/q020;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Ll/xz10;->f1()Ll/xz10;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v0, v0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 11
    .line 12
    iget-object p1, p1, Ll/a020;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 13
    .line 14
    if-eqz v0, :cond_3

    .line 15
    .line 16
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_3

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->isUsing()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->isPlaying()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iget-object p0, p0, Ll/q020;->b:Ll/c020;

    .line 38
    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/c020;->y2()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    invoke-virtual {p0}, Ll/c020;->B2()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    :goto_0
    iget-object p0, p0, Ll/q020;->b:Ll/c020;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ll/c020;->z2(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public M(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q020;->k:Ll/xx10;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/xx10;->x(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/q020;->V(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public N(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q020;->k:Ll/xx10;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/xx10;->y(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/q020;->V(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q020;->k:Ll/xx10;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/xx10;->z(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/q020;->V(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public P(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q020;->k:Ll/xx10;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xx10;->A()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/q020;->V(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final Q(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q020;->f:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/l020;

    .line 8
    .line 9
    invoke-direct {v1, p1}, Ll/l020;-><init>(Z)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/q020;->f:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final R(Ll/a020;)V
    .locals 2

    .line 1
    iget-boolean v0, p1, Ll/a020;->c:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    xor-int/2addr v0, v1

    .line 5
    iput-boolean v0, p1, Ll/a020;->c:Z

    .line 6
    .line 7
    invoke-virtual {p0, p1, v1}, Ll/q020;->W(Ll/a020;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/q020;->f:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public S(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Ll/q020;->n:Landroidx/constraintlayout/widget/Group;

    .line 13
    .line 14
    xor-int/lit8 v2, v0, 0x1

    .line 15
    .line 16
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/q020;->m:Landroidx/constraintlayout/widget/Group;

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/q020;->e:Landroid/widget/TextView;

    .line 25
    .line 26
    xor-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/q020;->k:Ll/xx10;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ll/xx10;->C(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/q020;->k:Ll/xx10;

    .line 37
    .line 38
    invoke-static {}, Ll/xz10;->f1()Ll/xz10;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Ll/xz10;->l1()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {v0, v1}, Ll/xx10;->G(Z)V

    .line 47
    .line 48
    .line 49
    new-instance v0, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .line 53
    .line 54
    const/4 v1, 0x0

    .line 55
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-ge v1, v2, :cond_1

    .line 60
    .line 61
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 66
    .line 67
    new-instance v3, Ll/a020;

    .line 68
    .line 69
    invoke-direct {v3, v2}, Ll/a020;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 70
    .line 71
    .line 72
    iput v1, v3, Ll/a020;->f:I

    .line 73
    .line 74
    new-instance v2, Ll/o020;

    .line 75
    .line 76
    invoke-direct {v2, p0, v3}, Ll/o020;-><init>(Ll/q020;Ll/a020;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3, v2}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    new-instance v2, Ll/p020;

    .line 83
    .line 84
    invoke-direct {v2, p0, v3}, Ll/p020;-><init>(Ll/q020;Ll/a020;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v3, v2}, Ll/a020;->J(Landroid/view/View$OnClickListener;)V

    .line 88
    .line 89
    .line 90
    new-instance v2, Ll/e020;

    .line 91
    .line 92
    invoke-direct {v2, p0, v3}, Ll/e020;-><init>(Ll/q020;Ll/a020;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v3, v2}, Ll/a020;->I(Landroid/view/View$OnClickListener;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    add-int/lit8 v1, v1, 0x1

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-nez p1, :cond_2

    .line 109
    .line 110
    new-instance p1, Ll/ufs;

    .line 111
    .line 112
    const/high16 v1, 0x42a00000    # 80.0f

    .line 113
    .line 114
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    invoke-direct {p1, v1}, Ll/ufs;-><init>(I)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    :cond_2
    iget-object p0, p0, Ll/q020;->f:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 125
    .line 126
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public final T(Ll/a020;)V
    .locals 7

    .line 1
    invoke-static {}, Ll/xz10;->f1()Ll/xz10;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xz10;->g1()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/g020;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/g020;-><init>(Ll/a020;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 19
    .line 20
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    iput-boolean v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->isSetTop:Z

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    move v3, v2

    .line 33
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-ge v3, v4, :cond_1

    .line 38
    .line 39
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 44
    .line 45
    iget-object v5, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v6, v4, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    if-nez v5, :cond_0

    .line 54
    .line 55
    iput-boolean v2, v4, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->isSetTop:Z

    .line 56
    .line 57
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    invoke-static {}, Ll/xz10;->f1()Ll/xz10;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0, v0, v1}, Ll/xz10;->E1(Ljava/util/List;Z)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final U()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/q020;->l:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/q020;->i:Lv/VButton;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/q020;->i:Lv/VButton;

    .line 16
    .line 17
    const-string v2, "#66FFFFFF"

    .line 18
    .line 19
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/q020;->i:Lv/VButton;

    .line 27
    .line 28
    const-string v1, "#7F4F2D"

    .line 29
    .line 30
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const/high16 v2, 0x41200000    # 10.0f

    .line 35
    .line 36
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    int-to-float v2, v2

    .line 41
    invoke-static {v1, v2, v0}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    const/4 v0, 0x1

    .line 50
    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/q020;->i:Lv/VButton;

    .line 54
    .line 55
    const-string v1, "#E5FFFFFF"

    .line 56
    .line 57
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Ll/q020;->i:Lv/VButton;

    .line 65
    .line 66
    sget v0, Ll/nbc0;->l:I

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public V(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q020;->f:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/f020;

    .line 10
    .line 11
    invoke-direct {v1, p1}, Ll/f020;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/a020;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v1, v0, Ll/a020;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->playStatus:Ljava/lang/String;

    .line 25
    .line 26
    iput-object p1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->playStatus:Ljava/lang/String;

    .line 27
    .line 28
    iget-object p0, p0, Ll/q020;->f:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final W(Ll/a020;Z)V
    .locals 2

    .line 1
    iget-boolean v0, p1, Ll/a020;->c:Z

    .line 2
    .line 3
    iget-object v1, p0, Ll/q020;->l:Ljava/util/HashMap;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Ll/a020;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p1, p1, Ll/a020;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    :goto_0
    if-eqz p2, :cond_2

    .line 23
    .line 24
    iget-object p1, p0, Ll/q020;->j:Lv/VImage;

    .line 25
    .line 26
    iget-object p2, p0, Ll/q020;->l:Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-virtual {p2}, Ljava/util/HashMap;->size()I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    iget-object v0, p0, Ll/q020;->f:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const/4 v1, 0x1

    .line 43
    sub-int/2addr v0, v1

    .line 44
    if-ne p2, v0, :cond_1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    const/4 v1, 0x0

    .line 48
    :goto_1
    invoke-virtual {p1, v1}, Landroid/view/View;->setSelected(Z)V

    .line 49
    .line 50
    .line 51
    :cond_2
    invoke-virtual {p0}, Ll/q020;->U()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/c020;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/q020;->q(Ll/c020;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    sget p2, Ll/xec0;->M:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Ll/q020;->y(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public q(Ll/c020;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/q020;->b:Ll/c020;

    .line 2
    .line 3
    return-void
.end method

.method public final s()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/q020;->f:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    new-instance v2, Ll/n020;

    .line 13
    .line 14
    invoke-direct {v2, v0}, Ll/n020;-><init>(Ljava/util/ArrayList;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/xz10;->f1()Ll/xz10;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1, v0}, Ll/xz10;->e1(Ljava/util/ArrayList;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/q020;->e:Landroid/widget/TextView;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final u(Landroid/view/View;)V
    .locals 2

    .line 1
    sget v0, Ll/ldc0;->c:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Ll/q020;->d:Landroid/view/View;

    .line 8
    .line 9
    new-instance v1, Ll/d020;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/d020;-><init>(Ll/q020;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    sget v0, Ll/ldc0;->U:I

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Ll/q020;->h:Landroid/view/View;

    .line 24
    .line 25
    sget v0, Ll/ldc0;->T:I

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lv/VButton;

    .line 32
    .line 33
    iput-object v0, p0, Ll/q020;->i:Lv/VButton;

    .line 34
    .line 35
    new-instance v1, Ll/h020;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/h020;-><init>(Ll/q020;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    sget v0, Ll/ldc0;->E:I

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lv/VImage;

    .line 50
    .line 51
    iput-object v0, p0, Ll/q020;->j:Lv/VImage;

    .line 52
    .line 53
    new-instance v1, Ll/i020;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/i020;-><init>(Ll/q020;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    sget v0, Ll/ldc0;->f0:I

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Landroidx/constraintlayout/widget/Group;

    .line 68
    .line 69
    iput-object v0, p0, Ll/q020;->m:Landroidx/constraintlayout/widget/Group;

    .line 70
    .line 71
    sget v0, Ll/ldc0;->O:I

    .line 72
    .line 73
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    check-cast p1, Landroidx/constraintlayout/widget/Group;

    .line 78
    .line 79
    iput-object p1, p0, Ll/q020;->n:Landroidx/constraintlayout/widget/Group;

    .line 80
    .line 81
    return-void
.end method

.method public final v(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance v0, Ll/xx10;

    .line 2
    .line 3
    iget-object v1, p0, Ll/q020;->b:Ll/c020;

    .line 4
    .line 5
    invoke-direct {v0, v1, p1}, Ll/xx10;-><init>(Ll/c020;Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/q020;->k:Ll/xx10;

    .line 9
    .line 10
    return-void
.end method

.method public final w(Landroid/view/View;)V
    .locals 3

    .line 1
    sget v0, Ll/ldc0;->N0:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VRecyclerView;

    .line 8
    .line 9
    iput-object v0, p0, Ll/q020;->c:Lv/VRecyclerView;

    .line 10
    .line 11
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/4 v1, 0x1

    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-direct {v0, p1, v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/q020;->c:Lv/VRecyclerView;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 25
    .line 26
    .line 27
    new-instance p1, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 28
    .line 29
    invoke-direct {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ll/q020;->f:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 33
    .line 34
    iget-object p0, p0, Ll/q020;->c:Lv/VRecyclerView;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final x(Landroid/view/View;)V
    .locals 2

    .line 1
    sget v0, Ll/ldc0;->d1:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/bnl0;->F0()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 12
    .line 13
    .line 14
    sget v0, Ll/ldc0;->c0:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/TextView;

    .line 21
    .line 22
    iput-object v0, p0, Ll/q020;->e:Landroid/widget/TextView;

    .line 23
    .line 24
    new-instance v1, Ll/j020;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/j020;-><init>(Ll/q020;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    sget v0, Ll/ldc0;->x:I

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance v0, Ll/k020;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/k020;-><init>(Ll/q020;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q020;->x(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/q020;->w(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/q020;->u(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/q020;->v(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/q020;->U()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic z(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q020;->b:Ll/c020;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/c020;->u2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
