.class public Ll/b25;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/b25$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/w15;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/VDraweeView;

.field public c:Lv/VImage;

.field public d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public e:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public f:Lv/VText;

.field public g:Lv/VLinear;

.field public h:Lv/VDraweeView;

.field public i:Lv/VDraweeView;

.field public j:Lv/VText;

.field public k:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public l:Lv/VRecyclerView;

.field public m:Landroid/view/View;

.field public n:Landroid/widget/FrameLayout;

.field public o:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public p:Landroid/widget/TextView;

.field public q:Lcom/p1/mobile/android/app/Act;

.field public r:Ll/w15;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/b25;->q:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/b25;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b25;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/b25;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b25;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/b25;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b25;->k(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic d(Ll/b25;)Ll/w15;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b25;->r:Ll/w15;

    return-object p0
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/b25;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/b25;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/b25;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/b25;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerHistoryAct;->Z1(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/b25;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "e_chatting_partner_signal_list"

    .line 25
    .line 26
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/b25;->q:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/b25;->q:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/c25;->b(Ll/b25;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Ll/w15;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b25;->r:Ll/w15;

    .line 2
    .line 3
    return-void
.end method

.method public i()V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/b25;->b:Lv/VDraweeView;

    .line 4
    .line 5
    const-string v2, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IlNLTjI1V0czRlZIVUZQNlNNQ1pUTVpVUVFEWDQ3VTE0IiwidyI6MTM1MCwiaCI6MTA4MCwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjkxNDY1Mjg2MDk4Njh9.webp"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/b25;->c:Lv/VImage;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/b25;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v1}, Ll/vnb;->n1(Lcom/p1/mobile/android/app/Act;)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/high16 v2, 0x40c00000    # 6.0f

    .line 21
    .line 22
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    add-int/2addr v1, v2

    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 28
    .line 29
    .line 30
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 31
    .line 32
    iget-object v1, p0, Ll/b25;->h:Lv/VDraweeView;

    .line 33
    .line 34
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 37
    .line 38
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Gc()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    if-nez v0, :cond_0

    .line 66
    .line 67
    iget-object v0, p0, Ll/b25;->i:Lv/VDraweeView;

    .line 68
    .line 69
    sget v1, Ll/dbc0;->o5:I

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 76
    .line 77
    iget-object v1, p0, Ll/b25;->i:Lv/VDraweeView;

    .line 78
    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-interface {v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Gc()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    iget-object v2, v2, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 88
    .line 89
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :goto_0
    iget-object v0, p0, Ll/b25;->c:Lv/VImage;

    .line 95
    .line 96
    new-instance v1, Ll/y15;

    .line 97
    .line 98
    invoke-direct {v1, p0}, Ll/y15;-><init>(Ll/b25;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/b25;->d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 105
    .line 106
    new-instance v1, Ll/z15;

    .line 107
    .line 108
    invoke-direct {v1, p0}, Ll/z15;-><init>(Ll/b25;)V

    .line 109
    .line 110
    .line 111
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/w15;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b25;->f(Ll/w15;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/b25;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/b25;->r:Ll/w15;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/w15;->j0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Ll/b25;->r:Ll/w15;

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/w15;->j0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {v0}, Ll/w15;->i0()Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/b25;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p1}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/b25;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-object v0, p0, Ll/b25;->r:Ll/w15;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/w15;->h0()Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v1, p0, Ll/b25;->r:Ll/w15;

    .line 54
    .line 55
    invoke-virtual {v1}, Ll/w15;->i0()Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->id:Ljava/lang/String;

    .line 60
    .line 61
    const-string v2, "fixtion"

    .line 62
    .line 63
    invoke-static {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerSelectFriendAct;->a2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/ChatPartners;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0}, Ll/b25;->act()Lcom/p1/mobile/android/app/Act;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/b25;->act()Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 79
    .line 80
    .line 81
    :cond_1
    invoke-virtual {p0}, Ll/b25;->act()Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iget-object p0, p0, Ll/b25;->r:Ll/w15;

    .line 90
    .line 91
    invoke-virtual {p0}, Ll/w15;->i0()Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 96
    .line 97
    const-string v0, "word_content"

    .line 98
    .line 99
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    filled-new-array {p0}, [Ll/pf60;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const-string v0, "e_sent_chatting_partner_signal"

    .line 108
    .line 109
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 110
    .line 111
    .line 112
    :cond_2
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/core/data/ChatPartners;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/core/data/ChatPartners;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatPartners;->texts:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/b25;->r:Ll/w15;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Ll/w15;->m0(Lcom/p1/mobile/putong/core/data/ChatPartnerText;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/b25;->j:Lv/VText;

    .line 22
    .line 23
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p1, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object v0, p0, Ll/b25;->l:Lv/VRecyclerView;

    .line 38
    .line 39
    new-instance v1, Ll/b25$a;

    .line 40
    .line 41
    invoke-direct {v1, p0, p1}, Ll/b25$a;-><init>(Ll/b25;Ljava/util/List;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/b25;->r:Ll/w15;

    .line 48
    .line 49
    invoke-virtual {p1}, Ll/w15;->i0()Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_1

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/b25;->act()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iget-object v0, p0, Ll/b25;->r:Ll/w15;

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/w15;->i0()Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 74
    .line 75
    const-string v1, "word_content"

    .line 76
    .line 77
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    filled-new-array {v0}, [Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const-string v1, "e_preset_word"

    .line 86
    .line 87
    invoke-static {v1, p1, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 88
    .line 89
    .line 90
    :cond_1
    iget-object p1, p0, Ll/b25;->p:Landroid/widget/TextView;

    .line 91
    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    const-string v1, "\u6211\u7684\u4fe1\u53f7\u6b21\u6570\uff1a"

    .line 95
    .line 96
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget-object v1, p0, Ll/b25;->r:Ll/w15;

    .line 100
    .line 101
    invoke-virtual {v1}, Ll/w15;->h0()Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    iget v1, v1, Lcom/p1/mobile/putong/core/data/ChatPartners;->remainSignalCount:I

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Ll/b25;->r:Ll/w15;

    .line 118
    .line 119
    invoke-virtual {p1}, Ll/w15;->h0()Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    iget p1, p1, Lcom/p1/mobile/putong/core/data/ChatPartners;->remainSignalCount:I

    .line 124
    .line 125
    iget-object v0, p0, Ll/b25;->n:Landroid/widget/FrameLayout;

    .line 126
    .line 127
    if-lez p1, :cond_2

    .line 128
    .line 129
    sget p1, Ll/dbc0;->Q4:I

    .line 130
    .line 131
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 132
    .line 133
    .line 134
    iget-object p1, p0, Ll/b25;->n:Landroid/widget/FrameLayout;

    .line 135
    .line 136
    new-instance v0, Ll/x15;

    .line 137
    .line 138
    invoke-direct {v0, p0}, Ll/x15;-><init>(Ll/b25;)V

    .line 139
    .line 140
    .line 141
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_2
    sget p0, Ll/dbc0;->R4:I

    .line 146
    .line 147
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 148
    .line 149
    .line 150
    return-void
.end method
