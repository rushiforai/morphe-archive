.class public final synthetic Ll/nmn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/umn0;


# direct methods
.method public synthetic constructor <init>(Ll/umn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nmn0;->a:Ll/umn0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nmn0;->a:Ll/umn0;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceRoomTopicUpdate;

    invoke-static {p0, p1}, Ll/umn0;->S3(Ll/umn0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceRoomTopicUpdate;)V

    return-void
.end method
