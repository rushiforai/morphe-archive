.class public final Lduh;
.super Lqkj;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lduh;",
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

    new-instance v0, Lzug;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lzug;-><init>(B)V

    sput-object v0, Lduh;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 8

    new-instance v1, Lvql;

    new-instance v0, Lrxh;

    const v2, 0x7f141220

    invoke-direct {v0, v2}, Lrxh;-><init>(I)V

    const/4 v2, 0x2

    invoke-direct {v1, v0, v2}, Lvql;-><init>(Lrxh;I)V

    move v0, v2

    new-instance v2, Lwwd;

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v3

    new-instance v4, Lsxh;

    const v5, 0x7f14121f

    invoke-direct {v4, v5, v3}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    invoke-direct {v2, v4, v0}, Lwwd;-><init>(Lpxh;I)V

    new-instance v3, Lrxh;

    const v0, 0x7f140567

    invoke-direct {v3, v0}, Lrxh;-><init>(I)V

    new-instance v4, Lrxh;

    const v0, 0x7f1403bf

    invoke-direct {v4, v0}, Lrxh;-><init>(I)V

    const/16 v5, 0x10

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lqkj;-><init>(Lvql;Lwwd;Lrxh;Lrxh;I)V

    iput-object p1, v0, Lduh;->g:Ljava/lang/String;

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

    iget-object p0, p0, Lduh;->g:Ljava/lang/String;

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
