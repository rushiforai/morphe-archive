.class public final synthetic Ll/cwn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/rwn0;


# direct methods
.method public synthetic constructor <init>(Ll/rwn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cwn0;->a:Ll/rwn0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cwn0;->a:Ll/rwn0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;

    invoke-static {p0, p1}, Ll/rwn0;->E2(Ll/rwn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
