.class public Ll/a210$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/a210;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/a210;


# direct methods
.method public constructor <init>(Ll/a210;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a210$a;->a:Ll/a210;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;Ll/y20;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/a210$a;->a:Ll/a210;

    .line 2
    .line 3
    invoke-static {p0}, Ll/a210;->U0(Ll/a210;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/z110;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/z110;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/a210$a;->b(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
