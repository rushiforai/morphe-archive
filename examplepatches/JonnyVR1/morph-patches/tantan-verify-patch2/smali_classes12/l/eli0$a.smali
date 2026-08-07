.class Ll/eli0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pmq0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/eli0;->d0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/eli0;


# direct methods
.method public constructor <init>(Ll/eli0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eli0$a;->a:Ll/eli0;

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
    .locals 4

    .line 1
    iget-object p2, p0, Ll/eli0$a;->a:Ll/eli0;

    .line 2
    .line 3
    invoke-static {p2}, Ll/eli0;->W(Ll/eli0;)Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Ll/eli0$a;->a:Ll/eli0;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/nio/Buffer;->capacity()I

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    invoke-static {p3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    invoke-static {p2, p3}, Ll/eli0;->X(Ll/eli0;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p2, p0, Ll/eli0$a;->a:Ll/eli0;

    .line 23
    .line 24
    invoke-static {p2}, Ll/eli0;->W(Ll/eli0;)Ljava/nio/ByteBuffer;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    const/4 p3, 0x0

    .line 29
    invoke-virtual {p2, p3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 33
    .line 34
    .line 35
    iget-object p2, p0, Ll/eli0$a;->a:Ll/eli0;

    .line 36
    .line 37
    invoke-static {p2}, Ll/eli0;->W(Ll/eli0;)Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->array()[B

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ll/eli0$a;->a:Ll/eli0;

    .line 49
    .line 50
    iget-object p2, p1, Ll/eli0;->r:Ll/qpr;

    .line 51
    .line 52
    invoke-static {p1}, Ll/eli0;->W(Ll/eli0;)Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object p3, p0, Ll/eli0$a;->a:Ll/eli0;

    .line 57
    .line 58
    invoke-static {p3}, Ll/eli0;->W(Ll/eli0;)Ljava/nio/ByteBuffer;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    invoke-virtual {p3}, Ljava/nio/Buffer;->limit()I

    .line 63
    .line 64
    .line 65
    move-result p3

    .line 66
    iget-object p0, p0, Ll/eli0$a;->a:Ll/eli0;

    .line 67
    .line 68
    invoke-static {p0}, Ll/eli0;->Y(Ll/eli0;)J

    .line 69
    .line 70
    .line 71
    move-result-wide v0

    .line 72
    const-wide/16 v2, 0x3e8

    .line 73
    .line 74
    mul-long/2addr v0, v2

    .line 75
    invoke-interface {p2, p1, p3, v0, v1}, Ll/qpr;->a(Ljava/nio/ByteBuffer;IJ)V

    .line 76
    .line 77
    .line 78
    return-void
.end method
