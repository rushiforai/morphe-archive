.class public final La27;
.super Lqkj;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "La27;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final g:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lhh3;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Lhh3;-><init>(B)V

    sput-object v0, La27;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 8

    new-instance v2, Lwwd;

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v0

    new-instance v1, Lsxh;

    const v3, 0x7f140c58

    invoke-direct {v1, v3, v0}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    const/4 v0, 0x2

    invoke-direct {v2, v1, v0}, Lwwd;-><init>(Lpxh;I)V

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

    iput-object p1, v0, La27;->g:Ljava/lang/String;

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

    iget-object p0, p0, La27;->g:Ljava/lang/String;

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
