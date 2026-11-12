.class public Lbp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfd2;
.implements Lb36;
.implements Lm82;
.implements Lbag;
.implements Ljke;
.implements Lp9n;


# instance fields
.field public a:I

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 3

    sparse-switch p1, :sswitch_data_36

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput p1, p0, Lbp;->a:I

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iput-object p1, p0, Lbp;->b:Ljava/lang/Object;

    return-void

    :sswitch_11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lg1g;

    const/16 v0, 0x8

    invoke-direct {p1, v0}, Lg1g;-><init>(I)V

    iput-object p1, p0, Lbp;->b:Ljava/lang/Object;

    return-void

    :sswitch_1e
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lbp;->b:Ljava/lang/Object;

    return-void

    :sswitch_29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput p1, p0, Lbp;->a:I

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, p0, Lbp;->b:Ljava/lang/Object;

    return-void

    :sswitch_data_36
    .sparse-switch
        0x15 -> :sswitch_29
        0x17 -> :sswitch_1e
        0x1b -> :sswitch_11
    .end sparse-switch
.end method

.method public constructor <init>(I)V
    .registers 4

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput p1, p0, Lbp;->a:I

    const v0, 0xffffff

    and-int v1, p1, v0

    if-ne v1, v0, :cond_e

    const/4 p1, 0x0

    goto :goto_15

    .line 58
    :cond_e
    new-instance v0, Landroid/graphics/LightingColorFilter;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Landroid/graphics/LightingColorFilter;-><init>(II)V

    move-object p1, v0

    :goto_15
    iput-object p1, p0, Lbp;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lbp;)V
    .registers 3

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iget v0, p1, Lbp;->a:I

    iput v0, p0, Lbp;->a:I

    .line 75
    iget-object p1, p1, Lbp;->b:Ljava/lang/Object;

    check-cast p1, Landroid/content/res/ColorStateList;

    iput-object p1, p0, Lbp;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/browser/SessionStore;I)V
    .registers 3

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lbp;->a:I

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lbp;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;)V
    .registers 3

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 60
    iput v0, p0, Lbp;->a:I

    .line 61
    iput-object p1, p0, Lbp;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 55
    iput-object p1, p0, Lbp;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;I)V
    .registers 3

    .line 54
    iput-object p1, p0, Lbp;->b:Ljava/lang/Object;

    iput p2, p0, Lbp;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lorg/chromium/mojo/system/impl/CoreImpl;I)V
    .registers 5

    .line 62
    new-instance v0, Lzg;

    .line 63
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lzg;->d:Ljava/lang/Object;

    .line 65
    iput-object p1, v0, Lzg;->b:Ljava/lang/Object;

    if-gtz p2, :cond_12

    const/16 p2, 0x400

    .line 66
    :cond_12
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, v0, Lzg;->c:Ljava/lang/Object;

    .line 67
    sget-object p2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    const/4 p1, 0x0

    .line 68
    iput p1, v0, Lzg;->a:I

    .line 69
    invoke-direct {p0, v0}, Lbp;-><init>(Lzg;)V

    return-void
.end method

.method public constructor <init>(Lzg;)V
    .registers 2

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Lbp;->b:Ljava/lang/Object;

    .line 72
    iget p1, p1, Lzg;->a:I

    iput p1, p0, Lbp;->a:I

    return-void
.end method

.method public static R(Landroid/content/Context;Ljava/lang/Class;)Z
    .registers 4

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    :try_start_5
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_8
    .catch Ljava/lang/IllegalStateException; {:try_start_5 .. :try_end_8} :catch_9

    goto :goto_1c

    :catch_9
    const-string v1, "launch_fg"

    invoke-static {p0, p1, v1}, Lbp;->S(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)V

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt p1, v1, :cond_19

    invoke-static {p0, v0}, Lm41;->M(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result p0

    return p0

    :cond_19
    invoke-virtual {p0, v0}, Landroid/content/Context;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :goto_1c
    const/4 p0, 0x1

    return p0
.end method

.method public static S(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)V
    .registers 9

    const/4 v0, 0x0

    const-string v1, "activity"

    if-eqz p0, :cond_30

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/ActivityManager;

    const v3, 0x7fffffff

    invoke-virtual {v2, v3}, Landroid/app/ActivityManager;->getRunningServices(I)Ljava/util/List;

    move-result-object v2

    new-instance v3, Landroid/content/ComponentName;

    invoke-direct {v3, p0, p1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_30

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/ActivityManager$RunningServiceInfo;

    iget-object v5, v4, Landroid/app/ActivityManager$RunningServiceInfo;->service:Landroid/content/ComponentName;

    invoke-virtual {v3, v5}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1b

    move-object v0, v4

    :cond_30
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "n/a"

    if-eqz v0, :cond_47

    iget-boolean v3, v0, Landroid/app/ActivityManager$RunningServiceInfo;->foreground:Z

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    iget v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->flags:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_49

    :cond_47
    move-object v0, v2

    move-object v3, v0

    :goto_49
    if-eqz p0, :cond_59

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/ActivityManager;

    invoke-virtual {p0}, Landroid/app/ActivityManager;->isBackgroundRestricted()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    :cond_59
    new-instance p0, Landroid/app/ActivityManager$RunningAppProcessInfo;

    invoke-direct {p0}, Landroid/app/ActivityManager$RunningAppProcessInfo;-><init>()V

    const/4 v1, -0x1

    iput v1, p0, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    invoke-static {p0}, Landroid/app/ActivityManager;->getMyMemoryState(Landroid/app/ActivityManager$RunningAppProcessInfo;)V

    iget p0, p0, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    const-string v1, "[fg="

    const-string v4, ",fl="

    invoke-static {p2, v1, v3, v4, v0}, Lz1m;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, ",bg="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ",imp="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "]"

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object p2, Lks3;->k:Lks3;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, " "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Lks3;->J(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final A(IIZ)V
    .registers 5

    iget v0, p0, Lbp;->a:I

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Lzg;

    if-eqz p3, :cond_1d

    iget-object p3, p0, Lzg;->c:Ljava/lang/Object;

    check-cast p3, Ljava/nio/ByteBuffer;

    add-int/2addr v0, p1

    invoke-virtual {p3, v0}, Ljava/nio/ByteBuffer;->get(I)B

    move-result p1

    const/4 p3, 0x1

    shl-int/2addr p3, p2

    int-to-byte p2, p3

    or-int/2addr p1, p2

    int-to-byte p1, p1

    iget-object p0, p0, Lzg;->c:Ljava/lang/Object;

    check-cast p0, Ljava/nio/ByteBuffer;

    invoke-virtual {p0, v0, p1}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    :cond_1d
    return-void
.end method

.method public final B(Lcom/opera/android/browser/chromium/ChromiumContent;ILjava/util/HashMap;)V
    .registers 6

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/SessionStore;

    iget-wide v0, p0, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-static {v0, v1, p0, p2, p3}, LJ/N;->MbDDD5E8(JLjava/lang/Object;ILjava/lang/Object;)V

    return-void
.end method

.method public final C(II[I)V
    .registers 6

    if-nez p3, :cond_a

    invoke-static {p2}, Lwyh;->E(I)Z

    move-result p2

    invoke-virtual {p0, p1, p2}, Lbp;->N(IZ)V

    return-void

    :cond_a
    const/4 p2, 0x4

    array-length v0, p3

    const/4 v1, -0x1

    invoke-virtual {p0, p2, v0, p1, v1}, Lbp;->P(IIII)Lbp;

    move-result-object p0

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Lzg;

    iget-object p0, p0, Lzg;->c:Ljava/lang/Object;

    check-cast p0, Ljava/nio/ByteBuffer;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->asIntBuffer()Ljava/nio/IntBuffer;

    move-result-object p0

    invoke-virtual {p0, p3}, Ljava/nio/IntBuffer;->put([I)Ljava/nio/IntBuffer;

    return-void
.end method

.method public final D(IJ)V
    .registers 5

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lzg;

    iget-object v0, v0, Lzg;->c:Ljava/lang/Object;

    check-cast v0, Ljava/nio/ByteBuffer;

    iget p0, p0, Lbp;->a:I

    add-int/2addr p0, p1

    invoke-virtual {v0, p0, p2, p3}, Ljava/nio/ByteBuffer;->putLong(IJ)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public final E(ILjava/lang/String;Z)V
    .registers 5

    if-nez p2, :cond_6

    invoke-virtual {p0, p1, p3}, Lbp;->N(IZ)V

    return-void

    :cond_6
    const-string v0, "utf8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2

    const/4 v0, -0x1

    invoke-virtual {p0, p1, p3, v0, p2}, Lbp;->z(III[B)V

    return-void
.end method

.method public final F(Lbc6;)V
    .registers 7

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lzg;

    iget v1, p1, Lbc6;->a:I

    add-int/lit8 v1, v1, 0x7

    and-int/lit8 v1, v1, -0x8

    iget v2, v0, Lzg;->a:I

    add-int/2addr v2, v1

    iput v2, v0, Lzg;->a:I

    iget-object v1, v0, Lzg;->c:Ljava/lang/Object;

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/Buffer;->capacity()I

    move-result v1

    iget v2, v0, Lzg;->a:I

    const/4 v3, 0x0

    if-ge v1, v2, :cond_50

    iget-object v1, v0, Lzg;->c:Ljava/lang/Object;

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/Buffer;->capacity()I

    move-result v1

    :cond_24
    shl-int/lit8 v1, v1, 0x1

    iget v2, v0, Lzg;->a:I

    if-lt v1, v2, :cond_24

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    iget-object v2, v0, Lzg;->c:Ljava/lang/Object;

    check-cast v2, Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/ByteBuffer;

    iget-object v2, v0, Lzg;->c:Ljava/lang/Object;

    check-cast v2, Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/Buffer;->capacity()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/ByteBuffer;

    iget-object v2, v0, Lzg;->c:Ljava/lang/Object;

    check-cast v2, Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    iput-object v1, v0, Lzg;->c:Ljava/lang/Object;

    :cond_50
    iget v0, p1, Lbc6;->a:I

    invoke-virtual {p0, v0, v3}, Lbp;->y(II)V

    iget p1, p1, Lbc6;->b:I

    const/4 v0, 0x4

    invoke-virtual {p0, p1, v0}, Lbp;->y(II)V

    return-void
.end method

.method public final G(Lw6a;IZ)V
    .registers 6

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lzg;

    if-eqz p1, :cond_1f

    invoke-interface {p1}, Lw6a;->isValid()Z

    move-result v1

    if-eqz v1, :cond_1f

    iget-object p3, v0, Lzg;->d:Ljava/lang/Object;

    check-cast p3, Ljava/util/ArrayList;

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p3

    invoke-virtual {p0, p3, p2}, Lbp;->y(II)V

    iget-object p0, v0, Lzg;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_1f
    invoke-virtual {p0, p2, p3}, Lbp;->M(IZ)V

    return-void
.end method

.method public final H(Lneb;IZLa26;)V
    .registers 8

    const/4 v0, 0x0

    if-nez p1, :cond_c

    invoke-virtual {p0, p2, p3}, Lbp;->M(IZ)V

    add-int/lit8 p2, p2, 0x4

    invoke-virtual {p0, v0, p2}, Lbp;->y(II)V

    return-void

    :cond_c
    iget-object v1, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v1, Lzg;

    iget-object v1, v1, Lzg;->b:Ljava/lang/Object;

    check-cast v1, Lorg/chromium/mojo/system/impl/CoreImpl;

    if-eqz v1, :cond_4c

    instance-of v2, p1, Lmeb;

    if-eqz v2, :cond_33

    check-cast p1, Lmeb;

    invoke-virtual {p1}, Lmeb;->k()Lleb;

    move-result-object p1

    iget-object p4, p1, Lleb;->b:Lnwd;

    check-cast p4, Lz6a;

    invoke-interface {p4}, Lz6a;->R()Lkwd;

    move-result-object p4

    invoke-virtual {p0, p4, p2, p3}, Lbp;->G(Lw6a;IZ)V

    iget p1, p1, Lleb;->c:I

    add-int/lit8 p2, p2, 0x4

    invoke-virtual {p0, p1, p2}, Lbp;->y(II)V

    return-void

    :cond_33
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/chromium/mojo/system/impl/CoreImpl;->b(Lir5;)Lkyf;

    move-result-object v1

    iget-object v2, v1, Lkyf;->a:Ljava/lang/Object;

    check-cast v2, Lkwd;

    invoke-virtual {p4, p1, v2}, La26;->m(Lneb;Lkwd;)Lj9i;

    iget-object p1, v1, Lkyf;->b:Ljava/lang/Object;

    check-cast p1, Lw6a;

    invoke-virtual {p0, p1, p2, p3}, Lbp;->G(Lw6a;IZ)V

    add-int/lit8 p2, p2, 0x4

    invoke-virtual {p0, v0, p2}, Lbp;->y(II)V

    return-void

    :cond_4c
    const-string p0, "The encoder has been created without a Core. It can\'t encode an interface."

    invoke-static {p0}, Lyt7;->k(Ljava/lang/String;)V

    return-void
.end method

.method public final I(Lueb;I)V
    .registers 5

    const/4 v0, 0x0

    if-nez p1, :cond_7

    invoke-virtual {p0, p2, v0}, Lbp;->M(IZ)V

    return-void

    :cond_7
    iget-object v1, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v1, Lzg;

    iget-object v1, v1, Lzg;->b:Ljava/lang/Object;

    check-cast v1, Lorg/chromium/mojo/system/impl/CoreImpl;

    if-eqz v1, :cond_1b

    iget-object p1, p1, Lueb;->a:Lkwd;

    invoke-interface {p1}, Lkwd;->q0()Lkwd;

    move-result-object p1

    invoke-virtual {p0, p1, p2, v0}, Lbp;->G(Lw6a;IZ)V

    return-void

    :cond_1b
    const-string p0, "The encoder has been created without a Core. It can\'t encode an interface."

    invoke-static {p0}, Lyt7;->k(Ljava/lang/String;)V

    return-void
.end method

.method public final J(Luik;IZ)V
    .registers 8

    if-nez p1, :cond_6

    invoke-virtual {p0, p2, p3}, Lbp;->N(IZ)V

    return-void

    :cond_6
    iget-object p3, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p3, Lzg;

    iget p3, p3, Lzg;->a:I

    int-to-long v0, p3

    iget p3, p0, Lbp;->a:I

    add-int/2addr p3, p2

    int-to-long v2, p3

    sub-long/2addr v0, v2

    invoke-virtual {p0, p2, v0, v1}, Lbp;->D(IJ)V

    invoke-virtual {p1, p0}, Luik;->a(Lbp;)V

    return-void
.end method

.method public final K(Lslm;IZ)V
    .registers 6

    if-nez p1, :cond_17

    if-eqz p3, :cond_f

    const-wide/16 v0, 0x0

    invoke-virtual {p0, p2, v0, v1}, Lbp;->D(IJ)V

    add-int/lit8 p2, p2, 0x8

    invoke-virtual {p0, p2, v0, v1}, Lbp;->D(IJ)V

    return-void

    :cond_f
    new-instance p0, Le22;

    const-string p1, "Trying to encode a null pointer for a non-nullable type."

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_17
    invoke-virtual {p1, p0, p2}, Lslm;->a(Lbp;I)V

    return-void
.end method

.method public final L(SI)V
    .registers 4

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lzg;

    iget-object v0, v0, Lzg;->c:Ljava/lang/Object;

    check-cast v0, Ljava/nio/ByteBuffer;

    iget p0, p0, Lbp;->a:I

    add-int/2addr p0, p2

    invoke-virtual {v0, p0, p1}, Ljava/nio/ByteBuffer;->putShort(IS)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public final M(IZ)V
    .registers 3

    if-eqz p2, :cond_12

    iget-object p2, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p2, Lzg;

    iget-object p2, p2, Lzg;->c:Ljava/lang/Object;

    check-cast p2, Ljava/nio/ByteBuffer;

    iget p0, p0, Lbp;->a:I

    add-int/2addr p0, p1

    const/4 p1, -0x1

    invoke-virtual {p2, p0, p1}, Ljava/nio/ByteBuffer;->putInt(II)Ljava/nio/ByteBuffer;

    return-void

    :cond_12
    new-instance p0, Le22;

    const-string p1, "Trying to encode an invalid handle for a non-nullable type."

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final N(IZ)V
    .registers 5

    if-eqz p2, :cond_13

    iget-object p2, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p2, Lzg;

    iget-object p2, p2, Lzg;->c:Ljava/lang/Object;

    check-cast p2, Ljava/nio/ByteBuffer;

    iget p0, p0, Lbp;->a:I

    add-int/2addr p0, p1

    const-wide/16 v0, 0x0

    invoke-virtual {p2, p0, v0, v1}, Ljava/nio/ByteBuffer;->putLong(IJ)Ljava/nio/ByteBuffer;

    return-void

    :cond_13
    new-instance p0, Le22;

    const-string p1, "Trying to encode a null pointer for a non-nullable type."

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final O(IIII)Lbp;
    .registers 9

    const/4 v0, -0x1

    if-eq p4, v0, :cond_d

    if-eq p4, p2, :cond_d

    new-instance p0, Le22;

    const-string p1, "Trying to encode a fixed array of incorrect length."

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_d
    mul-int/2addr p1, p2

    iget-object p4, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p4, Lzg;

    iget p4, p4, Lzg;->a:I

    int-to-long v0, p4

    iget p4, p0, Lbp;->a:I

    add-int/2addr p4, p3

    int-to-long v2, p4

    sub-long/2addr v0, v2

    invoke-virtual {p0, p3, v0, v1}, Lbp;->D(IJ)V

    new-instance p3, Lbc6;

    add-int/lit8 p1, p1, 0x8

    invoke-direct {p3, p1, p2}, Lbc6;-><init>(II)V

    invoke-virtual {p0, p3}, Lbp;->Q(Lbc6;)Lbp;

    move-result-object p0

    return-object p0
.end method

.method public final P(IIII)Lbp;
    .registers 5

    invoke-virtual {p0, p1, p2, p3, p4}, Lbp;->O(IIII)Lbp;

    move-result-object p0

    iget-object p1, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p1, Lzg;

    iget-object p1, p1, Lzg;->c:Ljava/lang/Object;

    check-cast p1, Ljava/nio/ByteBuffer;

    iget p2, p0, Lbp;->a:I

    add-int/lit8 p2, p2, 0x8

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/ByteBuffer;

    return-object p0
.end method

.method public final Q(Lbc6;)Lbp;
    .registers 3

    new-instance v0, Lbp;

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Lzg;

    invoke-direct {v0, p0}, Lbp;-><init>(Lzg;)V

    invoke-virtual {v0, p1}, Lbp;->F(Lbc6;)V

    return-object v0
.end method

.method public final T(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Class;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget p0, p0, Lbp;->a:I

    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p2, "[st="

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "]"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, v0, p0}, Lbp;->S(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public final U(Z)V
    .registers 5

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lo8f;

    iget v1, p0, Lbp;->a:I

    const/4 v2, 0x1

    if-eqz p1, :cond_14

    add-int/2addr v1, v2

    iput v1, p0, Lbp;->a:I

    if-ne v1, v2, :cond_1e

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Lo8f;->run(Ljava/lang/Object;)V

    return-void

    :cond_14
    sub-int/2addr v1, v2

    iput v1, p0, Lbp;->a:I

    if-nez v1, :cond_1e

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Lo8f;->run(Ljava/lang/Object;)V

    :cond_1e
    return-void
.end method

.method public final V()V
    .registers 2

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Laqi;

    if-eqz p0, :cond_d

    iget-object v0, p0, Lyz;->q:Ltz;

    if-eqz v0, :cond_d

    invoke-interface {v0, p0}, Ltz;->b(Lyz;)Z

    :cond_d
    return-void
.end method

.method public final W()V
    .registers 3

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Laqi;

    if-eqz v0, :cond_13

    iget v1, p0, Lbp;->a:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lbp;->a:I

    iget-object p0, v0, Lyz;->q:Ltz;

    if-eqz p0, :cond_13

    invoke-interface {p0, v0}, Ltz;->a(Lyz;)Z

    :cond_13
    return-void
.end method

.method public final X(Lcom/opera/android/browser/NavigationEntry;Z)V
    .registers 16

    iget-object p2, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/browser/SessionStore;

    iget-object v0, p2, Lcom/opera/android/browser/SessionStore;->b:Ljava/util/HashMap;

    iget v1, p0, Lbp;->a:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lj4j;

    iget-wide v2, p2, Lcom/opera/android/browser/SessionStore;->a:J

    iget v4, p0, Lbp;->a:I

    check-cast p1, Lhlj;

    invoke-virtual {p1}, Lhlj;->getUrl()Ljava/lang/String;

    move-result-object v5

    iget-object v12, p1, Lhlj;->b:Llsc;

    iget-object v6, v12, Lksc;->a:Ljava/lang/String;

    invoke-virtual {p1}, Lhlj;->getTitle()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1}, Lhlj;->a()Z

    move-result v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x1

    invoke-static/range {v2 .. v11}, LJ/N;->Mt8_ckp0(JILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/Object;Z)V

    if-eqz v0, :cond_53

    iget v2, v0, Lj4j;->a:I

    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p2, v1, v3, v2}, Lcom/opera/android/browser/SessionStore;->injectNavigationHistory(III)V

    iget-object p2, p0, Lbp;->b:Ljava/lang/Object;

    move-object v1, p2

    check-cast v1, Lcom/opera/android/browser/SessionStore;

    iget v2, p0, Lbp;->a:I

    iget v3, v0, Lj4j;->a:I

    invoke-virtual {p1}, Lhlj;->getUrl()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v12, Lksc;->a:Ljava/lang/String;

    invoke-virtual {p1}, Lhlj;->getTitle()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1}, Lhlj;->a()Z

    move-result v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v1 .. v9}, Lcom/opera/android/browser/SessionStore;->injectNavigationEntry(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[B[B)V

    :cond_53
    return-void
.end method

.method public final Y(Lgom;)V
    .registers 9

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->c:Lx5f;

    iget-object p1, p1, Lgom;->a:Llom;

    sget-object v2, Llom;->a:Llom;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eq p1, v2, :cond_1c

    move p1, v4

    goto :goto_1d

    :cond_1c
    move p1, v3

    :goto_1d
    iget-boolean v2, v1, Lx5f;->h:Z

    if-eqz v2, :cond_33

    iget-object v2, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    invoke-virtual {v5, v2}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v2

    const/16 v6, 0x1c

    invoke-virtual {v2, v6, v4, p1}, Ljf0;->r(IIZ)V

    invoke-virtual {v1, v5}, Lx5f;->U0(Lx56;)V

    :cond_33
    iget p0, p0, Lbp;->a:I

    const/4 p1, 0x3

    if-ne p0, p1, :cond_39

    move v3, v4

    :cond_39
    const/4 p0, 0x0

    invoke-static {v0, p0, v3}, Lxf8;->n0(Landroid/content/Context;Llkk;Z)V

    return-void
.end method

.method public final Z(Llp6;)J
    .registers 9

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lg1g;

    iget-object v1, v0, Lg1g;->a:[B

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {p1, v1, v2, v3, v2}, Llp6;->peekFully([BIIZ)Z

    iget-object v1, v0, Lg1g;->a:[B

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    if-nez v1, :cond_16

    const-wide/high16 p0, -0x8000000000000000L

    return-wide p0

    :cond_16
    const/16 v4, 0x80

    move v5, v2

    :goto_19
    and-int v6, v1, v4

    if-nez v6, :cond_22

    shr-int/lit8 v4, v4, 0x1

    add-int/lit8 v5, v5, 0x1

    goto :goto_19

    :cond_22
    not-int v4, v4

    and-int/2addr v1, v4

    iget-object v4, v0, Lg1g;->a:[B

    invoke-virtual {p1, v4, v3, v5, v2}, Llp6;->peekFully([BIIZ)Z

    :goto_29
    if-ge v2, v5, :cond_37

    shl-int/lit8 v1, v1, 0x8

    iget-object p1, v0, Lg1g;->a:[B

    add-int/lit8 v2, v2, 0x1

    aget-byte p1, p1, v2

    and-int/lit16 p1, p1, 0xff

    add-int/2addr v1, p1

    goto :goto_29

    :cond_37
    iget p1, p0, Lbp;->a:I

    add-int/2addr v5, v3

    add-int/2addr v5, p1

    iput v5, p0, Lbp;->a:I

    int-to-long p0, v1

    return-wide p0
.end method

.method public final a([B[B)[B
    .registers 6

    array-length v0, p1

    iget v1, p0, Lbp;->a:I

    const/4 v2, 0x0

    if-ne v0, v1, :cond_17

    array-length v0, p2

    const/16 v1, 0x20

    if-ne v0, v1, :cond_11

    const/4 v0, 0x3

    invoke-virtual {p0, v0, p1, p2}, Lbp;->f(I[B[B)[B

    move-result-object p0

    return-object p0

    :cond_11
    const-string p0, "wrong address length"

    :goto_13
    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v2

    :cond_17
    const-string p0, "wrong key length"

    goto :goto_13
.end method

.method public final a0(Lwsd;Ljva;Ljava/util/Map;J)V
    .registers 11

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_12

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_12
    check-cast v1, Ljava/util/ArrayList;

    new-instance p1, Lfmh;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {p1, v0, p3, p4, p5}, Lfmh;-><init>(Ljava/lang/ref/WeakReference;Ljava/util/Map;J)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_28

    invoke-interface {v1, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_4e

    :cond_28
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result p3

    const/4 v0, 0x0

    :goto_2d
    if-ge v0, p3, :cond_4e

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfmh;

    iget-wide v3, v2, Lfmh;->c:J

    cmp-long v3, p4, v3

    if-ltz v3, :cond_4b

    iget-object p3, v2, Lfmh;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {p3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p3

    if-ne p3, p2, :cond_47

    invoke-virtual {v1, v0, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_4e

    :cond_47
    invoke-virtual {v1, v0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_4e

    :cond_4b
    add-int/lit8 v0, v0, 0x1

    goto :goto_2d

    :cond_4e
    :goto_4e
    invoke-virtual {p0}, Lbp;->e()V

    return-void
.end method

.method public final b(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Ljava/lang/Void;

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lmom;->a(Landroid/content/Context;)Lgom;

    move-result-object p0

    return-object p0
.end method

.method public final b0(Landroid/content/Context;)Z
    .registers 5

    iget v0, p0, Lbp;->a:I

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1d

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1b

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Class;

    invoke-static {p1, v0}, Lbp;->R(Landroid/content/Context;Ljava/lang/Class;)Z

    move-result p1

    if-eqz p1, :cond_19

    iput v2, p0, Lbp;->a:I

    return v1

    :cond_19
    const/4 p0, 0x0

    return p0

    :cond_1b
    iput v2, p0, Lbp;->a:I

    :cond_1d
    return v1
.end method

.method public final c()V
    .registers 12

    invoke-virtual {p0}, Lbp;->j()I

    move-result v0

    invoke-virtual {p0, v0}, Lbp;->i(I)Lcom/opera/android/browser/NavigationEntry;

    move-result-object v0

    iget-object v1, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/browser/SessionStore;

    iget-wide v2, v1, Lcom/opera/android/browser/SessionStore;->a:J

    iget v4, p0, Lbp;->a:I

    invoke-interface {v0}, Lcom/opera/android/browser/NavigationEntry;->getUrl()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0}, Lcom/opera/android/browser/NavigationEntry;->d()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0}, Lcom/opera/android/browser/NavigationEntry;->getTitle()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0}, Lcom/opera/android/browser/NavigationEntry;->a()Z

    move-result v8

    invoke-interface {v0}, Lcom/opera/android/browser/NavigationEntry;->c()[B

    move-result-object v9

    invoke-interface {v0}, Lcom/opera/android/browser/NavigationEntry;->e()[B

    move-result-object v10

    invoke-static/range {v2 .. v10}, LJ/N;->M8TIgPA6(JILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public final c0(Landroid/content/Context;)V
    .registers 4

    iget v0, p0, Lbp;->a:I

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_19

    const/4 v1, 0x2

    if-eq v0, v1, :cond_18

    new-instance v0, Landroid/content/Intent;

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Class;

    invoke-direct {v0, p1, p0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v0}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    :cond_18
    return-void

    :cond_19
    const/4 p1, 0x3

    iput p1, p0, Lbp;->a:I

    return-void
.end method

.method public final d()I
    .registers 2

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/SessionStore;

    iget p0, p0, Lbp;->a:I

    invoke-virtual {v0, p0}, Lcom/opera/android/browser/SessionStore;->b(I)Lj4j;

    move-result-object p0

    iget p0, p0, Lj4j;->a:I

    return p0
.end method

.method public final d0(IZZIZZ)V
    .registers 16

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p2, :cond_a

    if-eqz p6, :cond_8

    if-eqz p3, :cond_a

    :cond_8
    move p2, v1

    goto :goto_b

    :cond_a
    move p2, v0

    :goto_b
    iget-object v2, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v2, Liqh;

    if-eqz v2, :cond_16

    if-eqz p2, :cond_16

    iput-boolean v1, v2, Liqh;->b:Z

    goto :goto_3a

    :cond_16
    and-int/lit16 p2, p1, 0xff

    const/16 v2, 0x8

    if-ne p2, v2, :cond_1e

    move v6, v0

    goto :goto_1f

    :cond_1e
    move v6, v1

    :goto_1f
    const/high16 p2, 0x200000

    and-int v2, p1, p2

    if-ne v2, p2, :cond_27

    move v8, v0

    goto :goto_28

    :cond_27
    move v8, v1

    :goto_28
    new-instance v3, Lhqh;

    const/4 v7, 0x0

    move v5, p3

    move v4, p6

    invoke-direct/range {v3 .. v8}, Lhqh;-><init>(ZZZZZ)V

    new-instance v2, Liqh;

    xor-int/2addr p5, v0

    invoke-direct {v2, p0, p5, v3}, Liqh;-><init>(Lbp;ZLhqh;)V

    iput-object v2, p0, Lbp;->b:Ljava/lang/Object;

    iput p4, p0, Lbp;->a:I

    :goto_3a
    const/high16 p0, 0x1000000

    and-int/2addr p1, p0

    if-eqz p1, :cond_41

    iput-boolean v0, v2, Liqh;->e:Z

    :cond_41
    return-void
.end method

.method public final e()V
    .registers 8

    iget v0, p0, Lbp;->a:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lbp;->a:I

    const/16 v1, 0xa

    if-lt v0, v1, :cond_6e

    const/4 v0, 0x0

    iput v0, p0, Lbp;->a:I

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_19
    :goto_19
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6e

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-gt v2, v3, :cond_44

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfmh;

    if-eqz v1, :cond_3d

    iget-object v1, v1, Lfmh;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljva;

    goto :goto_3e

    :cond_3d
    const/4 v1, 0x0

    :goto_3e
    if-nez v1, :cond_19

    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    goto :goto_19

    :cond_44
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v2

    move v3, v0

    move v4, v3

    :goto_4a
    if-ge v3, v2, :cond_64

    sub-int v5, v3, v4

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfmh;

    iget-object v6, v6, Lfmh;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_61

    invoke-interface {v1, v5}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x1

    :cond_61
    add-int/lit8 v3, v3, 0x1

    goto :goto_4a

    :cond_64
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    goto :goto_19

    :cond_6e
    return-void
.end method

.method public final f(I[B[B)[B
    .registers 7

    int-to-long v0, p1

    iget p1, p0, Lbp;->a:I

    invoke-static {p1, v0, v1}, Ldbh;->I(IJ)[B

    move-result-object v0

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Lt87;

    array-length v1, v0

    const/4 v2, 0x0

    invoke-interface {p0, v2, v1, v0}, Lt87;->g(II[B)V

    array-length v0, p2

    invoke-interface {p0, v2, v0, p2}, Lt87;->g(II[B)V

    array-length p2, p3

    invoke-interface {p0, v2, p2, p3}, Lt87;->g(II[B)V

    new-array p2, p1, [B

    instance-of p3, p0, Lvci;

    if-eqz p3, :cond_24

    check-cast p0, Lvci;

    invoke-virtual {p0, v2, p1, p2}, Lvci;->o(II[B)V

    return-object p2

    :cond_24
    invoke-interface {p0}, Lt87;->d()I

    move-result p3

    if-ge p1, p3, :cond_37

    invoke-interface {p0}, Lt87;->d()I

    move-result p3

    new-array p3, p3, [B

    invoke-interface {p0, v2, p3}, Lt87;->e(I[B)I

    invoke-static {p3, v2, p2, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p2

    :cond_37
    invoke-interface {p0, v2, p2}, Lt87;->e(I[B)I

    return-object p2
.end method

.method public final g(Landroid/app/Activity;Ljava/util/List;)Lv9g;
    .registers 4

    const p0, 0x7f1401b7

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    new-instance p2, Lt9g;

    const v0, 0x7f141027

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const v0, 0x7f140cd5

    invoke-direct {p2, p1, v0, p0}, Lt9g;-><init>(Landroid/app/Activity;ILjava/lang/String;)V

    return-object p2
.end method

.method public final h(Landroid/view/View;)V
    .registers 4

    iget v0, p0, Lbp;->a:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lbp;->a:I

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lc1f;

    iget-object v1, v0, Lc1f;->f:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lfck;

    if-eqz p1, :cond_24

    iget-object v0, v0, Lc1f;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    new-instance v1, Lgck;

    iget p0, p0, Lbp;->a:I

    invoke-direct {v1, p1, p0}, Lgck;-><init>(Lfck;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_24
    return-void
.end method

.method public final i(I)Lcom/opera/android/browser/NavigationEntry;
    .registers 7

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/SessionStore;

    iget p0, p0, Lbp;->a:I

    iget-object v1, v0, Lcom/opera/android/browser/SessionStore;->c:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    const/4 v2, 0x0

    if-nez v1, :cond_17

    move-object v1, v2

    goto :goto_21

    :cond_17
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/browser/NavigationEntry;

    :goto_21
    if-eqz v1, :cond_24

    return-object v1

    :cond_24
    iget-wide v3, v0, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {v3, v4, p0, p1}, LJ/N;->Me4jApA8(JII)V

    iget-object v0, v0, Lcom/opera/android/browser/SessionStore;->c:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    if-eqz p0, :cond_42

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Lcom/opera/android/browser/NavigationEntry;

    :cond_42
    if-nez v2, :cond_47

    sget-object p0, Lcom/opera/android/browser/SessionStore;->h:Li4j;

    return-object p0

    :cond_47
    return-object v2
.end method

.method public final isDestroyed()Z
    .registers 7

    iget v0, p0, Lbp;->a:I

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/SessionStore;

    iget-boolean v1, p0, Lcom/opera/android/browser/SessionStore;->g:Z

    iget-object v2, p0, Lcom/opera/android/browser/SessionStore;->b:Ljava/util/HashMap;

    const/4 v3, 0x1

    if-eqz v1, :cond_e

    return v3

    :cond_e
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    const/4 p0, 0x0

    return p0

    :cond_1a
    iget-wide v4, p0, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {v4, v5, v0}, LJ/N;->MAgWVLVE(JI)V

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    xor-int/2addr p0, v3

    return p0
.end method

.method public final j()I
    .registers 2

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/SessionStore;

    iget p0, p0, Lbp;->a:I

    invoke-virtual {v0, p0}, Lcom/opera/android/browser/SessionStore;->b(I)Lj4j;

    move-result-object p0

    iget p0, p0, Lj4j;->b:I

    return p0
.end method

.method public final k(Ln82;Ljava/util/List;)V
    .registers 10

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lvz5;

    iget-object v1, v0, Lvz5;->h:Ljava/lang/Object;

    check-cast v1, Lash;

    if-ne p1, v1, :cond_de

    iget-object p1, v0, Lvz5;->i:Ljava/lang/Object;

    check-cast p1, Lj92;

    if-eqz p1, :cond_de

    const/4 p1, 0x0

    iput-object p1, v0, Lvz5;->h:Ljava/lang/Object;

    new-instance v1, Ljava/util/HashSet;

    iget-object v2, v0, Lvz5;->i:Ljava/lang/Object;

    check-cast v2, Lj92;

    invoke-interface {v2}, Lj92;->f()Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/LinkedHashSet;-><init>(I)V

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2d
    :goto_2d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_49

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Loqe;

    invoke-virtual {v1, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2d

    invoke-interface {v2, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2d

    invoke-interface {v2, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_2d

    :cond_49
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v2, :cond_5c

    iget p0, v0, Lvz5;->a:I

    add-int/2addr p0, v4

    iput p0, v0, Lvz5;->a:I

    goto :goto_6b

    :cond_5c
    iget p0, p0, Lbp;->a:I

    iget-object v2, v0, Lvz5;->i:Ljava/lang/Object;

    check-cast v2, Lj92;

    if-ne p0, v3, :cond_68

    invoke-interface {v2, v1}, Lj92;->d(Ljava/util/ArrayList;)V

    goto :goto_6b

    :cond_68
    invoke-interface {v2, v1}, Lj92;->g(Ljava/util/ArrayList;)V

    :goto_6b
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p0

    iget p2, v0, Lvz5;->b:I

    const/4 v2, 0x0

    const/4 v5, -0x1

    if-eqz p0, :cond_ae

    if-ne p2, v5, :cond_b6

    iget-boolean p0, v0, Lvz5;->c:Z

    if-nez p0, :cond_b6

    iput-boolean v4, v0, Lvz5;->c:Z

    iget-object p0, v0, Lvz5;->e:Ljava/lang/Object;

    check-cast p0, Lz05;

    iget-object p0, p0, Ld93;->a:Lyla;

    iget-object p0, p0, Lyla;->e:Ll0c;

    if-nez p0, :cond_8a

    const-string p0, "fallback"

    goto :goto_8e

    :cond_8a
    invoke-virtual {p0}, Ll0c;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_8e
    iget-object p2, v0, Lvz5;->f:Ljava/lang/Object;

    check-cast p2, Lqre;

    iget-object p2, p2, Lqre;->b:Lyqe;

    if-nez p2, :cond_99

    const-string p2, "main"

    goto :goto_9b

    :cond_99
    iget-object p2, p2, Lyqe;->a:Ljava/lang/String;

    :goto_9b
    iget-object v4, v0, Lvz5;->g:Ljava/lang/Object;

    check-cast v4, Lx5f;

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v5, "locale: "

    const-string v6, " category: "

    invoke-static {v5, p0, v6, p2}, Lp3p;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x6

    invoke-virtual {v4, p2, p0}, Lx5f;->R(ILjava/lang/String;)V

    goto :goto_b6

    :cond_ae
    if-ne p2, v5, :cond_b3

    iput v2, v0, Lvz5;->b:I

    goto :goto_b6

    :cond_b3
    add-int/2addr p2, v4

    iput p2, v0, Lvz5;->b:I

    :cond_b6
    :goto_b6
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    xor-int/lit8 p2, p0, 0x1

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_d0

    iget v1, v0, Lvz5;->a:I

    if-gt v1, v3, :cond_d0

    sget-object p0, Lvc9;->a:Lvc9;

    invoke-static {p0}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object p0

    invoke-virtual {v0, p0}, Lvz5;->c(Ljava/util/EnumSet;)V

    return-void

    :cond_d0
    iput v2, v0, Lvz5;->a:I

    iget-object v1, v0, Lvz5;->i:Ljava/lang/Object;

    check-cast v1, Lj92;

    invoke-interface {v1, p2}, Lj92;->i(Z)V

    if-nez p0, :cond_de

    invoke-virtual {v0, p1}, Lvz5;->c(Ljava/util/EnumSet;)V

    :cond_de
    return-void
.end method

.method public final l(I)V
    .registers 5

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/SessionStore;

    iget-object v1, v0, Lcom/opera/android/browser/SessionStore;->b:Ljava/util/HashMap;

    iget p0, p0, Lbp;->a:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lj4j;

    if-eqz v1, :cond_19

    iget v1, v1, Lj4j;->b:I

    if-ne v1, p1, :cond_19

    return-void

    :cond_19
    iget-wide v0, v0, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {v0, v1, p0, p1}, LJ/N;->MZaZjyFz(JII)V

    return-void
.end method

.method public final n(Ldx3;Ljava/util/ArrayList;)Lv9g;
    .registers 4

    const p0, 0x7f1401b7

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    new-instance p2, Lt9g;

    const v0, 0x7f141027

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p1, p0}, Lt9g;-><init>(Ldx3;Ljava/lang/String;)V

    return-object p2
.end method

.method public final bridge synthetic onResult(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lgom;

    invoke-virtual {p0, p1}, Lbp;->Y(Lgom;)V

    return-void
.end method

.method public final q(Landroid/graphics/Canvas;Landroid/text/Layout;III)V
    .registers 7

    invoke-virtual {p2, p3}, Landroid/text/Layout;->getLineTop(I)I

    move-result v0

    invoke-virtual {p2, p3}, Landroid/text/Layout;->getLineBottom(I)I

    move-result p2

    invoke-static {p4, p5}, Ljava/lang/Math;->min(II)I

    move-result p3

    invoke-static {p4, p5}, Ljava/lang/Math;->max(II)I

    move-result p4

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p3, v0, p4, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final r([B)[B
    .registers 4

    :try_start_0
    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Ljavax/crypto/Cipher;

    iget p0, p0, Lbp;->a:I

    array-length v1, p1

    sub-int/2addr v1, p0

    invoke-virtual {v0, p1, p0, v1}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    move-result-object p0
    :try_end_c
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_c} :catch_d
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_c} :catch_d

    return-object p0

    :catch_d
    const/4 p0, 0x0

    return-object p0
.end method

.method public final s()V
    .registers 2

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lkxe;

    iget-object v0, v0, Lkxe;->y:Lcom/opera/android/settings/SettingsManager;

    iget p0, p0, Lbp;->a:I

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->X(I)V

    return-void
.end method

.method public final t()V
    .registers 1

    return-void
.end method

.method public final u()V
    .registers 4

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/SessionStore;

    iget-object v1, v0, Lcom/opera/android/browser/SessionStore;->b:Ljava/util/HashMap;

    iget p0, p0, Lbp;->a:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lj4j;

    if-eqz v1, :cond_1f

    iget v2, v1, Lj4j;->a:I

    if-eqz v2, :cond_1e

    iget v1, v1, Lj4j;->b:I

    add-int/lit8 v1, v1, 0x1

    if-ne v2, v1, :cond_1f

    :cond_1e
    return-void

    :cond_1f
    iget-wide v0, v0, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {v0, v1, p0}, LJ/N;->MPW$f0YM(JI)V

    return-void
.end method

.method public final v(I)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final w(Ln82;)V
    .registers 3

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Lvz5;

    iget-object v0, p0, Lvz5;->h:Ljava/lang/Object;

    check-cast v0, Lash;

    if-ne p1, v0, :cond_1a

    iget-object p1, p0, Lvz5;->i:Ljava/lang/Object;

    check-cast p1, Lj92;

    if-eqz p1, :cond_1a

    invoke-virtual {p0}, Lvz5;->a()V

    iget-object p0, p0, Lvz5;->i:Ljava/lang/Object;

    check-cast p0, Lj92;

    invoke-interface {p0}, Lj92;->onFailure()V

    :cond_1a
    return-void
.end method

.method public final x(FI)V
    .registers 4

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lzg;

    iget-object v0, v0, Lzg;->c:Ljava/lang/Object;

    check-cast v0, Ljava/nio/ByteBuffer;

    iget p0, p0, Lbp;->a:I

    add-int/2addr p0, p2

    invoke-virtual {v0, p0, p1}, Ljava/nio/ByteBuffer;->putFloat(IF)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public final y(II)V
    .registers 4

    iget-object v0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lzg;

    iget-object v0, v0, Lzg;->c:Ljava/lang/Object;

    check-cast v0, Ljava/nio/ByteBuffer;

    iget p0, p0, Lbp;->a:I

    add-int/2addr p0, p2

    invoke-virtual {v0, p0, p1}, Ljava/nio/ByteBuffer;->putInt(II)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public final z(III[B)V
    .registers 6

    if-nez p4, :cond_a

    invoke-static {p2}, Lwyh;->E(I)Z

    move-result p2

    invoke-virtual {p0, p1, p2}, Lbp;->N(IZ)V

    return-void

    :cond_a
    const/4 p2, 0x1

    array-length v0, p4

    invoke-virtual {p0, p2, v0, p1, p3}, Lbp;->P(IIII)Lbp;

    move-result-object p0

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Lzg;

    iget-object p0, p0, Lzg;->c:Ljava/lang/Object;

    check-cast p0, Ljava/nio/ByteBuffer;

    invoke-virtual {p0, p4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    return-void
.end method
