.class public final Lzba;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Lvba;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final b:Lnrl;

.field public c:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lvba;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lzba;->CREATOR:Lvba;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Lnrl;

    .line 30
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object v0, p0, Lzba;->b:Lnrl;

    const/4 v0, -0x1

    .line 32
    iput v0, p0, Lzba;->c:I

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lzba;->a:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lnrl;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lzba;->b:Lnrl;

    const/4 v0, -0x1

    iput v0, p0, Lzba;->c:I

    sget-object v0, Lxba;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lzba;->a:Ljava/util/ArrayList;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lzba;->c:I

    return-void
.end method


# virtual methods
.method public final a(Lxba;)V
    .registers 6

    iget-object v0, p0, Lzba;->b:Lnrl;

    iget-boolean v1, v0, Lnrl;->a:Z

    if-eqz v1, :cond_7

    return-void

    :cond_7
    :goto_7
    iget v1, p0, Lzba;->c:I

    iget-object v2, p0, Lzba;->a:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-eq v1, v3, :cond_1d

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v2, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_7

    :cond_1d
    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget p1, p0, Lzba;->c:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lzba;->c:I

    invoke-virtual {v0}, Lnrl;->A()V

    return-void
.end method

.method public final describeContents()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 3

    iget-object p2, p0, Lzba;->a:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    iget p0, p0, Lzba;->c:I

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
