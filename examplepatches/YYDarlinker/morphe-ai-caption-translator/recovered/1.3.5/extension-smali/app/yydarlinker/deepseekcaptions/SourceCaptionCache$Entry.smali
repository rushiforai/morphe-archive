.class final Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$Entry;
.super Ljava/lang/Object;
.source "SourceCaptionCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Entry"
.end annotation


# instance fields
.field final ageMs:J

.field final body:[B

.field final contentType:Ljava/lang/String;


# direct methods
.method constructor <init>([BLjava/lang/String;J)V
    .registers 5

    .line 224
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 225
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$Entry;->body:[B

    .line 226
    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$Entry;->contentType:Ljava/lang/String;

    .line 227
    iput-wide p3, p0, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$Entry;->ageMs:J

    return-void
.end method
