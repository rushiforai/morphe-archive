.class public final synthetic Ll/zn10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/eo10;


# direct methods
.method public synthetic constructor <init>(Ll/eo10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zn10;->a:Ll/eo10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zn10;->a:Ll/eo10;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;

    invoke-static {p0, p1}, Ll/eo10;->q4(Ll/eo10;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method
