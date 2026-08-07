.class Lv/VRangeSlider$RangeSliderState;
.super Landroid/view/AbsSavedState;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/VRangeSlider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RangeSliderState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lv/VRangeSlider$RangeSliderState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private minSeparation:F

.field private separationUnit:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lv/VRangeSlider$RangeSliderState$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lv/VRangeSlider$RangeSliderState$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lv/VRangeSlider$RangeSliderState;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 1
    const-class v0, Lv/VRangeSlider$RangeSliderState;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-direct {p0, v0}, Landroid/view/AbsSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Lv/VRangeSlider$RangeSliderState;->minSeparation:F

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iput p1, p0, Lv/VRangeSlider$RangeSliderState;->separationUnit:I

    .line 25
    .line 26
    return-void
.end method

.method public synthetic constructor <init>(Landroid/os/Parcel;Ll/bzk0;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1}, Lv/VRangeSlider$RangeSliderState;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcelable;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1}, Landroid/view/AbsSavedState;-><init>(Landroid/os/Parcelable;)V

    return-void
.end method

.method public static bridge synthetic a(Lv/VRangeSlider$RangeSliderState;)F
    .locals 0

    .line 1
    iget p0, p0, Lv/VRangeSlider$RangeSliderState;->minSeparation:F

    return p0
.end method

.method public static bridge synthetic b(Lv/VRangeSlider$RangeSliderState;)I
    .locals 0

    .line 1
    iget p0, p0, Lv/VRangeSlider$RangeSliderState;->separationUnit:I

    return p0
.end method

.method public static bridge synthetic c(Lv/VRangeSlider$RangeSliderState;F)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VRangeSlider$RangeSliderState;->minSeparation:F

    return-void
.end method

.method public static bridge synthetic d(Lv/VRangeSlider$RangeSliderState;I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VRangeSlider$RangeSliderState;->separationUnit:I

    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/AbsSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 2
    .line 3
    .line 4
    iget p2, p0, Lv/VRangeSlider$RangeSliderState;->minSeparation:F

    .line 5
    .line 6
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 7
    .line 8
    .line 9
    iget p0, p0, Lv/VRangeSlider$RangeSliderState;->separationUnit:I

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
