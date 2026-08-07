.class public Lcom/momo/xeengine/cv/bean/CVObjectInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private bounds:[F

.field private score:F

.field private type:Ljava/lang/String;


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
.method public getBounds()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->bounds:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getScore()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->score:F

    .line 2
    .line 3
    return p0
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setBounds([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->bounds:[F

    .line 2
    .line 3
    return-void
.end method

.method public setScore(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->score:F

    .line 2
    .line 3
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/CVObjectInfo;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
