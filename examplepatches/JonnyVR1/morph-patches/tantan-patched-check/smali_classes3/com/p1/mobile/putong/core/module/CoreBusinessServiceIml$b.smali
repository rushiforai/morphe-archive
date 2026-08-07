.class public Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a30;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;->rd(Ll/x0m;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/a30<",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "Lcom/p1/mobile/android/app/Act;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/x0m;

.field public final synthetic b:Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;Ll/x0m;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$b;->b:Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$b;->a:Ll/x0m;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    check-cast p3, Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$b;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$b;->a:Ll/x0m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x0m;->q1()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Ll/ma3;->c()Ll/x20;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 p2, 0x0

    .line 12
    sget-object p3, Lcom/p1/mobile/putong/core/data/Privilege;->minBoost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-static {p0, v0, p1, p2, p3}, Ll/ma3;->f(Lcom/p1/mobile/android/app/Act;ZLl/x20;ZLcom/p1/mobile/putong/core/data/Privilege;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
