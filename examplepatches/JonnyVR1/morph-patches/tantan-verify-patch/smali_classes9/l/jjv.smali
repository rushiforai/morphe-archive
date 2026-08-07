.class public final synthetic Ll/jjv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jjv;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jjv;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

    check-cast p1, Lcom/p1/mobile/putong/data/Followship;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->M0(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;Lcom/p1/mobile/putong/data/Followship;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
