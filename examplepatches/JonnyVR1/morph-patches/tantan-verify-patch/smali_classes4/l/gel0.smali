.class public final synthetic Ll/gel0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gel0;->a:Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gel0;->a:Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;

    invoke-static {p0}, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;->a(Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$ByteBufferHolder;)V

    return-void
.end method
