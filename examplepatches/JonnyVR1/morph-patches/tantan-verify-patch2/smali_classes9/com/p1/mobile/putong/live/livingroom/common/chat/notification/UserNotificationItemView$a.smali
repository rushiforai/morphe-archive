.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView$a;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView$a;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView$a;->b:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/fn2;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fn2;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView$a;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 8
    .line 9
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView$a;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->g(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;Ljava/lang/String;)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView$a;->b:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 26
    .line 27
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    int-to-float p3, p3

    .line 32
    int-to-float p2, p2

    .line 33
    int-to-float p1, p1

    .line 34
    div-float/2addr p2, p1

    .line 35
    mul-float/2addr p3, p2

    .line 36
    float-to-int p1, p3

    .line 37
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView$a;->b:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 38
    .line 39
    const/4 p3, 0x1

    .line 40
    new-array p3, p3, [Landroid/view/View;

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    aput-object p2, p3, v0

    .line 44
    .line 45
    invoke-static {p1, p3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView$a;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView$a;->a:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {p2, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->h(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;Ljava/lang/String;I)V

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_0
    return-void
.end method
