.class public final synthetic Ll/b800;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b800;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    iput-object p2, p0, Ll/b800;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/b800;->c:Lcom/p1/mobile/putong/data/User;

    iput-object p4, p0, Ll/b800;->d:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/b800;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;

    iget-object v1, p0, Ll/b800;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/b800;->c:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/b800;->d:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;->a(Lcom/p1/mobile/putong/core/ui/messages/view/MessageUserHeaderLayout;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
