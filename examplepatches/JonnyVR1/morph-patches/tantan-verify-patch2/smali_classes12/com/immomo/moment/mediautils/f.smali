.class public abstract Lcom/immomo/moment/mediautils/f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/moment/mediautils/f$a;
    }
.end annotation


# instance fields
.field protected a:Lcom/immomo/moment/mediautils/f$a;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public abstract b()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/media/MediaFormat;",
            ">;"
        }
    .end annotation
.end method

.method public abstract c(Ljava/lang/String;)Z
.end method

.method public abstract d(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)I
.end method

.method public abstract e()V
.end method

.method public abstract f(J)V
.end method

.method public abstract g(Landroid/media/MediaFormat;)Z
.end method

.method public h(Lcom/immomo/moment/mediautils/f$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/f;->a:Lcom/immomo/moment/mediautils/f$a;

    .line 2
    .line 3
    return-void
.end method
