.class public Lcom/effectsar/labcv/effectsdk/VideoAS$VideoASInitConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/VideoAS;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VideoASInitConfig"
.end annotation


# instance fields
.field public vasLevel:Lcom/effectsar/labcv/effectsdk/VideoAS$VideoASLevel;

.field public vasMaxHeight:I

.field public vasMaxWidth:I

.field public vasThreadNum:I


# direct methods
.method public constructor <init>(Lcom/effectsar/labcv/effectsdk/VideoAS$VideoASLevel;III)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/VideoAS$VideoASInitConfig;->vasLevel:Lcom/effectsar/labcv/effectsdk/VideoAS$VideoASLevel;

    .line 5
    .line 6
    iput p2, p0, Lcom/effectsar/labcv/effectsdk/VideoAS$VideoASInitConfig;->vasMaxWidth:I

    .line 7
    .line 8
    iput p3, p0, Lcom/effectsar/labcv/effectsdk/VideoAS$VideoASInitConfig;->vasMaxHeight:I

    .line 9
    .line 10
    iput p4, p0, Lcom/effectsar/labcv/effectsdk/VideoAS$VideoASInitConfig;->vasThreadNum:I

    .line 11
    .line 12
    return-void
.end method
