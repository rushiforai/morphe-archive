.class public Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLiveReq;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public app_id:Ljava/lang/String;

.field public business_name:Ljava/lang/String;

.field public live_type:I

.field public livedata:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLive;

.field public person_id:Ljava/lang/String;

.field public req_type:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLive;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLiveReq;->app_id:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLiveReq;->business_name:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLiveReq;->person_id:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLiveReq;->livedata:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLive;

    .line 11
    .line 12
    iput p5, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLiveReq;->live_type:I

    .line 13
    .line 14
    iput-object p6, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLiveReq;->req_type:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getApp_id()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLiveReq;->app_id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBusiness_name()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLiveReq;->business_name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLive_type()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLiveReq;->live_type:I

    .line 2
    .line 3
    return p0
.end method

.method public getLivedata()Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLive;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLiveReq;->livedata:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLive;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPerson_id()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLiveReq;->person_id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getReq_type()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLiveReq;->req_type:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setApp_id(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLiveReq;->app_id:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setBusiness_name(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLiveReq;->business_name:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setLive_type(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLiveReq;->live_type:I

    .line 2
    .line 3
    return-void
.end method

.method public setLivedata(Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLive;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLiveReq;->livedata:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLive;

    .line 2
    .line 3
    return-void
.end method

.method public setPerson_id(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLiveReq;->person_id:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setReq_type(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/PersonLiveReq;->req_type:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
