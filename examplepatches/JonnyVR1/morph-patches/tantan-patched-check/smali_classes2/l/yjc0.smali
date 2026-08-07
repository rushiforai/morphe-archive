.class public final synthetic Ll/yjc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/bytedance/realx/video/memory/RXVideoMemory;


# direct methods
.method public synthetic constructor <init>(Lcom/bytedance/realx/video/memory/RXVideoMemory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yjc0;->a:Lcom/bytedance/realx/video/memory/RXVideoMemory;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yjc0;->a:Lcom/bytedance/realx/video/memory/RXVideoMemory;

    invoke-static {p0}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->a(Lcom/bytedance/realx/video/memory/RXVideoMemory;)V

    return-void
.end method
