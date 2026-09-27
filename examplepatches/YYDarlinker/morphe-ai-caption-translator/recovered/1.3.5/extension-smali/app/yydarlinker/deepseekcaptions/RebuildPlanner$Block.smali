.class final Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;
.super Ljava/lang/Object;
.source "RebuildPlanner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Block"
.end annotation


# instance fields
.field final continuedAfter:Z

.field final continuedBefore:Z

.field final end:J

.field final from:I

.field final index:I

.field final start:J

.field final to:I


# direct methods
.method constructor <init>(IIILapp/yydarlinker/deepseekcaptions/RebuildSource;)V
    .registers 7

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->index:I

    .line 19
    iput p2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->from:I

    .line 20
    iput p3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->to:I

    .line 21
    iget-object p1, p4, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-wide v0, p1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->start:J

    iput-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->start:J

    .line 22
    iget-object p1, p4, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    iget-wide v0, p1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->end:J

    iput-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->end:J

    const/4 p1, 0x0

    const/4 v0, 0x1

    if-lez p2, :cond_2e

    sub-int/2addr p2, v0

    .line 23
    invoke-static {p4, p2}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->boundary(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)Z

    move-result p2

    if-nez p2, :cond_2e

    move p2, v0

    goto :goto_2f

    :cond_2e
    move p2, p1

    :goto_2f
    iput-boolean p2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->continuedBefore:Z

    add-int/lit8 p2, p3, 0x1

    .line 24
    iget-object v1, p4, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge p2, v1, :cond_42

    invoke-static {p4, p3}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner;->boundary(Lapp/yydarlinker/deepseekcaptions/RebuildSource;I)Z

    move-result p2

    if-nez p2, :cond_42

    move p1, v0

    :cond_42
    iput-boolean p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->continuedAfter:Z

    return-void
.end method


# virtual methods
.method id()Ljava/lang/String;
    .registers 4

    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "b"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->index:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->from:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->to:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
