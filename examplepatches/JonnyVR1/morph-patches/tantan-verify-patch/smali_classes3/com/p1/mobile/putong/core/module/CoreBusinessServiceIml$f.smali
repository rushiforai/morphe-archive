.class public Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bn50;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;->Eo(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;ZLl/x20;Ll/x20;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;Ll/x20;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$f;->c:Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$f;->a:Ll/x20;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$f;->b:Ll/x20;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$f;->b:Ll/x20;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$f;->b:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$f;->a:Ll/x20;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$f;->a:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
