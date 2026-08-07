.class public final synthetic Ll/gny;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hny;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;


# direct methods
.method public synthetic constructor <init>(Ll/hny;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gny;->a:Ll/hny;

    iput-object p2, p0, Ll/gny;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gny;->a:Ll/hny;

    iget-object p0, p0, Ll/gny;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;

    invoke-static {v0, p0, p1}, Ll/hny;->b4(Ll/hny;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;)V

    return-void
.end method
