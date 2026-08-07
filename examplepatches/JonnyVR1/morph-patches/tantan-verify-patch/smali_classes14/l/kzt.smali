.class public final synthetic Ll/kzt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->F(Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;)V

    return-void
.end method
