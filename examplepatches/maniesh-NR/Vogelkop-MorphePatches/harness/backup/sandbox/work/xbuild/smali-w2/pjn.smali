.class public Lpjn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnol;
.implements Lbs;
.implements Lhti;
.implements Lvlf;
.implements Loeb;
.implements Lqc;
.implements Lez4;
.implements Ljh4;


# static fields
.field public static final c:[Ljava/lang/String;

.field public static final d:Ljava/lang/Object;

.field public static e:Lpjn;

.field public static final f:[Ljava/lang/String;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 2

    const-string v0, "UserComment"

    const-string v1, "ImageDescription"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lpjn;->c:[Ljava/lang/String;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lpjn;->d:Ljava/lang/Object;

    const-string v0, "_data"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lpjn;->f:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(B)V
    .registers 3

    iput-byte p1, p0, Lpjn;->a:B

    packed-switch p1, :pswitch_data_1c

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayDeque;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/util/ArrayDeque;-><init>(I)V

    iput-object p1, p0, Lpjn;->b:Ljava/lang/Object;

    return-void

    :pswitch_11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, La31;

    invoke-direct {p1}, La31;-><init>()V

    iput-object p1, p0, Lpjn;->b:Ljava/lang/Object;

    return-void

    :pswitch_data_1c
    .packed-switch 0x16
        :pswitch_11
    .end packed-switch
.end method

.method public constructor <init>(Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;ILsaj;Landroid/graphics/Rect;)V
    .registers 7

    const/16 p1, 0x15

    iput-byte p1, p0, Lpjn;->a:B

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iget p1, p6, Landroid/graphics/Rect;->left:I

    invoke-static {p1}, Ljpo;->l(I)V

    .line 35
    iget p1, p6, Landroid/graphics/Rect;->top:I

    invoke-static {p1}, Ljpo;->l(I)V

    .line 36
    iget p1, p6, Landroid/graphics/Rect;->right:I

    invoke-static {p1}, Ljpo;->l(I)V

    .line 37
    iget p1, p6, Landroid/graphics/Rect;->bottom:I

    invoke-static {p1}, Ljpo;->l(I)V

    .line 38
    iput-object p5, p0, Lpjn;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/os/Looper;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Lpjn;->a:B

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zza;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/mlkit_common/zza;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lpjn;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/custom_views/TabCountButton;)V
    .registers 4

    const/16 v0, 0x12

    iput-byte v0, p0, Lpjn;->a:B

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lpjn;->b:Ljava/lang/Object;

    .line 41
    new-instance v0, Lu7;

    const/16 v1, 0x15

    invoke-direct {v0, p0, v1}, Lu7;-><init>(Ljava/lang/Object;B)V

    .line 42
    invoke-static {p1, v0}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    .line 43
    invoke-virtual {v0, p1}, Lu7;->a(Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Lhjf;)V
    .registers 4

    const/4 v0, 0x5

    iput-byte v0, p0, Lpjn;->a:B

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Lb2b;

    const/4 v1, 0x0

    .line 31
    invoke-direct {v0, p1, v1}, Lb2b;-><init>(Ljava/lang/Object;B)V

    .line 32
    iput-object v0, p0, Lpjn;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 44
    iput-byte p2, p0, Lpjn;->a:B

    iput-object p1, p0, Lpjn;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static c(ILandroid/content/Context;)Lpjn;
    .registers 14

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p0, :cond_6

    move v2, v0

    goto :goto_7

    :cond_6
    move v2, v1

    :goto_7
    const-string v3, "Cannot create a CalendarItemStyle with a styleResId of 0"

    invoke-static {v3, v2}, Ljpo;->i(Ljava/lang/String;Z)V

    sget-object v2, Lihh;->A:[I

    invoke-virtual {p1, p0, v2}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object p0

    invoke-virtual {p0, v1, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    const/4 v3, 0x2

    invoke-virtual {p0, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v3

    invoke-virtual {p0, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v0

    const/4 v4, 0x3

    invoke-virtual {p0, v4, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v4

    new-instance v11, Landroid/graphics/Rect;

    invoke-direct {v11, v2, v3, v0, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    const/4 v0, 0x4

    invoke-static {p1, p0, v0}, Lj14;->L(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v6

    const/16 v0, 0x9

    invoke-static {p1, p0, v0}, Lj14;->L(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v7

    const/4 v0, 0x7

    invoke-static {p1, p0, v0}, Lj14;->L(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v8

    const/16 v0, 0x8

    invoke-virtual {p0, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v9

    const/4 v0, 0x5

    invoke-virtual {p0, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    const/4 v2, 0x6

    invoke-virtual {p0, v2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    invoke-static {v0, p1, v1}, Lsaj;->g(ILandroid/content/Context;I)Lala;

    move-result-object p1

    invoke-virtual {p1}, Lala;->i()Lsaj;

    move-result-object v10

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    new-instance v5, Lpjn;

    invoke-direct/range {v5 .. v11}, Lpjn;-><init>(Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;ILsaj;Landroid/graphics/Rect;)V

    return-object v5
.end method

.method public static h()Lpjn;
    .registers 4

    sget-object v0, Lpjn;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lpjn;->e:Lpjn;

    if-nez v1, :cond_1f

    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "MLHandler"

    const/16 v3, 0x9

    invoke-direct {v1, v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    new-instance v2, Lpjn;

    invoke-direct {v2, v1}, Lpjn;-><init>(Landroid/os/Looper;)V

    sput-object v2, Lpjn;->e:Lpjn;

    move-object v1, v2

    :cond_1f
    monitor-exit v0

    return-object v1

    :goto_21
    monitor-exit v0
    :try_end_22
    .catchall {:try_start_3 .. :try_end_22} :catchall_23

    throw v1

    :catchall_23
    move-exception v1

    goto :goto_21
.end method

.method public static l(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;
    .registers 4

    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    new-instance v1, Lypp;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v0, v2}, Lypp;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 p0, 0x1

    invoke-static {p0, v1}, Losp;->a(ILjava/lang/Runnable;)V

    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final a(Lis;)V
    .registers 5

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p0, Lct;

    invoke-virtual {p0}, Lct;->G0()Lju;

    move-result-object p0

    iget-object p0, p0, Lju;->g:Ltr8;

    iget-object p1, p1, Lis;->c:Lst;

    iget-object v0, p1, Lst;->b:Ljava/lang/String;

    iget-object p1, p1, Lst;->g:Ljava/lang/String;

    filled-new-array {v0, p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p1

    iget-object v0, p0, Ltr8;->a:Lumi;

    new-instance v1, Lrml;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v1, v2, v0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lry7;

    const/4 v2, 0x7

    invoke-direct {v0, p0, p1, v2}, Lry7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void
.end method

.method public final b(Lrc;)V
    .registers 7

    check-cast p1, Lv3l;

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/TabCountButton;

    iget-object v0, p1, Lrc;->b:Ljf;

    iget v1, p1, Lv3l;->d:I

    iget-object v0, v0, Ljf;->c:Lxc;

    if-nez v0, :cond_12

    iget-object v0, p1, Lrc;->a:Lpc;

    iget-object v0, v0, Lpc;->a:Lxc;

    :cond_12
    new-instance v2, Lef;

    sget-object v3, Lcf;->a:Lcf;

    invoke-direct {v2, v3}, Lef;-><init>(Ldf;)V

    iget v3, v0, Lxc;->d:I

    invoke-virtual {p0, v3}, Landroid/view/View;->setId(I)V

    new-instance v3, Lnf;

    const/16 v4, 0x14

    invoke-direct {v3, p1, v2, v4}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p1, Lrc;->b:Ljf;

    iget-object p1, p1, Ljf;->b:Lkotlin/jvm/functions/Function2;

    if-eqz p1, :cond_37

    new-instance v3, Lvp3;

    const/4 v4, 0x1

    invoke-direct {v3, p1, v2, v4}, Lvp3;-><init>(Lkotlin/jvm/functions/Function2;Lef;B)V

    invoke-virtual {p0, v3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    :cond_37
    iget-object p1, p0, Lcom/opera/android/custom_views/TabCountButton;->k:Lm3l;

    invoke-virtual {p1, v1}, Lm3l;->a(I)V

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p1, v0, Lxc;->c:Lpxh;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p1, v1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    iget v0, v0, Lxc;->e:I

    invoke-static {p0, p1, v0}, Ln1h;->o(Landroid/view/View;Ljava/lang/CharSequence;I)V

    return-void
.end method

.method public final close()V
    .registers 1

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p0, Lrz4;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final d()V
    .registers 1

    return-void
.end method

.method public final e(Landroid/net/Uri;)Landroid/database/Cursor;
    .registers 8

    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Landroid/content/ContentResolver;

    sget-object v1, Landroid/provider/MediaStore$Images$Thumbnails;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    sget-object v2, Lpjn;->f:[Ljava/lang/String;

    const-string v3, "kind = 1 AND image_id = ?"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    return-object p0
.end method

.method public final f()Lcom/opera/android/StatusBarDrawingFrameLayout;
    .registers 1

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p0, Lct;

    iget-object p0, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    return-object p0
.end method

.method public final g(Lcom/opera/api/Callback;)V
    .registers 5

    iget-byte v0, p0, Lpjn;->a:B

    iget-object v1, p0, Lpjn;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_20

    check-cast v1, Le3j;

    new-instance v0, Lp1;

    const/4 v2, 0x4

    invoke-direct {v0, p0, p1, v2}, Lp1;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lno7;->g(Lmo7;)V

    return-void

    :pswitch_13
    new-instance v0, Lp1;

    const/4 v2, 0x0

    invoke-direct {v0, p0, p1, v2}, Lp1;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    check-cast v1, Lv1;

    invoke-virtual {v1, v0}, Lno7;->g(Lmo7;)V

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x4
        :pswitch_13
    .end packed-switch
.end method

.method public final i(Lbza;Lapj;)Lvrf;
    .registers 21

    move-object/from16 v0, p1

    new-instance v1, Lvrf;

    move-object v2, v1

    iget-object v1, v0, Lbza;->a:Landroid/content/Context;

    iget-object v3, v0, Lbza;->m:Llli;

    iget-object v4, v0, Lbza;->n:Lwog;

    iget-object v5, v0, Lbza;->e:Lg29;

    iget-object v6, v0, Lbza;->i:Lj74;

    iget-object v7, v0, Lbza;->j:Lj74;

    iget-object v8, v0, Lbza;->k:Lj74;

    sget-object v9, Leza;->b:Lxm5;

    invoke-static {v0, v9}, Lxf8;->J(Lbza;Lxm5;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/graphics/Bitmap$Config;

    sget-object v11, Leza;->g:Lxm5;

    invoke-static {v0, v11}, Lxf8;->J(Lbza;Lxm5;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Boolean;

    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v12

    sget-object v13, Ldza;->a:Lxm5;

    invoke-static {v0, v13}, Lxf8;->J(Lbza;Lxm5;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/List;

    invoke-interface {v14}, Ljava/util/List;->isEmpty()Z

    move-result v14

    const/16 v16, 0x0

    if-nez v14, :cond_4a

    sget-object v14, Lnzm;->a:[Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v9}, Lxf8;->J(Lbza;Lxm5;)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v15, v17

    check-cast v15, Landroid/graphics/Bitmap$Config;

    invoke-static {v14, v15}, Le82;->o([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_4a

    move/from16 v14, v16

    goto :goto_4b

    :cond_4a
    const/4 v14, 0x1

    :goto_4b
    invoke-static {v0, v9}, Lxf8;->J(Lbza;Lxm5;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/graphics/Bitmap$Config;

    move-object/from16 v17, v1

    sget-object v1, Landroid/graphics/Bitmap$Config;->HARDWARE:Landroid/graphics/Bitmap$Config;

    if-ne v15, v1, :cond_70

    invoke-static {v0, v9}, Lxf8;->J(Lbza;Lxm5;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/graphics/Bitmap$Config;

    if-ne v15, v1, :cond_70

    sget-object v1, Leza;->f:Lxm5;

    invoke-static {v0, v1}, Lxf8;->J(Lbza;Lxm5;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_70

    move/from16 v1, v16

    goto :goto_71

    :cond_70
    const/4 v1, 0x1

    :goto_71
    if-eqz v14, :cond_75

    if-nez v1, :cond_77

    :cond_75
    sget-object v10, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    :cond_77
    if-eqz v12, :cond_8b

    invoke-static {v0, v13}, Lxf8;->J(Lbza;Lxm5;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_8b

    sget-object v1, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    if-eq v10, v1, :cond_8b

    const/4 v15, 0x1

    goto :goto_8d

    :cond_8b
    move/from16 v15, v16

    :goto_8d
    iget-object v1, v0, Lbza;->q:Lzya;

    iget-object v1, v1, Lzya;->d:Lhn8;

    iget-object v1, v1, Lhn8;->a:Ljava/util/Map;

    iget-object v12, v0, Lbza;->o:Lhn8;

    iget-object v12, v12, Lhn8;->a:Ljava/util/Map;

    invoke-static {v1, v12}, Lrbd;->e(Ljava/util/Map;Ljava/util/Map;)Ljava/util/LinkedHashMap;

    move-result-object v1

    new-instance v12, Ljava/util/LinkedHashMap;

    invoke-direct {v12, v1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    invoke-static {v0, v9}, Lxf8;->J(Lbza;Lxm5;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap$Config;

    if-eq v10, v1, :cond_b1

    if-eqz v10, :cond_ae

    invoke-interface {v12, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b1

    :cond_ae
    invoke-interface {v12, v9}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_b1
    :goto_b1
    invoke-static {v0, v11}, Lxf8;->J(Lbza;Lxm5;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eq v15, v0, :cond_c4

    invoke-static {v15}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {v12, v11, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_c4
    new-instance v9, Lhn8;

    invoke-static {v12}, Lzi4;->d0(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    invoke-direct {v9, v0}, Lhn8;-><init>(Ljava/util/Map;)V

    move-object v0, v2

    move-object/from16 v1, v17

    move-object/from16 v2, p2

    invoke-direct/range {v0 .. v9}, Lvrf;-><init>(Landroid/content/Context;Lapj;Llli;Lwog;Lg29;Lj74;Lj74;Lj74;Lhn8;)V

    return-object v0
.end method

.method public final j(Landroid/net/Uri;Landroid/content/Context;Lnt5;)Ljava/lang/Object;
    .registers 14

    instance-of v0, p3, Ltg8;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Ltg8;

    iget v1, v0, Ltg8;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Ltg8;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Ltg8;

    invoke-direct {v0, p0, p3}, Ltg8;-><init>(Lpjn;Lnt5;)V

    :goto_18
    iget-object p3, v0, Ltg8;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Ltg8;->w:I

    const/4 v3, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v3, :cond_29

    iget-object p0, v0, Ltg8;->t:Ljava/util/LinkedHashMap;

    :try_start_25
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_28} :catch_63

    goto :goto_5f

    :cond_29
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_30
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    new-instance v7, Ljava/util/LinkedHashMap;

    invoke-direct {v7}, Ljava/util/LinkedHashMap;-><init>()V

    :try_start_38
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p0, Lqie;

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object p0

    new-instance p2, Ljg8;

    invoke-direct {p2, p0}, Ljg8;-><init>(Ljava/util/concurrent/Executor;)V

    new-instance v4, Lc71;

    const/4 v9, 0x6

    const/4 v8, 0x0

    move-object v6, p1

    invoke-direct/range {v4 .. v9}, Lc71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput-object v7, v0, Ltg8;->t:Ljava/util/LinkedHashMap;

    iput v3, v0, Ltg8;->w:I

    invoke-static {p2, v4, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p3
    :try_end_5b
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_5b} :catch_62

    if-ne p3, v1, :cond_5e

    return-object v1

    :cond_5e
    move-object p0, v7

    :goto_5f
    :try_start_5f
    check-cast p3, Lkotlin/Unit;
    :try_end_61
    .catch Ljava/io/IOException; {:try_start_5f .. :try_end_61} :catch_63

    return-object p0

    :catch_62
    move-object p0, v7

    :catch_63
    return-object p0
.end method

.method public final declared-synchronized k(Lux9;)V
    .registers 3

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    iput-object v0, p1, Lux9;->b:Ljava/nio/ByteBuffer;

    iput-object v0, p1, Lux9;->c:Ltx9;

    iget-object v0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z
    :try_end_d
    .catchall {:try_start_2 .. :try_end_d} :catchall_11

    monitor-exit p0

    return-void

    :goto_f
    :try_start_f
    monitor-exit p0
    :try_end_10
    .catchall {:try_start_f .. :try_end_10} :catchall_11

    throw p1

    :catchall_11
    move-exception p1

    goto :goto_f
.end method

.method public final m(I)V
    .registers 3

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p0, Lu02;

    iget-object p0, p0, Lu02;->o:Ljava/lang/Object;

    check-cast p0, Lzz1;

    if-eqz p0, :cond_16

    iget-object p0, p0, Lzz1;->d:Lmlj;

    new-instance v0, Lrxh;

    invoke-direct {v0, p1}, Lrxh;-><init>(I)V

    const/16 p1, 0x9c4

    invoke-virtual {p0, v0, p1}, Lmlj;->a(Lrxh;I)V

    :cond_16
    return-void
.end method

.method public final n()V
    .registers 4

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p0, Lqjn;

    iget-object v0, p0, Lqjn;->e:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lqjn;->d()V

    :goto_9
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1c

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/api/Callback;

    iget-object v2, p0, Lqjn;->h:Ldnn;

    invoke-interface {v1, v2}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_9

    :cond_1c
    return-void
.end method

.method public final o(Landroid/net/Uri;Landroid/content/Context;Ljava/util/Map;Lnt5;)Ljava/lang/Object;
    .registers 15

    instance-of v0, p4, Lug8;

    if-eqz v0, :cond_13

    move-object v0, p4

    check-cast v0, Lug8;

    iget v1, v0, Lug8;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lug8;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lug8;

    invoke-direct {v0, p0, p4}, Lug8;-><init>(Lpjn;Lnt5;)V

    :goto_18
    iget-object p4, v0, Lug8;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lug8;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v3, :cond_27

    :try_start_23
    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_26} :catch_66

    goto :goto_5f

    :cond_27
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2e
    invoke-static {p4}, Lybh;->y(Ljava/lang/Object;)V

    invoke-interface {p3}, Ljava/util/Map;->isEmpty()Z

    move-result p4

    if-eqz p4, :cond_3a

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :cond_3a
    :try_start_3a
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p0, Lqie;

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object p0

    new-instance p2, Ljg8;

    invoke-direct {p2, p0}, Ljg8;-><init>(Ljava/util/concurrent/Executor;)V

    new-instance v4, Lc71;

    const/4 v9, 0x7

    const/4 v8, 0x0

    move-object v6, p1

    move-object v7, p3

    invoke-direct/range {v4 .. v9}, Lc71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput v3, v0, Lug8;->v:I

    invoke-static {p2, v4, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p4

    if-ne p4, v1, :cond_5f

    return-object v1

    :cond_5f
    :goto_5f
    check-cast p4, Ljava/lang/Boolean;

    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0
    :try_end_65
    .catch Ljava/io/IOException; {:try_start_3a .. :try_end_65} :catch_66

    goto :goto_67

    :catch_66
    const/4 p0, 0x0

    :goto_67
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public final p(Ljava/lang/String;)V
    .registers 3

    iget-byte v0, p0, Lpjn;->a:B

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_28

    check-cast p0, Lm93;

    iget-object p0, p0, Lm93;->r:Lqmj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lc83;

    invoke-direct {v0, p0}, Lc83;-><init>(Lqmj;)V

    invoke-virtual {v0, p1}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_17
    check-cast p0, Lg01;

    iget-object p0, p0, Lg01;->w:Lqmj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lc83;

    invoke-direct {v0, p0}, Lc83;-><init>(Lqmj;)V

    invoke-virtual {v0, p1}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    return-void

    nop

    :pswitch_data_28
    .packed-switch 0x7
        :pswitch_17
    .end packed-switch
.end method

.method public final q()Lneb;
    .registers 2

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/content_public/browser/RenderFrameHost;

    if-nez p0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    new-instance v0, Lek2;

    invoke-direct {v0, p0}, Lek2;-><init>(Lorg/chromium/content_public/browser/RenderFrameHost;)V

    return-object v0
.end method

.method public final r(Lis;)V
    .registers 10

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p0, Lct;

    invoke-virtual {p0}, Lct;->G0()Lju;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    iget-object v1, v0, Lju;->d:Lot;

    iget-object v2, v0, Lju;->e:Ltw2;

    iget-object v3, p1, Ljs;->a:Lgt;

    iget-object v4, p1, Ljs;->a:Lgt;

    sget-object v5, Lgt;->f:Lgt;

    iget-object p1, p1, Lis;->c:Lst;

    if-ne v3, v5, :cond_5f

    iget-object v3, p1, Lst;->e:Lht;

    sget-object v5, Lht;->b:Lht;

    const/4 v6, 0x0

    if-eq v3, v5, :cond_4f

    sget-object v5, Lht;->f:Lht;

    if-eq v3, v5, :cond_4f

    iget-object v0, v0, Lju;->c:Lqb7;

    new-instance v3, Lmzj;

    iget-object v5, p1, Lst;->a:Lpxh;

    invoke-virtual {v5, p0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    iget-object v5, p1, Lst;->b:Ljava/lang/String;

    const/4 v7, 0x0

    invoke-direct {v3, p0, v5, v6, v7}, Lmzj;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Z)V

    iget-object p0, v0, Lqb7;->a:Ljava/lang/Object;

    check-cast p0, Lnr8;

    invoke-virtual {p0, v3}, Lnr8;->a(Lmzj;)J

    iget-object p0, v0, Lqb7;->b:Ljava/lang/Object;

    check-cast p0, Lu59;

    const v0, 0x7f141162    # 1.96816E38f

    invoke-virtual {p0, v0}, Lu59;->N(I)V

    const/4 p0, 0x1

    invoke-virtual {v2, p1, p0, v4}, Ltw2;->x(Lst;ZLgt;)V

    goto :goto_58

    :cond_4f
    invoke-virtual {v0, p0, p1}, Lju;->g(Landroid/content/res/Resources;Lst;)Lst;

    move-result-object p0

    iget-boolean p1, p0, Lst;->k:Z

    invoke-virtual {v2, p0, p1, v4}, Ltw2;->x(Lst;ZLgt;)V

    :goto_58
    invoke-virtual {v1}, Loy;->c()Z

    invoke-virtual {v1, v6}, Loy;->g(Ljava/lang/String;)V

    return-void

    :cond_5f
    invoke-virtual {v0, p0, p1}, Lju;->g(Landroid/content/res/Resources;Lst;)Lst;

    move-result-object p0

    iget-boolean p1, p0, Lst;->k:Z

    invoke-virtual {v2, p0, p1, v4}, Ltw2;->x(Lst;ZLgt;)V

    return-void
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 3

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p0, Lqc2;

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "ai_assistant_ask_aria"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void
.end method

.method public final v(Ljava/lang/String;)V
    .registers 3

    iget-byte v0, p0, Lpjn;->a:B

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_28

    check-cast p0, Lm93;

    iget-object p0, p0, Lm93;->r:Lqmj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lc83;

    invoke-direct {v0, p0}, Lc83;-><init>(Lqmj;)V

    invoke-virtual {v0, p1}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_17
    check-cast p0, Lg01;

    iget-object p0, p0, Lg01;->w:Lqmj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lc83;

    invoke-direct {v0, p0}, Lc83;-><init>(Lqmj;)V

    invoke-virtual {v0, p1}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    return-void

    nop

    :pswitch_data_28
    .packed-switch 0x7
        :pswitch_17
    .end packed-switch
.end method

.method public final w(Landroid/graphics/Typeface;)V
    .registers 2

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p0, Lv85;

    invoke-virtual {p0, p1}, Lv85;->t(Landroid/graphics/Typeface;)Z

    move-result p1

    if-eqz p1, :cond_e

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lv85;->l(Z)V

    :cond_e
    return-void
.end method

.method public final x(Lhs;)V
    .registers 8

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p0, Lct;

    invoke-virtual {p0}, Lct;->G0()Lju;

    move-result-object p0

    iget-object v0, p0, Lju;->c:Lqb7;

    new-instance v1, Lmzj;

    iget-object v2, p1, Lhs;->c:Ljava/lang/String;

    sget-object v3, Lp6l;->a:Lp6l;

    const/4 v3, 0x0

    const/4 v4, 0x2

    invoke-static {v2, v3, v4}, Leti;->a(Ljava/lang/String;Lshf;I)Lorg/chromium/url/GURL;

    move-result-object v2

    invoke-virtual {v2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v2

    const-string v4, ""

    const/4 v5, 0x0

    invoke-direct {v1, v4, v2, v3, v5}, Lmzj;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Z)V

    iget-object v2, v0, Lqb7;->a:Ljava/lang/Object;

    check-cast v2, Lnr8;

    invoke-virtual {v2, v1}, Lnr8;->a(Lmzj;)J

    iget-object v0, v0, Lqb7;->b:Ljava/lang/Object;

    check-cast v0, Lu59;

    const v1, 0x7f141162    # 1.96816E38f

    invoke-virtual {v0, v1}, Lu59;->N(I)V

    iget-object v0, p0, Lju;->d:Lot;

    invoke-virtual {v0}, Loy;->c()Z

    invoke-virtual {v0, v3}, Loy;->g(Ljava/lang/String;)V

    iget-object p0, p0, Lju;->e:Ltw2;

    iget-object v0, p1, Lhs;->c:Ljava/lang/String;

    iget-object p1, p1, Ljs;->a:Lgt;

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lorm;

    invoke-static {v0}, Lwqm;->x(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4c

    sget-object v0, Lip0;->q:Lip0;

    goto :goto_4e

    :cond_4c
    sget-object v0, Lip0;->p:Lip0;

    :goto_4e
    invoke-static {p1}, Ltw2;->t(Lgt;)Ljava/lang/String;

    move-result-object p1

    check-cast p0, Lx5f;

    iget-boolean v1, p0, Lx5f;->h:Z

    if-eqz v1, :cond_5c

    const/4 v1, 0x1

    invoke-virtual {p0, v1, p1, v5}, Lx5f;->j(ILjava/lang/String;Z)V

    :cond_5c
    invoke-virtual {p0, v0}, Lx5f;->u(Lip0;)V

    return-void
.end method
