.class public final synthetic Ll/qel0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/nio/ByteBuffer;

.field public final synthetic b:Ljava/nio/ByteBuffer;

.field public final synthetic c:Ljava/nio/ByteBuffer;


# direct methods
.method public synthetic constructor <init>(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qel0;->a:Ljava/nio/ByteBuffer;

    iput-object p2, p0, Ll/qel0;->b:Ljava/nio/ByteBuffer;

    iput-object p3, p0, Ll/qel0;->c:Ljava/nio/ByteBuffer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qel0;->a:Ljava/nio/ByteBuffer;

    iget-object v1, p0, Ll/qel0;->b:Ljava/nio/ByteBuffer;

    iget-object p0, p0, Ll/qel0;->c:Ljava/nio/ByteBuffer;

    invoke-static {v0, v1, p0}, Lcom/ss/bytertc/engine/ui/VideoFrameRender;->a(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V

    return-void
.end method
