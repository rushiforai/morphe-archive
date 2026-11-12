.class public final Lexe;
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
            "Lexe;",
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

    new-instance v0, Lefc;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lefc;-><init>(B)V

    sput-object v0, Lexe;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    const/4 v0, 0x0

    const/4 v1, 0x3

    .line 26
    invoke-direct {p0, v1, v0}, Lexe;-><init>(ILoba;)V

    return-void
.end method

.method public synthetic constructor <init>(ILoba;)V
    .registers 6

    and-int/lit8 v0, p1, 0x1

    const/4 v1, 0x0

    if-eqz v0, :cond_7

    move v0, v1

    goto :goto_8

    :cond_7
    const/4 v0, 0x1

    :goto_8
    and-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_13

    new-instance p2, Loba;

    const/4 p1, 0x3

    const/4 v2, 0x0

    invoke-direct {p2, p1, v1, v2}, Loba;-><init>(II[I)V

    :cond_13
    invoke-direct {p0, v0, p2}, Lexe;-><init>(ZLoba;)V

    return-void
.end method

.method public constructor <init>(ZLoba;)V
    .registers 3

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-boolean p1, p0, Lexe;->a:Z

    .line 25
    iput-object p2, p0, Lexe;->b:Loba;

    return-void
.end method


# virtual methods
.method public final a()Loba;
    .registers 1

    iget-object p0, p0, Lexe;->b:Loba;

    return-object p0
.end method

.method public final describeContents()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 4

    iget-boolean v0, p0, Lexe;->a:Z

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-object p0, p0, Lexe;->b:Loba;

    invoke-virtual {p0, p1, p2}, Loba;->writeToParcel(Landroid/os/Parcel;I)V

    return-void
.end method
