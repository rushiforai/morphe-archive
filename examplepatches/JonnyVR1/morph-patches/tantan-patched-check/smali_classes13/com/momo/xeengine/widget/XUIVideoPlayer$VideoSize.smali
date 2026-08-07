.class Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/widget/XUIVideoPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VideoSize"
.end annotation


# instance fields
.field height:I

.field width:I


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

.method public synthetic constructor <init>(Lcom/momo/xeengine/widget/XUIVideoPlayer$1;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;-><init>()V

    return-void
.end method


# virtual methods
.method public set(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;->width:I

    .line 2
    .line 3
    iput p1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;->height:I

    .line 4
    .line 5
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;->width:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "x"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget p0, p0, Lcom/momo/xeengine/widget/XUIVideoPlayer$VideoSize;->height:I

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
