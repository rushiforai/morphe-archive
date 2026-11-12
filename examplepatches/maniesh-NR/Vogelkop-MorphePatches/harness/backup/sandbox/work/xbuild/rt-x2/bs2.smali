.class public final Lbs2;
.super Lqkj;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lbs2;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ln2;

    const/16 v1, 0x19

    invoke-direct {v0, v1}, Ln2;-><init>(B)V

    sput-object v0, Lbs2;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 7

    new-instance v2, Lwwd;

    new-instance v0, Lrxh;

    const v1, 0x7f14025b

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    const/4 v1, 0x2

    invoke-direct {v2, v0, v1}, Lwwd;-><init>(Lpxh;I)V

    new-instance v3, Lrxh;

    const v0, 0x7f140567

    invoke-direct {v3, v0}, Lrxh;-><init>(I)V

    new-instance v4, Lrxh;

    const v0, 0x7f1403bf

    invoke-direct {v4, v0}, Lrxh;-><init>(I)V

    const/16 v5, 0x11

    const/4 v1, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lqkj;-><init>(Lvql;Lwwd;Lrxh;Lrxh;I)V

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
