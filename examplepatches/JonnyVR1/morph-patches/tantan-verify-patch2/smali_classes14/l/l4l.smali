.class public final synthetic Ll/l4l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/media/ttmediautils/download/Action1;


# instance fields
.field public final synthetic a:Ll/o4l;


# direct methods
.method public synthetic constructor <init>(Ll/o4l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l4l;->a:Ll/o4l;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l4l;->a:Ll/o4l;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p0, p1}, Ll/o4l;->c(Ll/o4l;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
