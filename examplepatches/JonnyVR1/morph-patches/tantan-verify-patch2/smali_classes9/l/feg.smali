.class public final synthetic Ll/feg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/peg;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveTask;


# direct methods
.method public synthetic constructor <init>(Ll/peg;Lcom/p1/mobile/putong/live/base/data/BLiveTask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/feg;->a:Ll/peg;

    iput-object p2, p0, Ll/feg;->b:Lcom/p1/mobile/putong/live/base/data/BLiveTask;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/feg;->a:Ll/peg;

    iget-object p0, p0, Ll/feg;->b:Lcom/p1/mobile/putong/live/base/data/BLiveTask;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/peg;->u4(Ll/peg;Lcom/p1/mobile/putong/live/base/data/BLiveTask;Ljava/lang/Throwable;)V

    return-void
.end method
