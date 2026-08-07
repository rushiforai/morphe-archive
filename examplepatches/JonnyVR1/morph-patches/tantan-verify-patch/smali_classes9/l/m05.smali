.class public Ll/m05;
.super Ll/dh2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dh2<",
        "Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dh2;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public J(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/dh2;->a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->notificationData:Ll/p9t;

    .line 7
    .line 8
    iget-object v1, p0, Ll/dh2;->b:Ll/yql;

    .line 9
    .line 10
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    new-instance v2, Ll/l05;

    .line 14
    .line 15
    invoke-direct {v2, v1}, Ll/l05;-><init>(Ll/yql;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->y(Ll/p9t;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/dh2;->a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 22
    .line 23
    invoke-static {p1}, Ll/tz40;->f(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Ll/dh2;->b:Ll/yql;

    .line 30
    .line 31
    invoke-interface {p0}, Ll/yql;->c()V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->e0:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m05;->J(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
