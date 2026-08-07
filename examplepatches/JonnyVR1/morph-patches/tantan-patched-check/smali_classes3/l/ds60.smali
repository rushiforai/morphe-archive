.class public final synthetic Ll/ds60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;

.field public final synthetic b:Ljava/util/Set;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;Ljava/util/Set;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ds60;->a:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;

    iput-object p2, p0, Ll/ds60;->b:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ds60;->a:Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;

    iget-object p0, p0, Ll/ds60;->b:Ljava/util/Set;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;->g(Lcom/p1/mobile/putong/ui/permission/PermissionRequestFragment;Ljava/util/Set;)V

    return-void
.end method
