.class public final synthetic Ll/abk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/abk0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    iput-boolean p2, p0, Ll/abk0;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/abk0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    iget-boolean p0, p0, Ll/abk0;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;

    invoke-static {v0, p0, p1}, Ll/gbk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;ZLcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;)V

    return-void
.end method
