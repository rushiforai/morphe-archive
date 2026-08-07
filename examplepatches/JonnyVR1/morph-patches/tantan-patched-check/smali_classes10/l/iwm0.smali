.class public final synthetic Ll/iwm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/kwm0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;


# direct methods
.method public synthetic constructor <init>(Ll/kwm0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iwm0;->a:Ll/kwm0;

    iput-object p2, p0, Ll/iwm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iwm0;->a:Ll/kwm0;

    iget-object p0, p0, Ll/iwm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    invoke-static {v0, p0}, Ll/kwm0;->V3(Ll/kwm0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method
