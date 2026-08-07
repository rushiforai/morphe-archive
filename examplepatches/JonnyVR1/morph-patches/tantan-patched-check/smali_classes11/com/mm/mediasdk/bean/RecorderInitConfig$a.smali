.class Lcom/mm/mediasdk/bean/RecorderInitConfig$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mm/mediasdk/bean/RecorderInitConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/mm/mediasdk/bean/RecorderInitConfig;",
        ">;"
    }
.end annotation


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
.method public a(Landroid/os/Parcel;)Lcom/mm/mediasdk/bean/RecorderInitConfig;
    .locals 0

    .line 1
    new-instance p0, Lcom/mm/mediasdk/bean/RecorderInitConfig;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/mm/mediasdk/bean/RecorderInitConfig;-><init>(Landroid/os/Parcel;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public b(I)[Lcom/mm/mediasdk/bean/RecorderInitConfig;
    .locals 0

    .line 1
    new-array p0, p1, [Lcom/mm/mediasdk/bean/RecorderInitConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/mm/mediasdk/bean/RecorderInitConfig$a;->a(Landroid/os/Parcel;)Lcom/mm/mediasdk/bean/RecorderInitConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/mm/mediasdk/bean/RecorderInitConfig$a;->b(I)[Lcom/mm/mediasdk/bean/RecorderInitConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
