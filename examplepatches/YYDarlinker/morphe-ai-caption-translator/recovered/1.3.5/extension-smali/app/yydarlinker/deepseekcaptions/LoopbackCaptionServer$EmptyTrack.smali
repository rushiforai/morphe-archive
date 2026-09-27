.class final Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;
.super Ljava/lang/Object;
.source "LoopbackCaptionServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "EmptyTrack"
.end annotation


# instance fields
.field final body:[B

.field final contentType:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;[B)V
    .registers 3

    .line 480
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 481
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;->contentType:Ljava/lang/String;

    .line 482
    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$EmptyTrack;->body:[B

    return-void
.end method
