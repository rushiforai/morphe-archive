.class public final synthetic Ll/es60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/es60;->a:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/es60;->a:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->f(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;Landroid/content/DialogInterface;)V

    return-void
.end method
