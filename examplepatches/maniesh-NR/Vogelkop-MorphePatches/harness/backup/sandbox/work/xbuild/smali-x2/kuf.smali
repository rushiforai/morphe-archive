.class public final Lkuf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lkuf;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 10

    iget-byte p0, p0, Lkuf;->a:B

    packed-switch p0, :pswitch_data_1a6

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lgug;

    invoke-direct {p0}, Lgug;-><init>()V

    return-object p0

    :pswitch_e
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Leug;

    invoke-direct {p0}, Leug;-><init>()V

    return-object p0

    :pswitch_17
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lbug;

    invoke-direct {p0}, Lbug;-><init>()V

    return-object p0

    :pswitch_20
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Laug;

    invoke-direct {p0}, Laug;-><init>()V

    return-object p0

    :pswitch_29
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lztg;

    invoke-direct {p0}, Lztg;-><init>()V

    return-object p0

    :pswitch_32
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lytg;

    invoke-direct {p0}, Lytg;-><init>()V

    return-object p0

    :pswitch_3b
    new-instance p0, Lptg;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    sget-object v1, Lltg;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lltg;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-direct {p0, v0, v1, v2, p1}, Lptg;-><init>(ILltg;Ljava/lang/String;I)V

    return-object p0

    :pswitch_55
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lotg;

    invoke-direct {p0}, Lotg;-><init>()V

    return-object p0

    :pswitch_5e
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lntg;

    invoke-direct {p0}, Lntg;-><init>()V

    return-object p0

    :pswitch_67
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lmtg;

    invoke-direct {p0}, Lmtg;-><init>()V

    return-object p0

    :pswitch_70
    new-instance p0, Lltg;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, v1, p1}, Lltg;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object p0

    :pswitch_82
    new-instance p0, Luhg;

    invoke-direct {p0, p1}, Luhg;-><init>(Landroid/os/Parcel;)V

    return-object p0

    :pswitch_88
    new-instance p0, Landroid/support/v4/media/session/PlaybackStateCompat;

    invoke-direct {p0, p1}, Landroid/support/v4/media/session/PlaybackStateCompat;-><init>(Landroid/os/Parcel;)V

    return-object p0

    :pswitch_8e
    new-instance p0, Lvhg;

    invoke-direct {p0, p1}, Lvhg;-><init>(Landroid/os/Parcel;)V

    return-object p0

    :pswitch_94
    new-instance p0, Lfcg;

    sget-object v0, Loba;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Loba;

    invoke-direct {p0, p1}, Lfcg;-><init>(Loba;)V

    return-object p0

    :pswitch_a2
    new-instance p0, Lc9g;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lc9g;-><init>(Ljava/lang/String;)V

    return-object p0

    :pswitch_ac
    new-instance p0, La6g;

    sget-object v0, Loba;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Loba;

    invoke-direct {p0, p1}, La6g;-><init>(Loba;)V

    return-object p0

    :pswitch_ba
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lo5g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_c3
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Ls4g;

    invoke-direct {p0}, Ls4g;-><init>()V

    return-object p0

    :pswitch_cc
    new-instance v0, Ls3g;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Ls3g;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :pswitch_e6
    new-instance v1, Ln3g;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v7

    invoke-direct/range {v1 .. v7}, Ln3g;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :pswitch_104
    new-instance p0, Li2g;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Li2g;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0

    :pswitch_112
    new-instance p0, Lh2g;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lsq2;->valueOf(Ljava/lang/String;)Lsq2;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lh2g;-><init>(Ljava/lang/String;Lsq2;)V

    return-object p0

    :pswitch_124
    new-instance p0, Lg2g;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lg2g;-><init>(Ljava/lang/String;)V

    return-object p0

    :pswitch_12e
    new-instance p0, Landroid/support/v4/media/session/ParcelableVolumeInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/support/v4/media/session/ParcelableVolumeInfo;->a:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/support/v4/media/session/ParcelableVolumeInfo;->c:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/support/v4/media/session/ParcelableVolumeInfo;->d:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/support/v4/media/session/ParcelableVolumeInfo;->e:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Landroid/support/v4/media/session/ParcelableVolumeInfo;->b:I

    return-object p0

    :pswitch_152
    new-instance p0, Lr0g;

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lr0g;-><init>(J)V

    return-object p0

    :pswitch_15c
    new-instance p0, Lq0g;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-direct {p0, p1}, Lq0g;-><init>(I)V

    return-object p0

    :pswitch_166
    new-instance p0, Lp0g;

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result p1

    invoke-direct {p0, p1}, Lp0g;-><init>(F)V

    return-object p0

    :pswitch_170
    new-instance p0, Landroidx/versionedparcelable/ParcelImpl;

    invoke-direct {p0, p1}, Landroidx/versionedparcelable/ParcelImpl;-><init>(Landroid/os/Parcel;)V

    return-object p0

    :pswitch_176
    new-instance v0, Lluf;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/graphics/Bitmap$CompressFormat;->valueOf(Ljava/lang/String;)Landroid/graphics/Bitmap$CompressFormat;

    move-result-object v1

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    const-class p0, Lluf;

    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p0

    move-object v3, p0

    check-cast v3, Landroid/graphics/Point;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v5

    sget-object p0, Lqnn;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p0

    move-object v6, p0

    check-cast v6, Lqnn;

    invoke-direct/range {v0 .. v6}, Lluf;-><init>(Landroid/graphics/Bitmap$CompressFormat;ILandroid/graphics/Point;Ljava/lang/String;Ljava/lang/String;Lqnn;)V

    return-object v0

    :pswitch_data_1a6
    .packed-switch 0x0
        :pswitch_176
        :pswitch_170
        :pswitch_166
        :pswitch_15c
        :pswitch_152
        :pswitch_12e
        :pswitch_124
        :pswitch_112
        :pswitch_104
        :pswitch_e6
        :pswitch_cc
        :pswitch_c3
        :pswitch_ba
        :pswitch_ac
        :pswitch_a2
        :pswitch_94
        :pswitch_8e
        :pswitch_88
        :pswitch_82
        :pswitch_70
        :pswitch_67
        :pswitch_5e
        :pswitch_55
        :pswitch_3b
        :pswitch_32
        :pswitch_29
        :pswitch_20
        :pswitch_17
        :pswitch_e
    .end packed-switch
.end method

.method public final newArray(I)[Ljava/lang/Object;
    .registers 2

    iget-byte p0, p0, Lkuf;->a:B

    packed-switch p0, :pswitch_data_60

    new-array p0, p1, [Lgug;

    return-object p0

    :pswitch_8
    new-array p0, p1, [Leug;

    return-object p0

    :pswitch_b
    new-array p0, p1, [Lbug;

    return-object p0

    :pswitch_e
    new-array p0, p1, [Laug;

    return-object p0

    :pswitch_11
    new-array p0, p1, [Lztg;

    return-object p0

    :pswitch_14
    new-array p0, p1, [Lytg;

    return-object p0

    :pswitch_17
    new-array p0, p1, [Lptg;

    return-object p0

    :pswitch_1a
    new-array p0, p1, [Lotg;

    return-object p0

    :pswitch_1d
    new-array p0, p1, [Lntg;

    return-object p0

    :pswitch_20
    new-array p0, p1, [Lmtg;

    return-object p0

    :pswitch_23
    new-array p0, p1, [Lltg;

    return-object p0

    :pswitch_26
    new-array p0, p1, [Luhg;

    return-object p0

    :pswitch_29
    new-array p0, p1, [Landroid/support/v4/media/session/PlaybackStateCompat;

    return-object p0

    :pswitch_2c
    new-array p0, p1, [Lvhg;

    return-object p0

    :pswitch_2f
    new-array p0, p1, [Lfcg;

    return-object p0

    :pswitch_32
    new-array p0, p1, [Lc9g;

    return-object p0

    :pswitch_35
    new-array p0, p1, [La6g;

    return-object p0

    :pswitch_38
    new-array p0, p1, [Lo5g;

    return-object p0

    :pswitch_3b
    new-array p0, p1, [Ls4g;

    return-object p0

    :pswitch_3e
    new-array p0, p1, [Ls3g;

    return-object p0

    :pswitch_41
    new-array p0, p1, [Ln3g;

    return-object p0

    :pswitch_44
    new-array p0, p1, [Li2g;

    return-object p0

    :pswitch_47
    new-array p0, p1, [Lh2g;

    return-object p0

    :pswitch_4a
    new-array p0, p1, [Lg2g;

    return-object p0

    :pswitch_4d
    new-array p0, p1, [Landroid/support/v4/media/session/ParcelableVolumeInfo;

    return-object p0

    :pswitch_50
    new-array p0, p1, [Lr0g;

    return-object p0

    :pswitch_53
    new-array p0, p1, [Lq0g;

    return-object p0

    :pswitch_56
    new-array p0, p1, [Lp0g;

    return-object p0

    :pswitch_59
    new-array p0, p1, [Landroidx/versionedparcelable/ParcelImpl;

    return-object p0

    :pswitch_5c
    new-array p0, p1, [Lluf;

    return-object p0

    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_5c
        :pswitch_59
        :pswitch_56
        :pswitch_53
        :pswitch_50
        :pswitch_4d
        :pswitch_4a
        :pswitch_47
        :pswitch_44
        :pswitch_41
        :pswitch_3e
        :pswitch_3b
        :pswitch_38
        :pswitch_35
        :pswitch_32
        :pswitch_2f
        :pswitch_2c
        :pswitch_29
        :pswitch_26
        :pswitch_23
        :pswitch_20
        :pswitch_1d
        :pswitch_1a
        :pswitch_17
        :pswitch_14
        :pswitch_11
        :pswitch_e
        :pswitch_b
        :pswitch_8
    .end packed-switch
.end method
