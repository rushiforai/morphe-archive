.class public Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/ui/permission/PermissionHelper$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->h(Landroid/app/Activity;Ljava/util/List;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/app/Activity;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;Landroid/app/Activity;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a$a;->c:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a$a;->a:Landroid/app/Activity;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a$a;->b:Ljava/util/List;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a$a;->c:Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a$a;->a:Landroid/app/Activity;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a$a;->b:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->d(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;Landroid/app/Activity;Ljava/util/List;ZLcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
