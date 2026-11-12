.class public final Ltrk;
.super Lb63;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Ltrk;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ll7k;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ll7k;-><init>(B)V

    sput-object v0, Ltrk;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 7

    new-instance v1, Lvql;

    const/4 v0, 0x0

    const/4 v2, 0x3

    invoke-direct {v1, v0, v2}, Lvql;-><init>(Lrxh;I)V

    move v3, v2

    new-instance v2, Lwwd;

    invoke-direct {v2, v0, v3}, Lwwd;-><init>(Lpxh;I)V

    new-instance v3, Lqxh;

    const-string v0, ""

    invoke-direct {v3, v0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    new-instance v4, Lqxh;

    invoke-direct {v4, v0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    const v5, 0x7f15028f

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lb63;-><init>(Lvql;Lwwd;Lpxh;Lpxh;I)V

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
