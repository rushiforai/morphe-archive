.class public final Lhh3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lhh3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 14

    iget-byte p0, p0, Lhh3;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    packed-switch p0, :pswitch_data_1de

    new-instance p0, Lex8;

    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lex8;->a:I

    return-object p0

    :pswitch_13
    new-instance p0, Lax8;

    invoke-direct {p0, p1}, Lax8;-><init>(Landroid/os/Parcel;)V

    return-object p0

    :pswitch_19
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lzl8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_22
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    sget-object p0, Lr88;->a:Lr88;

    return-object p0

    :pswitch_28
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    sget-object p0, Lq88;->a:Lq88;

    return-object p0

    :pswitch_2e
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    sget-object p0, Lp88;->a:Lp88;

    return-object p0

    :pswitch_34
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    sget-object p0, Lo88;->a:Lo88;

    return-object p0

    :pswitch_3a
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    sget-object p0, Ln88;->a:Ln88;

    return-object p0

    :pswitch_40
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    sget-object p0, Lm88;->a:Lm88;

    return-object p0

    :pswitch_46
    new-instance p0, Ll88;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ll88;-><init>(Ljava/lang/String;)V

    return-object p0

    :pswitch_50
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lpx7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_59
    new-instance p0, Lzv7;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-direct {p0, p1}, Lzv7;-><init>(I)V

    return-object p0

    :pswitch_63
    new-instance p0, Lul7;

    invoke-direct {p0, p1}, Lul7;-><init>(Landroid/os/Parcel;)V

    return-object p0

    :pswitch_69
    new-instance p0, Lvl7;

    invoke-direct {p0, p1}, Lvl7;-><init>(Landroid/os/Parcel;)V

    return-object p0

    :pswitch_6f
    new-instance p0, La27;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, La27;-><init>(Ljava/lang/String;)V

    return-object p0

    :pswitch_79
    new-instance p0, Lyr6;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-direct {p0, p1}, Lyr6;-><init>(I)V

    return-object p0

    :pswitch_83
    new-instance p0, Lgi6;

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lgi6;-><init>(J)V

    return-object p0

    :pswitch_8d
    new-instance p0, Lpb6;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-eqz v2, :cond_96

    move v0, v1

    :cond_96
    sget-object v1, Loba;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Loba;

    invoke-direct {p0, v0, p1}, Lpb6;-><init>(ZLoba;)V

    return-object p0

    :pswitch_a2
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p0

    new-array v1, p0, [Lvz8;

    :goto_a8
    const-class v2, Lm16;

    if-eq v0, p0, :cond_b9

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v2

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_a8

    :cond_b9
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p0

    check-cast p0, Lj2g;

    new-instance p1, Lm16;

    invoke-direct {p1, v1, p0}, Lm16;-><init>([Lvz8;Lj2g;)V

    return-object p1

    :pswitch_c9
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p0

    new-array v1, p0, [Lvz8;

    :goto_cf
    const-class v2, Ld16;

    if-eq v0, p0, :cond_e0

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v2

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_cf

    :cond_e0
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p0

    check-cast p0, Lj2g;

    new-instance p1, Ld16;

    invoke-direct {p1, v1, p0}, Ld16;-><init>([Lvz8;Lj2g;)V

    return-object p1

    :pswitch_f0
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p0

    new-array v1, p0, [Lvz8;

    :goto_f6
    const-class v2, Lsp5;

    if-eq v0, p0, :cond_107

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v2

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_f6

    :cond_107
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p0

    check-cast p0, Lj2g;

    new-instance p1, Lsp5;

    invoke-direct {p1, v1, p0}, Lsp5;-><init>([Lvz8;Lj2g;)V

    return-object p1

    :pswitch_117
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Ln35;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_120
    new-instance p0, Lk15;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ll15;->valueOf(Ljava/lang/String;)Ll15;

    move-result-object p1

    invoke-direct {p0, v0, v1, v2, p1}, Lk15;-><init>(Ljava/lang/String;JLl15;)V

    return-object p0

    :pswitch_136
    new-instance v3, Lhu4;

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p0

    if-eqz p0, :cond_144

    move v6, v1

    goto :goto_145

    :cond_144
    move v6, v0

    :goto_145
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v8

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p0

    if-eqz p0, :cond_159

    move v11, v1

    goto :goto_15a

    :cond_159
    move v11, v0

    :goto_15a
    invoke-direct/range {v3 .. v11}, Lhu4;-><init>(JZLjava/lang/String;JLjava/lang/String;Z)V

    return-object v3

    :pswitch_15e
    new-instance p0, Lxk4;

    sget-object v0, Loba;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Loba;

    invoke-direct {p0, p1}, Lxk4;-><init>(Loba;)V

    return-object p0

    :pswitch_16c
    const-class p0, Li9e;

    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Li9e;

    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Li9e;

    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p0

    move-object v5, p0

    check-cast v5, Li9e;

    const-class p0, Lgi6;

    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p0

    move-object v4, p0

    check-cast v4, Lgi6;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    new-instance v1, Lt84;

    invoke-direct/range {v1 .. v6}, Lt84;-><init>(Li9e;Li9e;Lgi6;Li9e;I)V

    return-object v1

    :pswitch_1a6
    new-instance p0, Ln54;

    invoke-virtual {p1}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object p1

    invoke-direct {p0, p1}, Ln54;-><init>([B)V

    return-object p0

    :pswitch_1b0
    new-instance p0, Ldy3;

    sget-object v0, Loba;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Loba;

    invoke-direct {p0, p1}, Ldy3;-><init>(Loba;)V

    return-object p0

    :pswitch_1be
    new-instance p0, Lxl3;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-nez v0, :cond_1c8

    const/4 p1, 0x0

    goto :goto_1d0

    :cond_1c8
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    :goto_1d0
    invoke-direct {p0, p1}, Lxl3;-><init>(Ljava/lang/Long;)V

    return-object p0

    :pswitch_1d4
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lih3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    nop

    :pswitch_data_1de
    .packed-switch 0x0
        :pswitch_1d4
        :pswitch_1be
        :pswitch_1b0
        :pswitch_1a6
        :pswitch_16c
        :pswitch_15e
        :pswitch_136
        :pswitch_120
        :pswitch_117
        :pswitch_f0
        :pswitch_c9
        :pswitch_a2
        :pswitch_8d
        :pswitch_83
        :pswitch_79
        :pswitch_6f
        :pswitch_69
        :pswitch_63
        :pswitch_59
        :pswitch_50
        :pswitch_46
        :pswitch_40
        :pswitch_3a
        :pswitch_34
        :pswitch_2e
        :pswitch_28
        :pswitch_22
        :pswitch_19
        :pswitch_13
    .end packed-switch
.end method

.method public final newArray(I)[Ljava/lang/Object;
    .registers 2

    iget-byte p0, p0, Lhh3;->a:B

    packed-switch p0, :pswitch_data_60

    new-array p0, p1, [Lex8;

    return-object p0

    :pswitch_8
    new-array p0, p1, [Lax8;

    return-object p0

    :pswitch_b
    new-array p0, p1, [Lzl8;

    return-object p0

    :pswitch_e
    new-array p0, p1, [Lr88;

    return-object p0

    :pswitch_11
    new-array p0, p1, [Lq88;

    return-object p0

    :pswitch_14
    new-array p0, p1, [Lp88;

    return-object p0

    :pswitch_17
    new-array p0, p1, [Lo88;

    return-object p0

    :pswitch_1a
    new-array p0, p1, [Ln88;

    return-object p0

    :pswitch_1d
    new-array p0, p1, [Lm88;

    return-object p0

    :pswitch_20
    new-array p0, p1, [Ll88;

    return-object p0

    :pswitch_23
    new-array p0, p1, [Lpx7;

    return-object p0

    :pswitch_26
    new-array p0, p1, [Lzv7;

    return-object p0

    :pswitch_29
    new-array p0, p1, [Lul7;

    return-object p0

    :pswitch_2c
    new-array p0, p1, [Lvl7;

    return-object p0

    :pswitch_2f
    new-array p0, p1, [La27;

    return-object p0

    :pswitch_32
    new-array p0, p1, [Lyr6;

    return-object p0

    :pswitch_35
    new-array p0, p1, [Lgi6;

    return-object p0

    :pswitch_38
    new-array p0, p1, [Lpb6;

    return-object p0

    :pswitch_3b
    new-array p0, p1, [Lm16;

    return-object p0

    :pswitch_3e
    new-array p0, p1, [Ld16;

    return-object p0

    :pswitch_41
    new-array p0, p1, [Lsp5;

    return-object p0

    :pswitch_44
    new-array p0, p1, [Ln35;

    return-object p0

    :pswitch_47
    new-array p0, p1, [Lk15;

    return-object p0

    :pswitch_4a
    new-array p0, p1, [Lhu4;

    return-object p0

    :pswitch_4d
    new-array p0, p1, [Lxk4;

    return-object p0

    :pswitch_50
    new-array p0, p1, [Lt84;

    return-object p0

    :pswitch_53
    new-array p0, p1, [Ln54;

    return-object p0

    :pswitch_56
    new-array p0, p1, [Ldy3;

    return-object p0

    :pswitch_59
    new-array p0, p1, [Lxl3;

    return-object p0

    :pswitch_5c
    new-array p0, p1, [Lih3;

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
