.class public final Lzug;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lzug;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 11

    iget-byte p0, p0, Lzug;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch p0, :pswitch_data_2a0

    new-instance p0, La3k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, La3k;->a:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, La3k;->b:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, La3k;->c:I

    if-lez v0, :cond_28

    new-array v0, v0, [I

    iput-object v0, p0, La3k;->d:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readIntArray([I)V

    :cond_28
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, La3k;->e:I

    if-lez v0, :cond_37

    new-array v0, v0, [I

    iput-object v0, p0, La3k;->f:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readIntArray([I)V

    :cond_37
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_3f

    move v0, v1

    goto :goto_40

    :cond_3f
    move v0, v2

    :goto_40
    iput-boolean v0, p0, La3k;->h:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_4a

    move v0, v1

    goto :goto_4b

    :cond_4a
    move v0, v2

    :goto_4b
    iput-boolean v0, p0, La3k;->i:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eq v0, v1, :cond_54

    move v1, v2

    :cond_54
    iput-boolean v1, p0, La3k;->j:Z

    const-class v0, Lz2k;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readArrayList(Ljava/lang/ClassLoader;)Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, La3k;->g:Ljava/util/ArrayList;

    return-object p0

    :pswitch_63
    new-instance p0, Lz2k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lz2k;->a:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lz2k;->b:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eq v0, v1, :cond_7b

    move v1, v2

    :cond_7b
    iput-boolean v1, p0, Lz2k;->d:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-lez v0, :cond_8a

    new-array v0, v0, [I

    iput-object v0, p0, Lz2k;->c:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readIntArray([I)V

    :cond_8a
    return-object p0

    :pswitch_8b
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lmoj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_94
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p0

    if-ne p0, v1, :cond_9c

    move p0, v1

    goto :goto_9d

    :cond_9c
    move p0, v2

    :goto_9d
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v6

    if-eqz p0, :cond_b7

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p0

    if-ne p0, v1, :cond_af

    move v8, v1

    goto :goto_b0

    :cond_af
    move v8, v2

    :goto_b0
    new-instance v3, Lkkj;

    const/4 v7, 0x0

    invoke-direct/range {v3 .. v8}, Lkkj;-><init>(JLjava/lang/String;Ljava/lang/String;Z)V

    goto :goto_c7

    :cond_b7
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p0

    new-instance v3, Llkj;

    new-instance p1, Lshf;

    const/16 v0, 0xd

    invoke-direct {p1, p0, v0}, Lshf;-><init>(Ljava/lang/String;B)V

    invoke-direct {v3, v4, v5, v6, p1}, Llkj;-><init>(JLjava/lang/String;Lshf;)V

    :goto_c7
    return-object v3

    :pswitch_c8
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lt8j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_d1
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Le6j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_da
    new-instance p0, Lxvi;

    sget-object v0, Loba;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Loba;

    invoke-direct {p0, p1}, Lxvi;-><init>(Loba;)V

    return-object p0

    :pswitch_e8
    new-instance p0, Lhsi;

    sget-object v0, Loba;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Loba;

    invoke-direct {p0, p1}, Lhsi;-><init>(Loba;)V

    return-object p0

    :pswitch_f6
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lu7i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_ff
    new-instance p0, Lt4i;

    const-class v0, Lt4i;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lk15;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lq4i;->valueOf(Ljava/lang/String;)Lq4i;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lt4i;-><init>(Lk15;Lq4i;)V

    return-object p0

    :pswitch_119
    new-instance p0, Lp4i;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lo3i;->valueOf(Ljava/lang/String;)Lo3i;

    move-result-object v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-nez p1, :cond_12e

    move v1, v2

    :cond_12e
    invoke-direct {p0, v0, v3, v1}, Lp4i;-><init>(Lo3i;Ljava/lang/String;Z)V

    return-object p0

    :pswitch_132
    new-instance p0, Lg4i;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lo3i;->valueOf(Ljava/lang/String;)Lo3i;

    move-result-object p1

    invoke-direct {p0, p1}, Lg4i;-><init>(Lo3i;)V

    return-object p0

    :pswitch_140
    new-instance p0, Ln3i;

    const-class v0, Ln3i;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lp4i;

    invoke-direct {p0, p1}, Ln3i;-><init>(Lp4i;)V

    return-object p0

    :pswitch_152
    new-instance p0, Lw0i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    sget v1, Lv0i;->b:I

    if-eqz p1, :cond_175

    sget-object v0, Leta;->fp:Ljava/lang/String;

    invoke-interface {p1, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_16e

    instance-of v1, v0, Leta;

    if-eqz v1, :cond_16e

    check-cast v0, Leta;

    goto :goto_175

    :cond_16e
    new-instance v0, Ldta;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p1, v0, Ldta;->a:Landroid/os/IBinder;

    :cond_175
    :goto_175
    iput-object v0, p0, Lw0i;->a:Leta;

    return-object p0

    :pswitch_178
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p0

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    new-array v3, v1, [Ljava/lang/Object;

    :goto_186
    if-eq v2, v1, :cond_197

    const-class v4, Ltxh;

    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/os/Parcel;->readValue(Ljava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object v4

    aput-object v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_186

    :cond_197
    new-instance p1, Ltxh;

    invoke-direct {p1, v3, p0, v0}, Ltxh;-><init>([Ljava/lang/Object;II)V

    return-object p1

    :pswitch_19d
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p0

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    new-array v1, v0, [Ljava/lang/Object;

    :goto_1a7
    if-eq v2, v0, :cond_1b8

    const-class v3, Lsxh;

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->readValue(Ljava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1a7

    :cond_1b8
    new-instance p1, Lsxh;

    invoke-direct {p1, p0, v1}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    return-object p1

    :pswitch_1be
    new-instance p0, Lrxh;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-direct {p0, p1}, Lrxh;-><init>(I)V

    return-object p0

    :pswitch_1c8
    new-instance p0, Lqxh;

    sget-object v0, Landroid/text/TextUtils;->CHAR_SEQUENCE_CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/CharSequence;

    invoke-direct {p0, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    return-object p0

    :pswitch_1d6
    new-instance p0, Ltvh;

    invoke-direct {p0, p1}, Ltvh;-><init>(Landroid/os/Parcel;)V

    return-object p0

    :pswitch_1dc
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Leuh;

    invoke-direct {p0}, Leuh;-><init>()V

    return-object p0

    :pswitch_1e5
    new-instance p0, Lduh;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lduh;-><init>(Ljava/lang/String;)V

    return-object p0

    :pswitch_1ef
    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelReader;->validateObjectHeader(Landroid/os/Parcel;)I

    move-result p0

    :goto_1f3
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    if-ge v1, p0, :cond_20d

    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelReader;->readHeader(Landroid/os/Parcel;)I

    move-result v1

    invoke-static {v1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelReader;->getFieldId(I)I

    move-result v2

    const/4 v3, 0x2

    if-eq v2, v3, :cond_208

    invoke-static {p1, v1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelReader;->skipUnknownField(Landroid/os/Parcel;I)V

    goto :goto_1f3

    :cond_208
    invoke-static {p1, v1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelReader;->createBundle(Landroid/os/Parcel;I)Landroid/os/Bundle;

    move-result-object v0

    goto :goto_1f3

    :cond_20d
    invoke-static {p1, p0}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelReader;->ensureAtEnd(Landroid/os/Parcel;I)V

    new-instance p0, Lrth;

    invoke-direct {p0, v0}, Lrth;-><init>(Landroid/os/Bundle;)V

    return-object p0

    :pswitch_216
    new-instance p0, Lsqh;

    invoke-direct {p0, p1}, Lsqh;-><init>(Landroid/os/Parcel;)V

    return-object p0

    :pswitch_21c
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Ljnh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_225
    new-instance p0, Landroid/support/v4/media/RatingCompat;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result p1

    invoke-direct {p0, v0, p1}, Landroid/support/v4/media/RatingCompat;-><init>(IF)V

    return-object p0

    :pswitch_233
    new-instance p0, Lyjh;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result p1

    invoke-direct {p0, v0, p1}, Lyjh;-><init>(IF)V

    return-object p0

    :pswitch_241
    new-instance p0, Lzih;

    invoke-direct {p0, p1}, Lzih;-><init>(Landroid/os/Parcel;)V

    return-object p0

    :pswitch_247
    move-object p0, v0

    new-instance v0, Ls5h;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ln8g;->valueOf(Ljava/lang/String;)Ln8g;

    move-result-object v3

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    move v5, v1

    if-eqz v4, :cond_25d

    move v4, v2

    move v2, v5

    :goto_25b
    move-object v1, v3

    goto :goto_25f

    :cond_25d
    move v4, v2

    goto :goto_25b

    :goto_25f
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lnil;->valueOf(Ljava/lang/String;)Lnil;

    move-result-object v6

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v7

    if-nez v7, :cond_272

    move v5, v4

    :cond_272
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-nez v4, :cond_27b

    :goto_278
    move-object v4, v6

    move-object v6, p0

    goto :goto_284

    :cond_27b
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ln8g;->valueOf(Ljava/lang/String;)Ln8g;

    move-result-object p0

    goto :goto_278

    :goto_284
    invoke-direct/range {v0 .. v6}, Ls5h;-><init>(Ln8g;ZILnil;ZLn8g;)V

    return-object v0

    :pswitch_288
    new-instance p0, Lxyg;

    sget-object v0, Loba;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Loba;

    invoke-direct {p0, p1}, Lxyg;-><init>(Loba;)V

    return-object p0

    :pswitch_296
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lavg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    nop

    :pswitch_data_2a0
    .packed-switch 0x0
        :pswitch_296
        :pswitch_288
        :pswitch_247
        :pswitch_241
        :pswitch_233
        :pswitch_225
        :pswitch_21c
        :pswitch_216
        :pswitch_1ef
        :pswitch_1e5
        :pswitch_1dc
        :pswitch_1d6
        :pswitch_1c8
        :pswitch_1be
        :pswitch_19d
        :pswitch_178
        :pswitch_152
        :pswitch_140
        :pswitch_132
        :pswitch_119
        :pswitch_ff
        :pswitch_f6
        :pswitch_e8
        :pswitch_da
        :pswitch_d1
        :pswitch_c8
        :pswitch_94
        :pswitch_8b
        :pswitch_63
    .end packed-switch
.end method

.method public final newArray(I)[Ljava/lang/Object;
    .registers 2

    iget-byte p0, p0, Lzug;->a:B

    packed-switch p0, :pswitch_data_60

    new-array p0, p1, [La3k;

    return-object p0

    :pswitch_8
    new-array p0, p1, [Lz2k;

    return-object p0

    :pswitch_b
    new-array p0, p1, [Lmoj;

    return-object p0

    :pswitch_e
    new-array p0, p1, [Ljkj;

    return-object p0

    :pswitch_11
    new-array p0, p1, [Lt8j;

    return-object p0

    :pswitch_14
    new-array p0, p1, [Le6j;

    return-object p0

    :pswitch_17
    new-array p0, p1, [Lxvi;

    return-object p0

    :pswitch_1a
    new-array p0, p1, [Lhsi;

    return-object p0

    :pswitch_1d
    new-array p0, p1, [Lu7i;

    return-object p0

    :pswitch_20
    new-array p0, p1, [Lt4i;

    return-object p0

    :pswitch_23
    new-array p0, p1, [Lp4i;

    return-object p0

    :pswitch_26
    new-array p0, p1, [Lg4i;

    return-object p0

    :pswitch_29
    new-array p0, p1, [Ln3i;

    return-object p0

    :pswitch_2c
    new-array p0, p1, [Lw0i;

    return-object p0

    :pswitch_2f
    new-array p0, p1, [Ltxh;

    return-object p0

    :pswitch_32
    new-array p0, p1, [Lsxh;

    return-object p0

    :pswitch_35
    new-array p0, p1, [Lrxh;

    return-object p0

    :pswitch_38
    new-array p0, p1, [Lqxh;

    return-object p0

    :pswitch_3b
    new-array p0, p1, [Ltvh;

    return-object p0

    :pswitch_3e
    new-array p0, p1, [Leuh;

    return-object p0

    :pswitch_41
    new-array p0, p1, [Lduh;

    return-object p0

    :pswitch_44
    new-array p0, p1, [Lrth;

    return-object p0

    :pswitch_47
    new-array p0, p1, [Lsqh;

    return-object p0

    :pswitch_4a
    new-array p0, p1, [Ljnh;

    return-object p0

    :pswitch_4d
    new-array p0, p1, [Landroid/support/v4/media/RatingCompat;

    return-object p0

    :pswitch_50
    new-array p0, p1, [Lyjh;

    return-object p0

    :pswitch_53
    new-array p0, p1, [Lzih;

    return-object p0

    :pswitch_56
    new-array p0, p1, [Ls5h;

    return-object p0

    :pswitch_59
    new-array p0, p1, [Lxyg;

    return-object p0

    :pswitch_5c
    new-array p0, p1, [Lavg;

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
