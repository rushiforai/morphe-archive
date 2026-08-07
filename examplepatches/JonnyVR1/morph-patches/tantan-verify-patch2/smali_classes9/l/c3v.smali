.class public final synthetic Ll/c3v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/d3v;


# direct methods
.method public synthetic constructor <init>(Ll/d3v;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c3v;->a:Ll/d3v;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c3v;->a:Ll/d3v;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionLeaderboard;

    invoke-static {p0, p1}, Ll/d3v;->a(Ll/d3v;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceAuctionMessage$VoiceLiveAuctionLeaderboard;)V

    return-void
.end method
