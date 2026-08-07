.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;
.super Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;
.source "SourceFile"


# instance fields
.field public B:Lv/VLinear;

.field public C:Landroid/widget/TextView;

.field public D:Lv/VText;

.field public E:Landroid/widget/LinearLayout;

.field public F:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

.field public G:Lv/VText;

.field public H:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

.field public I:Landroid/widget/LinearLayout;

.field public J:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic l0(Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->q0(Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V

    return-void
.end method


# virtual methods
.method public C()V
    .locals 0

    .line 1
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->o0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Z(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->Z(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 5
    .line 6
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->E(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 13
    .line 14
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    :goto_0
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->L(Z)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/xsg;

    .line 41
    .line 42
    invoke-direct {v1, p3, p2}, Ll/xsg;-><init>(Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->Q(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$e;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->M(Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 50
    .line 51
    .line 52
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->H:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 53
    .line 54
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->Y0(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 55
    .line 56
    .line 57
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->H:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 60
    .line 61
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->p:Z

    .line 62
    .line 63
    invoke-virtual {p3, v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->e1(Ljava/lang/String;Z)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->p0(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->G:Lv/VText;

    .line 70
    .line 71
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->X(Lv/VText;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->Y(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final o0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zsg;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public p0(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->H:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/high16 p1, 0x41400000    # 12.0f

    .line 15
    .line 16
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-static {p0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic q0(Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 1

    .line 1
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k0(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->r()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->E:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->a:Landroid/view/View;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->F:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->getTextView()Lv/VText;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->g:Lv/VText;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->J:Landroid/view/View;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->h:Landroid/view/View;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->C:Landroid/widget/TextView;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->c:Landroid/widget/TextView;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->D:Lv/VText;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->d:Lv/VText;

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->B:Lv/VLinear;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->b:Lv/VLinear;

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->E:Landroid/widget/LinearLayout;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->e:Landroid/view/View;

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->I:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->w:Landroid/widget/LinearLayout;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->H:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 43
    .line 44
    const v0, 0x7fffffff

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0}, Landroidx/constraintlayout/widget/ConstraintLayout;->setMaxWidth(I)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public r0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->E(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 10
    .line 11
    iget-object v2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const/4 v3, 0x0

    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    move v2, v3

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    :goto_0
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->L(Z)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    new-instance v2, Ll/ysg;

    .line 39
    .line 40
    invoke-direct {v2, p0, p3, p2}, Ll/ysg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->Q(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$e;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->M(Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 48
    .line 49
    .line 50
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->H:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 51
    .line 52
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->Y0(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 53
    .line 54
    .line 55
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->H:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 56
    .line 57
    invoke-virtual {p3, p1, v3}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->e1(Ljava/lang/String;Z)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->p0(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->G:Lv/VText;

    .line 64
    .line 65
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->X(Lv/VText;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->Y(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public s0(IIII)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterAudioView;->E:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/view/View;->setPadding(IIII)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
