.class public final synthetic Ll/pb9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/n;

.field public final synthetic b:Lrx/Notification;

.field public final synthetic c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/n;Lrx/Notification;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pb9;->a:Lcom/p1/mobile/putong/core/api/n;

    iput-object p2, p0, Ll/pb9;->b:Lrx/Notification;

    iput-object p3, p0, Ll/pb9;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iput-object p4, p0, Ll/pb9;->d:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pb9;->a:Lcom/p1/mobile/putong/core/api/n;

    iget-object v1, p0, Ll/pb9;->b:Lrx/Notification;

    iget-object v2, p0, Ll/pb9;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iget-object p0, p0, Ll/pb9;->d:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/n;->v3(Lcom/p1/mobile/putong/core/api/n;Lrx/Notification;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
