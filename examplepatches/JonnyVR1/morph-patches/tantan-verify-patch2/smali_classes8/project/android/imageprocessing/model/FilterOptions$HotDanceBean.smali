.class public Lproject/android/imageprocessing/model/FilterOptions$HotDanceBean;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lproject/android/imageprocessing/model/FilterOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "HotDanceBean"
.end annotation


# instance fields
.field private interval:F

.field private name:Ljava/lang/String;

.field final synthetic this$0:Lproject/android/imageprocessing/model/FilterOptions;


# direct methods
.method public constructor <init>(Lproject/android/imageprocessing/model/FilterOptions;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lproject/android/imageprocessing/model/FilterOptions$HotDanceBean;->this$0:Lproject/android/imageprocessing/model/FilterOptions;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getInterval()F
    .locals 0

    .line 1
    iget p0, p0, Lproject/android/imageprocessing/model/FilterOptions$HotDanceBean;->interval:F

    .line 2
    .line 3
    return p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lproject/android/imageprocessing/model/FilterOptions$HotDanceBean;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setInterval(F)V
    .locals 0

    .line 1
    iput p1, p0, Lproject/android/imageprocessing/model/FilterOptions$HotDanceBean;->interval:F

    .line 2
    .line 3
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lproject/android/imageprocessing/model/FilterOptions$HotDanceBean;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
