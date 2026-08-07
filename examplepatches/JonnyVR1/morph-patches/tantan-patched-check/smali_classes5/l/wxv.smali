.class public final synthetic Ll/wxv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wxv;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/wxv;->b:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;

    return-void
.end method


# virtual methods
.method public final a(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wxv;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/wxv;->b:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;

    invoke-static {v0, p0, p1, p2}, Ll/xxv;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method
