.class public final Ls4g;
.super Ljlj;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Ls4g;",
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

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lkuf;-><init>(B)V

    sput-object v0, Ls4g;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 10

    new-instance v0, Lrxh;

    const v1, 0x7f140c5c

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    new-instance v3, Lvql;

    const/4 v1, 0x1

    invoke-direct {v3, v0, v1}, Lvql;-><init>(Lpxh;Z)V

    new-instance v4, Lwwd;

    new-instance v0, Lrxh;

    const v1, 0x7f140c5b

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    const/4 v1, 0x2

    invoke-direct {v4, v0, v1}, Lwwd;-><init>(Lpxh;I)V

    new-instance v5, Lrxh;

    const v0, 0x7f140bea

    invoke-direct {v5, v0}, Lrxh;-><init>(I)V

    new-instance v6, Lrxh;

    const v0, 0x7f140b4b

    invoke-direct {v6, v0}, Lrxh;-><init>(I)V

    new-instance v7, Llxh;

    const v0, 0x7f080637

    invoke-direct {v7, v0}, Llxh;-><init>(I)V

    const/16 v8, 0x10

    move-object v2, p0

    invoke-direct/range {v2 .. v8}, Ljlj;-><init>(Lvql;Lwwd;Lrxh;Lrxh;Llxh;I)V

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
