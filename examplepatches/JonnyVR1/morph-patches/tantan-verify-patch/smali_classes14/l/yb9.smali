.class public final synthetic Ll/yb9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/n;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/n;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yb9;->a:Lcom/p1/mobile/putong/core/api/n;

    iput-boolean p2, p0, Ll/yb9;->b:Z

    iput-object p3, p0, Ll/yb9;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iput-object p4, p0, Ll/yb9;->d:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yb9;->a:Lcom/p1/mobile/putong/core/api/n;

    iget-boolean v1, p0, Ll/yb9;->b:Z

    iget-object v2, p0, Ll/yb9;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iget-object p0, p0, Ll/yb9;->d:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Lrx/Notification;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/api/n;->n3(Lcom/p1/mobile/putong/core/api/n;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;Lrx/Notification;)Lrx/Notification;

    move-result-object p0

    return-object p0
.end method
