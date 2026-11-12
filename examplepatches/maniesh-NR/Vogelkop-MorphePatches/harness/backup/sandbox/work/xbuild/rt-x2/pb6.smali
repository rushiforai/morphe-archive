.class public final Lpb6;
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
            "Lpb6;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Z

.field public final b:Loba;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lhh3;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lhh3;-><init>(B)V

    sput-object v0, Lpb6;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 5

    new-instance v0, Loba;

    const/4 v1, 0x3

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Loba;-><init>(II[I)V

    const/4 v1, 0x1

    invoke-direct {p0, v1, v0}, Lpb6;-><init>(ZLoba;)V

    return-void
.end method

.method public constructor <init>(ZLoba;)V
    .registers 3

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-boolean p1, p0, Lpb6;->a:Z

    .line 15
    iput-object p2, p0, Lpb6;->b:Loba;

    return-void
.end method


# virtual methods
.method public final a()Loba;
    .registers 1

    iget-object p0, p0, Lpb6;->b:Loba;

    return-object p0
.end method

.method public final describeContents()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 4

    iget-boolean v0, p0, Lpb6;->a:Z

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-object p0, p0, Lpb6;->b:Loba;

    invoke-virtual {p0, p1, p2}, Loba;->writeToParcel(Landroid/os/Parcel;I)V

    return-void
.end method
