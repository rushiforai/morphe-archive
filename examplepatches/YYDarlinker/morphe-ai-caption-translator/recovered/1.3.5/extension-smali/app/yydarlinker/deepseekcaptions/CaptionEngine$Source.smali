.class final Lapp/yydarlinker/deepseekcaptions/CaptionEngine$Source;
.super Ljava/lang/Object;
.source "CaptionEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/CaptionEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Source"
.end annotation


# instance fields
.field final body:[B

.field final contentType:Ljava/lang/String;

.field final document:Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;

.field final sourceUrl:Ljava/lang/String;


# direct methods
.method constructor <init>([BLjava/lang/String;Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;)V
    .registers 5

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEngine$Source;->body:[B

    .line 79
    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEngine$Source;->contentType:Ljava/lang/String;

    .line 80
    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEngine$Source;->sourceUrl:Ljava/lang/String;

    .line 81
    iput-object p4, p0, Lapp/yydarlinker/deepseekcaptions/CaptionEngine$Source;->document:Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;

    return-void
.end method
