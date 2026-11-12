.class public final Lt4i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr37;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lt4i;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Lk15;

.field public final b:Lq4i;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lzug;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Lzug;-><init>(B)V

    sput-object v0, Lt4i;->CREATOR:Landroid/os/Parcelable$Creator;

    sget-object v0, Lk15;->Companion:Lj15;

    return-void
.end method

.method public constructor <init>(Lk15;Lq4i;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lt4i;->a:Lk15;

    iput-object p2, p0, Lt4i;->b:Lq4i;

    return-void
.end method


# virtual methods
.method public final describeContents()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 4

    iget-object v0, p0, Lt4i;->a:Lk15;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object p0, p0, Lt4i;->b:Lq4i;

    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
