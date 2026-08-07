.class public final synthetic Ll/xjc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/bytedance/realx/video/RXVideoFrameHelper;


# direct methods
.method public synthetic constructor <init>(Lcom/bytedance/realx/video/RXVideoFrameHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xjc0;->a:Lcom/bytedance/realx/video/RXVideoFrameHelper;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xjc0;->a:Lcom/bytedance/realx/video/RXVideoFrameHelper;

    invoke-static {p0}, Lcom/bytedance/realx/video/RXVideoFrameHelper;->a(Lcom/bytedance/realx/video/RXVideoFrameHelper;)V

    return-void
.end method
