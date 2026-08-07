.class public final synthetic Ll/d510;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/e510;


# direct methods
.method public synthetic constructor <init>(Ll/e510;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d510;->a:Ll/e510;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d510;->a:Ll/e510;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;

    invoke-static {p0, p1}, Ll/e510;->K3(Ll/e510;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method
