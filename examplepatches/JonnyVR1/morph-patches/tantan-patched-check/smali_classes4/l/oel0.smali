.class public final synthetic Ll/oel0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/engine/ui/VideoFrameRender;

.field public final synthetic b:Lcom/bytedance/realx/video/EglBase$Context;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/engine/ui/VideoFrameRender;Lcom/bytedance/realx/video/EglBase$Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oel0;->a:Lcom/ss/bytertc/engine/ui/VideoFrameRender;

    iput-object p2, p0, Ll/oel0;->b:Lcom/bytedance/realx/video/EglBase$Context;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oel0;->a:Lcom/ss/bytertc/engine/ui/VideoFrameRender;

    iget-object p0, p0, Ll/oel0;->b:Lcom/bytedance/realx/video/EglBase$Context;

    invoke-static {v0, p0}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->c(Lcom/ss/bytertc/engine/ui/VideoFrameRender;Lcom/bytedance/realx/video/EglBase$Context;)V

    return-void
.end method
