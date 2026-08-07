.class final Lcom/jaredrummler/android/processes/models/Cgroup$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jaredrummler/android/processes/models/Cgroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/jaredrummler/android/processes/models/Cgroup;",
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
.method public a(Landroid/os/Parcel;)Lcom/jaredrummler/android/processes/models/Cgroup;
    .locals 1

    .line 1
    new-instance p0, Lcom/jaredrummler/android/processes/models/Cgroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, p1, v0}, Lcom/jaredrummler/android/processes/models/Cgroup;-><init>(Landroid/os/Parcel;Lcom/jaredrummler/android/processes/models/Cgroup$a;)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public b(I)[Lcom/jaredrummler/android/processes/models/Cgroup;
    .locals 0

    .line 1
    new-array p0, p1, [Lcom/jaredrummler/android/processes/models/Cgroup;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/jaredrummler/android/processes/models/Cgroup$a;->a(Landroid/os/Parcel;)Lcom/jaredrummler/android/processes/models/Cgroup;

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
    invoke-virtual {p0, p1}, Lcom/jaredrummler/android/processes/models/Cgroup$a;->b(I)[Lcom/jaredrummler/android/processes/models/Cgroup;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
