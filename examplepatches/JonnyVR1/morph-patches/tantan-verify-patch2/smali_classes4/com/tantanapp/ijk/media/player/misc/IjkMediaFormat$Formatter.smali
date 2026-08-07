.class abstract Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$Formatter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Formatter"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$1;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$Formatter;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract doFormat(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;)Ljava/lang/String;
.end method

.method public format(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$Formatter;->doFormat(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$Formatter;->getDefaultString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    return-object p1
.end method

.method public getDefaultString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "N/A"

    .line 2
    .line 3
    return-object p0
.end method
