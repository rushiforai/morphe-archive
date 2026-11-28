.class Lcom/google/common/io/CharSource$CharSequenceCharSource;
.super Lcom/google/common/io/CharSource;
.source "CharSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/CharSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CharSequenceCharSource"
.end annotation


# static fields
.field private static final LINE_SPLITTER:Lcom/google/common/base/Splitter;


# instance fields
.field final seq:Ljava/lang/CharSequence;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 547
    const-string v0, "\r\n|\n|\r"

    invoke-static {v0}, Lcom/google/common/base/Splitter;->onPattern(Ljava/lang/String;)Lcom/google/common/base/Splitter;

    move-result-object v0

    sput-object v0, Lcom/google/common/io/CharSource$CharSequenceCharSource;->LINE_SPLITTER:Lcom/google/common/base/Splitter;

    return-void
.end method

.method constructor <init>(Ljava/lang/CharSequence;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "seq"
        }
    .end annotation

    .line 551
    invoke-direct {p0}, Lcom/google/common/io/CharSource;-><init>()V

    .line 552
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/CharSequence;

    iput-object p1, p0, Lcom/google/common/io/CharSource$CharSequenceCharSource;->seq:Ljava/lang/CharSequence;

    return-void
.end method

.method static synthetic access$100()Lcom/google/common/base/Splitter;
    .registers 1

    .line 545
    sget-object v0, Lcom/google/common/io/CharSource$CharSequenceCharSource;->LINE_SPLITTER:Lcom/google/common/base/Splitter;

    return-object v0
.end method

.method private linesIterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 585
    new-instance v0, Lcom/google/common/io/CharSource$CharSequenceCharSource$1;

    invoke-direct {v0, p0}, Lcom/google/common/io/CharSource$CharSequenceCharSource$1;-><init>(Lcom/google/common/io/CharSource$CharSequenceCharSource;)V

    return-object v0
.end method


# virtual methods
.method public isEmpty()Z
    .registers 1

    .line 567
    iget-object p0, p0, Lcom/google/common/io/CharSource$CharSequenceCharSource;->seq:Ljava/lang/CharSequence;

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public length()J
    .registers 3

    .line 572
    iget-object p0, p0, Lcom/google/common/io/CharSource$CharSequenceCharSource;->seq:Ljava/lang/CharSequence;

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    int-to-long v0, p0

    return-wide v0
.end method

.method public lengthIfKnown()Lcom/google/common/base/Optional;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/base/Optional<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 577
    iget-object p0, p0, Lcom/google/common/io/CharSource$CharSequenceCharSource;->seq:Ljava/lang/CharSequence;

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    int-to-long v0, p0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object p0

    return-object p0
.end method

.method public lines()Ljava/util/stream/Stream;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/stream/Stream<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 606
    invoke-direct {p0}, Lcom/google/common/io/CharSource$CharSequenceCharSource;->linesIterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/collect/Streams;->stream(Ljava/util/Iterator;)Ljava/util/stream/Stream;

    move-result-object p0

    return-object p0
.end method

.method public openStream()Ljava/io/Reader;
    .registers 2

    .line 557
    new-instance v0, Lcom/google/common/io/CharSequenceReader;

    iget-object p0, p0, Lcom/google/common/io/CharSource$CharSequenceCharSource;->seq:Ljava/lang/CharSequence;

    invoke-direct {v0, p0}, Lcom/google/common/io/CharSequenceReader;-><init>(Ljava/lang/CharSequence;)V

    return-object v0
.end method

.method public read()Ljava/lang/String;
    .registers 1

    .line 562
    iget-object p0, p0, Lcom/google/common/io/CharSource$CharSequenceCharSource;->seq:Ljava/lang/CharSequence;

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public readFirstLine()Ljava/lang/String;
    .registers 2

    .line 611
    invoke-direct {p0}, Lcom/google/common/io/CharSource$CharSequenceCharSource;->linesIterator()Ljava/util/Iterator;

    move-result-object p0

    .line 612
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public readLines()Lcom/google/common/collect/ImmutableList;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 617
    invoke-direct {p0}, Lcom/google/common/io/CharSource$CharSequenceCharSource;->linesIterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Iterator;)Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method

.method public readLines(Lcom/google/common/io/LineProcessor;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "processor"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/io/LineProcessor<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 623
    invoke-direct {p0}, Lcom/google/common/io/CharSource$CharSequenceCharSource;->linesIterator()Ljava/util/Iterator;

    move-result-object p0

    .line 624
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 625
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {p1, v0}, Lcom/google/common/io/LineProcessor;->processLine(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 629
    :cond_1
    invoke-interface {p1}, Lcom/google/common/io/LineProcessor;->getResult()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 634
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CharSource.wrap("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/common/io/CharSource$CharSequenceCharSource;->seq:Ljava/lang/CharSequence;

    const/16 v1, 0x1e

    const-string v2, "..."

    invoke-static {p0, v1, v2}, Lcom/google/common/base/Ascii;->truncate(Ljava/lang/CharSequence;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
