.class public Lcom/ss/bytertc/engine/InternalVideoSourceConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/InternalVideoSourceConfig$VideoContentCategory;,
        Lcom/ss/bytertc/engine/InternalVideoSourceConfig$VideoSourceType;
    }
.end annotation


# instance fields
.field private source_category:I

.field private source_type:I


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/InternalVideoSourceConfig$VideoSourceType;Lcom/ss/bytertc/engine/InternalVideoSourceConfig$VideoContentCategory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/InternalVideoSourceConfig$VideoSourceType;->getValue()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/ss/bytertc/engine/InternalVideoSourceConfig;->source_type:I

    .line 9
    .line 10
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/InternalVideoSourceConfig$VideoContentCategory;->getValue()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput p1, p0, Lcom/ss/bytertc/engine/InternalVideoSourceConfig;->source_category:I

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getVideoSourceCategory()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalVideoSourceConfig;->source_category:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideoSourceType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalVideoSourceConfig;->source_type:I

    .line 2
    .line 3
    return p0
.end method
