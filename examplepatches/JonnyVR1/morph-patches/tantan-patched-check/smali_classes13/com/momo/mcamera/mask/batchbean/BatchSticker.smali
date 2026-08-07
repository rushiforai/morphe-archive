.class public Lcom/momo/mcamera/mask/batchbean/BatchSticker;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private filename:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "filename"
    .end annotation
.end field

.field private frame:Lcom/momo/mcamera/mask/batchbean/BatchFrame;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "frame"
    .end annotation
.end field

.field private pivot:Lcom/momo/mcamera/mask/batchbean/FramePivot;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "pivot"
    .end annotation
.end field

.field private rotated:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "rotated"
    .end annotation
.end field

.field private sourceSize:Lcom/momo/mcamera/mask/batchbean/SourceSize;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "sourceSize"
    .end annotation
.end field

.field private spriteSourceSize:Lcom/momo/mcamera/mask/batchbean/SpriteSourceSize;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "spriteSourceSize"
    .end annotation
.end field

.field private trimmed:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "trimmed"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getFilename()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/batchbean/BatchSticker;->filename:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFrame()Lcom/momo/mcamera/mask/batchbean/BatchFrame;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/batchbean/BatchSticker;->frame:Lcom/momo/mcamera/mask/batchbean/BatchFrame;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPivot()Lcom/momo/mcamera/mask/batchbean/FramePivot;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/batchbean/BatchSticker;->pivot:Lcom/momo/mcamera/mask/batchbean/FramePivot;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRotated()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/batchbean/BatchSticker;->rotated:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSourceSize()Lcom/momo/mcamera/mask/batchbean/SourceSize;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/batchbean/BatchSticker;->sourceSize:Lcom/momo/mcamera/mask/batchbean/SourceSize;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSpriteSourceSize()Lcom/momo/mcamera/mask/batchbean/SpriteSourceSize;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/batchbean/BatchSticker;->spriteSourceSize:Lcom/momo/mcamera/mask/batchbean/SpriteSourceSize;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTrimmed()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/batchbean/BatchSticker;->trimmed:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public setFilename(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/batchbean/BatchSticker;->filename:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setFrame(Lcom/momo/mcamera/mask/batchbean/BatchFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/batchbean/BatchSticker;->frame:Lcom/momo/mcamera/mask/batchbean/BatchFrame;

    .line 2
    .line 3
    return-void
.end method

.method public setPivot(Lcom/momo/mcamera/mask/batchbean/FramePivot;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/batchbean/BatchSticker;->pivot:Lcom/momo/mcamera/mask/batchbean/FramePivot;

    .line 2
    .line 3
    return-void
.end method

.method public setRotated(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/batchbean/BatchSticker;->rotated:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-void
.end method

.method public setSourceSize(Lcom/momo/mcamera/mask/batchbean/SourceSize;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/batchbean/BatchSticker;->sourceSize:Lcom/momo/mcamera/mask/batchbean/SourceSize;

    .line 2
    .line 3
    return-void
.end method

.method public setSpriteSourceSize(Lcom/momo/mcamera/mask/batchbean/SpriteSourceSize;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/batchbean/BatchSticker;->spriteSourceSize:Lcom/momo/mcamera/mask/batchbean/SpriteSourceSize;

    .line 2
    .line 3
    return-void
.end method

.method public setTrimmed(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/batchbean/BatchSticker;->trimmed:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-void
.end method
