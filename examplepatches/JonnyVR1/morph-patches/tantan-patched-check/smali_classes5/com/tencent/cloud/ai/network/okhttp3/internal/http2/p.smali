.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;,
        Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$a;
    }
.end annotation


# static fields
.field public static final e:Ljava/util/logging/Logger;


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okio/g;

.field public final b:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$a;

.field public final c:Z

.field public final d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->e:Ljava/util/logging/Logger;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lcom/tencent/cloud/ai/network/okio/g;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->c:Z

    .line 7
    .line 8
    new-instance p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$a;

    .line 9
    .line 10
    invoke-direct {p2, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$a;-><init>(Lcom/tencent/cloud/ai/network/okio/g;)V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$a;

    .line 14
    .line 15
    new-instance p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;

    .line 16
    .line 17
    const/16 v0, 0x1000

    .line 18
    .line 19
    invoke-direct {p1, v0, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;-><init>(ILcom/tencent/cloud/ai/network/okio/w;)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;

    .line 23
    .line 24
    return-void
.end method

.method public static a(IBS)I
    .locals 0

    and-int/lit8 p1, p1, 0x8

    if-eqz p1, :cond_0

    add-int/lit8 p0, p0, -0x1

    :cond_0
    if-gt p2, p0, :cond_1

    sub-int/2addr p0, p2

    int-to-short p0, p0

    return p0

    .line 830
    :cond_1
    invoke-static {p2}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "PROTOCOL_ERROR padding %s > remaining length %s"

    invoke-static {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    const/4 p0, 0x0

    throw p0
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okio/g;)I
    .locals 2

    .line 827
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/g;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x10

    .line 828
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/g;->readByte()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    .line 829
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/g;->readByte()B

    move-result p0

    and-int/lit16 p0, p0, 0xff

    or-int/2addr p0, v0

    return p0
.end method


# virtual methods
.method public final a(ISBI)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ISBI)",
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;",
            ">;"
        }
    .end annotation

    .line 757
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$a;

    iput p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$a;->e:I

    iput p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$a;->b:I

    .line 758
    iput-short p2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$a;->f:S

    .line 759
    iput-byte p3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$a;->c:B

    .line 760
    iput p4, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$a;->d:I

    .line 761
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;

    .line 762
    :cond_0
    :goto_0
    iget-object p2, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->b:Lcom/tencent/cloud/ai/network/okio/g;

    invoke-interface {p2}, Lcom/tencent/cloud/ai/network/okio/g;->g()Z

    move-result p2

    if-nez p2, :cond_c

    .line 763
    iget-object p2, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->b:Lcom/tencent/cloud/ai/network/okio/g;

    invoke-interface {p2}, Lcom/tencent/cloud/ai/network/okio/g;->readByte()B

    move-result p2

    and-int/lit16 p3, p2, 0xff

    const/4 p4, 0x0

    const/16 v0, 0x80

    if-eq p3, v0, :cond_b

    and-int/lit16 v1, p2, 0x80

    if-ne v1, v0, :cond_3

    const/16 p2, 0x7f

    .line 764
    invoke-virtual {p1, p3, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->a(II)I

    move-result p2

    add-int/lit8 p3, p2, -0x1

    if-ltz p3, :cond_1

    .line 765
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d;->a:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    if-gt p3, v1, :cond_1

    .line 766
    aget-object p2, v0, p3

    .line 767
    iget-object p3, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->a:Ljava/util/List;

    invoke-interface {p3, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 768
    :cond_1
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d;->a:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    array-length v0, v0

    sub-int/2addr p3, v0

    invoke-virtual {p1, p3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->a(I)I

    move-result p3

    if-ltz p3, :cond_2

    .line 769
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->e:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    array-length v1, v0

    if-ge p3, v1, :cond_2

    .line 770
    iget-object p2, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->a:Ljava/util/List;

    aget-object p3, v0, p3

    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 771
    :cond_2
    const-string p0, "Header index too large "

    invoke-static {p0, p2}, Ll/p3r0;->a(Ljava/lang/String;I)V

    return-object p4

    :cond_3
    const/4 v0, -0x1

    const/16 v1, 0x40

    if-ne p3, v1, :cond_4

    .line 772
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object p2

    invoke-static {p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d;->a(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object p2

    .line 773
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object p3

    .line 774
    new-instance p4, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    invoke-direct {p4, p2, p3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    invoke-virtual {p1, v0, p4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->a(ILcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;)V

    goto :goto_0

    :cond_4
    and-int/lit8 v2, p2, 0x40

    if-ne v2, v1, :cond_5

    const/16 p2, 0x3f

    .line 775
    invoke-virtual {p1, p3, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->a(II)I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    .line 776
    invoke-virtual {p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->c(I)Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object p2

    .line 777
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object p3

    .line 778
    new-instance p4, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    invoke-direct {p4, p2, p3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    invoke-virtual {p1, v0, p4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->a(ILcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;)V

    goto/16 :goto_0

    :cond_5
    and-int/lit8 p2, p2, 0x20

    const/16 v0, 0x20

    if-ne p2, v0, :cond_8

    const/16 p2, 0x1f

    .line 779
    invoke-virtual {p1, p3, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->a(II)I

    move-result p2

    iput p2, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->d:I

    if-ltz p2, :cond_7

    .line 780
    iget p3, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->c:I

    if-gt p2, p3, :cond_7

    .line 781
    iget p3, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->h:I

    if-ge p2, p3, :cond_0

    if-nez p2, :cond_6

    .line 782
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->a()V

    goto/16 :goto_0

    :cond_6
    sub-int/2addr p3, p2

    .line 783
    invoke-virtual {p1, p3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->b(I)I

    goto/16 :goto_0

    .line 784
    :cond_7
    const-string p0, "Invalid dynamic table size update "

    iget p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->d:I

    invoke-static {p0, p1}, Ll/yll;->a(Ljava/lang/String;I)V

    return-object p4

    :cond_8
    const/16 p2, 0x10

    if-eq p3, p2, :cond_a

    if-nez p3, :cond_9

    goto :goto_1

    :cond_9
    const/16 p2, 0xf

    .line 785
    invoke-virtual {p1, p3, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->a(II)I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    .line 786
    invoke-virtual {p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->c(I)Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object p2

    .line 787
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object p3

    .line 788
    iget-object p4, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->a:Ljava/util/List;

    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    invoke-direct {v0, p2, p3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    invoke-interface {p4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 789
    :cond_a
    :goto_1
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object p2

    invoke-static {p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d;->a(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object p2

    .line 790
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->b()Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object p3

    .line 791
    iget-object p4, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->a:Ljava/util/List;

    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    invoke-direct {v0, p2, p3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    invoke-interface {p4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 792
    :cond_b
    const-string p0, "index == 0"

    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    return-object p4

    .line 793
    :cond_c
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;

    .line 794
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 795
    new-instance p1, Ljava/util/ArrayList;

    iget-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->a:Ljava/util/List;

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 796
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;->a:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->clear()V

    return-object p1
.end method

.method public a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;)V
    .locals 4

    .line 717
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->c:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    .line 718
    invoke-virtual {p0, v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a(ZLcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 719
    new-array p0, p0, [Ljava/lang/Object;

    const-string p1, "Required SETTINGS preface not received"

    invoke-static {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    throw v1

    .line 720
    :cond_1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    sget-object p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->a:Lcom/tencent/cloud/ai/network/okio/ByteString;

    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    move-result v0

    int-to-long v2, v0

    invoke-interface {p0, v2, v3}, Lcom/tencent/cloud/ai/network/okio/g;->a(J)Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object p0

    .line 721
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->e:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->hex()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const-string v3, "<< CONNECTION %s"

    invoke-static {v3, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 722
    :cond_2
    invoke-virtual {p1, p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    :goto_0
    return-void

    .line 723
    :cond_3
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->utf8()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "Expected a connection header but was %s"

    invoke-static {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    throw v1
.end method

.method public final a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;I)V
    .locals 0

    .line 797
    iget-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    invoke-interface {p2}, Lcom/tencent/cloud/ai/network/okio/g;->readInt()I

    .line 798
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/g;->readByte()B

    .line 799
    check-cast p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;

    .line 800
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public final a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;IBI)V
    .locals 9

    const/4 v0, 0x0

    if-eqz p4, :cond_9

    and-int/lit8 v1, p3, 0x1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    move v6, v1

    goto :goto_0

    :cond_0
    move v6, v0

    :goto_0
    and-int/lit8 v1, p3, 0x8

    if-eqz v1, :cond_1

    .line 724
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/g;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-short v0, v0

    :cond_1
    and-int/lit8 v1, p3, 0x20

    if-eqz v1, :cond_2

    .line 725
    invoke-virtual {p0, p1, p4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;I)V

    add-int/lit8 p2, p2, -0x5

    .line 726
    :cond_2
    invoke-static {p2, p3, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a(IBS)I

    move-result p2

    .line 727
    invoke-virtual {p0, p2, v0, p3, p4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a(ISBI)Ljava/util/List;

    move-result-object v7

    .line 728
    check-cast p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;

    .line 729
    iget-object p0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    invoke-virtual {p0, p4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->d(I)Z

    move-result p0

    .line 730
    iget-object v3, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    if-eqz p0, :cond_4

    .line 731
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 732
    :try_start_0
    new-instance v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/i;
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v4, "OkHttp %s Push Headers[%s]"

    :try_start_1
    iget-object p0, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->d:Ljava/lang/String;

    .line 733
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object v5

    move v8, v6

    move v6, p4

    invoke-direct/range {v2 .. v8}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/i;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;Ljava/lang/String;[Ljava/lang/Object;ILjava/util/List;Z)V

    move-object p0, v3

    monitor-enter p0
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0

    .line 734
    :try_start_2
    iget-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->g:Z

    if-nez p1, :cond_3

    .line 735
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->i:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object p1, v0

    goto :goto_2

    :cond_3
    :goto_1
    :try_start_3
    monitor-exit p0

    return-void

    :goto_2
    monitor-exit p0

    throw p1
    :try_end_3
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_3 .. :try_end_3} :catch_0

    :catch_0
    return-void

    :cond_4
    move-object p0, v3

    move v3, p4

    .line 736
    monitor-enter p0

    .line 737
    :try_start_4
    iget-object p2, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    monitor-enter p2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 738
    :try_start_5
    iget-object p3, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->c:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-interface {p3, p4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :try_start_6
    monitor-exit p2

    if-nez p3, :cond_8

    .line 739
    iget-object p2, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 740
    iget-boolean p3, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->g:Z

    if-eqz p3, :cond_5

    .line 741
    monitor-exit p0

    return-void

    :catchall_1
    move-exception v0

    move-object p1, v0

    goto :goto_3

    .line 742
    :cond_5
    iget p3, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->e:I

    if-gt v3, p3, :cond_6

    monitor-exit p0

    return-void

    .line 743
    :cond_6
    rem-int/lit8 p4, v3, 0x2

    iget p2, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->f:I

    rem-int/lit8 p2, p2, 0x2

    if-ne p4, p2, :cond_7

    monitor-exit p0

    return-void

    .line 744
    :cond_7
    invoke-static {v7}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->b(Ljava/util/List;)Lcom/tencent/cloud/ai/network/okhttp3/o;

    move-result-object v7

    .line 745
    new-instance v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    iget-object v4, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    const/4 v5, 0x0

    invoke-direct/range {v2 .. v7}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;-><init>(ILcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;ZZLcom/tencent/cloud/ai/network/okhttp3/o;)V

    .line 746
    iget-object p2, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    iput v3, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->e:I

    .line 747
    iget-object p2, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->c:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-interface {p2, p3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 748
    sget-object p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->y:Ljava/util/concurrent/ExecutorService;

    .line 749
    new-instance p3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/l;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    const-string p4, "OkHttp %s stream %d"

    :try_start_7
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->d:Ljava/lang/String;

    .line 750
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p3, p1, p4, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/l;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;Ljava/lang/String;[Ljava/lang/Object;Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;)V

    .line 751
    invoke-interface {p2, p3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 752
    monitor-exit p0

    return-void

    .line 753
    :cond_8
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 754
    invoke-static {v7}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->b(Ljava/util/List;)Lcom/tencent/cloud/ai/network/okhttp3/o;

    move-result-object p0

    invoke-virtual {p3, p0, v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->a(Lcom/tencent/cloud/ai/network/okhttp3/o;Z)V

    return-void

    :catchall_2
    move-exception v0

    move-object p1, v0

    :try_start_8
    monitor-exit p2

    throw p1

    .line 755
    :goto_3
    monitor-exit p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    throw p1

    .line 756
    :cond_9
    new-array p0, v0, [Ljava/lang/Object;

    const-string p1, "PROTOCOL_ERROR: TYPE_HEADERS streamId == 0"

    invoke-static {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    const/4 p0, 0x0

    throw p0
.end method

.method public final a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;II)V
    .locals 4

    const/4 v0, 0x0

    const/16 v1, 0x8

    if-lt p2, v1, :cond_6

    const/4 v2, 0x0

    if-nez p3, :cond_5

    .line 801
    iget-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    invoke-interface {p3}, Lcom/tencent/cloud/ai/network/okio/g;->readInt()I

    move-result p3

    .line 802
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    invoke-interface {v3}, Lcom/tencent/cloud/ai/network/okio/g;->readInt()I

    move-result v3

    sub-int/2addr p2, v1

    .line 803
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->a(I)Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 804
    sget-object v0, Lcom/tencent/cloud/ai/network/okio/ByteString;->EMPTY:Lcom/tencent/cloud/ai/network/okio/ByteString;

    if-lez p2, :cond_0

    .line 805
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    int-to-long v0, p2

    invoke-interface {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/g;->a(J)Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object v0

    .line 806
    :cond_0
    check-cast p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;

    .line 807
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 808
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    .line 809
    iget-object p0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    monitor-enter p0

    .line 810
    :try_start_0
    iget-object p2, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    iget-object p2, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->c:Ljava/util/Map;

    invoke-interface {p2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p2

    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->c:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    new-array v0, v0, [Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    invoke-interface {p2, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 811
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;Z)Z

    .line 812
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 813
    array-length p0, p2

    :goto_0
    if-ge v2, p0, :cond_3

    aget-object v0, p2, v2

    .line 814
    iget v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->c:I

    if-le v1, p3, :cond_2

    .line 815
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->d()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 816
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->f:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    monitor-enter v0

    .line 817
    :try_start_1
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    if-nez v3, :cond_1

    .line 818
    iput-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 819
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_2

    :cond_1
    :goto_1
    monitor-exit v0

    .line 820
    iget-object v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 821
    iget v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->c:I

    .line 822
    invoke-virtual {v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->e(I)Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    goto :goto_3

    :goto_2
    monitor-exit v0

    throw p0

    :cond_2
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return-void

    :catchall_1
    move-exception p1

    .line 823
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p1

    .line 824
    :cond_4
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "TYPE_GOAWAY unexpected error code: %d"

    invoke-static {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    throw v0

    .line 825
    :cond_5
    new-array p0, v2, [Ljava/lang/Object;

    const-string p1, "TYPE_GOAWAY streamId != 0"

    invoke-static {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    throw v0

    .line 826
    :cond_6
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "TYPE_GOAWAY length < 8: %s"

    invoke-static {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    throw v0
.end method

.method public a(ZLcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;)Z
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :try_start_0
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 7
    .line 8
    const-wide/16 v4, 0x9

    .line 9
    .line 10
    invoke-interface {v3, v4, v5}, Lcom/tencent/cloud/ai/network/okio/g;->f(J)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_1

    .line 11
    .line 12
    .line 13
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 14
    .line 15
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a(Lcom/tencent/cloud/ai/network/okio/g;)I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    const/4 v4, 0x0

    .line 20
    if-ltz v3, :cond_27

    .line 21
    .line 22
    const/16 v5, 0x4000

    .line 23
    .line 24
    if-gt v3, v5, :cond_27

    .line 25
    .line 26
    iget-object v6, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 27
    .line 28
    invoke-interface {v6}, Lcom/tencent/cloud/ai/network/okio/g;->readByte()B

    .line 29
    .line 30
    .line 31
    move-result v6

    .line 32
    and-int/lit16 v6, v6, 0xff

    .line 33
    .line 34
    int-to-byte v6, v6

    .line 35
    const/4 v7, 0x4

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    if-ne v6, v7, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-static {v6}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "Expected a SETTINGS frame but was %s"

    .line 50
    .line 51
    invoke-static {v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 52
    .line 53
    .line 54
    throw v4

    .line 55
    :cond_1
    :goto_0
    iget-object v8, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 56
    .line 57
    invoke-interface {v8}, Lcom/tencent/cloud/ai/network/okio/g;->readByte()B

    .line 58
    .line 59
    .line 60
    move-result v8

    .line 61
    and-int/lit16 v8, v8, 0xff

    .line 62
    .line 63
    int-to-byte v8, v8

    .line 64
    iget-object v9, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 65
    .line 66
    invoke-interface {v9}, Lcom/tencent/cloud/ai/network/okio/g;->readInt()I

    .line 67
    .line 68
    .line 69
    move-result v9

    .line 70
    const v10, 0x7fffffff

    .line 71
    .line 72
    .line 73
    and-int v15, v9, v10

    .line 74
    .line 75
    sget-object v9, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->e:Ljava/util/logging/Logger;

    .line 76
    .line 77
    sget-object v10, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 78
    .line 79
    invoke-virtual {v9, v10}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    .line 80
    .line 81
    .line 82
    move-result v10

    .line 83
    const/4 v11, 0x1

    .line 84
    if-eqz v10, :cond_2

    .line 85
    .line 86
    invoke-static {v11, v15, v3, v6, v8}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->a(ZIIBB)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v10

    .line 90
    invoke-virtual {v9, v10}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_2
    const/4 v9, 0x5

    .line 94
    packed-switch v6, :pswitch_data_0

    .line 95
    .line 96
    .line 97
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 98
    .line 99
    int-to-long v1, v3

    .line 100
    invoke-interface {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okio/g;->d(J)V

    .line 101
    .line 102
    .line 103
    :catch_0
    :goto_1
    move v3, v11

    .line 104
    goto/16 :goto_10

    .line 105
    .line 106
    :pswitch_0
    invoke-virtual {v0, v1, v3, v15}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->c(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;II)V

    .line 107
    .line 108
    .line 109
    goto :goto_1

    .line 110
    :pswitch_1
    invoke-virtual {v0, v1, v3, v15}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;II)V

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :pswitch_2
    invoke-virtual {v0, v1, v3, v8, v15}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->b(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;IBI)V

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :pswitch_3
    invoke-virtual {v0, v1, v3, v8, v15}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->c(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;IBI)V

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :pswitch_4
    if-nez v15, :cond_f

    .line 123
    .line 124
    and-int/lit8 v6, v8, 0x1

    .line 125
    .line 126
    if-eqz v6, :cond_4

    .line 127
    .line 128
    if-nez v3, :cond_3

    .line 129
    .line 130
    move-object v0, v1

    .line 131
    check-cast v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;

    .line 132
    .line 133
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 134
    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_3
    new-array v0, v2, [Ljava/lang/Object;

    .line 138
    .line 139
    const-string v1, "FRAME_SIZE_ERROR ack frame should be empty!"

    .line 140
    .line 141
    invoke-static {v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 142
    .line 143
    .line 144
    throw v4

    .line 145
    :cond_4
    rem-int/lit8 v6, v3, 0x6

    .line 146
    .line 147
    if-nez v6, :cond_e

    .line 148
    .line 149
    new-instance v6, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;

    .line 150
    .line 151
    invoke-direct {v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;-><init>()V

    .line 152
    .line 153
    .line 154
    move v8, v2

    .line 155
    :goto_2
    if-ge v8, v3, :cond_d

    .line 156
    .line 157
    iget-object v10, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 158
    .line 159
    invoke-interface {v10}, Lcom/tencent/cloud/ai/network/okio/g;->readShort()S

    .line 160
    .line 161
    .line 162
    move-result v10

    .line 163
    const v12, 0xffff

    .line 164
    .line 165
    .line 166
    and-int/2addr v10, v12

    .line 167
    iget-object v12, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 168
    .line 169
    invoke-interface {v12}, Lcom/tencent/cloud/ai/network/okio/g;->readInt()I

    .line 170
    .line 171
    .line 172
    move-result v12

    .line 173
    const/4 v13, 0x2

    .line 174
    if-eq v10, v13, :cond_a

    .line 175
    .line 176
    const/4 v13, 0x3

    .line 177
    if-eq v10, v13, :cond_9

    .line 178
    .line 179
    if-eq v10, v7, :cond_7

    .line 180
    .line 181
    if-eq v10, v9, :cond_5

    .line 182
    .line 183
    goto :goto_3

    .line 184
    :cond_5
    if-lt v12, v5, :cond_6

    .line 185
    .line 186
    const v13, 0xffffff

    .line 187
    .line 188
    .line 189
    if-gt v12, v13, :cond_6

    .line 190
    .line 191
    goto :goto_3

    .line 192
    :cond_6
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    const-string v1, "PROTOCOL_ERROR SETTINGS_MAX_FRAME_SIZE: %s"

    .line 201
    .line 202
    invoke-static {v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 203
    .line 204
    .line 205
    throw v4

    .line 206
    :cond_7
    if-ltz v12, :cond_8

    .line 207
    .line 208
    const/4 v10, 0x7

    .line 209
    goto :goto_3

    .line 210
    :cond_8
    new-array v0, v2, [Ljava/lang/Object;

    .line 211
    .line 212
    const-string v1, "PROTOCOL_ERROR SETTINGS_INITIAL_WINDOW_SIZE > 2^31 - 1"

    .line 213
    .line 214
    invoke-static {v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 215
    .line 216
    .line 217
    throw v4

    .line 218
    :cond_9
    move v10, v7

    .line 219
    goto :goto_3

    .line 220
    :cond_a
    if-eqz v12, :cond_c

    .line 221
    .line 222
    if-ne v12, v11, :cond_b

    .line 223
    .line 224
    goto :goto_3

    .line 225
    :cond_b
    new-array v0, v2, [Ljava/lang/Object;

    .line 226
    .line 227
    const-string v1, "PROTOCOL_ERROR SETTINGS_ENABLE_PUSH != 0 or 1"

    .line 228
    .line 229
    invoke-static {v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 230
    .line 231
    .line 232
    throw v4

    .line 233
    :cond_c
    :goto_3
    invoke-virtual {v6, v10, v12}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;->a(II)Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;

    .line 234
    .line 235
    .line 236
    add-int/lit8 v8, v8, 0x6

    .line 237
    .line 238
    goto :goto_2

    .line 239
    :cond_d
    move-object v13, v1

    .line 240
    check-cast v13, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;

    .line 241
    .line 242
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 243
    .line 244
    .line 245
    :try_start_1
    iget-object v0, v13, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 246
    .line 247
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->h:Ljava/util/concurrent/ScheduledExecutorService;

    .line 248
    .line 249
    new-instance v12, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/m;
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0

    .line 250
    .line 251
    const-string v14, "OkHttp %s ACK Settings"

    .line 252
    .line 253
    :try_start_2
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->d:Ljava/lang/String;

    .line 254
    .line 255
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object v15

    .line 259
    const/16 v16, 0x0

    .line 260
    .line 261
    move-object/from16 v17, v6

    .line 262
    .line 263
    invoke-direct/range {v12 .. v17}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/m;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;Ljava/lang/String;[Ljava/lang/Object;ZLcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;)V

    .line 264
    .line 265
    .line 266
    invoke-interface {v1, v12}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_2
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_2 .. :try_end_2} :catch_0

    .line 267
    .line 268
    .line 269
    goto/16 :goto_1

    .line 270
    .line 271
    :cond_e
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    const-string v1, "TYPE_SETTINGS length %% 6 != 0: %s"

    .line 280
    .line 281
    invoke-static {v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 282
    .line 283
    .line 284
    throw v4

    .line 285
    :cond_f
    new-array v0, v2, [Ljava/lang/Object;

    .line 286
    .line 287
    const-string v1, "TYPE_SETTINGS streamId != 0"

    .line 288
    .line 289
    invoke-static {v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 290
    .line 291
    .line 292
    throw v4

    .line 293
    :pswitch_5
    invoke-virtual {v0, v1, v3, v15}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->b(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;II)V

    .line 294
    .line 295
    .line 296
    goto/16 :goto_1

    .line 297
    .line 298
    :pswitch_6
    if-ne v3, v9, :cond_11

    .line 299
    .line 300
    if-eqz v15, :cond_10

    .line 301
    .line 302
    invoke-virtual {v0, v1, v15}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;I)V

    .line 303
    .line 304
    .line 305
    goto/16 :goto_1

    .line 306
    .line 307
    :cond_10
    new-array v0, v2, [Ljava/lang/Object;

    .line 308
    .line 309
    const-string v1, "TYPE_PRIORITY streamId == 0"

    .line 310
    .line 311
    invoke-static {v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 312
    .line 313
    .line 314
    throw v4

    .line 315
    :cond_11
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    const-string v1, "TYPE_PRIORITY length: %d != 5"

    .line 324
    .line 325
    invoke-static {v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 326
    .line 327
    .line 328
    throw v4

    .line 329
    :pswitch_7
    invoke-virtual {v0, v1, v3, v8, v15}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;IBI)V

    .line 330
    .line 331
    .line 332
    goto/16 :goto_1

    .line 333
    .line 334
    :pswitch_8
    if-eqz v15, :cond_26

    .line 335
    .line 336
    and-int/lit8 v5, v8, 0x1

    .line 337
    .line 338
    if-eqz v5, :cond_12

    .line 339
    .line 340
    move/from16 v18, v11

    .line 341
    .line 342
    goto :goto_4

    .line 343
    :cond_12
    move/from16 v18, v2

    .line 344
    .line 345
    :goto_4
    and-int/lit8 v5, v8, 0x20

    .line 346
    .line 347
    if-nez v5, :cond_25

    .line 348
    .line 349
    and-int/lit8 v4, v8, 0x8

    .line 350
    .line 351
    if-eqz v4, :cond_13

    .line 352
    .line 353
    iget-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 354
    .line 355
    invoke-interface {v4}, Lcom/tencent/cloud/ai/network/okio/g;->readByte()B

    .line 356
    .line 357
    .line 358
    move-result v4

    .line 359
    and-int/lit16 v4, v4, 0xff

    .line 360
    .line 361
    int-to-short v4, v4

    .line 362
    goto :goto_5

    .line 363
    :cond_13
    move v4, v2

    .line 364
    :goto_5
    invoke-static {v3, v8, v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a(IBS)I

    .line 365
    .line 366
    .line 367
    move-result v3

    .line 368
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 369
    .line 370
    check-cast v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;

    .line 371
    .line 372
    iget-object v6, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 373
    .line 374
    invoke-virtual {v6, v15}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->d(I)Z

    .line 375
    .line 376
    .line 377
    move-result v6

    .line 378
    iget-object v12, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 379
    .line 380
    if-eqz v6, :cond_16

    .line 381
    .line 382
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 383
    .line 384
    .line 385
    new-instance v1, Lcom/tencent/cloud/ai/network/okio/e;

    .line 386
    .line 387
    invoke-direct {v1}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 388
    .line 389
    .line 390
    int-to-long v6, v3

    .line 391
    invoke-interface {v5, v6, v7}, Lcom/tencent/cloud/ai/network/okio/g;->f(J)V

    .line 392
    .line 393
    .line 394
    invoke-interface {v5, v1, v6, v7}, Lcom/tencent/cloud/ai/network/okio/w;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    .line 395
    .line 396
    .line 397
    iget-wide v8, v1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 398
    .line 399
    cmp-long v2, v8, v6

    .line 400
    .line 401
    if-nez v2, :cond_15

    .line 402
    .line 403
    move v2, v11

    .line 404
    new-instance v11, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/j;

    .line 405
    .line 406
    iget-object v5, v12, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->d:Ljava/lang/String;

    .line 407
    .line 408
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 409
    .line 410
    .line 411
    move-result-object v6

    .line 412
    filled-new-array {v5, v6}, [Ljava/lang/Object;

    .line 413
    .line 414
    .line 415
    move-result-object v14

    .line 416
    const-string v13, "OkHttp %s Push Data[%s]"

    .line 417
    .line 418
    move-object/from16 v16, v1

    .line 419
    .line 420
    move/from16 v17, v3

    .line 421
    .line 422
    move v3, v2

    .line 423
    invoke-direct/range {v11 .. v18}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/j;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;Ljava/lang/String;[Ljava/lang/Object;ILcom/tencent/cloud/ai/network/okio/e;IZ)V

    .line 424
    .line 425
    .line 426
    monitor-enter v12

    .line 427
    :try_start_3
    iget-boolean v1, v12, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->g:Z

    .line 428
    .line 429
    if-nez v1, :cond_14

    .line 430
    .line 431
    iget-object v1, v12, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->i:Ljava/util/concurrent/ExecutorService;

    .line 432
    .line 433
    invoke-interface {v1, v11}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 434
    .line 435
    .line 436
    goto :goto_6

    .line 437
    :catchall_0
    move-exception v0

    .line 438
    goto :goto_7

    .line 439
    :cond_14
    :goto_6
    monitor-exit v12

    .line 440
    goto/16 :goto_f

    .line 441
    .line 442
    :goto_7
    monitor-exit v12

    .line 443
    throw v0

    .line 444
    :cond_15
    move-object v0, v1

    .line 445
    move v6, v3

    .line 446
    new-instance v1, Ljava/io/IOException;

    .line 447
    .line 448
    iget-wide v2, v0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 449
    .line 450
    new-instance v0, Ljava/lang/StringBuilder;

    .line 451
    .line 452
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 453
    .line 454
    .line 455
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 456
    .line 457
    .line 458
    const-string v2, " != "

    .line 459
    .line 460
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 461
    .line 462
    .line 463
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 464
    .line 465
    .line 466
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 467
    .line 468
    .line 469
    move-result-object v0

    .line 470
    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 471
    .line 472
    .line 473
    throw v1

    .line 474
    :cond_16
    move v6, v3

    .line 475
    move v3, v11

    .line 476
    monitor-enter v12

    .line 477
    :try_start_4
    iget-object v7, v12, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->c:Ljava/util/Map;

    .line 478
    .line 479
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 480
    .line 481
    .line 482
    move-result-object v8

    .line 483
    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 484
    .line 485
    .line 486
    move-result-object v7

    .line 487
    check-cast v7, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 488
    .line 489
    monitor-exit v12

    .line 490
    if-nez v7, :cond_17

    .line 491
    .line 492
    iget-object v2, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 493
    .line 494
    sget-object v7, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 495
    .line 496
    invoke-virtual {v2, v15, v7}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->a(ILcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;)V

    .line 497
    .line 498
    .line 499
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 500
    .line 501
    int-to-long v6, v6

    .line 502
    invoke-virtual {v1, v6, v7}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->h(J)V

    .line 503
    .line 504
    .line 505
    invoke-interface {v5, v6, v7}, Lcom/tencent/cloud/ai/network/okio/g;->d(J)V

    .line 506
    .line 507
    .line 508
    goto/16 :goto_f

    .line 509
    .line 510
    :cond_17
    sget-boolean v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->m:Z

    .line 511
    .line 512
    if-nez v1, :cond_19

    .line 513
    .line 514
    invoke-static {v7}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    .line 515
    .line 516
    .line 517
    move-result v1

    .line 518
    if-nez v1, :cond_18

    .line 519
    .line 520
    goto :goto_8

    .line 521
    :cond_18
    invoke-static {}, Ll/aqg0;->a()V

    .line 522
    .line 523
    .line 524
    return v2

    .line 525
    :cond_19
    :goto_8
    iget-object v1, v7, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;

    .line 526
    .line 527
    int-to-long v8, v6

    .line 528
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 529
    .line 530
    .line 531
    sget-boolean v6, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->h:Z

    .line 532
    .line 533
    if-nez v6, :cond_1b

    .line 534
    .line 535
    iget-object v6, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 536
    .line 537
    invoke-static {v6}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    .line 538
    .line 539
    .line 540
    move-result v6

    .line 541
    if-nez v6, :cond_1a

    .line 542
    .line 543
    goto :goto_9

    .line 544
    :cond_1a
    invoke-static {}, Ll/aqg0;->a()V

    .line 545
    .line 546
    .line 547
    return v2

    .line 548
    :cond_1b
    :goto_9
    const-wide/16 v10, 0x0

    .line 549
    .line 550
    cmp-long v6, v8, v10

    .line 551
    .line 552
    if-lez v6, :cond_23

    .line 553
    .line 554
    iget-object v6, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 555
    .line 556
    monitor-enter v6

    .line 557
    :try_start_5
    iget-boolean v12, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->f:Z

    .line 558
    .line 559
    iget-object v13, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->b:Lcom/tencent/cloud/ai/network/okio/e;

    .line 560
    .line 561
    iget-wide v13, v13, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 562
    .line 563
    add-long/2addr v13, v8

    .line 564
    move-wide/from16 p1, v10

    .line 565
    .line 566
    iget-wide v10, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->c:J

    .line 567
    .line 568
    cmp-long v10, v13, v10

    .line 569
    .line 570
    if-lez v10, :cond_1c

    .line 571
    .line 572
    move v11, v3

    .line 573
    goto :goto_a

    .line 574
    :cond_1c
    move v11, v2

    .line 575
    :goto_a
    monitor-exit v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 576
    if-eqz v11, :cond_1d

    .line 577
    .line 578
    invoke-interface {v5, v8, v9}, Lcom/tencent/cloud/ai/network/okio/g;->d(J)V

    .line 579
    .line 580
    .line 581
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 582
    .line 583
    sget-object v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 584
    .line 585
    invoke-virtual {v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;)V

    .line 586
    .line 587
    .line 588
    goto :goto_e

    .line 589
    :cond_1d
    if-eqz v12, :cond_1e

    .line 590
    .line 591
    invoke-interface {v5, v8, v9}, Lcom/tencent/cloud/ai/network/okio/g;->d(J)V

    .line 592
    .line 593
    .line 594
    goto :goto_e

    .line 595
    :cond_1e
    iget-object v6, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 596
    .line 597
    invoke-interface {v5, v6, v8, v9}, Lcom/tencent/cloud/ai/network/okio/w;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    .line 598
    .line 599
    .line 600
    move-result-wide v10

    .line 601
    const-wide/16 v12, -0x1

    .line 602
    .line 603
    cmp-long v6, v10, v12

    .line 604
    .line 605
    if-eqz v6, :cond_22

    .line 606
    .line 607
    sub-long/2addr v8, v10

    .line 608
    iget-object v6, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 609
    .line 610
    monitor-enter v6

    .line 611
    :try_start_6
    iget-boolean v10, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->e:Z

    .line 612
    .line 613
    if-eqz v10, :cond_1f

    .line 614
    .line 615
    iget-object v10, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 616
    .line 617
    iget-wide v11, v10, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 618
    .line 619
    invoke-virtual {v10}, Lcom/tencent/cloud/ai/network/okio/e;->k()V

    .line 620
    .line 621
    .line 622
    goto :goto_c

    .line 623
    :catchall_1
    move-exception v0

    .line 624
    goto :goto_d

    .line 625
    :cond_1f
    iget-object v10, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->b:Lcom/tencent/cloud/ai/network/okio/e;

    .line 626
    .line 627
    iget-wide v11, v10, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 628
    .line 629
    cmp-long v11, v11, p1

    .line 630
    .line 631
    if-nez v11, :cond_20

    .line 632
    .line 633
    move v11, v3

    .line 634
    goto :goto_b

    .line 635
    :cond_20
    move v11, v2

    .line 636
    :goto_b
    iget-object v12, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 637
    .line 638
    invoke-virtual {v10, v12}, Lcom/tencent/cloud/ai/network/okio/e;->a(Lcom/tencent/cloud/ai/network/okio/w;)J

    .line 639
    .line 640
    .line 641
    if-eqz v11, :cond_21

    .line 642
    .line 643
    iget-object v10, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 644
    .line 645
    invoke-virtual {v10}, Ljava/lang/Object;->notifyAll()V

    .line 646
    .line 647
    .line 648
    :cond_21
    move-wide/from16 v11, p1

    .line 649
    .line 650
    :goto_c
    monitor-exit v6
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 651
    cmp-long v6, v11, p1

    .line 652
    .line 653
    if-lez v6, :cond_1b

    .line 654
    .line 655
    invoke-virtual {v1, v11, v12}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->h(J)V

    .line 656
    .line 657
    .line 658
    goto :goto_9

    .line 659
    :goto_d
    :try_start_7
    monitor-exit v6
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 660
    throw v0

    .line 661
    :cond_22
    invoke-static {}, Ll/vg3;->a()V

    .line 662
    .line 663
    .line 664
    return v2

    .line 665
    :catchall_2
    move-exception v0

    .line 666
    :try_start_8
    monitor-exit v6
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 667
    throw v0

    .line 668
    :cond_23
    :goto_e
    if-eqz v18, :cond_24

    .line 669
    .line 670
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->b:Lcom/tencent/cloud/ai/network/okhttp3/o;

    .line 671
    .line 672
    invoke-virtual {v7, v1, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->a(Lcom/tencent/cloud/ai/network/okhttp3/o;Z)V

    .line 673
    .line 674
    .line 675
    :cond_24
    :goto_f
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 676
    .line 677
    int-to-long v1, v4

    .line 678
    invoke-interface {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okio/g;->d(J)V

    .line 679
    .line 680
    .line 681
    :goto_10
    return v3

    .line 682
    :catchall_3
    move-exception v0

    .line 683
    monitor-exit v12

    .line 684
    throw v0

    .line 685
    :cond_25
    new-array v0, v2, [Ljava/lang/Object;

    .line 686
    .line 687
    const-string v1, "PROTOCOL_ERROR: FLAG_COMPRESSED without SETTINGS_COMPRESS_DATA"

    .line 688
    .line 689
    invoke-static {v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 690
    .line 691
    .line 692
    throw v4

    .line 693
    :cond_26
    new-array v0, v2, [Ljava/lang/Object;

    .line 694
    .line 695
    const-string v1, "PROTOCOL_ERROR: TYPE_DATA streamId == 0"

    .line 696
    .line 697
    invoke-static {v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 698
    .line 699
    .line 700
    throw v4

    .line 701
    :cond_27
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 702
    .line 703
    .line 704
    move-result-object v0

    .line 705
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 706
    .line 707
    .line 708
    move-result-object v0

    .line 709
    const-string v1, "FRAME_SIZE_ERROR: %s"

    .line 710
    .line 711
    invoke-static {v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 712
    .line 713
    .line 714
    throw v4

    .line 715
    :catch_1
    return v2

    .line 716
    nop

    .line 717
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final b(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;IBI)V
    .locals 3

    const/16 v0, 0x8

    const/4 v1, 0x0

    if-ne p2, v0, :cond_6

    const/4 p2, 0x0

    if-nez p4, :cond_5

    .line 147
    iget-object p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    invoke-interface {p4}, Lcom/tencent/cloud/ai/network/okio/g;->readInt()I

    move-result p4

    .line 148
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/g;->readInt()I

    move-result p0

    const/4 v0, 0x1

    and-int/2addr p3, v0

    if-eqz p3, :cond_0

    move p2, v0

    .line 149
    :cond_0
    check-cast p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;

    .line 150
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 151
    iget-object p3, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    if-eqz p2, :cond_4

    .line 152
    monitor-enter p3

    const-wide/16 v1, 0x1

    if-ne p4, v0, :cond_1

    .line 153
    :try_start_0
    iget-object p0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 154
    iget-wide p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->l:J

    add-long/2addr p1, v1

    iput-wide p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->l:J

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_1
    const/4 p0, 0x2

    if-ne p4, p0, :cond_2

    .line 155
    iget-object p0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 156
    iget-wide p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->n:J

    add-long/2addr p1, v1

    iput-wide p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->n:J

    goto :goto_0

    :cond_2
    const/4 p0, 0x3

    if-ne p4, p0, :cond_3

    .line 157
    iget-object p0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 158
    iget-wide p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->o:J

    add-long/2addr p1, v1

    iput-wide p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->o:J

    .line 159
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 160
    :cond_3
    :goto_0
    monitor-exit p3

    return-void

    :goto_1
    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 161
    :cond_4
    :try_start_1
    iget-object p1, p3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->h:Ljava/util/concurrent/ScheduledExecutorService;

    .line 162
    new-instance p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$f;

    invoke-direct {p2, p3, v0, p4, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$f;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;ZII)V

    invoke-interface {p1, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    return-void

    .line 163
    :cond_5
    new-array p0, p2, [Ljava/lang/Object;

    const-string p1, "TYPE_PING streamId != 0"

    invoke-static {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    throw v1

    .line 164
    :cond_6
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "TYPE_PING length != 8: %s"

    invoke-static {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    throw v1
.end method

.method public final b(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;II)V
    .locals 8

    .line 1
    const/4 v0, 0x4

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p2, v0, :cond_6

    .line 4
    .line 5
    if-eqz p3, :cond_5

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 8
    .line 9
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/g;->readInt()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->a(I)Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 14
    .line 15
    .line 16
    move-result-object v7

    .line 17
    if-eqz v7, :cond_4

    .line 18
    .line 19
    check-cast p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;

    .line 20
    .line 21
    iget-object p0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 22
    .line 23
    invoke-virtual {p0, p3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->d(I)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    iget-object v3, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    new-instance v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/k;

    .line 32
    .line 33
    iget-object p0, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->d:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    const-string v4, "OkHttp %s Push Reset[%s]"

    .line 44
    .line 45
    move v6, p3

    .line 46
    invoke-direct/range {v2 .. v7}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/k;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;Ljava/lang/String;[Ljava/lang/Object;ILcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;)V

    .line 47
    .line 48
    .line 49
    monitor-enter v3

    .line 50
    :try_start_0
    iget-boolean p0, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->g:Z

    .line 51
    .line 52
    if-nez p0, :cond_0

    .line 53
    .line 54
    iget-object p0, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->i:Ljava/util/concurrent/ExecutorService;

    .line 55
    .line 56
    invoke-interface {p0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :catchall_0
    move-exception v0

    .line 61
    move-object p0, v0

    .line 62
    goto :goto_1

    .line 63
    :cond_0
    :goto_0
    monitor-exit v3

    .line 64
    return-void

    .line 65
    :goto_1
    monitor-exit v3

    .line 66
    throw p0

    .line 67
    :cond_1
    move v6, p3

    .line 68
    monitor-enter v3

    .line 69
    :try_start_1
    iget-object p0, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->c:Ljava/util/Map;

    .line 70
    .line 71
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    check-cast p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 80
    .line 81
    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 82
    .line 83
    .line 84
    monitor-exit v3

    .line 85
    if-eqz p0, :cond_3

    .line 86
    .line 87
    monitor-enter p0

    .line 88
    :try_start_2
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 89
    .line 90
    if-nez p1, :cond_2

    .line 91
    .line 92
    iput-object v7, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 93
    .line 94
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 95
    .line 96
    .line 97
    goto :goto_2

    .line 98
    :catchall_1
    move-exception v0

    .line 99
    move-object p1, v0

    .line 100
    goto :goto_3

    .line 101
    :cond_2
    :goto_2
    monitor-exit p0

    .line 102
    return-void

    .line 103
    :goto_3
    monitor-exit p0

    .line 104
    throw p1

    .line 105
    :cond_3
    return-void

    .line 106
    :catchall_2
    move-exception v0

    .line 107
    move-object p0, v0

    .line 108
    monitor-exit v3

    .line 109
    throw p0

    .line 110
    :cond_4
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    const-string p1, "TYPE_RST_STREAM unexpected error code: %d"

    .line 119
    .line 120
    invoke-static {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 121
    .line 122
    .line 123
    throw v1

    .line 124
    :cond_5
    const/4 p0, 0x0

    .line 125
    new-array p0, p0, [Ljava/lang/Object;

    .line 126
    .line 127
    const-string p1, "TYPE_RST_STREAM streamId == 0"

    .line 128
    .line 129
    invoke-static {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 130
    .line 131
    .line 132
    throw v1

    .line 133
    :cond_6
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    const-string p1, "TYPE_RST_STREAM length: %d != 4"

    .line 142
    .line 143
    invoke-static {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 144
    .line 145
    .line 146
    throw v1
.end method

.method public final c(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;IBI)V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p4, :cond_3

    .line 3
    .line 4
    and-int/lit8 v1, p3, 0x8

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 9
    .line 10
    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/g;->readByte()B

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    and-int/lit16 v0, v0, 0xff

    .line 15
    .line 16
    int-to-short v0, v0

    .line 17
    :cond_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 18
    .line 19
    invoke-interface {v1}, Lcom/tencent/cloud/ai/network/okio/g;->readInt()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const v2, 0x7fffffff

    .line 24
    .line 25
    .line 26
    and-int v7, v1, v2

    .line 27
    .line 28
    add-int/lit8 p2, p2, -0x4

    .line 29
    .line 30
    invoke-static {p2, p3, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a(IBS)I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    invoke-virtual {p0, p2, v0, p3, p4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a(ISBI)Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v8

    .line 38
    check-cast p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;

    .line 39
    .line 40
    iget-object v4, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 41
    .line 42
    monitor-enter v4

    .line 43
    :try_start_0
    iget-object p0, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->x:Ljava/util/Set;

    .line 44
    .line 45
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_1

    .line 54
    .line 55
    sget-object p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 56
    .line 57
    invoke-virtual {v4, v7, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->a(ILcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;)V

    .line 58
    .line 59
    .line 60
    monitor-exit v4

    .line 61
    return-void

    .line 62
    :catchall_0
    move-exception v0

    .line 63
    move-object p0, v0

    .line 64
    goto :goto_2

    .line 65
    :cond_1
    iget-object p0, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->x:Ljava/util/Set;

    .line 66
    .line 67
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    :try_start_1
    new-instance v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/h;
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0

    .line 76
    .line 77
    const-string v5, "OkHttp %s Push Request[%s]"

    .line 78
    .line 79
    :try_start_2
    iget-object p0, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->d:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    invoke-direct/range {v3 .. v8}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/h;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;Ljava/lang/String;[Ljava/lang/Object;ILjava/util/List;)V

    .line 90
    .line 91
    .line 92
    monitor-enter v4
    :try_end_2
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_2 .. :try_end_2} :catch_0

    .line 93
    :try_start_3
    iget-boolean p0, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->g:Z

    .line 94
    .line 95
    if-nez p0, :cond_2

    .line 96
    .line 97
    iget-object p0, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->i:Ljava/util/concurrent/ExecutorService;

    .line 98
    .line 99
    invoke-interface {p0, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :catchall_1
    move-exception v0

    .line 104
    move-object p0, v0

    .line 105
    goto :goto_1

    .line 106
    :cond_2
    :goto_0
    :try_start_4
    monitor-exit v4

    .line 107
    return-void

    .line 108
    :goto_1
    monitor-exit v4

    .line 109
    throw p0
    :try_end_4
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_4 .. :try_end_4} :catch_0

    .line 110
    :catch_0
    return-void

    .line 111
    :goto_2
    :try_start_5
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 112
    throw p0

    .line 113
    :cond_3
    new-array p0, v0, [Ljava/lang/Object;

    .line 114
    .line 115
    const-string p1, "PROTOCOL_ERROR: TYPE_PUSH_PROMISE streamId == 0"

    .line 116
    .line 117
    invoke-static {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 118
    .line 119
    .line 120
    const/4 p0, 0x0

    .line 121
    throw p0
.end method

.method public final c(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p$b;II)V
    .locals 6

    const/4 v0, 0x4

    const/4 v1, 0x0

    if-ne p2, v0, :cond_4

    .line 122
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/g;->readInt()I

    move-result p0

    int-to-long v2, p0

    const-wide/32 v4, 0x7fffffff

    and-long/2addr v2, v4

    const-wide/16 v4, 0x0

    cmp-long p0, v2, v4

    if-eqz p0, :cond_3

    .line 123
    check-cast p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;

    if-nez p3, :cond_0

    .line 124
    iget-object p2, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    monitor-enter p2

    .line 125
    :try_start_0
    iget-object p0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->r:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->r:J

    .line 126
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 127
    monitor-exit p2

    return-void

    :catchall_0
    move-exception p0

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 128
    :cond_0
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    monitor-enter p1

    .line 129
    :try_start_1
    iget-object p2, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->c:Ljava/util/Map;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-interface {p2, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    monitor-exit p1

    if-eqz p2, :cond_2

    .line 130
    monitor-enter p2

    .line 131
    :try_start_2
    iget-wide v0, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->b:J

    add-long/2addr v0, v2

    iput-wide v0, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->b:J

    if-lez p0, :cond_1

    .line 132
    invoke-virtual {p2}, Ljava/lang/Object;->notifyAll()V

    goto :goto_0

    :catchall_1
    move-exception p0

    goto :goto_1

    .line 133
    :cond_1
    :goto_0
    monitor-exit p2

    return-void

    :goto_1
    monitor-exit p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p0

    :cond_2
    return-void

    :catchall_2
    move-exception p0

    monitor-exit p1

    throw p0

    .line 134
    :cond_3
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "windowSizeIncrement was 0"

    invoke-static {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    throw v1

    .line 135
    :cond_4
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "TYPE_WINDOW_UPDATE length !=4: %s"

    invoke-static {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/e;->b(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    throw v1
.end method

.method public close()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/p;->a:Lcom/tencent/cloud/ai/network/okio/g;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/w;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
