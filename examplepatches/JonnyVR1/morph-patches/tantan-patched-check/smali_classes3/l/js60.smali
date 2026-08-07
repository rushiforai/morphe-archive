.class public final synthetic Ll/js60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;

.field public final synthetic b:Landroid/app/Activity;

.field public final synthetic c:Ll/z20;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;Landroid/app/Activity;Ll/z20;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/js60;->a:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;

    iput-object p2, p0, Ll/js60;->b:Landroid/app/Activity;

    iput-object p3, p0, Ll/js60;->c:Ll/z20;

    iput-boolean p4, p0, Ll/js60;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/js60;->a:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;

    iget-object v1, p0, Ll/js60;->b:Landroid/app/Activity;

    iget-object v2, p0, Ll/js60;->c:Ll/z20;

    iget-boolean p0, p0, Ll/js60;->d:Z

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;->a(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment$CheckPermissionsData;Landroid/app/Activity;Ll/z20;ZLjava/lang/String;)V

    return-void
.end method
