.class Lcom/p1/mobile/putong/account/data/Photo$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/account/data/Photo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/p1/mobile/putong/account/data/Photo;",
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
.method public createFromParcel(Landroid/os/Parcel;)Lcom/p1/mobile/putong/account/data/Photo;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/account/data/Photo;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/data/Photo;-><init>(Landroid/os/Parcel;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/data/Photo$1;->createFromParcel(Landroid/os/Parcel;)Lcom/p1/mobile/putong/account/data/Photo;

    move-result-object p0

    return-object p0
.end method

.method public newArray(I)[Lcom/p1/mobile/putong/account/data/Photo;
    .locals 0

    .line 6
    new-array p0, p1, [Lcom/p1/mobile/putong/account/data/Photo;

    return-object p0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/data/Photo$1;->newArray(I)[Lcom/p1/mobile/putong/account/data/Photo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
