.class public Lcom/momo/xeengine/cv/bean/XEHandInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public gestures:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XEGestureInfo;",
            ">;"
        }
    .end annotation
.end field

.field public landmarks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XEJointInfo;",
            ">;"
        }
    .end annotation
.end field

.field public params3D:[F


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
.method public getGestures()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XEGestureInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEHandInfo;->gestures:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLandmarks()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XEJointInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEHandInfo;->landmarks:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getParams3D()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEHandInfo;->params3D:[F

    .line 2
    .line 3
    return-object p0
.end method
