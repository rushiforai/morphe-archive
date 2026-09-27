.class final Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;
.super Ljava/lang/Object;
.source "RawCaptionSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LoadedTrack"
.end annotation


# instance fields
.field final body:[B

.field final contentType:Ljava/lang/String;

.field final document:Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;

.field final url:Ljava/lang/String;


# direct methods
.method constructor <init>([BLjava/lang/String;Ljava/lang/String;)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 223
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 224
    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->parse([BLjava/lang/String;)Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;

    move-result-object v0

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;->document:Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;

    .line 225
    invoke-interface {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;->cues()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1a

    .line 227
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;->body:[B

    .line 228
    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;->contentType:Ljava/lang/String;

    .line 229
    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;->url:Ljava/lang/String;

    return-void

    .line 226
    :cond_1a
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    const-string v2, "source_empty"

    const/4 v3, 0x0

    invoke-direct/range {v1 .. v6}, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;-><init>(Ljava/lang/String;ZJLjava/lang/Throwable;)V

    throw v1
.end method
