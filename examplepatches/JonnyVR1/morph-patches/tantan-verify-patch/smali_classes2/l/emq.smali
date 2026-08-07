.class public final synthetic Ll/emq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/nio/ByteBuffer;


# direct methods
.method public synthetic constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/emq;->a:Ljava/nio/ByteBuffer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/emq;->a:Ljava/nio/ByteBuffer;

    invoke-static {p0}, Lcom/bytedance/realx/video/JavaI420Buffer;->a(Ljava/nio/ByteBuffer;)V

    return-void
.end method
