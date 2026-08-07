.class public final synthetic Ll/axi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/dxi;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;


# direct methods
.method public synthetic constructor <init>(Ll/dxi;Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/axi;->a:Ll/dxi;

    iput-object p2, p0, Ll/axi;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/axi;->a:Ll/dxi;

    iget-object p0, p0, Ll/axi;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;

    invoke-static {v0, p0}, Ll/dxi;->N3(Ll/dxi;Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;)V

    return-void
.end method
