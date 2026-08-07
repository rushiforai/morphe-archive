.class public final synthetic Ll/kdt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kdt;->a:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kdt;->a:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/module/api/LivePrivacyApiProvider;->e(Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
