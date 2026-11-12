.class public final Luz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Luz8;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 9

    new-instance p0, Lorg/chromium/base/library_loader/IRelroLibInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/chromium/base/library_loader/IRelroLibInfo;->b:J

    iput-wide v0, p0, Lorg/chromium/base/library_loader/IRelroLibInfo;->c:J

    iput-wide v0, p0, Lorg/chromium/base/library_loader/IRelroLibInfo;->d:J

    iput-wide v0, p0, Lorg/chromium/base/library_loader/IRelroLibInfo;->e:J

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    const/4 v2, 0x4

    const/4 v3, 0x0

    const v4, 0x7fffffff

    if-lt v1, v2, :cond_99

    :try_start_1e
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    sub-int/2addr v2, v0

    if-lt v2, v1, :cond_2a

    sub-int/2addr v4, v1

    if-gt v0, v4, :cond_a5

    goto/16 :goto_94

    :cond_2a
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/chromium/base/library_loader/IRelroLibInfo;->a:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    sub-int/2addr v2, v0

    if-lt v2, v1, :cond_3b

    sub-int/2addr v4, v1

    if-gt v0, v4, :cond_a5

    goto :goto_94

    :cond_3b
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v5

    iput-wide v5, p0, Lorg/chromium/base/library_loader/IRelroLibInfo;->b:J

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    sub-int/2addr v2, v0

    if-lt v2, v1, :cond_4c

    sub-int/2addr v4, v1

    if-gt v0, v4, :cond_a5

    goto :goto_94

    :cond_4c
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v5

    iput-wide v5, p0, Lorg/chromium/base/library_loader/IRelroLibInfo;->c:J

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    sub-int/2addr v2, v0

    if-lt v2, v1, :cond_5d

    sub-int/2addr v4, v1

    if-gt v0, v4, :cond_a5

    goto :goto_94

    :cond_5d
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v5

    iput-wide v5, p0, Lorg/chromium/base/library_loader/IRelroLibInfo;->d:J

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    sub-int/2addr v2, v0

    if-lt v2, v1, :cond_6e

    sub-int/2addr v4, v1

    if-gt v0, v4, :cond_a5

    goto :goto_94

    :cond_6e
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v5

    iput-wide v5, p0, Lorg/chromium/base/library_loader/IRelroLibInfo;->e:J

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    sub-int/2addr v2, v0

    if-lt v2, v1, :cond_7f

    sub-int/2addr v4, v1

    if-gt v0, v4, :cond_a5

    goto :goto_94

    :cond_7f
    sget-object v2, Landroid/os/ParcelFileDescriptor;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    if-eqz v5, :cond_8c

    invoke-interface {v2, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_8d

    :cond_8c
    move-object v2, v3

    :goto_8d
    check-cast v2, Landroid/os/ParcelFileDescriptor;

    iput-object v2, p0, Lorg/chromium/base/library_loader/IRelroLibInfo;->f:Landroid/os/ParcelFileDescriptor;
    :try_end_91
    .catchall {:try_start_1e .. :try_end_91} :catchall_a1

    sub-int/2addr v4, v1

    if-gt v0, v4, :cond_a5

    :goto_94
    add-int/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    return-object p0

    :cond_99
    :try_start_99
    new-instance p0, Landroid/os/BadParcelableException;

    const-string v2, "Parcelable too small"

    invoke-direct {p0, v2}, Landroid/os/BadParcelableException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_a1
    .catchall {:try_start_99 .. :try_end_a1} :catchall_a1

    :catchall_a1
    move-exception p0

    sub-int/2addr v4, v1

    if-le v0, v4, :cond_a9

    :cond_a5
    invoke-static {}, Ls49;->c()V

    return-object v3

    :cond_a9
    add-int/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    throw p0
.end method

.method private final b(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 22

    move-object/from16 v0, p1

    invoke-virtual {v0}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    sget-object v3, Leya;->h:Lh58;

    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {v3, v4}, Lh58;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Leya;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_d7

    const/4 v4, 0x1

    if-eq v3, v4, :cond_c3

    const/4 v5, 0x2

    const-class v6, Landroid/graphics/PointF;

    const-class v7, Loel;

    if-eq v3, v5, :cond_5f

    const/4 v4, 0x3

    if-eq v3, v4, :cond_42

    const/4 v4, 0x4

    if-ne v3, v4, :cond_3d

    new-instance v3, Lf76;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    sget-object v5, Landroid/graphics/PointF;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v0, v4, v5}, Landroid/os/Parcel;->readTypedList(Ljava/util/List;Landroid/os/Parcelable$Creator;)V

    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-direct {v3, v4, v0}, Lf76;-><init>(Ljava/util/List;I)V

    goto/16 :goto_e6

    :cond_3d
    invoke-static {}, Lh9o;->p()V

    const/4 v0, 0x0

    return-object v0

    :cond_42
    new-instance v3, Lox7;

    invoke-virtual {v0}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v7}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    invoke-static {v0, v5, v6}, Lkfo;->b0(Landroid/os/Parcel;Ljava/lang/ClassLoader;Ljava/lang/Class;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Landroid/graphics/PointF;

    invoke-virtual {v0}, Landroid/os/Parcel;->readFloat()F

    move-result v6

    invoke-virtual {v0}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    invoke-direct {v3, v4, v5, v6, v0}, Lox7;-><init>(Ljava/lang/String;Landroid/graphics/PointF;FF)V

    goto/16 :goto_e6

    :cond_5f
    move-object v3, v7

    new-instance v7, Loel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-static {v0, v3, v6}, Lkfo;->b0(Landroid/os/Parcel;Ljava/lang/ClassLoader;Ljava/lang/Class;)Landroid/os/Parcelable;

    move-result-object v3

    move-object v9, v3

    check-cast v9, Landroid/graphics/PointF;

    invoke-virtual {v0}, Landroid/os/Parcel;->readFloat()F

    move-result v10

    invoke-virtual {v0}, Landroid/os/Parcel;->readFloat()F

    move-result v11

    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    move-result v12

    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    move-result v3

    const/4 v5, 0x0

    if-eqz v3, :cond_86

    move v13, v4

    goto :goto_87

    :cond_86
    move v13, v5

    :goto_87
    invoke-virtual {v6}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-static {v0, v3, v6}, Lkfo;->b0(Landroid/os/Parcel;Ljava/lang/ClassLoader;Ljava/lang/Class;)Landroid/os/Parcelable;

    move-result-object v3

    move-object v14, v3

    check-cast v14, Landroid/graphics/PointF;

    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    move-result v15

    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_9f

    move/from16 v16, v4

    goto :goto_a1

    :cond_9f
    move/from16 v16, v5

    :goto_a1
    sget-object v3, Lnil;->e:Lh58;

    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v3, v6}, Lh58;->get(I)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v17, v3

    check-cast v17, Lnil;

    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_b8

    move/from16 v18, v4

    goto :goto_ba

    :cond_b8
    move/from16 v18, v5

    :goto_ba
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    move-result v19

    invoke-direct/range {v7 .. v19}, Loel;-><init>(Ljava/lang/String;Landroid/graphics/PointF;FFIZLandroid/graphics/PointF;IZLnil;ZI)V

    move-object v3, v7

    goto :goto_e6

    :cond_c3
    new-instance v3, Lv6g;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    sget-object v5, Landroid/graphics/PointF;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v0, v4, v5}, Landroid/os/Parcel;->readTypedList(Ljava/util/List;Landroid/os/Parcelable$Creator;)V

    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    move-result v0

    invoke-direct {v3, v4, v0}, Lv6g;-><init>(Ljava/util/List;I)V

    goto :goto_e6

    :cond_d7
    new-instance v3, Lok3;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    sget-object v5, Landroid/graphics/PointF;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v0, v4, v5}, Landroid/os/Parcel;->readTypedList(Ljava/util/List;Landroid/os/Parcelable$Creator;)V

    invoke-direct {v3, v4}, Lok3;-><init>(Ljava/util/List;)V

    :goto_e6
    iput-wide v1, v3, Lfya;->b:J

    return-object v3
.end method


# virtual methods
.method public final createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Luz8;->a:B

    const v1, 0xffffff

    const/high16 v2, -0x40800000    # -1.0f

    const/4 v3, -0x1

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    const-string v6, "Parcelable too small"

    const/4 v7, 0x4

    const v8, 0x7fffffff

    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    packed-switch v0, :pswitch_data_78e

    new-instance p0, Lhdb;

    const-class v0, Landroid/content/IntentSender;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/IntentSender;

    const-class v1, Landroid/content/Intent;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/content/Intent;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-direct {p0, v0, v1, v2, p1}, Lhdb;-><init>(Landroid/content/IntentSender;Landroid/content/Intent;II)V

    return-object p0

    :pswitch_3d
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Ld3b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_46
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    new-instance p0, Lm2b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_4f
    invoke-direct {p0, p1}, Luz8;->b(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_54
    new-instance v0, Lbxa;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p0

    if-eqz p0, :cond_5e

    move v1, v9

    goto :goto_5f

    :cond_5e
    move v1, v10

    :goto_5f
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p0

    if-eqz p0, :cond_67

    move v2, v9

    goto :goto_68

    :cond_67
    move v2, v10

    :goto_68
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p0

    if-eqz p0, :cond_70

    move v3, v9

    goto :goto_71

    :cond_70
    move v3, v10

    :goto_71
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p0

    if-eqz p0, :cond_79

    move v4, v9

    goto :goto_7a

    :cond_79
    move v4, v10

    :goto_7a
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p0

    if-eqz p0, :cond_82

    move v5, v9

    goto :goto_83

    :cond_82
    move v5, v10

    :goto_83
    invoke-direct/range {v0 .. v5}, Lbxa;-><init>(ZZZZZ)V

    return-object v0

    :pswitch_87
    invoke-direct {p0, p1}, Luz8;->a(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_8c
    new-instance p0, Lorg/chromium/base/process_launcher/IFileDescriptorInfo;

    invoke-direct {p0}, Lorg/chromium/base/process_launcher/IFileDescriptorInfo;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-lt v2, v7, :cond_f4

    :try_start_9b
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_a6

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_ff

    goto :goto_ee

    :cond_a6
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lorg/chromium/base/process_launcher/IFileDescriptorInfo;->a:I

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_b7

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_ff

    goto :goto_ee

    :cond_b7
    sget-object v0, Landroid/os/ParcelFileDescriptor;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_c4

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_c5

    :cond_c4
    move-object v0, v11

    :goto_c5
    check-cast v0, Landroid/os/ParcelFileDescriptor;

    iput-object v0, p0, Lorg/chromium/base/process_launcher/IFileDescriptorInfo;->b:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_d4

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_ff

    goto :goto_ee

    :cond_d4
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v3

    iput-wide v3, p0, Lorg/chromium/base/process_launcher/IFileDescriptorInfo;->c:J

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_e5

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_ff

    goto :goto_ee

    :cond_e5
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v3

    iput-wide v3, p0, Lorg/chromium/base/process_launcher/IFileDescriptorInfo;->d:J
    :try_end_eb
    .catchall {:try_start_9b .. :try_end_eb} :catchall_fa

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_ff

    :goto_ee
    add-int/2addr v1, v2

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    move-object v11, p0

    goto :goto_102

    :cond_f4
    :try_start_f4
    new-instance p0, Landroid/os/BadParcelableException;

    invoke-direct {p0, v6}, Landroid/os/BadParcelableException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_fa
    .catchall {:try_start_f4 .. :try_end_fa} :catchall_fa

    :catchall_fa
    move-exception v0

    move-object p0, v0

    sub-int/2addr v8, v2

    if-le v1, v8, :cond_103

    :cond_ff
    invoke-static {}, Ls49;->c()V

    :goto_102
    return-object v11

    :cond_103
    add-int/2addr v1, v2

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    throw p0

    :pswitch_108
    new-instance p0, Lorg/chromium/base/IDeviceInfo;

    invoke-direct {p0}, Lorg/chromium/base/IDeviceInfo;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-lt v2, v7, :cond_1c8

    :try_start_117
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_123

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_1d3

    goto/16 :goto_1c2

    :cond_123
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IDeviceInfo;->a:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_135

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_1d3

    goto/16 :goto_1c2

    :cond_135
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_13d

    move v0, v9

    goto :goto_13e

    :cond_13d
    move v0, v10

    :goto_13e
    iput-boolean v0, p0, Lorg/chromium/base/IDeviceInfo;->b:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_14c

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_1d3

    goto/16 :goto_1c2

    :cond_14c
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_154

    move v0, v9

    goto :goto_155

    :cond_154
    move v0, v10

    :goto_155
    iput-boolean v0, p0, Lorg/chromium/base/IDeviceInfo;->c:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_163

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_1d3

    goto/16 :goto_1c2

    :cond_163
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_16b

    move v0, v9

    goto :goto_16c

    :cond_16b
    move v0, v10

    :goto_16c
    iput-boolean v0, p0, Lorg/chromium/base/IDeviceInfo;->d:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_179

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_1d3

    goto :goto_1c2

    :cond_179
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_181

    move v0, v9

    goto :goto_182

    :cond_181
    move v0, v10

    :goto_182
    iput-boolean v0, p0, Lorg/chromium/base/IDeviceInfo;->e:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_18f

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_1d3

    goto :goto_1c2

    :cond_18f
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lorg/chromium/base/IDeviceInfo;->f:I

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_1a0

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_1d3

    goto :goto_1c2

    :cond_1a0
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_1a8

    move v0, v9

    goto :goto_1a9

    :cond_1a8
    move v0, v10

    :goto_1a9
    iput-boolean v0, p0, Lorg/chromium/base/IDeviceInfo;->g:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_1b6

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_1d3

    goto :goto_1c2

    :cond_1b6
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-nez v0, :cond_1bd

    move v9, v10

    :cond_1bd
    iput-boolean v9, p0, Lorg/chromium/base/IDeviceInfo;->h:Z
    :try_end_1bf
    .catchall {:try_start_117 .. :try_end_1bf} :catchall_1ce

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_1d3

    :goto_1c2
    add-int/2addr v1, v2

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    move-object v11, p0

    goto :goto_1d6

    :cond_1c8
    :try_start_1c8
    new-instance p0, Landroid/os/BadParcelableException;

    invoke-direct {p0, v6}, Landroid/os/BadParcelableException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1ce
    .catchall {:try_start_1c8 .. :try_end_1ce} :catchall_1ce

    :catchall_1ce
    move-exception v0

    move-object p0, v0

    sub-int/2addr v8, v2

    if-le v1, v8, :cond_1d7

    :cond_1d3
    invoke-static {}, Ls49;->c()V

    :goto_1d6
    return-object v11

    :cond_1d7
    add-int/2addr v1, v2

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    throw p0

    :pswitch_1dc
    new-instance p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;

    invoke-direct {p0}, Lorg/chromium/base/process_launcher/IChildProcessArgs;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-lt v2, v7, :cond_2ed

    :try_start_1eb
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_1f7

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_2f8

    goto/16 :goto_2e7

    :cond_1f7
    sget-object v0, Lorg/chromium/base/IApkInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_204

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_205

    :cond_204
    move-object v0, v11

    :goto_205
    check-cast v0, Lorg/chromium/base/IApkInfo;

    iput-object v0, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->a:Lorg/chromium/base/IApkInfo;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_215

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_2f8

    goto/16 :goto_2e7

    :cond_215
    sget-object v0, Lorg/chromium/base/IAndroidInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_222

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_223

    :cond_222
    move-object v0, v11

    :goto_223
    check-cast v0, Lorg/chromium/base/IAndroidInfo;

    iput-object v0, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->b:Lorg/chromium/base/IAndroidInfo;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_233

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_2f8

    goto/16 :goto_2e7

    :cond_233
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-nez v0, :cond_23a

    move v9, v10

    :cond_23a
    iput-boolean v9, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->c:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_248

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_2f8

    goto/16 :goto_2e7

    :cond_248
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->d:I

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_25a

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_2f8

    goto/16 :goto_2e7

    :cond_25a
    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->e:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_26c

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_2f8

    goto/16 :goto_2e7

    :cond_26c
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->f:I

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_27e

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_2f8

    goto/16 :goto_2e7

    :cond_27e
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v3

    iput-wide v3, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->g:J

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_28f

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_2f8

    goto :goto_2e7

    :cond_28f
    sget-object v0, Lorg/chromium/base/IDeviceInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_29c

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_29d

    :cond_29c
    move-object v0, v11

    :goto_29d
    check-cast v0, Lorg/chromium/base/IDeviceInfo;

    iput-object v0, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->h:Lorg/chromium/base/IDeviceInfo;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_2ac

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_2f8

    goto :goto_2e7

    :cond_2ac
    sget-object v0, Lorg/chromium/base/process_launcher/IFileDescriptorInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->createTypedArray(Landroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/chromium/base/process_launcher/IFileDescriptorInfo;

    iput-object v0, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->i:[Lorg/chromium/base/process_launcher/IFileDescriptorInfo;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_2c1

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_2f8

    goto :goto_2e7

    :cond_2c1
    sget-object v0, Lorg/chromium/base/library_loader/IRelroLibInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_2ce

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_2cf

    :cond_2ce
    move-object v0, v11

    :goto_2cf
    check-cast v0, Lorg/chromium/base/library_loader/IRelroLibInfo;

    iput-object v0, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->j:Lorg/chromium/base/library_loader/IRelroLibInfo;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_2de

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_2f8

    goto :goto_2e7

    :cond_2de
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lorg/chromium/base/process_launcher/IChildProcessArgs;->k:I
    :try_end_2e4
    .catchall {:try_start_1eb .. :try_end_2e4} :catchall_2f3

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_2f8

    :goto_2e7
    add-int/2addr v1, v2

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    move-object v11, p0

    goto :goto_2fb

    :cond_2ed
    :try_start_2ed
    new-instance p0, Landroid/os/BadParcelableException;

    invoke-direct {p0, v6}, Landroid/os/BadParcelableException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_2f3
    .catchall {:try_start_2ed .. :try_end_2f3} :catchall_2f3

    :catchall_2f3
    move-exception v0

    move-object p0, v0

    sub-int/2addr v8, v2

    if-le v1, v8, :cond_2fc

    :cond_2f8
    invoke-static {}, Ls49;->c()V

    :goto_2fb
    return-object v11

    :cond_2fc
    add-int/2addr v1, v2

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    throw p0

    :pswitch_301
    new-instance p0, Lorg/chromium/base/IApkInfo;

    invoke-direct {p0}, Lorg/chromium/base/IApkInfo;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-lt v2, v7, :cond_3e1

    :try_start_310
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_31c

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_3ec

    goto/16 :goto_3db

    :cond_31c
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IApkInfo;->a:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_32e

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_3ec

    goto/16 :goto_3db

    :cond_32e
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IApkInfo;->b:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_340

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_3ec

    goto/16 :goto_3db

    :cond_340
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IApkInfo;->c:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_352

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_3ec

    goto/16 :goto_3db

    :cond_352
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IApkInfo;->d:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_364

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_3ec

    goto/16 :goto_3db

    :cond_364
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_36c

    move v0, v9

    goto :goto_36d

    :cond_36c
    move v0, v10

    :goto_36d
    iput-boolean v0, p0, Lorg/chromium/base/IApkInfo;->e:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_37a

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_3ec

    goto :goto_3db

    :cond_37a
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-nez v0, :cond_381

    move v9, v10

    :cond_381
    iput-boolean v9, p0, Lorg/chromium/base/IApkInfo;->f:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_38e

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_3ec

    goto :goto_3db

    :cond_38e
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IApkInfo;->g:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_39f

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_3ec

    goto :goto_3db

    :cond_39f
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IApkInfo;->h:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_3b0

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_3ec

    goto :goto_3db

    :cond_3b0
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IApkInfo;->i:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_3c1

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_3ec

    goto :goto_3db

    :cond_3c1
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IApkInfo;->j:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_3d2

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_3ec

    goto :goto_3db

    :cond_3d2
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lorg/chromium/base/IApkInfo;->k:I
    :try_end_3d8
    .catchall {:try_start_310 .. :try_end_3d8} :catchall_3e7

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_3ec

    :goto_3db
    add-int/2addr v1, v2

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    move-object v11, p0

    goto :goto_3ef

    :cond_3e1
    :try_start_3e1
    new-instance p0, Landroid/os/BadParcelableException;

    invoke-direct {p0, v6}, Landroid/os/BadParcelableException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_3e7
    .catchall {:try_start_3e1 .. :try_end_3e7} :catchall_3e7

    :catchall_3e7
    move-exception v0

    move-object p0, v0

    sub-int/2addr v8, v2

    if-le v1, v8, :cond_3f0

    :cond_3ec
    invoke-static {}, Ls49;->c()V

    :goto_3ef
    return-object v11

    :cond_3f0
    add-int/2addr v1, v2

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    throw p0

    :pswitch_3f5
    new-instance p0, Lorg/chromium/base/IAndroidInfo;

    invoke-direct {p0}, Lorg/chromium/base/IAndroidInfo;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-lt v2, v7, :cond_53c

    :try_start_404
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_410

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_547

    goto/16 :goto_536

    :cond_410
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IAndroidInfo;->a:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_422

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_547

    goto/16 :goto_536

    :cond_422
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IAndroidInfo;->b:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_434

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_547

    goto/16 :goto_536

    :cond_434
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IAndroidInfo;->c:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_446

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_547

    goto/16 :goto_536

    :cond_446
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IAndroidInfo;->d:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_458

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_547

    goto/16 :goto_536

    :cond_458
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IAndroidInfo;->e:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_46a

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_547

    goto/16 :goto_536

    :cond_46a
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IAndroidInfo;->f:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_47c

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_547

    goto/16 :goto_536

    :cond_47c
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IAndroidInfo;->g:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_48e

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_547

    goto/16 :goto_536

    :cond_48e
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IAndroidInfo;->h:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_4a0

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_547

    goto/16 :goto_536

    :cond_4a0
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IAndroidInfo;->i:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_4b2

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_547

    goto/16 :goto_536

    :cond_4b2
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-nez v0, :cond_4b9

    move v9, v10

    :cond_4b9
    iput-boolean v9, p0, Lorg/chromium/base/IAndroidInfo;->j:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_4c7

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_547

    goto/16 :goto_536

    :cond_4c7
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IAndroidInfo;->k:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_4d8

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_547

    goto :goto_536

    :cond_4d8
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IAndroidInfo;->l:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_4e9

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_547

    goto :goto_536

    :cond_4e9
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lorg/chromium/base/IAndroidInfo;->m:I

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_4fa

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_547

    goto :goto_536

    :cond_4fa
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lorg/chromium/base/IAndroidInfo;->n:I

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_50b

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_547

    goto :goto_536

    :cond_50b
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IAndroidInfo;->o:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_51c

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_547

    goto :goto_536

    :cond_51c
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IAndroidInfo;->p:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    sub-int/2addr v0, v1

    if-lt v0, v2, :cond_52d

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_547

    goto :goto_536

    :cond_52d
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/IAndroidInfo;->q:Ljava/lang/String;
    :try_end_533
    .catchall {:try_start_404 .. :try_end_533} :catchall_542

    sub-int/2addr v8, v2

    if-gt v1, v8, :cond_547

    :goto_536
    add-int/2addr v1, v2

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    move-object v11, p0

    goto :goto_54a

    :cond_53c
    :try_start_53c
    new-instance p0, Landroid/os/BadParcelableException;

    invoke-direct {p0, v6}, Landroid/os/BadParcelableException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_542
    .catchall {:try_start_53c .. :try_end_542} :catchall_542

    :catchall_542
    move-exception v0

    move-object p0, v0

    sub-int/2addr v8, v2

    if-le v1, v8, :cond_54b

    :cond_547
    invoke-static {}, Ls49;->c()V

    :goto_54a
    return-object v11

    :cond_54b
    add-int/2addr v1, v2

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    throw p0

    :pswitch_550
    new-instance p0, Ltca;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lsca;->valueOf(Ljava/lang/String;)Lsca;

    move-result-object p1

    invoke-direct {p0, p1}, Ltca;-><init>(Lsca;)V

    return-object p0

    :pswitch_55e
    new-instance p0, Lxba;

    invoke-direct {p0, p1}, Lxba;-><init>(Landroid/os/Parcel;)V

    return-object p0

    :pswitch_564
    new-instance p0, Loba;

    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-direct {p0, v0, p1}, Loba;-><init>([II)V

    return-object p0

    :pswitch_572
    new-instance p0, Lbaa;

    sget-object v0, Loba;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Loba;

    invoke-direct {p0, p1}, Lbaa;-><init>(Loba;)V

    return-object p0

    :pswitch_580
    new-instance p0, Ldw9;

    sget-object v0, Loba;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Loba;

    invoke-direct {p0, p1}, Ldw9;-><init>(Loba;)V

    return-object p0

    :pswitch_58e
    new-instance p0, Landroidx/fragment/app/y;

    invoke-direct {p0, p1}, Landroidx/fragment/app/y;-><init>(Landroid/os/Parcel;)V

    return-object p0

    :pswitch_594
    new-instance p0, Lem9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v11, p0, Lem9;->e:Ljava/lang/String;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lem9;->f:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lem9;->g:Ljava/util/ArrayList;

    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lem9;->a:Ljava/util/ArrayList;

    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lem9;->b:Ljava/util/ArrayList;

    sget-object v0, Landroidx/fragment/app/b;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->createTypedArray(Landroid/os/Parcelable$Creator;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroidx/fragment/app/b;

    iput-object v0, p0, Lem9;->c:[Landroidx/fragment/app/b;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lem9;->d:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lem9;->e:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lem9;->f:Ljava/util/ArrayList;

    sget-object v0, Luz2;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lem9;->g:Ljava/util/ArrayList;

    sget-object v0, Lyl9;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Lem9;->h:Ljava/util/ArrayList;

    return-object p0

    :pswitch_5e2
    new-instance p0, Lyl9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lyl9;->a:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lyl9;->b:I

    return-object p0

    :pswitch_5f4
    new-instance p0, Lc89;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lc89;->a:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lc89;->b:I

    return-object p0

    :pswitch_606
    new-instance p0, La89;

    const/4 v0, -0x2

    invoke-direct {p0, v0, v0}, Llph;-><init>(II)V

    iput v5, p0, La89;->e:F

    iput v4, p0, La89;->f:F

    iput v3, p0, La89;->g:I

    iput v2, p0, La89;->h:F

    iput v1, p0, La89;->k:I

    iput v1, p0, La89;->l:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, La89;->e:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, La89;->f:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, La89;->g:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, La89;->h:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, La89;->i:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, La89;->j:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, La89;->k:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, La89;->l:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-nez v0, :cond_64f

    move v9, v10

    :cond_64f
    iput-boolean v9, p0, La89;->m:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    return-object p0

    :pswitch_676
    new-instance p0, Ly79;

    invoke-direct {p0, v10, v10}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    iput v9, p0, Ly79;->a:I

    iput v5, p0, Ly79;->b:F

    iput v4, p0, Ly79;->c:F

    iput v3, p0, Ly79;->d:I

    iput v2, p0, Ly79;->e:F

    iput v3, p0, Ly79;->f:I

    iput v3, p0, Ly79;->g:I

    iput v1, p0, Ly79;->h:I

    iput v1, p0, Ly79;->i:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Ly79;->a:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Ly79;->b:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Ly79;->c:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Ly79;->d:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Ly79;->e:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Ly79;->f:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Ly79;->g:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Ly79;->h:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Ly79;->i:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-nez v0, :cond_6ca

    move v9, v10

    :cond_6ca
    iput-boolean v9, p0, Ly79;->j:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    return-object p0

    :pswitch_6f1
    new-instance p0, Lb29;

    sget-object v0, Loba;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Loba;

    invoke-direct {p0, p1}, Lb29;-><init>(Loba;)V

    return-object p0

    :pswitch_6ff
    new-instance p0, Lw09;

    const-class v0, Lw09;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/view/autofill/AutofillValue;

    invoke-direct {p0, p1}, Lw09;-><init>(Landroid/view/autofill/AutofillValue;)V

    return-object p0

    :pswitch_711
    new-instance p0, Lv09;

    const-class v0, Lv09;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/view/autofill/AutofillValue;

    invoke-direct {p0, p1}, Lv09;-><init>(Landroid/view/autofill/AutofillValue;)V

    return-object p0

    :pswitch_723
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    sget-object p0, Lu09;->a:Lu09;

    return-object p0

    :pswitch_729
    new-instance p0, Lt09;

    const-class v0, Lt09;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/view/autofill/AutofillValue;

    invoke-direct {p0, p1}, Lt09;-><init>(Landroid/view/autofill/AutofillValue;)V

    return-object p0

    :pswitch_73b
    new-instance p0, Ls09;

    const-class v0, Ls09;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/view/autofill/AutofillValue;

    invoke-direct {p0, p1}, Ls09;-><init>(Landroid/view/autofill/AutofillValue;)V

    return-object p0

    :pswitch_74d
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lp09;->valueOf(Ljava/lang/String;)Lp09;

    move-result-object p0

    return-object p0

    :pswitch_756
    new-instance v0, Lvz8;

    const-class p0, Lvz8;

    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/view/autofill/AutofillId;

    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lx09;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lnf2;->valueOf(Ljava/lang/String;)Lnf2;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p0

    move-object v4, p0

    check-cast v4, Lp09;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p0

    if-eqz p0, :cond_789

    move v5, v9

    goto :goto_78a

    :cond_789
    move v5, v10

    :goto_78a
    invoke-direct/range {v0 .. v5}, Lvz8;-><init>(Landroid/view/autofill/AutofillId;Lx09;Lnf2;Lp09;Z)V

    return-object v0

    :pswitch_data_78e
    .packed-switch 0x0
        :pswitch_756
        :pswitch_74d
        :pswitch_73b
        :pswitch_729
        :pswitch_723
        :pswitch_711
        :pswitch_6ff
        :pswitch_6f1
        :pswitch_676
        :pswitch_606
        :pswitch_5f4
        :pswitch_5e2
        :pswitch_594
        :pswitch_58e
        :pswitch_580
        :pswitch_572
        :pswitch_564
        :pswitch_55e
        :pswitch_550
        :pswitch_3f5
        :pswitch_301
        :pswitch_1dc
        :pswitch_108
        :pswitch_8c
        :pswitch_87
        :pswitch_54
        :pswitch_4f
        :pswitch_46
        :pswitch_3d
    .end packed-switch
.end method

.method public final newArray(I)[Ljava/lang/Object;
    .registers 2

    iget-byte p0, p0, Luz8;->a:B

    packed-switch p0, :pswitch_data_60

    new-array p0, p1, [Lhdb;

    return-object p0

    :pswitch_8
    new-array p0, p1, [Ld3b;

    return-object p0

    :pswitch_b
    new-array p0, p1, [Lm2b;

    return-object p0

    :pswitch_e
    new-array p0, p1, [Lfya;

    return-object p0

    :pswitch_11
    new-array p0, p1, [Lbxa;

    return-object p0

    :pswitch_14
    new-array p0, p1, [Lorg/chromium/base/library_loader/IRelroLibInfo;

    return-object p0

    :pswitch_17
    new-array p0, p1, [Lorg/chromium/base/process_launcher/IFileDescriptorInfo;

    return-object p0

    :pswitch_1a
    new-array p0, p1, [Lorg/chromium/base/IDeviceInfo;

    return-object p0

    :pswitch_1d
    new-array p0, p1, [Lorg/chromium/base/process_launcher/IChildProcessArgs;

    return-object p0

    :pswitch_20
    new-array p0, p1, [Lorg/chromium/base/IApkInfo;

    return-object p0

    :pswitch_23
    new-array p0, p1, [Lorg/chromium/base/IAndroidInfo;

    return-object p0

    :pswitch_26
    new-array p0, p1, [Ltca;

    return-object p0

    :pswitch_29
    new-array p0, p1, [Lxba;

    return-object p0

    :pswitch_2c
    new-array p0, p1, [Loba;

    return-object p0

    :pswitch_2f
    new-array p0, p1, [Lbaa;

    return-object p0

    :pswitch_32
    new-array p0, p1, [Ldw9;

    return-object p0

    :pswitch_35
    new-array p0, p1, [Landroidx/fragment/app/y;

    return-object p0

    :pswitch_38
    new-array p0, p1, [Lem9;

    return-object p0

    :pswitch_3b
    new-array p0, p1, [Lyl9;

    return-object p0

    :pswitch_3e
    new-array p0, p1, [Lc89;

    return-object p0

    :pswitch_41
    new-array p0, p1, [La89;

    return-object p0

    :pswitch_44
    new-array p0, p1, [Ly79;

    return-object p0

    :pswitch_47
    new-array p0, p1, [Lb29;

    return-object p0

    :pswitch_4a
    new-array p0, p1, [Lw09;

    return-object p0

    :pswitch_4d
    new-array p0, p1, [Lv09;

    return-object p0

    :pswitch_50
    new-array p0, p1, [Lu09;

    return-object p0

    :pswitch_53
    new-array p0, p1, [Lt09;

    return-object p0

    :pswitch_56
    new-array p0, p1, [Ls09;

    return-object p0

    :pswitch_59
    new-array p0, p1, [Lp09;

    return-object p0

    :pswitch_5c
    new-array p0, p1, [Lvz8;

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
