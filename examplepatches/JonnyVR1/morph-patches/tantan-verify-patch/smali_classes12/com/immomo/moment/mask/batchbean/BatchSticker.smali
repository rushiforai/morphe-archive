.class public Lcom/immomo/moment/mask/batchbean/BatchSticker;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private frame:Lcom/immomo/moment/mask/batchbean/BatchFrame;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "frame"
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
.method public getFrame()Lcom/immomo/moment/mask/batchbean/BatchFrame;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mask/batchbean/BatchSticker;->frame:Lcom/immomo/moment/mask/batchbean/BatchFrame;

    .line 2
    .line 3
    return-object p0
.end method

.method public setFrame(Lcom/immomo/moment/mask/batchbean/BatchFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mask/batchbean/BatchSticker;->frame:Lcom/immomo/moment/mask/batchbean/BatchFrame;

    .line 2
    .line 3
    return-void
.end method
