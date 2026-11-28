.class final Lcom/google/common/io/CharStreams$NullWriter;
.super Ljava/io/Writer;
.source "CharStreams.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/CharStreams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NullWriter"
.end annotation


# static fields
.field private static final INSTANCE:Lcom/google/common/io/CharStreams$NullWriter;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 301
    new-instance v0, Lcom/google/common/io/CharStreams$NullWriter;

    invoke-direct {v0}, Lcom/google/common/io/CharStreams$NullWriter;-><init>()V

    sput-object v0, Lcom/google/common/io/CharStreams$NullWriter;->INSTANCE:Lcom/google/common/io/CharStreams$NullWriter;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 299
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lcom/google/common/io/CharStreams$NullWriter;
    .registers 1

    .line 299
    sget-object v0, Lcom/google/common/io/CharStreams$NullWriter;->INSTANCE:Lcom/google/common/io/CharStreams$NullWriter;

    return-object v0
.end method


# virtual methods
.method public append(C)Ljava/io/Writer;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "c"
        }
    .end annotation

    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;)Ljava/io/Writer;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "csq"
        }
    .end annotation

    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;II)Ljava/io/Writer;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "csq",
            "start",
            "end"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x4

    goto :goto_0

    .line 333
    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    :goto_0
    invoke-static {p2, p3, p1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    return-object p0
.end method

.method public bridge synthetic append(C)Ljava/lang/Appendable;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "c"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 299
    invoke-virtual {p0, p1}, Lcom/google/common/io/CharStreams$NullWriter;->append(C)Ljava/io/Writer;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "csq"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 299
    invoke-virtual {p0, p1}, Lcom/google/common/io/CharStreams$NullWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x1000
        }
        names = {
            "csq",
            "start",
            "end"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 299
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/io/CharStreams$NullWriter;->append(Ljava/lang/CharSequence;II)Ljava/io/Writer;

    move-result-object p0

    return-object p0
.end method

.method public close()V
    .registers 1

    return-void
.end method

.method public flush()V
    .registers 1

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 350
    const-string p0, "CharStreams.nullWriter()"

    return-object p0
.end method

.method public write(I)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "c"
        }
    .end annotation

    return-void
.end method

.method public write(Ljava/lang/String;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "str"
        }
    .end annotation

    .line 318
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public write(Ljava/lang/String;II)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "str",
            "off",
            "len"
        }
    .end annotation

    add-int/2addr p3, p2

    .line 323
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    invoke-static {p2, p3, p0}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    return-void
.end method

.method public write([C)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "cbuf"
        }
    .end annotation

    .line 308
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public write([CII)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "cbuf",
            "off",
            "len"
        }
    .end annotation

    add-int/2addr p3, p2

    .line 313
    array-length p0, p1

    invoke-static {p2, p3, p0}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    return-void
.end method
