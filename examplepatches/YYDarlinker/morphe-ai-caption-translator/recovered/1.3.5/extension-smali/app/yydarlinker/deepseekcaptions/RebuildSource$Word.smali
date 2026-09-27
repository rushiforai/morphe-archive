.class final Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;
.super Ljava/lang/Object;
.source "RebuildSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/RebuildSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Word"
.end annotation


# instance fields
.field final cue:I

.field final end:J

.field final key:Ljava/lang/String;

.field final precision:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

.field final start:J

.field final text:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;JJILapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;)V
    .registers 8

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->text:Ljava/lang/String;

    .line 25
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->key:Ljava/lang/String;

    .line 26
    iput-wide p2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->start:J

    .line 27
    iput-wide p4, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->end:J

    .line 28
    iput p6, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->cue:I

    .line 29
    iput-object p7, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->precision:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    return-void
.end method
