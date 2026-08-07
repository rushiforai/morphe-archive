.class public final synthetic Ll/k240;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/b;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/b;Ll/y20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k240;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    iput-object p2, p0, Ll/k240;->b:Ll/y20;

    iput-object p3, p0, Ll/k240;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k240;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    iget-object v1, p0, Ll/k240;->b:Ll/y20;

    iget-object p0, p0, Ll/k240;->c:Ll/x20;

    check-cast p1, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/b;->k(Lcom/p1/mobile/putong/core/newui/home/b;Ll/y20;Ll/x20;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method
