.class final Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;
.super Ljava/lang/Object;
.source "RebuildProtocol.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/RebuildProtocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Event"
.end annotation


# instance fields
.field final end:J

.field final from:I

.field final start:J

.field final text:Ljava/lang/String;

.field final to:I


# direct methods
.method constructor <init>(IIJJLjava/lang/String;)V
    .registers 8

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->from:I

    .line 61
    iput p2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->to:I

    .line 62
    iput-wide p3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->start:J

    .line 63
    iput-wide p5, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->end:J

    .line 64
    iput-object p7, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Event;->text:Ljava/lang/String;

    return-void
.end method
