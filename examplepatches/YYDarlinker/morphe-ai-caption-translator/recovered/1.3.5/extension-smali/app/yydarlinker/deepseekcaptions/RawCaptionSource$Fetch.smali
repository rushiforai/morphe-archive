.class final Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Fetch;
.super Ljava/lang/Object;
.source "RawCaptionSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Fetch"
.end annotation


# instance fields
.field final body:[B

.field final contentType:Ljava/lang/String;


# direct methods
.method constructor <init>([BLjava/lang/String;)V
    .registers 3

    .line 237
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 238
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Fetch;->body:[B

    .line 239
    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Fetch;->contentType:Ljava/lang/String;

    return-void
.end method
