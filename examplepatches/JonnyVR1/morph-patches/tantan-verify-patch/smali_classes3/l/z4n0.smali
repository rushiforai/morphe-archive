.class public final synthetic Ll/z4n0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z4n0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

    iput-object p2, p0, Ll/z4n0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z4n0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

    iget-object p0, p0, Ll/z4n0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->v(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;)V

    return-void
.end method
