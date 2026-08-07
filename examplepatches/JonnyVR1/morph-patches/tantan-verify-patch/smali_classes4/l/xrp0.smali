.class public final synthetic Ll/xrp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/engine/video/IVideoFrame;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/engine/video/IVideoFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xrp0;->a:Lcom/ss/bytertc/engine/video/IVideoFrame;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xrp0;->a:Lcom/ss/bytertc/engine/video/IVideoFrame;

    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoFrame;->releaseRef()J

    return-void
.end method
