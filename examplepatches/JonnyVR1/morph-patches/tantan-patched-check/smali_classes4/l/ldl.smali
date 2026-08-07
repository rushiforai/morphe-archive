.class public final synthetic Ll/ldl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;


# instance fields
.field public final synthetic a:Ll/tel;


# direct methods
.method public synthetic constructor <init>(Ll/tel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ldl;->a:Ll/tel;

    return-void
.end method


# virtual methods
.method public final a(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ldl;->a:Ll/tel;

    invoke-static {p0, p1, p2}, Ll/tel;->f0(Ll/tel;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method
