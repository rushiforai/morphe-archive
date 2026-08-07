.class public final synthetic Ll/txv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/txv;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/txv;->b:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;

    iput-object p3, p0, Ll/txv;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/txv;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/txv;->b:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;

    iget-object p0, p0, Ll/txv;->c:Ll/x20;

    invoke-static {v0, v1, p0}, Ll/xxv;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;Ll/x20;)V

    return-void
.end method
