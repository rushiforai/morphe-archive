.class final Lcom/google/common/io/ByteSource$EmptyByteSource;
.super Lcom/google/common/io/ByteSource$ByteArrayByteSource;
.source "ByteSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/ByteSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "EmptyByteSource"
.end annotation


# static fields
.field static final INSTANCE:Lcom/google/common/io/ByteSource$EmptyByteSource;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 650
    new-instance v0, Lcom/google/common/io/ByteSource$EmptyByteSource;

    invoke-direct {v0}, Lcom/google/common/io/ByteSource$EmptyByteSource;-><init>()V

    sput-object v0, Lcom/google/common/io/ByteSource$EmptyByteSource;->INSTANCE:Lcom/google/common/io/ByteSource$EmptyByteSource;

    return-void
.end method

.method constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    .line 653
    new-array v0, v0, [B

    invoke-direct {p0, v0}, Lcom/google/common/io/ByteSource$ByteArrayByteSource;-><init>([B)V

    return-void
.end method


# virtual methods
.method public asCharSource(Ljava/nio/charset/Charset;)Lcom/google/common/io/CharSource;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "charset"
        }
    .end annotation

    .line 658
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 659
    invoke-static {}, Lcom/google/common/io/CharSource;->empty()Lcom/google/common/io/CharSource;

    move-result-object p0

    return-object p0
.end method

.method public read()[B
    .registers 1

    .line 664
    iget-object p0, p0, Lcom/google/common/io/ByteSource$EmptyByteSource;->bytes:[B

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 669
    const-string p0, "ByteSource.empty()"

    return-object p0
.end method
