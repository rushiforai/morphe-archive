.class public Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;->So(Ll/x0m;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$e;->b:Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$e;->a:Ll/x0m;

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
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml$e;->a:Ll/x0m;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ll/x0m;->V(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
