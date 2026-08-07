.class public final synthetic Ll/q3c0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;


# instance fields
.field public final synthetic a:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q3c0;->a:Ll/x20;

    return-void
.end method


# virtual methods
.method public final a(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q3c0;->a:Ll/x20;

    invoke-static {p0, p1, p2}, Ll/r3c0;->b(Ll/x20;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method
