.class public final synthetic Ll/jpo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vpo0;


# direct methods
.method public synthetic constructor <init>(Ll/vpo0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jpo0;->a:Ll/vpo0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jpo0;->a:Ll/vpo0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;

    invoke-static {p0, p1}, Ll/vpo0;->d(Ll/vpo0;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method
