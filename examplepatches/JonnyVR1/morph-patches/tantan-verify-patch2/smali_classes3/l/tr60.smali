.class public final synthetic Ll/tr60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/x20;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tr60;->a:Ll/x20;

    iput-object p2, p0, Ll/tr60;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final a(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tr60;->a:Ll/x20;

    iget-object p0, p0, Ll/tr60;->b:Ll/y20;

    invoke-static {v0, p0, p1, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->c(Ll/x20;Ll/y20;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method
