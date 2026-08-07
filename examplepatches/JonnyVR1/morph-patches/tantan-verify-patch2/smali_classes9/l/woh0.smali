.class public final synthetic Ll/woh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/notifications/SysnotifListener;

.field public final synthetic b:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/notifications/SysnotifListener;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/woh0;->a:Lcom/p1/mobile/putong/core/ui/notifications/SysnotifListener;

    iput-object p2, p0, Ll/woh0;->b:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/woh0;->a:Lcom/p1/mobile/putong/core/ui/notifications/SysnotifListener;

    iget-object p0, p0, Ll/woh0;->b:Landroid/content/Intent;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/notifications/SysnotifListener;->a(Lcom/p1/mobile/putong/core/ui/notifications/SysnotifListener;Landroid/content/Intent;Ll/uxj0;)V

    return-void
.end method
