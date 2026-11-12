.class public final Lvz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lvz8;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Landroid/view/autofill/AutofillId;

.field public final b:Lx09;

.field public final c:Lnf2;

.field public final d:Lp09;

.field public final e:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Luz8;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Luz8;-><init>(B)V

    sput-object v0, Lvz8;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/view/autofill/AutofillId;Lx09;Lnf2;Lp09;Z)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvz8;->a:Landroid/view/autofill/AutofillId;

    iput-object p2, p0, Lvz8;->b:Lx09;

    iput-object p3, p0, Lvz8;->c:Lnf2;

    iput-object p4, p0, Lvz8;->d:Lp09;

    iput-boolean p5, p0, Lvz8;->e:Z

    return-void
.end method


# virtual methods
.method public final describeContents()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lvz8;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lvz8;

    iget-object v1, p0, Lvz8;->a:Landroid/view/autofill/AutofillId;

    iget-object v3, p1, Lvz8;->a:Landroid/view/autofill/AutofillId;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lvz8;->b:Lx09;

    iget-object v3, p1, Lvz8;->b:Lx09;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Lvz8;->c:Lnf2;

    iget-object v3, p1, Lvz8;->c:Lnf2;

    if-eq v1, v3, :cond_29

    return v2

    :cond_29
    iget-object v1, p0, Lvz8;->d:Lp09;

    iget-object v3, p1, Lvz8;->d:Lp09;

    if-eq v1, v3, :cond_30

    return v2

    :cond_30
    iget-boolean p0, p0, Lvz8;->e:Z

    iget-boolean p1, p1, Lvz8;->e:Z

    if-eq p0, p1, :cond_37

    return v2

    :cond_37
    return v0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lvz8;->a:Landroid/view/autofill/AutofillId;

    invoke-virtual {v0}, Landroid/view/autofill/AutofillId;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lvz8;->b:Lx09;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lvz8;->c:Lnf2;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lvz8;->d:Lp09;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-boolean p0, p0, Lvz8;->e:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 4

    iget-object v0, p0, Lvz8;->a:Landroid/view/autofill/AutofillId;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object v0, p0, Lvz8;->b:Lx09;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object v0, p0, Lvz8;->c:Lnf2;

    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lvz8;->d:Lp09;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-boolean p0, p0, Lvz8;->e:Z

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
