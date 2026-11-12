.class public final Ljt1;
.super Ljlj;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Ljt1;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final h:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ln2;

    const/16 v1, 0x11

    invoke-direct {v0, v1}, Ln2;-><init>(B)V

    sput-object v0, Ljt1;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 11

    new-instance v0, Lrxh;

    const v1, 0x7f1401b4

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    new-instance v3, Lvql;

    const/4 v1, 0x1

    invoke-direct {v3, v0, v1}, Lvql;-><init>(Lpxh;Z)V

    new-instance v4, Lwwd;

    new-instance v0, Lrxh;

    const v1, 0x7f1401b7

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    new-instance v1, Lsxh;

    const v2, 0x7f1401b3

    invoke-direct {v1, v2, v0}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    const/4 v0, 0x2

    invoke-direct {v4, v1, v0}, Lwwd;-><init>(Lpxh;I)V

    new-instance v5, Lrxh;

    const v0, 0x7f1401b5

    invoke-direct {v5, v0}, Lrxh;-><init>(I)V

    new-instance v7, Llxh;

    invoke-direct {v7, p1}, Llxh;-><init>(I)V

    const/16 v8, 0x18

    const/4 v6, 0x0

    move-object v2, p0

    invoke-direct/range {v2 .. v8}, Ljlj;-><init>(Lvql;Lwwd;Lrxh;Lrxh;Llxh;I)V

    iput p1, v2, Ljt1;->h:I

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

    iget p0, p0, Ljt1;->h:I

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
