.class public final Lsqh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lsqh;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lcom/opera/android/browser/Referrer$Policy;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lzug;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lzug;-><init>(B)V

    sput-object v0, Lsqh;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lsqh;->a:Ljava/lang/String;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_14

    invoke-static {p1}, Lt8;->O(Landroid/os/Parcel;)Ljava/io/Serializable;

    move-result-object p1

    goto :goto_18

    :cond_14
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object p1

    :goto_18
    check-cast p1, Lcom/opera/android/browser/Referrer$Policy;

    iput-object p1, p0, Lsqh;->b:Lcom/opera/android/browser/Referrer$Policy;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/opera/android/browser/Referrer$Policy;)V
    .registers 3

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lsqh;->a:Ljava/lang/String;

    .line 31
    iput-object p2, p0, Lsqh;->b:Lcom/opera/android/browser/Referrer$Policy;

    return-void
.end method


# virtual methods
.method public final describeContents()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 3

    iget-object p2, p0, Lsqh;->a:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object p0, p0, Lsqh;->b:Lcom/opera/android/browser/Referrer$Policy;

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    return-void
.end method
