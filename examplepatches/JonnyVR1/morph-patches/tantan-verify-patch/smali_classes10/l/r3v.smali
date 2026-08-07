.class public final synthetic Ll/r3v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/z3v;


# direct methods
.method public synthetic constructor <init>(Ll/z3v;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r3v;->a:Ll/z3v;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r3v;->a:Ll/z3v;

    check-cast p1, Ljava/lang/String;

    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;

    invoke-static {p0, p1, p2}, Ll/z3v;->U3(Ll/z3v;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;)V

    return-void
.end method
