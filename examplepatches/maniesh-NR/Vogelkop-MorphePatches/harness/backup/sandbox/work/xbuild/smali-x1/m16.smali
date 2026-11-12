.class public final Lm16;
.super Lk2g;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lm16;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final c:[Lvz8;

.field public final d:Lj2g;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lhh3;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lhh3;-><init>(B)V

    sput-object v0, Lm16;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>([Lvz8;Lj2g;)V
    .registers 3

    invoke-direct {p0}, Lk2g;-><init>()V

    iput-object p1, p0, Lm16;->c:[Lvz8;

    iput-object p2, p0, Lm16;->d:Lj2g;

    return-void
.end method


# virtual methods
.method public final a()Lj2g;
    .registers 1

    iget-object p0, p0, Lm16;->d:Lj2g;

    return-object p0
.end method

.method public final b()[Lvz8;
    .registers 1

    iget-object p0, p0, Lm16;->c:[Lvz8;

    return-object p0
.end method

.method public final c(Landroid/content/Context;Lr3g;Landroid/widget/inline/InlinePresentationSpec;Z)Landroid/service/autofill/Dataset;
    .registers 5

    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Not implemented"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final describeContents()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 7

    iget-object v0, p0, Lm16;->c:[Lvz8;

    array-length v1, v0

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v2, 0x0

    :goto_7
    if-eq v2, v1, :cond_11

    aget-object v3, v0, v2

    invoke-virtual {p1, v3, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_11
    iget-object p0, p0, Lm16;->d:Lj2g;

    invoke-virtual {p1, p0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    return-void
.end method
