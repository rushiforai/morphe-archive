.class public final synthetic Ll/zfk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

.field public final synthetic b:Ll/p9t;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/y20;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;Ll/p9t;Ljava/lang/String;Ll/y20;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zfk0;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    iput-object p2, p0, Ll/zfk0;->b:Ll/p9t;

    iput-object p3, p0, Ll/zfk0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/zfk0;->d:Ll/y20;

    iput-boolean p5, p0, Ll/zfk0;->e:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/zfk0;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;

    iget-object v1, p0, Ll/zfk0;->b:Ll/p9t;

    iget-object v2, p0, Ll/zfk0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/zfk0;->d:Ll/y20;

    iget-boolean v4, p0, Ll/zfk0;->e:Z

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;->e(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/UserNotificationItemView;Ll/p9t;Ljava/lang/String;Ll/y20;ZLandroid/view/View;)V

    return-void
.end method
