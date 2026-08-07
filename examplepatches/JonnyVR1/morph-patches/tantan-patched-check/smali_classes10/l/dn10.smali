.class public final synthetic Ll/dn10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/en10;


# direct methods
.method public synthetic constructor <init>(Ll/en10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dn10;->a:Ll/en10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dn10;->a:Ll/en10;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;

    invoke-static {p0, p1}, Ll/en10;->J3(Ll/en10;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method
