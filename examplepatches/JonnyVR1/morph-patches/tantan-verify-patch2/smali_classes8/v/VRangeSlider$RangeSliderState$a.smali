.class public Lv/VRangeSlider$RangeSliderState$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/VRangeSlider$RangeSliderState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lv/VRangeSlider$RangeSliderState;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Landroid/os/Parcel;)Lv/VRangeSlider$RangeSliderState;
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    new-instance v0, Lv/VRangeSlider$RangeSliderState;

    .line 3
    .line 4
    invoke-direct {v0, p1, p0}, Lv/VRangeSlider$RangeSliderState;-><init>(Landroid/os/Parcel;Ll/bzk0;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    .line 6
    .line 7
    return-object v0

    .line 8
    :catch_0
    return-object p0
.end method

.method public b(I)[Lv/VRangeSlider$RangeSliderState;
    .locals 0

    .line 1
    new-array p0, p1, [Lv/VRangeSlider$RangeSliderState;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/VRangeSlider$RangeSliderState$a;->a(Landroid/os/Parcel;)Lv/VRangeSlider$RangeSliderState;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/VRangeSlider$RangeSliderState$a;->b(I)[Lv/VRangeSlider$RangeSliderState;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
