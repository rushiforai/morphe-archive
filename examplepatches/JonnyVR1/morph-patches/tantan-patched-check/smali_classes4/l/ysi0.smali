.class public final synthetic Ll/ysi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ysi0;->a:Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ysi0;->a:Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;

    invoke-static {p0}, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->c(Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;)V

    return-void
.end method
