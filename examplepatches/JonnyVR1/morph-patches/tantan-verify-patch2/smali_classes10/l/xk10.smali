.class public final synthetic Ll/xk10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/zk10;


# direct methods
.method public synthetic constructor <init>(Ll/zk10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xk10;->a:Ll/zk10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xk10;->a:Ll/zk10;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    invoke-static {p0, p1}, Ll/zk10;->m4(Ll/zk10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
