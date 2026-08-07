.class public final synthetic Ll/p4l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/tantanapp/media/ttmediautils/download/Action1;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/media/ttmediautils/download/Action1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p4l;->a:Lcom/tantanapp/media/ttmediautils/download/Action1;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p4l;->a:Lcom/tantanapp/media/ttmediautils/download/Action1;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p0, p1}, Ll/r4l;->q2(Lcom/tantanapp/media/ttmediautils/download/Action1;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
