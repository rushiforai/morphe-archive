.class public final synthetic Ll/eap0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    invoke-static {p1, p2}, Ll/acp0;->w4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Lkotlin/Pair;

    move-result-object p0

    return-object p0
.end method
