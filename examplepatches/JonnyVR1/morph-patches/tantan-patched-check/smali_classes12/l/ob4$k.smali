.class Ll/ob4$k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pc1$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ob4;->f1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/ob4;


# direct methods
.method public constructor <init>(Ll/ob4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ob4$k;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/ad60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ob4$k;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ob4;->O0(Ll/ob4;)Ll/la1;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ob4$k;->a:Ll/ob4;

    .line 7
    .line 8
    iget-object v1, v0, Ll/ob4;->s:Lcom/immomo/moment/mediautils/l;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    iget-object v1, v0, Ll/ob4;->t:Lcom/immomo/moment/mediautils/l;

    .line 13
    .line 14
    if-eqz v1, :cond_4

    .line 15
    .line 16
    :cond_0
    iget-object v1, v0, Ll/ob4;->x:Ll/ed1;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-static {v0}, Ll/ob4;->P0(Ll/ob4;)F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {v1, p1, v0}, Ll/ed1;->e(Ll/ad60;F)Ll/ad60;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    :cond_1
    if-eqz p1, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Ll/ob4$k;->a:Ll/ob4;

    .line 31
    .line 32
    invoke-static {v0}, Ll/ob4;->Q0(Ll/ob4;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 43
    .line 44
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p1, v0}, Ll/ad60;->e(Ljava/nio/ByteBuffer;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    if-eqz p1, :cond_3

    .line 52
    .line 53
    iget-object v0, p0, Ll/ob4$k;->a:Ll/ob4;

    .line 54
    .line 55
    iget-object v0, v0, Ll/ob4;->s:Lcom/immomo/moment/mediautils/l;

    .line 56
    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    invoke-virtual {v0, p1}, Lcom/immomo/moment/mediautils/l;->E(Ll/ad60;)V

    .line 60
    .line 61
    .line 62
    :cond_3
    if-eqz p1, :cond_4

    .line 63
    .line 64
    iget-object p0, p0, Ll/ob4$k;->a:Ll/ob4;

    .line 65
    .line 66
    iget-object p0, p0, Ll/ob4;->t:Lcom/immomo/moment/mediautils/l;

    .line 67
    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Lcom/immomo/moment/mediautils/l;->E(Ll/ad60;)V

    .line 71
    .line 72
    .line 73
    :cond_4
    return-void
.end method
