.class public final synthetic Ll/tjv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tjv;->a:Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tjv;->a:Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->k1(Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
