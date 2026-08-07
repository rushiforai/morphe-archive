.class public final synthetic Ll/vr60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

.field public final synthetic b:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vr60;->a:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    iput-object p2, p0, Ll/vr60;->b:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vr60;->a:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    iget-object p0, p0, Ll/vr60;->b:Landroid/app/Activity;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->a(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;Landroid/app/Activity;Ljava/lang/Boolean;)V

    return-void
.end method
