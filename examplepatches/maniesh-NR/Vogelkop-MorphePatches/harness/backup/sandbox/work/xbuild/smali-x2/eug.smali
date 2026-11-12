.class public final Leug;
.super Lqkj;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Leug;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkuf;

    const/16 v1, 0x1c

    invoke-direct {v0, v1}, Lkuf;-><init>(B)V

    sput-object v0, Leug;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 7

    new-instance v1, Lvql;

    new-instance v0, Lrxh;

    const v2, 0x7f1407ee

    invoke-direct {v0, v2}, Lrxh;-><init>(I)V

    const/4 v2, 0x2

    invoke-direct {v1, v0, v2}, Lvql;-><init>(Lrxh;I)V

    move v0, v2

    new-instance v2, Lwwd;

    new-instance v3, Lrxh;

    const v4, 0x7f1407ed

    invoke-direct {v3, v4}, Lrxh;-><init>(I)V

    invoke-direct {v2, v3, v0}, Lwwd;-><init>(Lpxh;I)V

    new-instance v3, Lrxh;

    const v0, 0x7f140812

    invoke-direct {v3, v0}, Lrxh;-><init>(I)V

    const/4 v4, 0x0

    const/16 v5, 0x18

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
