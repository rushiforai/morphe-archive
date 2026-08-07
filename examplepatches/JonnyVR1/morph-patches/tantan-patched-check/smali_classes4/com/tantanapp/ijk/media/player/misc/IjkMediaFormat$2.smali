.class Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$2;
.super Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$Formatter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;


# direct methods
.method public constructor <init>(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$2;->this$0:Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-direct {p0, p1}, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$Formatter;-><init>(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$1;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public doFormat(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$2;->this$0:Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;->mMediaFormat:Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 4
    .line 5
    const-string p1, "codec_name"

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
