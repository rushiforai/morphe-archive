.class public Lcom/p1/mobile/putong/live/external/page/setting/a;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/external/page/setting/a$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;

.field public b:Lcom/p1/mobile/putong/live/external/page/setting/b$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/a;->a:Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public H()Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/a;->a:Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;

    .line 2
    .line 3
    return-object p0
.end method

.method public I(Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/a;->b:Lcom/p1/mobile/putong/live/external/page/setting/b$a;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;->q(Lcom/p1/mobile/putong/live/external/page/setting/a;Lcom/p1/mobile/putong/live/external/page/setting/b$a;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public J(Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;Ljava/util/List;)V
    .locals 1
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/d3q;->v(Landroid/view/View;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/a;->I(Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    invoke-interface {p2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    instance-of p2, p0, Lcom/p1/mobile/putong/live/external/page/setting/a$a;

    .line 20
    .line 21
    if-eqz p2, :cond_1

    .line 22
    .line 23
    check-cast p0, Lcom/p1/mobile/putong/live/external/page/setting/a$a;

    .line 24
    .line 25
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/a$a;->a:Z

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;->z(Z)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/live/external/page/setting/b;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/page/setting/b;->z2()Lcom/p1/mobile/putong/live/external/page/setting/b$a;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/a;->b:Lcom/p1/mobile/putong/live/external/page/setting/b$a;

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/a;->I(Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic v(Landroid/view/View;Ljava/util/List;)V
    .locals 0
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/page/setting/a;->J(Lcom/p1/mobile/putong/live/external/page/setting/LiveFollowPushNoticeItemView;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
