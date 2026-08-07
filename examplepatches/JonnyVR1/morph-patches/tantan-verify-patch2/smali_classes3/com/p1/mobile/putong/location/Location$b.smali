.class public Lcom/p1/mobile/putong/location/Location$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/location/Location;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/p1/mobile/putong/location/Location;",
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
.method public a(Landroid/os/Parcel;)Lcom/p1/mobile/putong/location/Location;
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Lcom/p1/mobile/putong/location/Location;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/location/Location;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/location/Location;->o(Lcom/p1/mobile/putong/location/Location;J)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/location/Location;->d(Lcom/p1/mobile/putong/location/Location;J)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/location/Location;->e(Lcom/p1/mobile/putong/location/Location;D)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/location/Location;->h(Lcom/p1/mobile/putong/location/Location;I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    .line 39
    .line 40
    .line 41
    move-result-wide v1

    .line 42
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/location/Location;->i(Lcom/p1/mobile/putong/location/Location;D)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    .line 46
    .line 47
    .line 48
    move-result-wide v1

    .line 49
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/location/Location;->l(Lcom/p1/mobile/putong/location/Location;D)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    .line 53
    .line 54
    .line 55
    move-result-wide v1

    .line 56
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/location/Location;->a(Lcom/p1/mobile/putong/location/Location;D)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/location/Location;->m(Lcom/p1/mobile/putong/location/Location;F)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/location/Location;->b(Lcom/p1/mobile/putong/location/Location;F)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/location/Location;->p(Lcom/p1/mobile/putong/location/Location;F)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/location/Location;->n(Lcom/p1/mobile/putong/location/Location;F)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/location/Location;->c(Lcom/p1/mobile/putong/location/Location;F)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/location/Location;->k(Lcom/p1/mobile/putong/location/Location;I)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/location/Location;->f(Lcom/p1/mobile/putong/location/Location;I)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1}, Landroid/os/Parcel;->readBundle()Landroid/os/Bundle;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/location/Location;->g(Lcom/p1/mobile/putong/location/Location;Landroid/os/Bundle;)V

    .line 113
    .line 114
    .line 115
    return-object v0
.end method

.method public b(I)[Lcom/p1/mobile/putong/location/Location;
    .locals 0

    .line 1
    new-array p0, p1, [Lcom/p1/mobile/putong/location/Location;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/location/Location$b;->a(Landroid/os/Parcel;)Lcom/p1/mobile/putong/location/Location;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/location/Location$b;->b(I)[Lcom/p1/mobile/putong/location/Location;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
