.class public Lcom/core/glcore/cv/MMCVBoxes;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private detectResult:[Lcom/momocv/MMBox;


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
.method public getDetectResult()[Lcom/momocv/MMBox;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/core/glcore/cv/MMCVBoxes;->detectResult:[Lcom/momocv/MMBox;

    .line 2
    .line 3
    return-object p0
.end method

.method public setDetectResult([Lcom/momocv/MMBox;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/core/glcore/cv/MMCVBoxes;->detectResult:[Lcom/momocv/MMBox;

    .line 2
    .line 3
    return-void
.end method
