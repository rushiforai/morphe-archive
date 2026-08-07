.class public Lcom/hihonor/push/sdk/common/data/ApiException;
.super Ljava/lang/Exception;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/hihonor/push/sdk/common/data/ApiException;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public errorCode:I

.field public message:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/hihonor/push/sdk/common/data/ApiException$1;

    invoke-direct {v0}, Lcom/hihonor/push/sdk/common/data/ApiException$1;-><init>()V

    sput-object v0, Lcom/hihonor/push/sdk/common/data/ApiException;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/hihonor/push/sdk/common/data/ApiException;->initData(ILjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    invoke-direct {p0, p1, p2}, Lcom/hihonor/push/sdk/common/data/ApiException;->initData(ILjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/hihonor/push/sdk/common/data/ApiException;->errorCode:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/hihonor/push/sdk/common/data/ApiException;->message:Ljava/lang/String;

    return-void
.end method

.method private initData(ILjava/lang/String;)V
    .locals 0

    iput p1, p0, Lcom/hihonor/push/sdk/common/data/ApiException;->errorCode:I

    iput-object p2, p0, Lcom/hihonor/push/sdk/common/data/ApiException;->message:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getErrorCode()I
    .locals 0

    iget p0, p0, Lcom/hihonor/push/sdk/common/data/ApiException;->errorCode:I

    return p0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/hihonor/push/sdk/common/data/ApiException;->message:Ljava/lang/String;

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    iget p2, p0, Lcom/hihonor/push/sdk/common/data/ApiException;->errorCode:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-object p0, p0, Lcom/hihonor/push/sdk/common/data/ApiException;->message:Ljava/lang/String;

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
