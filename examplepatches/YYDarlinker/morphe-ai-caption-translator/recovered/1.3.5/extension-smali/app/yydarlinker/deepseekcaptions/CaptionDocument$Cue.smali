.class final Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;
.super Ljava/lang/Object;
.source "CaptionDocument.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/CaptionDocument;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Cue"
.end annotation


# instance fields
.field final endMs:J

.field final startMs:J

.field final text:Ljava/lang/String;


# direct methods
.method constructor <init>(JJLjava/lang/String;)V
    .registers 8

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 41
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    iput-wide p1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->startMs:J

    const-wide/16 v0, 0x1

    add-long/2addr p1, v0

    .line 42
    invoke-static {p1, p2, p3, p4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    iput-wide p1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->endMs:J

    .line 43
    iput-object p5, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->text:Ljava/lang/String;

    return-void
.end method
