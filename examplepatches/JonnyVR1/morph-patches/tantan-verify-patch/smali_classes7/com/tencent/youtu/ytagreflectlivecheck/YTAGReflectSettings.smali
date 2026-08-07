.class public Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public isActionReflect:Z

.field public isEncodeReflectData:Z

.field public safetylevel:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;->safetylevel:I

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;->isEncodeReflectData:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;->isActionReflect:Z

    .line 10
    .line 11
    return-void
.end method
