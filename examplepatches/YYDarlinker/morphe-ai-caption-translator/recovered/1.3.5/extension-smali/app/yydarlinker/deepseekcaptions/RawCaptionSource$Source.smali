.class final Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;
.super Ljava/lang/Object;
.source "RawCaptionSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;
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
.method constructor <init>(Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;)V
    .registers 3

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iget-object v0, p1, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;->body:[B

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;->body:[B

    .line 20
    iget-object v0, p1, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;->contentType:Ljava/lang/String;

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;->contentType:Ljava/lang/String;

    .line 21
    iget-object v0, p1, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;->url:Ljava/lang/String;

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;->sourceUrl:Ljava/lang/String;

    .line 22
    iget-object p1, p1, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;->document:Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;->document:Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;

    return-void
.end method
