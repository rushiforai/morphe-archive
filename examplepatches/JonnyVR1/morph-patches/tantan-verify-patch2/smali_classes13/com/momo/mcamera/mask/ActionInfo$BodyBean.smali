.class public Lcom/momo/mcamera/mask/ActionInfo$BodyBean;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/mask/ActionInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BodyBean"
.end annotation


# instance fields
.field private first:I

.field private offsetX:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private offsetY:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private score:F

.field private second:I


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
.method public getFirst()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->first:I

    .line 2
    .line 3
    return p0
.end method

.method public getOffsetX()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->offsetX:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOffsetY()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->offsetY:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScore()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->score:F

    .line 2
    .line 3
    return p0
.end method

.method public getSecond()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/ActionInfo$BodyBean;->second:I

    .line 2
    .line 3
    return p0
.end method
