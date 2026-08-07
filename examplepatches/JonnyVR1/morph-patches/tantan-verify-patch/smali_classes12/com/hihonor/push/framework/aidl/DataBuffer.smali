.class public Lcom/hihonor/push/framework/aidl/DataBuffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/hihonor/push/framework/aidl/DataBuffer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public body:Landroid/os/Bundle;

.field public eventType:Ljava/lang/String;

.field public header:Landroid/os/Bundle;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/hihonor/push/framework/aidl/DataBuffer$1;

    invoke-direct {v0}, Lcom/hihonor/push/framework/aidl/DataBuffer$1;-><init>()V

    sput-object v0, Lcom/hihonor/push/framework/aidl/DataBuffer;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/hihonor/push/framework/aidl/DataBuffer;->eventType:Ljava/lang/String;

    const-class v0, Landroid/os/Bundle;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;

    move-result-object v1

    iput-object v1, p0, Lcom/hihonor/push/framework/aidl/DataBuffer;->header:Landroid/os/Bundle;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;

    move-result-object p1

    iput-object p1, p0, Lcom/hihonor/push/framework/aidl/DataBuffer;->body:Landroid/os/Bundle;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hihonor/push/framework/aidl/DataBuffer;->eventType:Ljava/lang/String;

    iput-object p2, p0, Lcom/hihonor/push/framework/aidl/DataBuffer;->header:Landroid/os/Bundle;

    iput-object p3, p0, Lcom/hihonor/push/framework/aidl/DataBuffer;->body:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getBody()Landroid/os/Bundle;
    .locals 0

    iget-object p0, p0, Lcom/hihonor/push/framework/aidl/DataBuffer;->body:Landroid/os/Bundle;

    return-object p0
.end method

.method public getEventType()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/hihonor/push/framework/aidl/DataBuffer;->eventType:Ljava/lang/String;

    return-object p0
.end method

.method public getHeader()Landroid/os/Bundle;
    .locals 0

    iget-object p0, p0, Lcom/hihonor/push/framework/aidl/DataBuffer;->header:Landroid/os/Bundle;

    return-object p0
.end method

.method public setBody(Landroid/os/Bundle;)V
    .locals 0

    iput-object p1, p0, Lcom/hihonor/push/framework/aidl/DataBuffer;->body:Landroid/os/Bundle;

    return-void
.end method

.method public setEventType(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/hihonor/push/framework/aidl/DataBuffer;->eventType:Ljava/lang/String;

    return-void
.end method

.method public setHeader(Landroid/os/Bundle;)V
    .locals 0

    iput-object p1, p0, Lcom/hihonor/push/framework/aidl/DataBuffer;->header:Landroid/os/Bundle;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    iget-object p2, p0, Lcom/hihonor/push/framework/aidl/DataBuffer;->eventType:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/hihonor/push/framework/aidl/DataBuffer;->header:Landroid/os/Bundle;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    iget-object p0, p0, Lcom/hihonor/push/framework/aidl/DataBuffer;->body:Landroid/os/Bundle;

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    return-void
.end method
