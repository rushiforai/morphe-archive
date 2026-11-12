.class public final Lk15;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lk15;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final Companion:Lj15;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final d:[Ll4c;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:J

.field public final c:Ll15;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lj15;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lk15;->Companion:Lj15;

    new-instance v0, Lhh3;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lhh3;-><init>(B)V

    sput-object v0, Lk15;->CREATOR:Landroid/os/Parcelable$Creator;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lnd3;

    const/4 v2, 0x6

    invoke-direct {v1, v2}, Lnd3;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    const/4 v1, 0x3

    new-array v1, v1, [Ll4c;

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object v0, v1, v2

    sput-object v1, Lk15;->d:[Ll4c;

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/String;JLl15;)V
    .registers 8

    and-int/lit8 v0, p1, 0x7

    const/4 v1, 0x7

    if-ne v1, v0, :cond_f

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lk15;->a:Ljava/lang/String;

    iput-wide p3, p0, Lk15;->b:J

    iput-object p5, p0, Lk15;->c:Ll15;

    return-void

    :cond_f
    sget-object p0, Li15;->a:Li15;

    invoke-virtual {p0}, Li15;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Ljava/lang/String;JLl15;)V
    .registers 5

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lk15;->a:Ljava/lang/String;

    iput-wide p2, p0, Lk15;->b:J

    iput-object p4, p0, Lk15;->c:Ll15;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 2

    iget-object p0, p0, Lk15;->c:Ll15;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 v0, 0x1

    if-eqz p0, :cond_12

    if-ne p0, v0, :cond_d

    const/4 p0, 0x0

    return p0

    :cond_d
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return p0

    :cond_12
    return v0
.end method

.method public final describeContents()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 9

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lk15;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lk15;

    iget-object v1, p0, Lk15;->a:Ljava/lang/String;

    iget-object v3, p1, Lk15;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-wide v3, p0, Lk15;->b:J

    iget-wide v5, p1, Lk15;->b:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_20

    return v2

    :cond_20
    iget-object p0, p0, Lk15;->c:Ll15;

    iget-object p1, p1, Lk15;->c:Ll15;

    if-eq p0, p1, :cond_27

    return v2

    :cond_27
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Lk15;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-wide v2, p0, Lk15;->b:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-object p0, p0, Lk15;->c:Ll15;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 5

    iget-object p2, p0, Lk15;->a:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-wide v0, p0, Lk15;->b:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    iget-object p0, p0, Lk15;->c:Ll15;

    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
