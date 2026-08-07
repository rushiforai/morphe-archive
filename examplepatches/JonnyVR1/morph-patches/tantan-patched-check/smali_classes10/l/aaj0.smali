.class public final synthetic Ll/aaj0;
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
    check-cast p1, Ljava/util/List;

    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;

    invoke-static {p1, p2}, Ll/haj0;->M3(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;)Lkotlin/Pair;

    move-result-object p0

    return-object p0
.end method
