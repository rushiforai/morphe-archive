.class final Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;
.super Ljava/lang/Object;
.source "RebuildSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/RebuildSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Span"
.end annotation


# instance fields
.field final cue:I

.field final end:J

.field final nativeOffset:Z

.field final start:J

.field final text:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;JJIZ)V
    .registers 8

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->text:Ljava/lang/String;

    .line 42
    iput-wide p2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->start:J

    .line 43
    iput-wide p4, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->end:J

    .line 44
    iput p6, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->cue:I

    .line 45
    iput-boolean p7, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Span;->nativeOffset:Z

    return-void
.end method
