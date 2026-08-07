.class public Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;->rd(Ll/x0m;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$a;->b:Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$a;->a:Ll/x0m;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$a;->a:Ll/x0m;

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
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->minBoost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    invoke-static {p0, v3, v0, v1, v2}, Ll/ma3;->f(Lcom/p1/mobile/android/app/Act;ZLl/x20;ZLcom/p1/mobile/putong/core/data/Privilege;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
