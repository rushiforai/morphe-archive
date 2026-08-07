.class final Lcom/google/android/libraries/places/api/model/zzav;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .line 1
    new-instance p0, Lcom/google/android/libraries/places/api/model/zzaw;

    .line 2
    .line 3
    const-class v0, Lcom/google/android/libraries/places/api/model/AutocompleteSessionToken;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Landroid/os/ParcelUuid;

    .line 14
    .line 15
    invoke-direct {p0, p1}, Lcom/google/android/libraries/places/api/model/zzaw;-><init>(Landroid/os/ParcelUuid;)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method public final synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 1
    new-array p0, p1, [Lcom/google/android/libraries/places/api/model/zzaw;

    .line 2
    .line 3
    return-object p0
.end method
