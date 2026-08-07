.class public final synthetic Lcom/p1/mobile/putong/ui/permission/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/permission/a;->a:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/permission/a;->a:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;

    check-cast p1, Ljava/lang/String;

    check-cast p2, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;

    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->e(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;Ljava/lang/String;Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData$Type;)V

    return-void
.end method
