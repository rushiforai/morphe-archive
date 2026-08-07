.class public Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;
.implements Ljava/io/Serializable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private authInfo:Lcom/sina/weibo/sdk/auth/AuthInfo;

.field private callback:Ljava/lang/String;

.field private callbackType:I

.field private specifyTitle:Ljava/lang/String;

.field private type:Lcom/sina/weibo/sdk/web/WebRequestType;

.field private url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->callbackType:I

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->url:Ljava/lang/String;

    .line 12
    .line 13
    const-class v0, Lcom/sina/weibo/sdk/auth/AuthInfo;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/sina/weibo/sdk/auth/AuthInfo;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->authInfo:Lcom/sina/weibo/sdk/auth/AuthInfo;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const/4 v1, -0x1

    .line 32
    if-ne v0, v1, :cond_0

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-static {}, Lcom/sina/weibo/sdk/web/WebRequestType;->values()[Lcom/sina/weibo/sdk/web/WebRequestType;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    aget-object v0, v1, v0

    .line 41
    .line 42
    :goto_0
    iput-object v0, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->type:Lcom/sina/weibo/sdk/web/WebRequestType;

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->callback:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->specifyTitle:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    iput p1, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->callbackType:I

    .line 61
    .line 62
    return-void
.end method

.method public constructor <init>(Lcom/sina/weibo/sdk/auth/AuthInfo;Lcom/sina/weibo/sdk/web/WebRequestType;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p3, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->callback:Ljava/lang/String;

    .line 65
    iput-object p1, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->authInfo:Lcom/sina/weibo/sdk/auth/AuthInfo;

    .line 66
    iput-object p2, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->type:Lcom/sina/weibo/sdk/web/WebRequestType;

    .line 67
    iput-object p5, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->specifyTitle:Ljava/lang/String;

    .line 68
    iput-object p6, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->url:Ljava/lang/String;

    .line 69
    iput p4, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->callbackType:I

    return-void
.end method

.method public constructor <init>(Lcom/sina/weibo/sdk/auth/AuthInfo;Lcom/sina/weibo/sdk/web/WebRequestType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    move-object v6, p5

    .line 70
    invoke-direct/range {v0 .. v6}, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;-><init>(Lcom/sina/weibo/sdk/auth/AuthInfo;Lcom/sina/weibo/sdk/web/WebRequestType;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getAuthInfo()Lcom/sina/weibo/sdk/auth/AuthInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->authInfo:Lcom/sina/weibo/sdk/auth/AuthInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCallback()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->callback:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCallbackType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->callbackType:I

    .line 2
    .line 3
    return p0
.end method

.method public getSpecifyTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->specifyTitle:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()Lcom/sina/weibo/sdk/web/WebRequestType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->type:Lcom/sina/weibo/sdk/web/WebRequestType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->url:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setAuthInfo(Lcom/sina/weibo/sdk/auth/AuthInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->authInfo:Lcom/sina/weibo/sdk/auth/AuthInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setCallback(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->callback:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setCallbackType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->callbackType:I

    .line 2
    .line 3
    return-void
.end method

.method public setSpecifyTitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->specifyTitle:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setType(Lcom/sina/weibo/sdk/web/WebRequestType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->type:Lcom/sina/weibo/sdk/web/WebRequestType;

    .line 2
    .line 3
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->url:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->url:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->authInfo:Lcom/sina/weibo/sdk/auth/AuthInfo;

    .line 7
    .line 8
    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->type:Lcom/sina/weibo/sdk/web/WebRequestType;

    .line 12
    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    const/4 p2, -0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    :goto_0
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 22
    .line 23
    .line 24
    iget-object p2, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->callback:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p2, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->specifyTitle:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget p0, p0, Lcom/sina/weibo/sdk/web/BaseWebViewRequestData;->callbackType:I

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
