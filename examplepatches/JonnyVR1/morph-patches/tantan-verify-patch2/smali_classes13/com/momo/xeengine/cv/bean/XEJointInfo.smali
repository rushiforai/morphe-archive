.class public Lcom/momo/xeengine/cv/bean/XEJointInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public location:[F

.field public location3D:[F

.field public location3DTo2D:[F

.field public score:F


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
.method public getLocation()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEJointInfo;->location:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocation3D()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEJointInfo;->location3D:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocation3DTo2D()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEJointInfo;->location3DTo2D:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getScore()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEJointInfo;->score:F

    .line 2
    .line 3
    return p0
.end method
