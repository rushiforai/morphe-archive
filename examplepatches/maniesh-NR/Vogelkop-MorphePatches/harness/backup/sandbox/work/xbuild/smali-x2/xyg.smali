.class public final Lxyg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln37;
.implements Lpn9;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lxyg;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Loba;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lzug;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lzug;-><init>(B)V

    sput-object v0, Lxyg;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public synthetic constructor <init>(I)V
    .registers 5

    new-instance p1, Loba;

    const/4 v0, 0x3

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p1, v0, v1, v2}, Loba;-><init>(II[I)V

    invoke-direct {p0, p1}, Lxyg;-><init>(Loba;)V

    return-void
.end method

.method public constructor <init>(Loba;)V
    .registers 2

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lxyg;->a:Loba;

    return-void
.end method


# virtual methods
.method public final a()Loba;
    .registers 1

    iget-object p0, p0, Lxyg;->a:Loba;

    return-object p0
.end method

.method public final describeContents()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 3

    iget-object p0, p0, Lxyg;->a:Loba;

    invoke-virtual {p0, p1, p2}, Loba;->writeToParcel(Landroid/os/Parcel;I)V

    return-void
.end method
