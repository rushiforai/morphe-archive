.class public final synthetic Ll/wwi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/dxi;


# direct methods
.method public synthetic constructor <init>(Ll/dxi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wwi;->a:Ll/dxi;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wwi;->a:Ll/dxi;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;

    invoke-virtual {p0, p1}, Ll/dxi;->Y3(Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;)V

    return-void
.end method
