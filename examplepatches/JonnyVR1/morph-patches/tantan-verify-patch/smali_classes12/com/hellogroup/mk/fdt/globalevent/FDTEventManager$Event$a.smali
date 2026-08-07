.class Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;",
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
.method public a(Landroid/os/Parcel;)Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;
    .locals 0

    .line 1
    new-instance p0, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;-><init>(Landroid/os/Parcel;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public b(I)[Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;
    .locals 0

    .line 1
    new-array p0, p1, [Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event$a;->a(Landroid/os/Parcel;)Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;

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
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event$a;->b(I)[Lcom/hellogroup/mk/fdt/globalevent/FDTEventManager$Event;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
