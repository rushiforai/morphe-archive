.class public final synthetic Ll/vrs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xrs;


# direct methods
.method public synthetic constructor <init>(Ll/xrs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vrs;->a:Ll/xrs;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vrs;->a:Ll/xrs;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;

    invoke-static {p0, p1}, Ll/xrs;->T3(Ll/xrs;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;)V

    return-void
.end method
