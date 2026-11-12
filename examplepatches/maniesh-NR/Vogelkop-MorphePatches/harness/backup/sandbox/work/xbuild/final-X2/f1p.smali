.class public Lf1p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lssf;
.implements Lzln;
.implements Lbd6;
.implements Lp9n;
.implements Llba;
.implements Lqxd;
.implements Lox8;
.implements Lrba;
.implements Lm82;


# static fields
.field public static volatile c:Lf1p;

.field public static final d:[C

.field public static final e:[I

.field public static final f:Lf1p;


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 2

    const/4 v0, 0x5

    new-array v0, v0, [C

    fill-array-data v0, :array_1e

    sput-object v0, Lf1p;->d:[C

    const v0, 0x101013b

    const v1, 0x101013c

    filled-new-array {v0, v1}, [I

    move-result-object v0

    sput-object v0, Lf1p;->e:[I

    new-instance v0, Lf1p;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lf1p;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sput-object v0, Lf1p;->f:Lf1p;

    return-void

    nop

    :array_1e
    .array-data 2
        0x2cs
        0x2es
        0x2ds
        0x5fs
        0x20s
    .end array-data
.end method

.method public constructor <init>(B)V
    .registers 5

    const/4 v0, 0x0

    sparse-switch p1, :sswitch_data_6e

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Li7f;

    invoke-direct {p1}, Li7f;-><init>()V

    iput-object p1, p0, Lf1p;->a:Ljava/lang/Object;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lf1p;->b:Ljava/lang/Object;

    return-void

    :sswitch_16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object p1, p0, Lf1p;->a:Ljava/lang/Object;

    new-instance p1, Landroidx/collection/ArrayMap;

    invoke-direct {p1, v0}, Lhkj;-><init>(I)V

    iput-object p1, p0, Lf1p;->b:Ljava/lang/Object;

    return-void

    :sswitch_28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lf1p;->a:Ljava/lang/Object;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lf1p;->b:Ljava/lang/Object;

    return-void

    :sswitch_3a
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    const/4 v1, 0x5

    const/4 v2, 0x1

    invoke-static {v0, v2, p1, v1}, Lipe;->c(IILh04;I)Ljdj;

    move-result-object p1

    iput-object p1, p0, Lf1p;->a:Ljava/lang/Object;

    invoke-static {p1}, La26;->i(Ljdj;)Lplh;

    move-result-object p1

    iput-object p1, p0, Lf1p;->b:Ljava/lang/Object;

    return-void

    :sswitch_4d
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 p1, 0x10

    new-array v0, p1, [I

    iput-object v0, p0, Lf1p;->a:Ljava/lang/Object;

    new-array p1, p1, [I

    iput-object p1, p0, Lf1p;->b:Ljava/lang/Object;

    return-void

    :sswitch_5b
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Losh;

    invoke-direct {p1}, Landroid/hardware/camera2/CameraCaptureSession;-><init>()V

    iput-object p1, p0, Lf1p;->a:Ljava/lang/Object;

    sget-object p1, Ll08;->a:Ll08;

    invoke-static {p1}, Lc26;->k(Ljava/lang/Object;)Lef2;

    move-result-object p1

    iput-object p1, p0, Lf1p;->b:Ljava/lang/Object;

    return-void

    :sswitch_data_6e
    .sparse-switch
        0x7 -> :sswitch_5b
        0xe -> :sswitch_4d
        0xf -> :sswitch_3a
        0x11 -> :sswitch_28
        0x18 -> :sswitch_16
    .end sparse-switch
.end method

.method public constructor <init>(Landroid/content/Context;B)V
    .registers 5

    packed-switch p2, :pswitch_data_5e

    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lf1p;->a:Ljava/lang/Object;

    .line 119
    new-instance p1, Lpsp;

    .line 120
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 121
    new-instance p2, Lxq0;

    invoke-direct {p2, p1}, Lxq0;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lf1p;->b:Ljava/lang/Object;

    return-void

    .line 122
    :pswitch_19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    const-string p2, "androidx.emoji2.emojipicker.preferences"

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lf1p;->b:Ljava/lang/Object;

    .line 124
    const-string p2, "pref_key_recent_emoji"

    const/4 v1, 0x0

    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_43

    const-string p2, ","

    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object p2

    const/4 v1, 0x6

    invoke-static {p1, p2, v0, v1}, Lkotlin/text/StringsKt;->Y(Ljava/lang/CharSequence;[Ljava/lang/String;II)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_43

    check-cast p1, Ljava/util/Collection;

    .line 125
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_48

    .line 126
    :cond_43
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 127
    :goto_48
    iput-object p2, p0, Lf1p;->a:Ljava/lang/Object;

    return-void

    .line 128
    :pswitch_4b
    new-instance p2, Lesg;

    const/16 v0, 0xc

    invoke-direct {p2, v0}, Lesg;-><init>(B)V

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lf1p;->a:Ljava/lang/Object;

    .line 131
    iput-object p2, p0, Lf1p;->b:Ljava/lang/Object;

    return-void

    :pswitch_data_5e
    .packed-switch 0xb
        :pswitch_4b
        :pswitch_19
    .end packed-switch
.end method

.method public constructor <init>(Landroid/widget/AbsSeekBar;)V
    .registers 2

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    iput-object p1, p0, Lf1p;->a:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .line 116
    iput-object p1, p0, Lf1p;->a:Ljava/lang/Object;

    iput-object p2, p0, Lf1p;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Z)V
    .registers 4

    .line 110
    iput-object p1, p0, Lf1p;->b:Ljava/lang/Object;

    iput-object p2, p0, Lf1p;->a:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lo9d;)V
    .registers 3

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lf1p;->a:Ljava/lang/Object;

    .line 115
    iput-object p1, p0, Lf1p;->b:Ljava/lang/Object;

    return-void
.end method

.method public static a()Lf1p;
    .registers 7

    sget-object v0, Lf1p;->c:Lf1p;

    if-nez v0, :cond_3b

    const-class v0, Lf1p;

    monitor-enter v0

    :try_start_7
    sget-object v1, Lf1p;->c:Lf1p;

    if-nez v1, :cond_35

    new-instance v1, Lf1p;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v1, Lf1p;->a:Ljava/lang/Object;

    new-instance v3, Lb6p;

    invoke-direct {v3}, Lboo;-><init>()V

    iput-object v3, v1, Lf1p;->b:Ljava/lang/Object;

    new-instance v4, Lkxo;

    const/4 v5, 0x1

    invoke-direct {v4, v5}, Lkxo;-><init>(B)V

    new-instance v5, Lkxo;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Lkxo;-><init>(B)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sput-object v1, Lf1p;->c:Lf1p;

    :cond_35
    monitor-exit v0

    goto :goto_3b

    :goto_37
    monitor-exit v0
    :try_end_38
    .catchall {:try_start_7 .. :try_end_38} :catchall_39

    throw v1

    :catchall_39
    move-exception v1

    goto :goto_37

    :cond_3b
    :goto_3b
    sget-object v0, Lf1p;->c:Lf1p;

    return-object v0
.end method

.method public static g(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    :try_start_4
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_a} :catch_b

    return-object p0

    :catch_b
    move-exception p0

    new-instance v0, Ljava/lang/Exception;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Encoding failure. Problem URL encoding input"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static n(Landroid/content/Context;)Lf1p;
    .registers 4

    const-string v0, "generatefid.lock"

    const/4 v1, 0x0

    :try_start_3
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    invoke-direct {v2, p0, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance p0, Ljava/io/RandomAccessFile;

    const-string v0, "rw"

    invoke-direct {p0, v2, v0}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object p0
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_17} :catch_23
    .catch Ljava/lang/Error; {:try_start_3 .. :try_end_17} :catch_23
    .catch Ljava/nio/channels/OverlappingFileLockException; {:try_start_3 .. :try_end_17} :catch_23

    :try_start_17
    invoke-virtual {p0}, Ljava/nio/channels/FileChannel;->lock()Ljava/nio/channels/FileLock;

    move-result-object v0
    :try_end_1b
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_1b} :catch_21
    .catch Ljava/lang/Error; {:try_start_17 .. :try_end_1b} :catch_21
    .catch Ljava/nio/channels/OverlappingFileLockException; {:try_start_17 .. :try_end_1b} :catch_21

    :try_start_1b
    new-instance v2, Lf1p;

    invoke-direct {v2, p0, v0}, Lf1p;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_20} :catch_25
    .catch Ljava/lang/Error; {:try_start_1b .. :try_end_20} :catch_25
    .catch Ljava/nio/channels/OverlappingFileLockException; {:try_start_1b .. :try_end_20} :catch_25

    return-object v2

    :catch_21
    move-object v0, v1

    goto :goto_25

    :catch_23
    move-object p0, v1

    move-object v0, p0

    :catch_25
    :goto_25
    if-eqz v0, :cond_2a

    :try_start_27
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->release()V
    :try_end_2a
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_2a} :catch_2a

    :catch_2a
    :cond_2a
    if-eqz p0, :cond_2f

    :try_start_2c
    invoke-virtual {p0}, Ljava/nio/channels/spi/AbstractInterruptibleChannel;->close()V
    :try_end_2f
    .catch Ljava/io/IOException; {:try_start_2c .. :try_end_2f} :catch_2f

    :catch_2f
    :cond_2f
    return-object v1
.end method


# virtual methods
.method public final A(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;
    .registers 10

    instance-of v0, p1, Landroid/graphics/drawable/LayerDrawable;

    const/4 v1, 0x1

    if-eqz v0, :cond_80

    check-cast p1, Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result p2

    new-array v0, p2, [Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    move v3, v2

    :goto_f
    if-ge v3, p2, :cond_2f

    invoke-virtual {p1, v3}, Landroid/graphics/drawable/LayerDrawable;->getId(I)I

    move-result v4

    invoke-virtual {p1, v3}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    const v6, 0x102000d

    if-eq v4, v6, :cond_25

    const v6, 0x102000f

    if-eq v4, v6, :cond_25

    move v4, v2

    goto :goto_26

    :cond_25
    move v4, v1

    :goto_26
    invoke-virtual {p0, v5, v4}, Lf1p;->A(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    aput-object v4, v0, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    :cond_2f
    new-instance p0, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {p0, v0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    :goto_34
    if-ge v2, p2, :cond_7f

    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getId(I)I

    move-result v0

    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getLayerGravity(I)I

    move-result v0

    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getLayerWidth(I)I

    move-result v0

    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerWidth(II)V

    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getLayerHeight(I)I

    move-result v0

    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerHeight(II)V

    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getLayerInsetLeft(I)I

    move-result v0

    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerInsetLeft(II)V

    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getLayerInsetRight(I)I

    move-result v0

    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerInsetRight(II)V

    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getLayerInsetTop(I)I

    move-result v0

    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerInsetTop(II)V

    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getLayerInsetBottom(I)I

    move-result v0

    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerInsetBottom(II)V

    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getLayerInsetStart(I)I

    move-result v0

    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerInsetStart(II)V

    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getLayerInsetEnd(I)I

    move-result v0

    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerInsetEnd(II)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_34

    :cond_7f
    return-object p0

    :cond_80
    instance-of v0, p1, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v0, :cond_cd

    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    iget-object v2, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Bitmap;

    if-nez v2, :cond_92

    iput-object v0, p0, Lf1p;->b:Ljava/lang/Object;

    :cond_92
    new-instance p0, Landroid/graphics/drawable/ShapeDrawable;

    const/16 v2, 0x8

    new-array v2, v2, [F

    fill-array-data v2, :array_ce

    new-instance v3, Landroid/graphics/drawable/shapes/RoundRectShape;

    const/4 v4, 0x0

    invoke-direct {v3, v2, v4, v4}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    invoke-direct {p0, v3}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    new-instance v2, Landroid/graphics/BitmapShader;

    sget-object v3, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    sget-object v4, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v2, v0, v3, v4}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    invoke-virtual {p0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    invoke-virtual {p0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v0

    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/Paint;->getColorFilter()Landroid/graphics/ColorFilter;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    if-eqz p2, :cond_cc

    new-instance p1, Landroid/graphics/drawable/ClipDrawable;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2, v1}, Landroid/graphics/drawable/ClipDrawable;-><init>(Landroid/graphics/drawable/Drawable;II)V

    return-object p1

    :cond_cc
    return-object p0

    :cond_cd
    return-object p1

    :array_ce
    .array-data 4
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
    .end array-data
.end method

.method public final H(Ljava/io/ByteArrayOutputStream;Lrsf;)V
    .registers 3

    check-cast p2, Lsc3;

    iget-object p0, p2, Lsc3;->b:Lt56;

    sget p2, Lxq0;->d:I

    new-instance p2, Ljava/io/DataOutputStream;

    invoke-direct {p2, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    const/4 p1, 0x2

    :try_start_c
    invoke-virtual {p2, p1}, Ljava/io/DataOutputStream;->writeByte(I)V

    invoke-static {p2, p0}, Lxq0;->c4(Ljava/io/DataOutputStream;Lt56;)V
    :try_end_12
    .catchall {:try_start_c .. :try_end_12} :catchall_16

    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    return-void

    :catchall_16
    move-exception p0

    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    throw p0
.end method

.method public final b()Lrsf;
    .registers 3

    new-instance v0, Lsc3;

    invoke-static {}, Lpsp;->f()Lt56;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lsc3;-><init>(Lf1p;Lt56;)V

    return-object v0
.end method

.method public final c(Lxq3;Lhjm;)V
    .registers 5

    iget-object v0, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast v0, Lqln;

    iget-object v0, v0, Lqln;->k:Lvs8;

    iget-object v0, v0, Lvs8;->b:Lekc;

    check-cast v0, Lpde;

    sget-object v1, Lv08;->a:Lv08;

    invoke-static {v0, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    iget-object p0, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast p0, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$initializeSheetRequest$2$1;

    invoke-interface {p0, p2}, Lmk5;->onFinished(Lhjm;)V

    sget-object p0, Lpk5;->m:Lxq3;

    if-eq p1, p0, :cond_1b

    return-void

    :cond_1b
    const/4 p0, 0x0

    sput-object p0, Lpk5;->m:Lxq3;

    return-void
.end method

.method public final createDataSource()Led6;
    .registers 3

    new-instance v0, Lhn6;

    iget-object v1, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    iget-object p0, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast p0, Lesg;

    invoke-virtual {p0}, Lesg;->createDataSource()Led6;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lhn6;-><init>(Landroid/content/Context;Led6;)V

    return-object v0
.end method

.method public final d()V
    .registers 5

    iget-object p0, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast p0, Lioc;

    iget-object p0, p0, Lioc;->e:Ljava/lang/Object;

    check-cast p0, Lqgf;

    iget-object v0, p0, Lqgf;->a:Landroid/content/Context;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    const-string v2, "external_apps.page_menu_hint.shown"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    iget-object v0, p0, Lqgf;->h:Lf6l;

    if-nez v0, :cond_24

    return-void

    :cond_24
    iget-object v1, p0, Lqgf;->b:Lk6l;

    invoke-virtual {v1, v0}, Lk6l;->x(Lj6l;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lqgf;->h:Lf6l;

    return-void
.end method

.method public final f(Ljava/util/List;)V
    .registers 4

    iget-object v0, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast v0, Luqe;

    iget-object p0, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast p0, Lmsh;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, p1, v1}, Luqe;->k(Lmsh;Ljava/util/List;Z)V

    iget-object v0, v0, Luqe;->h:Luy8;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, p1, v1}, Luy8;->k(Lmsh;Ljava/util/List;Z)V

    return-void
.end method

.method public final getView()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/core/widget/NestedScrollView;

    return-object p0
.end method

.method public final h(Landroid/view/View;)V
    .registers 3

    const v0, 0x7f0a0342

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnw7;

    if-eqz p1, :cond_17

    iget-object v0, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast v0, Lth7;

    invoke-interface {v0}, Lth7;->f()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_17

    iput-object p1, p0, Lf1p;->b:Ljava/lang/Object;

    :cond_17
    return-void
.end method

.method public final i(II)V
    .registers 6

    iget-object p1, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/appbar/AppBarLayout;

    const/4 v0, 0x0

    if-eqz p1, :cond_f

    invoke-virtual {p1}, Landroid/view/View;->isLaidOut()Z

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/android/material/appbar/AppBarLayout;->k(ZZZ)V

    :cond_f
    iget-object p0, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/core/widget/NestedScrollView;

    const/16 p1, 0xfa

    invoke-virtual {p0, v0, p2, p1, v0}, Landroidx/core/widget/NestedScrollView;->B(IIIZ)V

    return-void
.end method

.method public final j()V
    .registers 1

    return-void
.end method

.method public final k(Ln82;Ljava/util/List;)V
    .registers 3

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1c

    const/4 p1, 0x0

    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    instance-of p2, p1, Lmsh;

    if-eqz p2, :cond_1c

    check-cast p1, Lmsh;

    iget-object p2, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast p2, Lbch;

    iget-object p0, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast p0, Luqe;

    invoke-virtual {p2, p1, p0}, Lbch;->b(Lmsh;Luqe;)V

    :cond_1c
    return-void
.end method

.method public final l(Ludg;)V
    .registers 3

    iget-object v0, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/ConcurrentHashMap;

    iget-object p0, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast p0, Lo9d;

    invoke-interface {p0, p1}, Lo9d;->l(Ludg;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final o(Ljava/lang/String;Ljava/lang/String;)V
    .registers 15

    iget-object v0, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    const/16 v10, 0x5b

    const/4 v11, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const-string v4, " !\"#$&\'()+,/:;<=>?@[\\]^`{|}~"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v1, p1

    invoke-static/range {v1 .. v11}, Lokhttp3/internal/url/_UrlKt;->canonicalizeWithCharset$default(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    const/16 v9, 0x5b

    const/4 v10, 0x0

    const/4 v1, 0x0

    const-string v3, " !\"#$&\'()+,/:;<=>?@[\\]^`{|}~"

    const/4 v4, 0x0

    const/4 v8, 0x0

    move-object v0, p2

    invoke-static/range {v0 .. v10}, Lokhttp3/internal/url/_UrlKt;->canonicalizeWithCharset$default(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final p(Ljava/lang/String;)Ljava/lang/String;
    .registers 10

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return-object v0

    :cond_4
    const/4 v1, 0x0

    move-object v3, p1

    move v2, v1

    :goto_7
    if-nez v2, :cond_31

    :try_start_9
    iget-object v2, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x1

    move v6, v1

    :goto_13
    if-ge v6, v4, :cond_2a

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Lboo;

    invoke-virtual {v7, v3}, Lboo;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_25} :catch_2c

    if-nez v3, :cond_28

    move v5, v1

    :cond_28
    move-object v3, v7

    goto :goto_13

    :cond_2a
    move v2, v5

    goto :goto_7

    :catch_2c
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_32

    :cond_31
    move-object v0, v3

    :goto_32
    :try_start_32
    const-string p0, "UTF-8"

    invoke-static {v0, p0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_38} :catch_39

    return-object p0

    :catch_39
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    return-object p1
.end method

.method public final q(Landroid/content/Intent;ILax4;Ljava/lang/String;)Lbx4;
    .registers 13

    new-instance v0, Lbx4;

    iget-object v1, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    iget-object p0, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast p0, Liw4;

    iget-object v4, p0, Liw4;->b:Landroid/os/Handler;

    iget-object v5, p0, Liw4;->c:Lk31;

    move-object v2, p1

    move v3, p2

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v0 .. v7}, Lbx4;-><init>(Landroid/content/Context;Landroid/content/Intent;ILandroid/os/Handler;Lk31;Lax4;Ljava/lang/String;)V

    return-object v0
.end method

.method public final r(Z)Lxrf;
    .registers 9

    iget-object v0, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast v0, Lru9;

    iget-object p0, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast p0, Lvx;

    invoke-virtual {p0}, Lvx;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld75;

    iget-object v1, p0, Ld75;->c:Ljava/lang/String;

    iget-object v2, p0, Ld75;->b:Lo65;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_1a

    const-string v1, "wyYok20KneVh2y"

    :cond_1a
    iget-object v3, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v4, "cmp_consent_settings_id"

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_2b

    new-instance p0, Lxrf;

    invoke-direct {p0, v1, v2}, Lxrf;-><init>(Ljava/lang/String;Lo65;)V

    return-object p0

    :cond_2b
    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    const-string v6, "latest"

    if-nez v4, :cond_47

    if-eqz p1, :cond_3b

    new-instance p0, Lxrf;

    invoke-direct {p0, v1, v2}, Lxrf;-><init>(Ljava/lang/String;Lo65;)V

    return-object p0

    :cond_3b
    new-instance p0, Lxrf;

    new-instance p1, Lo65;

    const/4 v0, -0x1

    invoke-direct {p1, v0, v0, v0, v6}, Lo65;-><init>(IIILjava/lang/String;)V

    invoke-direct {p0, v3, p1}, Lxrf;-><init>(Ljava/lang/String;Lo65;)V

    return-object p0

    :cond_47
    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v3, "cmp_consent_config_version"

    invoke-interface {v0, v3, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_53

    const-string v0, ""

    :cond_53
    :try_start_53
    invoke-static {v0}, Luup;->p(Ljava/lang/String;)Lo65;

    move-result-object v5
    :try_end_57
    .catchall {:try_start_53 .. :try_end_57} :catchall_57

    :catchall_57
    if-eqz v5, :cond_91

    if-nez p1, :cond_8d

    iget-object p0, p0, Ld75;->a:Lo65;

    iget-object p1, v5, Lo65;->a:Ljava/lang/String;

    invoke-virtual {p1, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6b

    iget-object p0, p0, Lo65;->a:Ljava/lang/String;

    invoke-virtual {p0, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    goto :goto_8e

    :cond_6b
    iget-object p1, p0, Lo65;->a:Ljava/lang/String;

    invoke-virtual {p1, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8d

    iget p1, v5, Lo65;->b:I

    iget v0, p0, Lo65;->b:I

    if-eq p1, v0, :cond_7c

    if-le p1, v0, :cond_8d

    goto :goto_8e

    :cond_7c
    iget p1, v5, Lo65;->c:I

    iget v0, p0, Lo65;->c:I

    if-eq p1, v0, :cond_85

    if-le p1, v0, :cond_8d

    goto :goto_8e

    :cond_85
    iget p1, v5, Lo65;->d:I

    iget p0, p0, Lo65;->d:I

    if-eq p1, p0, :cond_8e

    if-gt p1, p0, :cond_8e

    :cond_8d
    move-object v5, v2

    :cond_8e
    :goto_8e
    if-eqz v5, :cond_91

    move-object v2, v5

    :cond_91
    new-instance p0, Lxrf;

    invoke-direct {p0, v1, v2}, Lxrf;-><init>(Ljava/lang/String;Lo65;)V

    return-object p0
.end method

.method public final s()V
    .registers 3

    iget-object v0, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast v0, Lioc;

    iget-object v0, v0, Lioc;->e:Ljava/lang/Object;

    check-cast v0, Lqgf;

    iget-object v0, v0, Lqgf;->c:Lkwf;

    const v1, 0x7f0a07ea

    iput v1, v0, Lo73;->i:I

    iget-object p0, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    return-void
.end method

.method public final t()V
    .registers 1

    return-void
.end method

.method public u(Landroid/util/AttributeSet;I)V
    .registers 11

    iget-object v0, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast v0, Landroid/widget/AbsSeekBar;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    sget-object v3, Lf1p;->e:[I

    invoke-static {p2, v2, v1, p1, v3}, Lghf;->H(IILandroid/content/Context;Landroid/util/AttributeSet;[I)Lghf;

    move-result-object p1

    invoke-virtual {p1, v2}, Lghf;->u(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    const/4 v1, 0x1

    if-eqz p2, :cond_4d

    instance-of v3, p2, Landroid/graphics/drawable/AnimationDrawable;

    if-eqz v3, :cond_4a

    check-cast p2, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {p2}, Landroid/graphics/drawable/AnimationDrawable;->getNumberOfFrames()I

    move-result v3

    new-instance v4, Landroid/graphics/drawable/AnimationDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/AnimationDrawable;-><init>()V

    invoke-virtual {p2}, Landroid/graphics/drawable/AnimationDrawable;->isOneShot()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/AnimationDrawable;->setOneShot(Z)V

    move v5, v2

    :goto_2d
    const/16 v6, 0x2710

    if-ge v5, v3, :cond_46

    invoke-virtual {p2, v5}, Landroid/graphics/drawable/AnimationDrawable;->getFrame(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {p0, v7, v1}, Lf1p;->A(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v7, v6}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    invoke-virtual {p2, v5}, Landroid/graphics/drawable/AnimationDrawable;->getDuration(I)I

    move-result v6

    invoke-virtual {v4, v7, v6}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_2d

    :cond_46
    invoke-virtual {v4, v6}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    move-object p2, v4

    :cond_4a
    invoke-virtual {v0, p2}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_4d
    invoke-virtual {p1, v1}, Lghf;->u(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    if-eqz p2, :cond_5a

    invoke-virtual {p0, p2, v2}, Lf1p;->A(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_5a
    invoke-virtual {p1}, Lghf;->J()V

    return-void
.end method

.method public final v(Ljava/io/ByteArrayInputStream;)Lrsf;
    .registers 5

    invoke-static {}, Lpsp;->f()Lt56;

    move-result-object v0

    iget-object v1, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast v1, Lxq0;

    new-instance v2, Ljava/io/DataInputStream;

    invoke-direct {v2, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    :try_start_d
    invoke-virtual {v1, v2}, Lxq0;->K2(Ljava/io/DataInputStream;)V

    invoke-virtual {v2}, Ljava/io/DataInputStream;->readShort()S

    move-result p1

    invoke-virtual {v1, v2, v0, p1}, Lxq0;->X0(Ljava/io/DataInputStream;Lt56;I)V
    :try_end_17
    .catchall {:try_start_d .. :try_end_17} :catchall_20

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    new-instance p1, Lsc3;

    invoke-direct {p1, p0, v0}, Lsc3;-><init>(Lf1p;Lt56;)V

    return-object p1

    :catchall_20
    move-exception p0

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw p0
.end method

.method public final w(Ln82;)V
    .registers 2

    return-void
.end method

.method public final x()V
    .registers 2

    :try_start_0
    iget-object v0, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast v0, Ljava/nio/channels/FileLock;

    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->release()V

    iget-object p0, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast p0, Ljava/nio/channels/FileChannel;

    invoke-virtual {p0}, Ljava/nio/channels/spi/AbstractInterruptibleChannel;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_e} :catch_e

    :catch_e
    return-void
.end method

.method public final y(Landroid/content/Context;Ln98;)Lkotlin/Unit;
    .registers 7

    iget-object p0, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast p0, Ljdj;

    invoke-virtual {p0, p2}, Ljdj;->i(Ljava/lang/Object;)Z

    new-instance p0, Landroid/os/Bundle;

    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    const-string v0, "origin"

    const/4 v1, 0x6

    invoke-virtual {p0, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "notification_type"

    const/16 v1, 0x9

    invoke-virtual {p0, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "notification_action_type"

    invoke-virtual {p0, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "enable_sound"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "enable_vibration"

    invoke-virtual {p0, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "enable_lights"

    invoke-virtual {p0, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_3e

    if-ne v0, v1, :cond_3a

    sget-object v0, Lq98;->h:Lq98;

    goto :goto_40

    :cond_3a
    invoke-static {}, Lh9o;->p()V

    return-object v2

    :cond_3e
    sget-object v0, Lq98;->g:Lq98;

    :goto_40
    const-string v3, "esim_push_notification_variant_id"

    iget-byte v0, v0, Lq98;->a:B

    invoke-virtual {p0, v3, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_53

    if-eq v0, v1, :cond_5b

    invoke-static {}, Lh9o;->p()V

    return-object v2

    :cond_53
    sget-object v0, Ligf;->b:Lwu5;

    const/4 v0, 0x3

    const-string v3, "action_open_esim_destination_id"

    invoke-virtual {p0, v3, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    :cond_5b
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    if-eqz p2, :cond_6a

    if-ne p2, v1, :cond_66

    const-string p2, "country_change_paid_push"

    goto :goto_6c

    :cond_66
    invoke-static {}, Lh9o;->p()V

    return-object v2

    :cond_6a
    const-string p2, "country_change_free_push"

    :goto_6c
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ESIM_ATTRIBUTION_RESOLVED"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lkotlin/Pair;

    const-string v2, "ESIM_SOURCE"

    const-string v3, "local"

    invoke-direct {v0, v2, v3}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lkotlin/Pair;

    const-string v3, "ESIM_CAMPAIGN"

    invoke-direct {v2, v3, p2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v1, v0, v2}, [Lkotlin/Pair;

    move-result-object p2

    invoke-static {p2}, Lic4;->m([Lkotlin/Pair;)Landroid/os/Bundle;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    const/4 p2, 0x0

    invoke-static {p1, p0, p2}, Loup;->X(Landroid/content/Context;Landroid/os/Bundle;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final z()V
    .registers 1

    return-void
.end method
