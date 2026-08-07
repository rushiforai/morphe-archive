.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveFlowView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Ll/nah;

.field public b:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic p(Ll/kah;Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Interactive;I)V
    .locals 0

    .line 1
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Interactive;->deepLink:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/kah;->a()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p3

    .line 14
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p3, p1}, Ll/ryh;->b(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/kah;->g()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p1, "topic_id"

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Interactive;->topic:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    filled-new-array {p1}, [Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string p2, "e_topic_activity_entry"

    .line 38
    .line 39
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public getAdapter()Ll/nah;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveFlowView;->a:Ll/nah;

    .line 2
    .line 3
    return-object p0
.end method

.method public final s(Ll/kah;)Lorg/apmem/tools/layouts/FlowLayout;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lorg/apmem/tools/layouts/FlowLayout;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/kah;->a()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lorg/apmem/tools/layouts/FlowLayout;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/nah;

    .line 11
    .line 12
    invoke-direct {v1, p1}, Ll/nah;-><init>(Ll/kah;)V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveFlowView;->a:Ll/nah;

    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveFlowView;->b:Ll/y20;

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ll/nah;->D(Ll/y20;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveFlowView;->a:Ll/nah;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ll/r4h;->t(Lorg/apmem/tools/layouts/FlowLayout;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveFlowView;->a:Ll/nah;

    .line 28
    .line 29
    new-instance v1, Ll/iah;

    .line 30
    .line 31
    invoke-direct {v1, p1}, Ll/iah;-><init>(Ll/kah;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v1}, Ll/r4h;->A(Ll/r4h$a;)V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public setOnViewRender(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveFlowView;->b:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public u(Ll/kah;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveFlowView;->a:Ll/nah;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveFlowView;->s(Ll/kah;)Lorg/apmem/tools/layouts/FlowLayout;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p1}, Ll/kah;->c()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p1}, Ll/nah;->C(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveFlowView;->a:Ll/nah;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/r4h;->notifyDataSetChanged()V

    .line 23
    .line 24
    .line 25
    return-void
.end method
