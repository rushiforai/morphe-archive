.class public final synthetic Ll/ze20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;


# direct methods
.method public synthetic constructor <init>(Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ze20;->a:Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ze20;->a:Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;

    invoke-static {p0}, Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;->b(Lcom/bytedance/realx/video/memory/NativeTextureVideoMemory;)V

    return-void
.end method
