.class public final synthetic Ll/zbu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveSuggestPopAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveSuggestPopAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zbu;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveSuggestPopAct;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zbu;->a:Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveSuggestPopAct;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveSuggestPopAct;->b2(Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveSuggestPopAct;Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;)Ll/ncu;

    move-result-object p0

    return-object p0
.end method
