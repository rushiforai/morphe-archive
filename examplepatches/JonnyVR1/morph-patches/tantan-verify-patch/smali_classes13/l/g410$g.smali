.class Ll/g410$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qmq0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g410;->V(Ll/z5m;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/g410;


# direct methods
.method public constructor <init>(Ll/g410;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g410$g;->a:Ll/g410;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/nio/ByteBuffer;J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g410$g;->a:Ll/g410;

    .line 2
    .line 3
    iget-object p0, p0, Ll/g410;->i:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    check-cast p2, Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 20
    .line 21
    invoke-interface {p2, p1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->v0(Ljava/nio/ByteBuffer;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method
