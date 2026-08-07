.class public final synthetic Ll/vuk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vuk;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vuk;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    invoke-static {p0, p1}, Ll/yuk;->b4(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
