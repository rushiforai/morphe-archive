.class public final synthetic Ll/shn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/thn0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

.field public final synthetic c:Ll/hrk0;


# direct methods
.method public synthetic constructor <init>(Ll/thn0;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Ll/hrk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/shn0;->a:Ll/thn0;

    iput-object p2, p0, Ll/shn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    iput-object p3, p0, Ll/shn0;->c:Ll/hrk0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/shn0;->a:Ll/thn0;

    iget-object v1, p0, Ll/shn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    iget-object p0, p0, Ll/shn0;->c:Ll/hrk0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    invoke-static {v0, v1, p0, p1}, Ll/thn0;->R3(Ll/thn0;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Ll/hrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method
