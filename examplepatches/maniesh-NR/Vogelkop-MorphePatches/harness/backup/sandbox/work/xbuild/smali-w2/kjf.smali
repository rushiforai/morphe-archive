.class public final Lkjf;
.super Lg3;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lkjf;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final c:I

.field public final d:I

.field public final e:Z

.field public final f:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Louj;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Louj;-><init>(B)V

    sput-object v0, Lkjf;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Lg3;-><init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lkjf;->c:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lkjf;->d:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p2, v1, :cond_19

    move p2, v1

    goto :goto_1a

    :cond_19
    move p2, v0

    :goto_1a
    iput-boolean p2, p0, Lkjf;->e:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-ne p1, v1, :cond_23

    move v0, v1

    :cond_23
    iput-boolean v0, p0, Lkjf;->f:Z

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/sheet/OperaBottomSheetBehavior;)V
    .registers 3

    sget-object v0, Landroid/view/AbsSavedState;->EMPTY_STATE:Landroid/view/AbsSavedState;

    .line 38
    invoke-direct {p0, v0}, Lg3;-><init>(Landroid/os/Parcelable;)V

    .line 39
    iget v0, p1, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    iput v0, p0, Lkjf;->c:I

    .line 40
    iget v0, p1, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->e:I

    iput v0, p0, Lkjf;->d:I

    .line 41
    iget-boolean v0, p1, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->n:Z

    iput-boolean v0, p0, Lkjf;->e:Z

    .line 42
    iget-boolean p1, p1, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->o:Z

    iput-boolean p1, p0, Lkjf;->f:Z

    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 3

    invoke-super {p0, p1, p2}, Lg3;->writeToParcel(Landroid/os/Parcel;I)V

    iget p2, p0, Lkjf;->c:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lkjf;->d:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-boolean p2, p0, Lkjf;->e:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-boolean p0, p0, Lkjf;->f:Z

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
