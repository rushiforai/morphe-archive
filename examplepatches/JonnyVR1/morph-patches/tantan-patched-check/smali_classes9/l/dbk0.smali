.class public final synthetic Ll/dbk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dbk0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;

    iput-object p2, p0, Ll/dbk0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    iput-boolean p3, p0, Ll/dbk0;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dbk0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;

    iget-object v1, p0, Ll/dbk0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    iget-boolean p0, p0, Ll/dbk0;->c:Z

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Ll/gbk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;ZLjava/lang/String;)V

    return-void
.end method
