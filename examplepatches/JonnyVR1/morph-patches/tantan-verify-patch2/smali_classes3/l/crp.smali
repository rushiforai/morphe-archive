.class public final synthetic Ll/crp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/erp;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;


# direct methods
.method public synthetic constructor <init>(Ll/erp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/crp;->a:Ll/erp;

    iput-object p2, p0, Ll/crp;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/crp;->a:Ll/erp;

    iget-object p0, p0, Ll/crp;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    invoke-static {v0, p0, p1}, Ll/erp;->L3(Ll/erp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V

    return-void
.end method
