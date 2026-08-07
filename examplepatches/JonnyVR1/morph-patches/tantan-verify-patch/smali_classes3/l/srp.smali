.class public final synthetic Ll/srp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/urp;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;


# direct methods
.method public synthetic constructor <init>(Ll/urp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/srp;->a:Ll/urp;

    iput-object p2, p0, Ll/srp;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/srp;->a:Ll/urp;

    iget-object p0, p0, Ll/srp;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;

    invoke-static {v0, p0}, Ll/urp;->a(Ll/urp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V

    return-void
.end method
