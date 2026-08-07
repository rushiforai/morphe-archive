.class public Lcom/google/protobuf/GeneratedMessageLite$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/GeneratedMessageLite$h;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/GeneratedMessageLite;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "f"
.end annotation


# instance fields
.field public a:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 6
    .line 7
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/protobuf/GeneratedMessageLite$a;)V
    .locals 0

    .line 8
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite$f;-><init>()V

    return-void
.end method

.method public static synthetic r(Lcom/google/protobuf/GeneratedMessageLite$f;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic s(Lcom/google/protobuf/GeneratedMessageLite$f;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public a(Lcom/google/protobuf/i;Lcom/google/protobuf/i;)Lcom/google/protobuf/i;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/protobuf/i<",
            "Lcom/google/protobuf/GeneratedMessageLite$d;",
            ">;",
            "Lcom/google/protobuf/i<",
            "Lcom/google/protobuf/GeneratedMessageLite$d;",
            ">;)",
            "Lcom/google/protobuf/i<",
            "Lcom/google/protobuf/GeneratedMessageLite$d;",
            ">;"
        }
    .end annotation

    .line 1
    iget p2, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 2
    .line 3
    mul-int/lit8 p2, p2, 0x35

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/google/protobuf/i;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/2addr p2, v0

    .line 10
    iput p2, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 11
    .line 12
    return-object p1
.end method

.method public b(Lcom/google/protobuf/l$e;Lcom/google/protobuf/l$e;)Lcom/google/protobuf/l$e;
    .locals 1

    .line 1
    iget p2, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 2
    .line 3
    mul-int/lit8 p2, p2, 0x35

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/2addr p2, v0

    .line 10
    iput p2, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 11
    .line 12
    return-object p1
.end method

.method public c(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public d(ZZZZ)Z
    .locals 0

    .line 1
    iget p1, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0x35

    .line 4
    .line 5
    invoke-static {p2}, Lcom/google/protobuf/l;->b(Z)I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    add-int/2addr p1, p3

    .line 10
    iput p1, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 11
    .line 12
    return p2
.end method

.method public e(ZIZI)I
    .locals 0

    .line 1
    iget p1, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0x35

    .line 4
    .line 5
    add-int/2addr p1, p2

    .line 6
    iput p1, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 7
    .line 8
    return p2
.end method

.method public f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget p1, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0x35

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    add-int/2addr p1, p3

    .line 10
    iput p1, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 11
    .line 12
    return-object p2
.end method

.method public g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/l$h<",
            "TT;>;",
            "Lcom/google/protobuf/l$h<",
            "TT;>;)",
            "Lcom/google/protobuf/l$h<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget p2, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 2
    .line 3
    mul-int/lit8 p2, p2, 0x35

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/2addr p2, v0

    .line 10
    iput p2, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 11
    .line 12
    return-object p1
.end method

.method public h(ZLcom/google/protobuf/ByteString;ZLcom/google/protobuf/ByteString;)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget p1, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0x35

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/google/protobuf/ByteString;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    add-int/2addr p1, p3

    .line 10
    iput p1, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 11
    .line 12
    return-object p2
.end method

.method public i(ZJZJ)J
    .locals 0

    .line 1
    iget p1, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0x35

    .line 4
    .line 5
    invoke-static {p2, p3}, Lcom/google/protobuf/l;->e(J)I

    .line 6
    .line 7
    .line 8
    move-result p4

    .line 9
    add-int/2addr p1, p4

    .line 10
    iput p1, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 11
    .line 12
    return-wide p2
.end method

.method public j(ZDZD)D
    .locals 0

    .line 1
    iget p1, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0x35

    .line 4
    .line 5
    invoke-static {p2, p3}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 6
    .line 7
    .line 8
    move-result-wide p4

    .line 9
    invoke-static {p4, p5}, Lcom/google/protobuf/l;->e(J)I

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    add-int/2addr p1, p4

    .line 14
    iput p1, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 15
    .line 16
    return-wide p2
.end method

.method public k(ZLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p2, Lcom/google/protobuf/q;

    .line 2
    .line 3
    check-cast p3, Lcom/google/protobuf/q;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p3}, Lcom/google/protobuf/GeneratedMessageLite$f;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public l(Lcom/google/protobuf/MapFieldLite;Lcom/google/protobuf/MapFieldLite;)Lcom/google/protobuf/MapFieldLite;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/protobuf/MapFieldLite<",
            "TK;TV;>;",
            "Lcom/google/protobuf/MapFieldLite<",
            "TK;TV;>;)",
            "Lcom/google/protobuf/MapFieldLite<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1
    iget p2, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 2
    .line 3
    mul-int/lit8 p2, p2, 0x35

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/google/protobuf/MapFieldLite;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/2addr p2, v0

    .line 10
    iput p2, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 11
    .line 12
    return-object p1
.end method

.method public m(Ll/eyj0;Ll/eyj0;)Ll/eyj0;
    .locals 1

    .line 1
    iget p2, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 2
    .line 3
    mul-int/lit8 p2, p2, 0x35

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/eyj0;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/2addr p2, v0

    .line 10
    iput p2, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 11
    .line 12
    return-object p1
.end method

.method public n(Lcom/google/protobuf/l$f;Lcom/google/protobuf/l$f;)Lcom/google/protobuf/l$f;
    .locals 1

    .line 1
    iget p2, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 2
    .line 3
    mul-int/lit8 p2, p2, 0x35

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/2addr p2, v0

    .line 10
    iput p2, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 11
    .line 12
    return-object p1
.end method

.method public o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/google/protobuf/q;",
            ">(TT;TT;)TT;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    instance-of p2, p1, Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    move-object p2, p1

    .line 8
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite;

    .line 9
    .line 10
    invoke-virtual {p2, p0}, Lcom/google/protobuf/GeneratedMessageLite;->hashCode(Lcom/google/protobuf/GeneratedMessageLite$f;)I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/16 p2, 0x25

    .line 21
    .line 22
    :goto_0
    iget v0, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 23
    .line 24
    mul-int/lit8 v0, v0, 0x35

    .line 25
    .line 26
    add-int/2addr v0, p2

    .line 27
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 28
    .line 29
    return-object p1
.end method

.method public p(ZFZF)F
    .locals 0

    .line 1
    iget p1, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0x35

    .line 4
    .line 5
    invoke-static {p2}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    add-int/2addr p1, p3

    .line 10
    iput p1, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 11
    .line 12
    return p2
.end method

.method public q(Lcom/google/protobuf/l$g;Lcom/google/protobuf/l$g;)Lcom/google/protobuf/l$g;
    .locals 1

    .line 1
    iget p2, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 2
    .line 3
    mul-int/lit8 p2, p2, 0x35

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/2addr p2, v0

    .line 10
    iput p2, p0, Lcom/google/protobuf/GeneratedMessageLite$f;->a:I

    .line 11
    .line 12
    return-object p1
.end method
