.class public final synthetic Ll/mse;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/bytedance/realx/video/EglRenderer;

.field public final synthetic b:Lcom/bytedance/realx/video/EglBase$Context;

.field public final synthetic c:[I


# direct methods
.method public synthetic constructor <init>(Lcom/bytedance/realx/video/EglRenderer;Lcom/bytedance/realx/video/EglBase$Context;[I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mse;->a:Lcom/bytedance/realx/video/EglRenderer;

    iput-object p2, p0, Ll/mse;->b:Lcom/bytedance/realx/video/EglBase$Context;

    iput-object p3, p0, Ll/mse;->c:[I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mse;->a:Lcom/bytedance/realx/video/EglRenderer;

    iget-object v1, p0, Ll/mse;->b:Lcom/bytedance/realx/video/EglBase$Context;

    iget-object p0, p0, Ll/mse;->c:[I

    invoke-static {v0, v1, p0}, Lcom/bytedance/realx/video/EglRenderer;->d(Lcom/bytedance/realx/video/EglRenderer;Lcom/bytedance/realx/video/EglBase$Context;[I)V

    return-void
.end method
