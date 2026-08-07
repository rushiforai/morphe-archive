.class public final Lcom/hihonor/push/sdk/common/data/ApiException$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hihonor/push/sdk/common/data/ApiException;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/hihonor/push/sdk/common/data/ApiException;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/hihonor/push/sdk/common/data/ApiException;
    .locals 0

    .line 1
    new-instance p0, Lcom/hihonor/push/sdk/common/data/ApiException;

    invoke-direct {p0, p1}, Lcom/hihonor/push/sdk/common/data/ApiException;-><init>(Landroid/os/Parcel;)V

    return-object p0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 2
    invoke-virtual {p0, p1}, Lcom/hihonor/push/sdk/common/data/ApiException$1;->createFromParcel(Landroid/os/Parcel;)Lcom/hihonor/push/sdk/common/data/ApiException;

    move-result-object p0

    return-object p0
.end method

.method public newArray(I)[Lcom/hihonor/push/sdk/common/data/ApiException;
    .locals 0

    .line 2
    new-array p0, p1, [Lcom/hihonor/push/sdk/common/data/ApiException;

    return-object p0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/hihonor/push/sdk/common/data/ApiException$1;->newArray(I)[Lcom/hihonor/push/sdk/common/data/ApiException;

    move-result-object p0

    return-object p0
.end method
