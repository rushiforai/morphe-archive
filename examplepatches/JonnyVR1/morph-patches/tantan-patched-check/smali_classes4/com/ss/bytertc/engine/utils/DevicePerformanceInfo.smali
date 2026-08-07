.class public Lcom/ss/bytertc/engine/utils/DevicePerformanceInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public cpuCores:I

.field public cpuFrequency:F

.field public cpuModel:Ljava/lang/String;

.field public cpuThreads:I

.field public deviceModel:Ljava/lang/String;

.field public gpuModel:Ljava/lang/String;

.field public memory:F

.field public os:Ljava/lang/String;

.field public osVersion:Ljava/lang/String;


# direct methods
.method public constructor <init>(FIIFLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/ss/bytertc/engine/utils/DevicePerformanceInfo;->memory:F

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/utils/DevicePerformanceInfo;->cpuCores:I

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/utils/DevicePerformanceInfo;->cpuThreads:I

    .line 9
    .line 10
    iput p4, p0, Lcom/ss/bytertc/engine/utils/DevicePerformanceInfo;->cpuFrequency:F

    .line 11
    .line 12
    iput-object p5, p0, Lcom/ss/bytertc/engine/utils/DevicePerformanceInfo;->cpuModel:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/ss/bytertc/engine/utils/DevicePerformanceInfo;->gpuModel:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p7, p0, Lcom/ss/bytertc/engine/utils/DevicePerformanceInfo;->os:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p8, p0, Lcom/ss/bytertc/engine/utils/DevicePerformanceInfo;->osVersion:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p9, p0, Lcom/ss/bytertc/engine/utils/DevicePerformanceInfo;->deviceModel:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method

.method private static create(FIIFLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/bytertc/engine/utils/DevicePerformanceInfo;
    .locals 10
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/utils/DevicePerformanceInfo;

    .line 2
    .line 3
    move v1, p0

    .line 4
    move v2, p1

    .line 5
    move v3, p2

    .line 6
    move v4, p3

    .line 7
    move-object v5, p4

    .line 8
    move-object v6, p5

    .line 9
    move-object/from16 v7, p6

    .line 10
    .line 11
    move-object/from16 v8, p7

    .line 12
    .line 13
    move-object/from16 v9, p8

    .line 14
    .line 15
    invoke-direct/range {v0 .. v9}, Lcom/ss/bytertc/engine/utils/DevicePerformanceInfo;-><init>(FIIFLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method
