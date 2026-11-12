.class public final Lij;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln37;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lij;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:Lij;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lij;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lij;->a:Lij;

    new-instance v0, Ln2;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ln2;-><init>(B)V

    sput-object v0, Lij;->CREATOR:Landroid/os/Parcelable$Creator;

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
