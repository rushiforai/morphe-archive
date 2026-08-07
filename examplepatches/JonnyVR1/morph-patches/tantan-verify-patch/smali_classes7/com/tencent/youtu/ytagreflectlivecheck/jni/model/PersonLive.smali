.class public Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLive;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public app_id:Ljava/lang/String;

.field public client_version:Ljava/lang/String;

.field public color_data:Ljava/lang/String;

.field public frames:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/FaceFrame;",
            ">;"
        }
    .end annotation
.end field

.field public platform:I

.field public reflect_data:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

.field public select_data:Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$SeleceData;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLive;->app_id:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getColor_data()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLive;->color_data:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFrames()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/FaceFrame;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLive;->frames:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPlatform()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLive;->platform:I

    .line 2
    .line 3
    return p0
.end method

.method public getReflect_data()Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLive;->reflect_data:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 2
    .line 3
    return-object p0
.end method

.method public setColor_data(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLive;->color_data:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setFrames(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/FaceFrame;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLive;->frames:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-void
.end method

.method public setPlatform(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLive;->platform:I

    .line 2
    .line 3
    return-void
.end method

.method public setReflect_data(Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLive;->reflect_data:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 2
    .line 3
    return-void
.end method
