.class public Lcom/momocv/ClientInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public cpu_type_:Ljava/lang/String;

.field public gpu_type_:Ljava/lang/String;

.field public mobile_phone_type_:Ljava/lang/String;

.field public user_id_:Ljava/lang/String;


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
.method public getCpu_type_()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momocv/ClientInfo;->cpu_type_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGpu_type_()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momocv/ClientInfo;->gpu_type_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMobile_phone_type_()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momocv/ClientInfo;->mobile_phone_type_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUser_id_()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momocv/ClientInfo;->user_id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setCpu_type_(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momocv/ClientInfo;->cpu_type_:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setGpu_type_(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momocv/ClientInfo;->gpu_type_:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setMobile_phone_type_(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momocv/ClientInfo;->mobile_phone_type_:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setUser_id_(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momocv/ClientInfo;->user_id_:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
