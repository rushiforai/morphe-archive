.class public final Lvj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln37;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lvj;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:Lvj;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lvj;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lvj;->a:Lvj;

    new-instance v0, Ln2;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ln2;-><init>(B)V

    sput-object v0, Lvj;->CREATOR:Landroid/os/Parcelable$Creator;

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

    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
