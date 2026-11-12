.class public final Ll7k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Ll7k;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 9

    iget-byte p0, p0, Ll7k;->a:B

    const-wide/16 v0, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    packed-switch p0, :pswitch_data_246

    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelReader;->validateObjectHeader(Landroid/os/Parcel;)I

    move-result p0

    move-object v0, v4

    :goto_f
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    if-ge v1, p0, :cond_38

    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelReader;->readHeader(Landroid/os/Parcel;)I

    move-result v1

    invoke-static {v1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelReader;->getFieldId(I)I

    move-result v5

    if-eq v5, v2, :cond_33

    const/4 v6, 0x2

    if-eq v5, v6, :cond_2e

    const/4 v6, 0x3

    if-eq v5, v6, :cond_29

    invoke-static {p1, v1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelReader;->skipUnknownField(Landroid/os/Parcel;I)V

    goto :goto_f

    :cond_29
    invoke-static {p1, v1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelReader;->createString(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v0

    goto :goto_f

    :cond_2e
    invoke-static {p1, v1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelReader;->createString(Landroid/os/Parcel;I)Ljava/lang/String;

    move-result-object v4

    goto :goto_f

    :cond_33
    invoke-static {p1, v1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelReader;->readInt(Landroid/os/Parcel;I)I

    move-result v3

    goto :goto_f

    :cond_38
    invoke-static {p1, p0}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelReader;->ensureAtEnd(Landroid/os/Parcel;I)V

    new-instance p0, Lads_mobile_sdk/cu0;

    invoke-direct {p0, v3, v4, v0}, Lads_mobile_sdk/cu0;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    return-object p0

    :pswitch_41
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lido;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_4a
    invoke-virtual {p1}, Landroid/os/Parcel;->readBundle()Landroid/os/Bundle;

    move-result-object p0

    if-eqz p0, :cond_7f

    const-string p1, "version"

    const-wide/16 v2, -0x1

    invoke-virtual {p0, p1, v2, v3}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    cmp-long p1, v2, v0

    if-nez p1, :cond_7f

    const-string p1, "processguard"

    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/os/ParcelUuid;

    if-eqz p1, :cond_7f

    sget-object v0, Lorg/chromium/content/browser/webcontents/WebContentsImpl;->n:Ljava/util/UUID;

    invoke-virtual {p1}, Landroid/os/ParcelUuid;->getUuid()Ljava/util/UUID;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/UUID;->compareTo(Ljava/util/UUID;)I

    move-result p1

    if-nez p1, :cond_7f

    const-string p1, "webcontents"

    invoke-virtual {p0, p1}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    move-result-wide p0

    invoke-static {p0, p1}, LJ/N;->M$eaBDjM(J)Ljava/lang/Object;

    move-result-object p0

    move-object v4, p0

    check-cast v4, Lorg/chromium/content_public/browser/WebContents;

    :cond_7f
    return-object v4

    :pswitch_80
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lspn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_89
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lmon;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_92
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqnn;->valueOf(Ljava/lang/String;)Lqnn;

    move-result-object p0

    return-object p0

    :pswitch_9b
    new-instance p0, Ldmn;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lwln;->valueOf(Ljava/lang/String;)Lwln;

    move-result-object v0

    sget-object v1, Lcmn;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcmn;

    invoke-direct {p0, v0, p1}, Ldmn;-><init>(Lwln;Lcmn;)V

    return-object p0

    :pswitch_b1
    new-instance p0, Lcmn;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-nez p1, :cond_c6

    move v2, v3

    :cond_c6
    invoke-direct {p0, v0, v4, v1, v2}, Lcmn;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    return-object p0

    :pswitch_ca
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lsln;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_d3
    new-instance p0, Lrkn;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lvln;->valueOf(Ljava/lang/String;)Lvln;

    move-result-object v0

    const-class v1, Lrkn;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lrkn;-><init>(Lvln;Landroid/os/Bundle;)V

    return-object p0

    :pswitch_eb
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lmkn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_f4
    new-instance p0, Lmin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lmin;->a:J

    invoke-virtual {p1}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v0

    iput-object v0, p0, Lmin;->b:[B

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_10d

    move v0, v2

    goto :goto_10e

    :cond_10d
    move v0, v3

    :goto_10e
    iput-boolean v0, p0, Lmin;->c:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result p1

    if-nez p1, :cond_117

    move v2, v3

    :cond_117
    iput-boolean v2, p0, Lmin;->d:Z

    return-object p0

    :pswitch_11a
    new-instance p0, Lvfn;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    sget-object v1, Loba;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Loba;

    invoke-direct {p0, v0, p1}, Lvfn;-><init>(ILoba;)V

    return-object p0

    :pswitch_12c
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lodn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_135
    new-instance p0, Lorg/chromium/components/autofill_public/ViewType;

    invoke-direct {p0, p1}, Lorg/chromium/components/autofill_public/ViewType;-><init>(Landroid/os/Parcel;)V

    return-object p0

    :pswitch_13b
    new-instance p0, Lj8n;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-direct {p0, p1}, Lj8n;-><init>(I)V

    return-object p0

    :pswitch_145
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lmmm;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_14e
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide p0

    cmp-long v5, v2, v0

    if-eqz v5, :cond_163

    cmp-long v0, p0, v0

    if-eqz v0, :cond_163

    new-instance v4, Lorg/chromium/base/UnguessableToken;

    invoke-direct {v4, v2, v3, p0, p1}, Lorg/chromium/base/TokenBase;-><init>(JJ)V

    :cond_163
    return-object v4

    :pswitch_164
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lnsl;->valueOf(Ljava/lang/String;)Lnsl;

    move-result-object p0

    return-object p0

    :pswitch_16d
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1ae

    const/16 p1, 0x3a

    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result p1

    if-ltz p1, :cond_1a9

    invoke-virtual {p0, v3, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    add-int/2addr p1, v2

    invoke-virtual {p0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "address"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1a4

    const-string p1, "string"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_19e

    const-string p0, "Unsupported prefix: "

    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    goto :goto_1ae

    :cond_19e
    new-instance v4, Lhhk;

    invoke-direct {v4, p0}, Lhhk;-><init>(Ljava/lang/String;)V

    goto :goto_1ae

    :cond_1a4
    invoke-static {p0}, Lyv;->a(Ljava/lang/String;)Lyv;

    move-result-object v4

    goto :goto_1ae

    :cond_1a9
    const-string p0, "All ids should have prefix"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    :cond_1ae
    :goto_1ae
    return-object v4

    :pswitch_1af
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Loyk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_1b8
    new-instance p0, Lawk;

    invoke-direct {p0, p1}, Lawk;-><init>(Landroid/os/Parcel;)V

    return-object p0

    :pswitch_1be
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p0

    if-ne p0, v2, :cond_1ee

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p0

    if-ne p0, v2, :cond_1cc

    move p0, v2

    goto :goto_1cd

    :cond_1cc
    move p0, v3

    :goto_1cd
    sget-object v0, Landroid/view/Surface;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/Surface;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eq v1, v2, :cond_1dc

    move v2, v3

    :cond_1dc
    if-eqz p0, :cond_1e8

    invoke-static {p1}, Lorg/chromium/content/common/SurfaceWrapper;->a(Landroid/os/Parcel;)Landroid/window/InputTransferToken;

    move-result-object p0

    new-instance p1, Lorg/chromium/content/common/SurfaceWrapper;

    invoke-direct {p1, v0, v2, p0}, Lorg/chromium/content/common/SurfaceWrapper;-><init>(Landroid/view/Surface;ZLandroid/window/InputTransferToken;)V

    goto :goto_1fb

    :cond_1e8
    new-instance p1, Lorg/chromium/content/common/SurfaceWrapper;

    invoke-direct {p1, v0, v2}, Lorg/chromium/content/common/SurfaceWrapper;-><init>(Landroid/view/Surface;Z)V

    goto :goto_1fb

    :cond_1ee
    sget-object p0, Landroid/view/SurfaceControl;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/SurfaceControl;

    new-instance p1, Lorg/chromium/content/common/SurfaceWrapper;

    invoke-direct {p1, p0}, Lorg/chromium/content/common/SurfaceWrapper;-><init>(Landroid/view/SurfaceControl;)V

    :goto_1fb
    return-object p1

    :pswitch_1fc
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lzrk;

    invoke-direct {p0}, Lzrk;-><init>()V

    return-object p0

    :pswitch_205
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lwrk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_20e
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Ltrk;

    invoke-direct {p0}, Ltrk;-><init>()V

    return-object p0

    :pswitch_217
    new-instance p0, Lork;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lork;-><init>(Ljava/lang/String;)V

    return-object p0

    :pswitch_221
    new-instance p0, Lzfk;

    invoke-direct {p0, p1}, Lzfk;-><init>(Landroid/os/Parcel;)V

    return-object p0

    :pswitch_227
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Laak;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_230
    new-instance p0, Lm7k;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lc8j;->valueOf(Ljava/lang/String;)Lc8j;

    move-result-object v0

    sget-object v1, Loba;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Loba;

    invoke-direct {p0, v0, p1}, Lm7k;-><init>(Lc8j;Loba;)V

    return-object p0

    :pswitch_data_246
    .packed-switch 0x0
        :pswitch_230
        :pswitch_227
        :pswitch_221
        :pswitch_217
        :pswitch_20e
        :pswitch_205
        :pswitch_1fc
        :pswitch_1be
        :pswitch_1b8
        :pswitch_1af
        :pswitch_16d
        :pswitch_164
        :pswitch_14e
        :pswitch_145
        :pswitch_13b
        :pswitch_135
        :pswitch_12c
        :pswitch_11a
        :pswitch_f4
        :pswitch_eb
        :pswitch_d3
        :pswitch_ca
        :pswitch_b1
        :pswitch_9b
        :pswitch_92
        :pswitch_89
        :pswitch_80
        :pswitch_4a
        :pswitch_41
    .end packed-switch
.end method

.method public final newArray(I)[Ljava/lang/Object;
    .registers 2

    iget-byte p0, p0, Ll7k;->a:B

    packed-switch p0, :pswitch_data_60

    new-array p0, p1, [Lads_mobile_sdk/cu0;

    return-object p0

    :pswitch_8
    new-array p0, p1, [Lido;

    return-object p0

    :pswitch_b
    new-array p0, p1, [Lorg/chromium/content_public/browser/WebContents;

    return-object p0

    :pswitch_e
    new-array p0, p1, [Lspn;

    return-object p0

    :pswitch_11
    new-array p0, p1, [Lmon;

    return-object p0

    :pswitch_14
    new-array p0, p1, [Lqnn;

    return-object p0

    :pswitch_17
    new-array p0, p1, [Ldmn;

    return-object p0

    :pswitch_1a
    new-array p0, p1, [Lcmn;

    return-object p0

    :pswitch_1d
    new-array p0, p1, [Lsln;

    return-object p0

    :pswitch_20
    new-array p0, p1, [Lrkn;

    return-object p0

    :pswitch_23
    new-array p0, p1, [Lmkn;

    return-object p0

    :pswitch_26
    new-array p0, p1, [Lmin;

    return-object p0

    :pswitch_29
    new-array p0, p1, [Lvfn;

    return-object p0

    :pswitch_2c
    new-array p0, p1, [Lodn;

    return-object p0

    :pswitch_2f
    new-array p0, p1, [Lorg/chromium/components/autofill_public/ViewType;

    return-object p0

    :pswitch_32
    new-array p0, p1, [Lj8n;

    return-object p0

    :pswitch_35
    new-array p0, p1, [Lmmm;

    return-object p0

    :pswitch_38
    new-array p0, p1, [Lorg/chromium/base/UnguessableToken;

    return-object p0

    :pswitch_3b
    new-array p0, p1, [Lnsl;

    return-object p0

    :pswitch_3e
    new-array p0, p1, [Lcsl;

    return-object p0

    :pswitch_41
    new-array p0, p1, [Loyk;

    return-object p0

    :pswitch_44
    new-array p0, p1, [Lawk;

    return-object p0

    :pswitch_47
    new-array p0, p1, [Lorg/chromium/content/common/SurfaceWrapper;

    return-object p0

    :pswitch_4a
    new-array p0, p1, [Lzrk;

    return-object p0

    :pswitch_4d
    new-array p0, p1, [Lwrk;

    return-object p0

    :pswitch_50
    new-array p0, p1, [Ltrk;

    return-object p0

    :pswitch_53
    new-array p0, p1, [Lork;

    return-object p0

    :pswitch_56
    new-array p0, p1, [Lzfk;

    return-object p0

    :pswitch_59
    new-array p0, p1, [Laak;

    return-object p0

    :pswitch_5c
    new-array p0, p1, [Lm7k;

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
