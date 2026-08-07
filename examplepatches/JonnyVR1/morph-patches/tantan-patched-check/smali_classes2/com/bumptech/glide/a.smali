.class public Lcom/bumptech/glide/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ComponentCallbacks2;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/a$a;
    }
.end annotation


# static fields
.field private static volatile l:Lcom/bumptech/glide/a;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "Glide.class"
    .end annotation
.end field

.field private static volatile m:Z


# instance fields
.field private final a:Lcom/bumptech/glide/load/engine/h;

.field private final b:Ll/w23;

.field private final c:Ll/lpy;

.field private final d:Lcom/bumptech/glide/c;

.field private final e:Lcom/bumptech/glide/Registry;

.field private final f:Ll/o01;

.field private final g:Lcom/bumptech/glide/manager/m;

.field private final h:Lcom/bumptech/glide/manager/d;

.field private final i:Ljava/util/List;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "managers"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/m2d0;",
            ">;"
        }
    .end annotation
.end field

.field private final j:Lcom/bumptech/glide/a$a;

.field private k:Lcom/bumptech/glide/MemoryCategory;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/bumptech/glide/load/engine/h;Ll/lpy;Ll/w23;Ll/o01;Lcom/bumptech/glide/manager/m;Lcom/bumptech/glide/manager/d;ILcom/bumptech/glide/a$a;Ljava/util/Map;Ljava/util/List;Lcom/bumptech/glide/d;)V
    .locals 27
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/engine/h;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/lpy;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ll/w23;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ll/o01;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Lcom/bumptech/glide/manager/m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p7    # Lcom/bumptech/glide/manager/d;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p9    # Lcom/bumptech/glide/a$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p10    # Ljava/util/Map;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p11    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/bumptech/glide/load/engine/h;",
            "Ll/lpy;",
            "Ll/w23;",
            "Ll/o01;",
            "Lcom/bumptech/glide/manager/m;",
            "Lcom/bumptech/glide/manager/d;",
            "I",
            "Lcom/bumptech/glide/a$a;",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ll/aij0<",
            "**>;>;",
            "Ljava/util/List<",
            "Ll/l2d0<",
            "Ljava/lang/Object;",
            ">;>;",
            "Lcom/bumptech/glide/d;",
            ")V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    move-object/from16 v1, p4

    move-object/from16 v3, p5

    move-object/from16 v10, p12

    .line 1
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, v0, Lcom/bumptech/glide/a;->i:Ljava/util/List;

    .line 3
    sget-object v4, Lcom/bumptech/glide/MemoryCategory;->NORMAL:Lcom/bumptech/glide/MemoryCategory;

    iput-object v4, v0, Lcom/bumptech/glide/a;->k:Lcom/bumptech/glide/MemoryCategory;

    move-object/from16 v9, p2

    .line 4
    iput-object v9, v0, Lcom/bumptech/glide/a;->a:Lcom/bumptech/glide/load/engine/h;

    .line 5
    iput-object v1, v0, Lcom/bumptech/glide/a;->b:Ll/w23;

    .line 6
    iput-object v3, v0, Lcom/bumptech/glide/a;->f:Ll/o01;

    move-object/from16 v4, p3

    .line 7
    iput-object v4, v0, Lcom/bumptech/glide/a;->c:Ll/lpy;

    move-object/from16 v4, p6

    .line 8
    iput-object v4, v0, Lcom/bumptech/glide/a;->g:Lcom/bumptech/glide/manager/m;

    move-object/from16 v4, p7

    .line 9
    iput-object v4, v0, Lcom/bumptech/glide/a;->h:Lcom/bumptech/glide/manager/d;

    move-object/from16 v6, p9

    .line 10
    iput-object v6, v0, Lcom/bumptech/glide/a;->j:Lcom/bumptech/glide/a$a;

    .line 11
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 12
    new-instance v5, Lcom/bumptech/glide/Registry;

    invoke-direct {v5}, Lcom/bumptech/glide/Registry;-><init>()V

    iput-object v5, v0, Lcom/bumptech/glide/a;->e:Lcom/bumptech/glide/Registry;

    .line 13
    new-instance v7, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser;

    invoke-direct {v7}, Lcom/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser;-><init>()V

    invoke-virtual {v5, v7}, Lcom/bumptech/glide/Registry;->o(Lcom/bumptech/glide/load/ImageHeaderParser;)Lcom/bumptech/glide/Registry;

    .line 14
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x1b

    if-lt v7, v8, :cond_0

    .line 15
    new-instance v8, Ll/q7f;

    invoke-direct {v8}, Ll/q7f;-><init>()V

    invoke-virtual {v5, v8}, Lcom/bumptech/glide/Registry;->o(Lcom/bumptech/glide/load/ImageHeaderParser;)Lcom/bumptech/glide/Registry;

    .line 16
    :cond_0
    invoke-virtual {v5}, Lcom/bumptech/glide/Registry;->g()Ljava/util/List;

    move-result-object v8

    .line 17
    new-instance v11, Ll/cr3;

    invoke-direct {v11, v2, v8, v1, v3}, Ll/cr3;-><init>(Landroid/content/Context;Ljava/util/List;Ll/w23;Ll/o01;)V

    .line 18
    invoke-static {v1}, Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder;->h(Ll/w23;)Ll/z3d0;

    move-result-object v12

    .line 19
    new-instance v13, Lcom/bumptech/glide/load/resource/bitmap/a;

    .line 20
    invoke-virtual {v5}, Lcom/bumptech/glide/Registry;->g()Ljava/util/List;

    move-result-object v14

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v15

    invoke-direct {v13, v14, v15, v1, v3}, Lcom/bumptech/glide/load/resource/bitmap/a;-><init>(Ljava/util/List;Landroid/util/DisplayMetrics;Ll/w23;Ll/o01;)V

    const/16 v14, 0x1c

    if-lt v7, v14, :cond_1

    .line 21
    const-class v15, Lcom/bumptech/glide/b$c;

    .line 22
    invoke-virtual {v10, v15}, Lcom/bumptech/glide/d;->a(Ljava/lang/Class;)Z

    move-result v15

    if-eqz v15, :cond_1

    .line 23
    new-instance v15, Ll/avm;

    invoke-direct {v15}, Ll/avm;-><init>()V

    .line 24
    new-instance v16, Ll/zq3;

    invoke-direct/range {v16 .. v16}, Ll/zq3;-><init>()V

    move-object/from16 v14, v16

    goto :goto_0

    .line 25
    :cond_1
    new-instance v15, Ll/xq3;

    invoke-direct {v15, v13}, Ll/xq3;-><init>(Lcom/bumptech/glide/load/resource/bitmap/a;)V

    .line 26
    new-instance v14, Lcom/bumptech/glide/load/resource/bitmap/c;

    invoke-direct {v14, v13, v3}, Lcom/bumptech/glide/load/resource/bitmap/c;-><init>(Lcom/bumptech/glide/load/resource/bitmap/a;Ll/o01;)V

    move-object/from16 v26, v15

    move-object v15, v14

    move-object/from16 v14, v26

    .line 27
    :goto_0
    const-string v6, "Animation"

    const-class v9, Landroid/graphics/drawable/Drawable;

    const-class v0, Ljava/nio/ByteBuffer;

    move-object/from16 p6, v11

    const-class v11, Ljava/io/InputStream;

    const/16 v1, 0x1c

    if-lt v7, v1, :cond_2

    const-class v1, Lcom/bumptech/glide/b$b;

    .line 28
    invoke-virtual {v10, v1}, Lcom/bumptech/glide/d;->a(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 29
    invoke-static {v8, v3}, Ll/xq0;->f(Ljava/util/List;Ll/o01;)Ll/z3d0;

    move-result-object v1

    .line 30
    invoke-virtual {v5, v6, v11, v9, v1}, Lcom/bumptech/glide/Registry;->e(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    .line 31
    invoke-static {v8, v3}, Ll/xq0;->a(Ljava/util/List;Ll/o01;)Ll/z3d0;

    move-result-object v1

    .line 32
    invoke-virtual {v5, v6, v0, v9, v1}, Lcom/bumptech/glide/Registry;->e(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    .line 33
    :cond_2
    new-instance v1, Ll/b4d0;

    invoke-direct {v1, v2}, Ll/b4d0;-><init>(Landroid/content/Context;)V

    .line 34
    new-instance v10, Ll/h4d0$c;

    invoke-direct {v10, v4}, Ll/h4d0$c;-><init>(Landroid/content/res/Resources;)V

    move/from16 p3, v7

    .line 35
    new-instance v7, Ll/h4d0$d;

    invoke-direct {v7, v4}, Ll/h4d0$d;-><init>(Landroid/content/res/Resources;)V

    .line 36
    new-instance v2, Ll/h4d0$b;

    invoke-direct {v2, v4}, Ll/h4d0$b;-><init>(Landroid/content/res/Resources;)V

    move-object/from16 p7, v7

    .line 37
    new-instance v7, Ll/h4d0$a;

    invoke-direct {v7, v4}, Ll/h4d0$a;-><init>(Landroid/content/res/Resources;)V

    move-object/from16 v16, v7

    .line 38
    new-instance v7, Ll/b23;

    invoke-direct {v7, v3}, Ll/b23;-><init>(Ll/o01;)V

    move-object/from16 v17, v2

    .line 39
    new-instance v2, Ll/m13;

    invoke-direct {v2}, Ll/m13;-><init>()V

    move-object/from16 v18, v2

    .line 40
    new-instance v2, Ll/cnj;

    invoke-direct {v2}, Ll/cnj;-><init>()V

    move-object/from16 v19, v2

    .line 41
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    move-object/from16 v20, v2

    .line 42
    new-instance v2, Ll/ar3;

    invoke-direct {v2}, Ll/ar3;-><init>()V

    .line 43
    invoke-virtual {v5, v0, v2}, Lcom/bumptech/glide/Registry;->c(Ljava/lang/Class;Ll/v0f;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    move-object/from16 v21, v10

    new-instance v10, Ll/j7g0;

    invoke-direct {v10, v3}, Ll/j7g0;-><init>(Ll/o01;)V

    .line 44
    invoke-virtual {v2, v11, v10}, Lcom/bumptech/glide/Registry;->c(Ljava/lang/Class;Ll/v0f;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    .line 45
    const-string v10, "Bitmap"

    move-object/from16 v22, v1

    const-class v1, Landroid/graphics/Bitmap;

    invoke-virtual {v2, v10, v0, v1, v14}, Lcom/bumptech/glide/Registry;->e(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    .line 46
    invoke-virtual {v2, v10, v11, v1, v15}, Lcom/bumptech/glide/Registry;->e(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    .line 47
    invoke-static {}, Lcom/bumptech/glide/load/data/ParcelFileDescriptorRewinder;->b()Z

    move-result v2

    move/from16 v23, v2

    const-class v2, Landroid/os/ParcelFileDescriptor;

    if-eqz v23, :cond_3

    move-object/from16 v23, v9

    .line 48
    new-instance v9, Ll/bg60;

    invoke-direct {v9, v13}, Ll/bg60;-><init>(Lcom/bumptech/glide/load/resource/bitmap/a;)V

    invoke-virtual {v5, v10, v2, v1, v9}, Lcom/bumptech/glide/Registry;->e(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    goto :goto_1

    :cond_3
    move-object/from16 v23, v9

    .line 49
    :goto_1
    invoke-virtual {v5, v10, v2, v1, v12}, Lcom/bumptech/glide/Registry;->e(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    move-result-object v9

    .line 50
    invoke-static/range {p4 .. p4}, Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder;->c(Ll/w23;)Ll/z3d0;

    move-result-object v13

    move-object/from16 v24, v5

    .line 51
    const-class v5, Landroid/content/res/AssetFileDescriptor;

    invoke-virtual {v9, v10, v5, v1, v13}, Lcom/bumptech/glide/Registry;->e(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    move-result-object v9

    .line 52
    invoke-static {}, Ll/yxj0$a;->a()Ll/yxj0$a;

    move-result-object v13

    invoke-virtual {v9, v1, v1, v13}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v9

    new-instance v13, Ll/wxj0;

    invoke-direct {v13}, Ll/wxj0;-><init>()V

    .line 53
    invoke-virtual {v9, v10, v1, v1, v13}, Lcom/bumptech/glide/Registry;->e(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    move-result-object v9

    .line 54
    invoke-virtual {v9, v1, v7}, Lcom/bumptech/glide/Registry;->d(Ljava/lang/Class;Ll/c4d0;)Lcom/bumptech/glide/Registry;

    move-result-object v9

    new-instance v13, Ll/y13;

    invoke-direct {v13, v4, v14}, Ll/y13;-><init>(Landroid/content/res/Resources;Ll/z3d0;)V

    .line 55
    const-string v14, "BitmapDrawable"

    move-object/from16 v25, v5

    const-class v5, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v9, v14, v0, v5, v13}, Lcom/bumptech/glide/Registry;->e(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    move-result-object v9

    new-instance v13, Ll/y13;

    invoke-direct {v13, v4, v15}, Ll/y13;-><init>(Landroid/content/res/Resources;Ll/z3d0;)V

    .line 56
    invoke-virtual {v9, v14, v11, v5, v13}, Lcom/bumptech/glide/Registry;->e(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    move-result-object v9

    new-instance v13, Ll/y13;

    invoke-direct {v13, v4, v12}, Ll/y13;-><init>(Landroid/content/res/Resources;Ll/z3d0;)V

    .line 57
    invoke-virtual {v9, v14, v2, v5, v13}, Lcom/bumptech/glide/Registry;->e(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    move-result-object v9

    new-instance v12, Ll/z13;

    move-object/from16 v13, p4

    invoke-direct {v12, v13, v7}, Ll/z13;-><init>(Ll/w23;Ll/c4d0;)V

    .line 58
    invoke-virtual {v9, v5, v12}, Lcom/bumptech/glide/Registry;->d(Ljava/lang/Class;Ll/c4d0;)Lcom/bumptech/glide/Registry;

    move-result-object v7

    new-instance v9, Ll/m7g0;

    move-object/from16 v12, p6

    invoke-direct {v9, v8, v12, v3}, Ll/m7g0;-><init>(Ljava/util/List;Ll/z3d0;Ll/o01;)V

    .line 59
    const-class v8, Ll/bnj;

    invoke-virtual {v7, v6, v11, v8, v9}, Lcom/bumptech/glide/Registry;->e(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    move-result-object v7

    .line 60
    invoke-virtual {v7, v6, v0, v8, v12}, Lcom/bumptech/glide/Registry;->e(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    move-result-object v6

    new-instance v7, Ll/dnj;

    invoke-direct {v7}, Ll/dnj;-><init>()V

    .line 61
    invoke-virtual {v6, v8, v7}, Lcom/bumptech/glide/Registry;->d(Ljava/lang/Class;Ll/c4d0;)Lcom/bumptech/glide/Registry;

    move-result-object v6

    .line 62
    invoke-static {}, Ll/yxj0$a;->a()Ll/yxj0$a;

    move-result-object v7

    .line 63
    const-class v9, Ll/anj;

    invoke-virtual {v6, v9, v9, v7}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v6

    new-instance v7, Ll/inj;

    invoke-direct {v7, v13}, Ll/inj;-><init>(Ll/w23;)V

    .line 64
    invoke-virtual {v6, v10, v9, v1, v7}, Lcom/bumptech/glide/Registry;->e(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    move-result-object v6

    .line 65
    const-class v7, Landroid/net/Uri;

    move-object/from16 v9, v22

    move-object/from16 v10, v23

    invoke-virtual {v6, v7, v10, v9}, Lcom/bumptech/glide/Registry;->b(Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    move-result-object v6

    new-instance v12, Ll/v3d0;

    invoke-direct {v12, v9, v13}, Ll/v3d0;-><init>(Ll/b4d0;Ll/w23;)V

    .line 66
    invoke-virtual {v6, v7, v1, v12}, Lcom/bumptech/glide/Registry;->b(Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    move-result-object v6

    new-instance v9, Ll/dr3$a;

    invoke-direct {v9}, Ll/dr3$a;-><init>()V

    .line 67
    invoke-virtual {v6, v9}, Lcom/bumptech/glide/Registry;->p(Lcom/bumptech/glide/load/data/a$a;)Lcom/bumptech/glide/Registry;

    move-result-object v6

    new-instance v9, Ll/br3$b;

    invoke-direct {v9}, Ll/br3$b;-><init>()V

    .line 68
    const-class v12, Ljava/io/File;

    invoke-virtual {v6, v12, v0, v9}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v6

    new-instance v9, Ll/vii$e;

    invoke-direct {v9}, Ll/vii$e;-><init>()V

    .line 69
    invoke-virtual {v6, v12, v11, v9}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v6

    new-instance v9, Ll/pii;

    invoke-direct {v9}, Ll/pii;-><init>()V

    .line 70
    invoke-virtual {v6, v12, v12, v9}, Lcom/bumptech/glide/Registry;->b(Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    move-result-object v6

    new-instance v9, Ll/vii$b;

    invoke-direct {v9}, Ll/vii$b;-><init>()V

    .line 71
    invoke-virtual {v6, v12, v2, v9}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v6

    .line 72
    invoke-static {}, Ll/yxj0$a;->a()Ll/yxj0$a;

    move-result-object v9

    invoke-virtual {v6, v12, v12, v9}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v6

    new-instance v9, Lcom/bumptech/glide/load/data/c$a;

    invoke-direct {v9, v3}, Lcom/bumptech/glide/load/data/c$a;-><init>(Ll/o01;)V

    .line 73
    invoke-virtual {v6, v9}, Lcom/bumptech/glide/Registry;->p(Lcom/bumptech/glide/load/data/a$a;)Lcom/bumptech/glide/Registry;

    .line 74
    invoke-static {}, Lcom/bumptech/glide/load/data/ParcelFileDescriptorRewinder;->b()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 75
    new-instance v6, Lcom/bumptech/glide/load/data/ParcelFileDescriptorRewinder$a;

    invoke-direct {v6}, Lcom/bumptech/glide/load/data/ParcelFileDescriptorRewinder$a;-><init>()V

    move-object/from16 v9, v24

    invoke-virtual {v9, v6}, Lcom/bumptech/glide/Registry;->p(Lcom/bumptech/glide/load/data/a$a;)Lcom/bumptech/glide/Registry;

    goto :goto_2

    :cond_4
    move-object/from16 v9, v24

    .line 76
    :goto_2
    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    move-object/from16 v14, v21

    invoke-virtual {v9, v6, v11, v14}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v15

    move-object/from16 v3, v17

    .line 77
    invoke-virtual {v15, v6, v2, v3}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v15

    move-object/from16 p6, v8

    .line 78
    const-class v8, Ljava/lang/Integer;

    invoke-virtual {v15, v8, v11, v14}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v14

    .line 79
    invoke-virtual {v14, v8, v2, v3}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v3

    move-object/from16 v14, p7

    .line 80
    invoke-virtual {v3, v8, v7, v14}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v3

    move-object/from16 v15, v16

    move-object/from16 v13, v25

    .line 81
    invoke-virtual {v3, v6, v13, v15}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v3

    .line 82
    invoke-virtual {v3, v8, v13, v15}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v3

    .line 83
    invoke-virtual {v3, v6, v7, v14}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v3

    new-instance v6, Ll/v6c$c;

    invoke-direct {v6}, Ll/v6c$c;-><init>()V

    .line 84
    const-class v8, Ljava/lang/String;

    invoke-virtual {v3, v8, v11, v6}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v3

    new-instance v6, Ll/v6c$c;

    invoke-direct {v6}, Ll/v6c$c;-><init>()V

    .line 85
    invoke-virtual {v3, v7, v11, v6}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v3

    new-instance v6, Ll/e8g0$c;

    invoke-direct {v6}, Ll/e8g0$c;-><init>()V

    .line 86
    invoke-virtual {v3, v8, v11, v6}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v3

    new-instance v6, Ll/e8g0$b;

    invoke-direct {v6}, Ll/e8g0$b;-><init>()V

    .line 87
    invoke-virtual {v3, v8, v2, v6}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v3

    new-instance v6, Ll/e8g0$a;

    invoke-direct {v6}, Ll/e8g0$a;-><init>()V

    .line 88
    invoke-virtual {v3, v8, v13, v6}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v3

    new-instance v6, Ll/b21$c;

    .line 89
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v8

    invoke-direct {v6, v8}, Ll/b21$c;-><init>(Landroid/content/res/AssetManager;)V

    invoke-virtual {v3, v7, v11, v6}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v3

    new-instance v6, Ll/b21$b;

    .line 90
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v8

    invoke-direct {v6, v8}, Ll/b21$b;-><init>(Landroid/content/res/AssetManager;)V

    .line 91
    invoke-virtual {v3, v7, v13, v6}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v3

    new-instance v6, Ll/w6y$a;

    move-object/from16 v8, p1

    invoke-direct {v6, v8}, Ll/w6y$a;-><init>(Landroid/content/Context;)V

    .line 92
    invoke-virtual {v3, v7, v11, v6}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v3

    new-instance v6, Ll/y6y$a;

    invoke-direct {v6, v8}, Ll/y6y$a;-><init>(Landroid/content/Context;)V

    .line 93
    invoke-virtual {v3, v7, v11, v6}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    const/16 v3, 0x1d

    move/from16 v6, p3

    if-lt v6, v3, :cond_5

    .line 94
    new-instance v3, Ll/cvb0$c;

    invoke-direct {v3, v8}, Ll/cvb0$c;-><init>(Landroid/content/Context;)V

    invoke-virtual {v9, v7, v11, v3}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    .line 95
    new-instance v3, Ll/cvb0$b;

    invoke-direct {v3, v8}, Ll/cvb0$b;-><init>(Landroid/content/Context;)V

    invoke-virtual {v9, v7, v2, v3}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    .line 96
    :cond_5
    new-instance v3, Ll/e4k0$d;

    move-object/from16 v6, v20

    invoke-direct {v3, v6}, Ll/e4k0$d;-><init>(Landroid/content/ContentResolver;)V

    .line 97
    invoke-virtual {v9, v7, v11, v3}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v3

    new-instance v14, Ll/e4k0$b;

    invoke-direct {v14, v6}, Ll/e4k0$b;-><init>(Landroid/content/ContentResolver;)V

    .line 98
    invoke-virtual {v3, v7, v2, v14}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    new-instance v3, Ll/e4k0$a;

    invoke-direct {v3, v6}, Ll/e4k0$a;-><init>(Landroid/content/ContentResolver;)V

    .line 99
    invoke-virtual {v2, v7, v13, v3}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    new-instance v3, Ll/z5k0$a;

    invoke-direct {v3}, Ll/z5k0$a;-><init>()V

    .line 100
    invoke-virtual {v2, v7, v11, v3}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    new-instance v3, Ll/r4k0$a;

    invoke-direct {v3}, Ll/r4k0$a;-><init>()V

    .line 101
    const-class v6, Ljava/net/URL;

    invoke-virtual {v2, v6, v11, v3}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    new-instance v3, Ll/v6y$a;

    invoke-direct {v3, v8}, Ll/v6y$a;-><init>(Landroid/content/Context;)V

    .line 102
    invoke-virtual {v2, v7, v12, v3}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    new-instance v3, Ll/wml$a;

    invoke-direct {v3}, Ll/wml$a;-><init>()V

    .line 103
    const-class v6, Ll/e4k;

    invoke-virtual {v2, v6, v11, v3}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    new-instance v3, Ll/uq3$a;

    invoke-direct {v3}, Ll/uq3$a;-><init>()V

    .line 104
    const-class v6, [B

    invoke-virtual {v2, v6, v0, v3}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    new-instance v3, Ll/uq3$d;

    invoke-direct {v3}, Ll/uq3$d;-><init>()V

    .line 105
    invoke-virtual {v2, v6, v11, v3}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    .line 106
    invoke-static {}, Ll/yxj0$a;->a()Ll/yxj0$a;

    move-result-object v3

    invoke-virtual {v2, v7, v7, v3}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    .line 107
    invoke-static {}, Ll/yxj0$a;->a()Ll/yxj0$a;

    move-result-object v3

    invoke-virtual {v2, v10, v10, v3}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ll/se00;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    new-instance v3, Ll/xxj0;

    invoke-direct {v3}, Ll/xxj0;-><init>()V

    .line 108
    invoke-virtual {v2, v10, v10, v3}, Lcom/bumptech/glide/Registry;->b(Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    new-instance v3, Ll/a23;

    invoke-direct {v3, v4}, Ll/a23;-><init>(Landroid/content/res/Resources;)V

    .line 109
    invoke-virtual {v2, v1, v5, v3}, Lcom/bumptech/glide/Registry;->q(Ljava/lang/Class;Ljava/lang/Class;Ll/y4d0;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    move-object/from16 v3, v18

    .line 110
    invoke-virtual {v2, v1, v6, v3}, Lcom/bumptech/glide/Registry;->q(Ljava/lang/Class;Ljava/lang/Class;Ll/y4d0;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    new-instance v7, Ll/nce;

    move-object/from16 v13, p4

    move-object/from16 v11, v19

    invoke-direct {v7, v13, v3, v11}, Ll/nce;-><init>(Ll/w23;Ll/y4d0;Ll/y4d0;)V

    .line 111
    invoke-virtual {v2, v10, v6, v7}, Lcom/bumptech/glide/Registry;->q(Ljava/lang/Class;Ljava/lang/Class;Ll/y4d0;)Lcom/bumptech/glide/Registry;

    move-result-object v2

    move-object/from16 v3, p6

    .line 112
    invoke-virtual {v2, v3, v6, v11}, Lcom/bumptech/glide/Registry;->q(Ljava/lang/Class;Ljava/lang/Class;Ll/y4d0;)Lcom/bumptech/glide/Registry;

    .line 113
    invoke-static {v13}, Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder;->d(Ll/w23;)Ll/z3d0;

    move-result-object v2

    .line 114
    invoke-virtual {v9, v0, v1, v2}, Lcom/bumptech/glide/Registry;->b(Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    .line 115
    new-instance v1, Ll/y13;

    invoke-direct {v1, v4, v2}, Ll/y13;-><init>(Landroid/content/res/Resources;Ll/z3d0;)V

    invoke-virtual {v9, v0, v5, v1}, Lcom/bumptech/glide/Registry;->b(Ljava/lang/Class;Ljava/lang/Class;Ll/z3d0;)Lcom/bumptech/glide/Registry;

    .line 116
    new-instance v5, Ll/clm;

    invoke-direct {v5}, Ll/clm;-><init>()V

    .line 117
    new-instance v1, Lcom/bumptech/glide/c;

    move-object/from16 v3, p5

    move/from16 v11, p8

    move-object/from16 v6, p9

    move-object/from16 v7, p10

    move-object/from16 v10, p12

    move-object v2, v8

    move-object v4, v9

    move-object/from16 v9, p2

    move-object/from16 v8, p11

    invoke-direct/range {v1 .. v11}, Lcom/bumptech/glide/c;-><init>(Landroid/content/Context;Ll/o01;Lcom/bumptech/glide/Registry;Ll/clm;Lcom/bumptech/glide/a$a;Ljava/util/Map;Ljava/util/List;Lcom/bumptech/glide/load/engine/h;Lcom/bumptech/glide/d;I)V

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/bumptech/glide/a;->d:Lcom/bumptech/glide/c;

    return-void
.end method

.method private static a(Landroid/content/Context;Lcom/bumptech/glide/GeneratedAppGlideModule;)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/bumptech/glide/GeneratedAppGlideModule;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/GuardedBy;
        value = "Glide.class"
    .end annotation

    .line 1
    sget-boolean v0, Lcom/bumptech/glide/a;->m:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sput-boolean v0, Lcom/bumptech/glide/a;->m:Z

    .line 7
    .line 8
    invoke-static {p0, p1}, Lcom/bumptech/glide/a;->m(Landroid/content/Context;Lcom/bumptech/glide/GeneratedAppGlideModule;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    sput-boolean p0, Lcom/bumptech/glide/a;->m:Z

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string p0, "You cannot call Glide.get() in registerComponents(), use the provided Glide instance instead"

    .line 16
    .line 17
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static c(Landroid/content/Context;)Lcom/bumptech/glide/a;
    .locals 3
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/bumptech/glide/a;->l:Lcom/bumptech/glide/a;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/bumptech/glide/a;->d(Landroid/content/Context;)Lcom/bumptech/glide/GeneratedAppGlideModule;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-class v1, Lcom/bumptech/glide/a;

    .line 14
    .line 15
    monitor-enter v1

    .line 16
    :try_start_0
    sget-object v2, Lcom/bumptech/glide/a;->l:Lcom/bumptech/glide/a;

    .line 17
    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    invoke-static {p0, v0}, Lcom/bumptech/glide/a;->a(Landroid/content/Context;Lcom/bumptech/glide/GeneratedAppGlideModule;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    :goto_0
    monitor-exit v1

    .line 27
    goto :goto_2

    .line 28
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw p0

    .line 30
    :cond_1
    :goto_2
    sget-object p0, Lcom/bumptech/glide/a;->l:Lcom/bumptech/glide/a;

    .line 31
    .line 32
    return-object p0
.end method

.method private static d(Landroid/content/Context;)Lcom/bumptech/glide/GeneratedAppGlideModule;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    :try_start_0
    const-string v0, "com.bumptech.glide.GeneratedAppGlideModuleImpl"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-class v1, Landroid/content/Context;

    .line 8
    .line 9
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/bumptech/glide/GeneratedAppGlideModule;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    return-object p0

    .line 32
    :catch_0
    move-exception p0

    .line 33
    invoke-static {p0}, Lcom/bumptech/glide/a;->q(Ljava/lang/Exception;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catch_1
    move-exception p0

    .line 38
    invoke-static {p0}, Lcom/bumptech/glide/a;->q(Ljava/lang/Exception;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catch_2
    move-exception p0

    .line 43
    invoke-static {p0}, Lcom/bumptech/glide/a;->q(Ljava/lang/Exception;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catch_3
    move-exception p0

    .line 48
    invoke-static {p0}, Lcom/bumptech/glide/a;->q(Ljava/lang/Exception;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catch_4
    const-string p0, "Glide"

    .line 53
    .line 54
    const/4 v0, 0x5

    .line 55
    invoke-static {p0, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 56
    .line 57
    .line 58
    :goto_0
    const/4 p0, 0x0

    .line 59
    return-object p0
.end method

.method private static l(Landroid/content/Context;)Lcom/bumptech/glide/manager/m;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const-string v0, "You cannot start a load on a not yet attached View or a Fragment where getActivity() returns null (which usually occurs when getActivity() is called before the Fragment is attached or after the Fragment is destroyed)."

    .line 2
    .line 3
    invoke-static {p0, v0}, Ll/vn80;->e(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lcom/bumptech/glide/a;->c(Landroid/content/Context;)Lcom/bumptech/glide/a;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/bumptech/glide/a;->k()Lcom/bumptech/glide/manager/m;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method private static m(Landroid/content/Context;Lcom/bumptech/glide/GeneratedAppGlideModule;)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/bumptech/glide/GeneratedAppGlideModule;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/GuardedBy;
        value = "Glide.class"
    .end annotation

    .line 1
    new-instance v0, Lcom/bumptech/glide/b;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/bumptech/glide/b;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0, p1}, Lcom/bumptech/glide/a;->n(Landroid/content/Context;Lcom/bumptech/glide/b;Lcom/bumptech/glide/GeneratedAppGlideModule;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static n(Landroid/content/Context;Lcom/bumptech/glide/b;Lcom/bumptech/glide/GeneratedAppGlideModule;)V
    .locals 7
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/bumptech/glide/b;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/GeneratedAppGlideModule;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/GuardedBy;
        value = "Glide.class"
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Ll/tw0;->c()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    :cond_0
    new-instance v0, Ll/wuw;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/wuw;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ll/wuw;->a()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :cond_1
    const/4 v1, 0x3

    .line 25
    const-string v2, "Glide"

    .line 26
    .line 27
    if-eqz p2, :cond_4

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/bumptech/glide/GeneratedAppGlideModule;->d()Ljava/util/Set;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-nez v3, :cond_4

    .line 38
    .line 39
    invoke-virtual {p2}, Lcom/bumptech/glide/GeneratedAppGlideModule;->d()Ljava/util/Set;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    if-eqz v5, :cond_4

    .line 52
    .line 53
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    check-cast v5, Ll/b4k;

    .line 58
    .line 59
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    invoke-interface {v3, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v6

    .line 67
    if-nez v6, :cond_2

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    invoke-static {v2, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 71
    .line 72
    .line 73
    move-result v6

    .line 74
    if-eqz v6, :cond_3

    .line 75
    .line 76
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    :cond_3
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    invoke-static {v2, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_5

    .line 88
    .line 89
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_5

    .line 98
    .line 99
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    check-cast v2, Ll/b4k;

    .line 104
    .line 105
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_5
    if-eqz p2, :cond_6

    .line 114
    .line 115
    invoke-virtual {p2}, Lcom/bumptech/glide/GeneratedAppGlideModule;->e()Lcom/bumptech/glide/manager/m$b;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    goto :goto_2

    .line 120
    :cond_6
    const/4 v1, 0x0

    .line 121
    :goto_2
    invoke-virtual {p1, v1}, Lcom/bumptech/glide/b;->b(Lcom/bumptech/glide/manager/m$b;)V

    .line 122
    .line 123
    .line 124
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    if-eqz v2, :cond_7

    .line 133
    .line 134
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    check-cast v2, Ll/b4k;

    .line 139
    .line 140
    invoke-interface {v2, p0, p1}, Ll/b4k;->a(Landroid/content/Context;Lcom/bumptech/glide/b;)V

    .line 141
    .line 142
    .line 143
    goto :goto_3

    .line 144
    :cond_7
    if-eqz p2, :cond_8

    .line 145
    .line 146
    invoke-virtual {p2, p0, p1}, Ll/tw0;->b(Landroid/content/Context;Lcom/bumptech/glide/b;)V

    .line 147
    .line 148
    .line 149
    :cond_8
    invoke-virtual {p1, p0}, Lcom/bumptech/glide/b;->a(Landroid/content/Context;)Lcom/bumptech/glide/a;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    if-eqz v1, :cond_9

    .line 162
    .line 163
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    check-cast v1, Ll/b4k;

    .line 168
    .line 169
    :try_start_0
    iget-object v2, p1, Lcom/bumptech/glide/a;->e:Lcom/bumptech/glide/Registry;

    .line 170
    .line 171
    invoke-interface {v1, p0, p1, v2}, Ll/b4k;->b(Landroid/content/Context;Lcom/bumptech/glide/a;Lcom/bumptech/glide/Registry;)V
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 172
    .line 173
    .line 174
    goto :goto_4

    .line 175
    :catch_0
    move-exception p0

    .line 176
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    const-string p2, "Attempting to register a Glide v3 module. If you see this, you or one of your dependencies may be including Glide v3 even though you\'re using Glide v4. You\'ll need to find and remove (or update) the offending dependency. The v3 module name is: "

    .line 185
    .line 186
    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    invoke-static {p1, p0}, Ll/yzv;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :cond_9
    if-eqz p2, :cond_a

    .line 195
    .line 196
    iget-object v0, p1, Lcom/bumptech/glide/a;->e:Lcom/bumptech/glide/Registry;

    .line 197
    .line 198
    invoke-virtual {p2, p0, p1, v0}, Ll/rdr;->a(Landroid/content/Context;Lcom/bumptech/glide/a;Lcom/bumptech/glide/Registry;)V

    .line 199
    .line 200
    .line 201
    :cond_a
    invoke-virtual {p0, p1}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 202
    .line 203
    .line 204
    sput-object p1, Lcom/bumptech/glide/a;->l:Lcom/bumptech/glide/a;

    .line 205
    .line 206
    return-void
.end method

.method private static q(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 2
    .line 3
    const-string v1, "GeneratedAppGlideModuleImpl is implemented incorrectly. If you\'ve manually implemented this class, remove your implementation. The Annotation processor will generate a correct implementation."

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    throw v0
.end method

.method public static t(Landroid/content/Context;)Ll/m2d0;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/bumptech/glide/a;->l(Landroid/content/Context;)Lcom/bumptech/glide/manager/m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/bumptech/glide/manager/m;->l(Landroid/content/Context;)Ll/m2d0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static u(Landroid/view/View;)Ll/m2d0;
    .locals 1
    .param p0    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/bumptech/glide/a;->l(Landroid/content/Context;)Lcom/bumptech/glide/manager/m;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p0}, Lcom/bumptech/glide/manager/m;->m(Landroid/view/View;)Ll/m2d0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static v(Landroidx/fragment/app/FragmentActivity;)Ll/m2d0;
    .locals 1
    .param p0    # Landroidx/fragment/app/FragmentActivity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/bumptech/glide/a;->l(Landroid/content/Context;)Lcom/bumptech/glide/manager/m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/bumptech/glide/manager/m;->o(Landroidx/fragment/app/FragmentActivity;)Ll/m2d0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    invoke-static {}, Ll/ylk0;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/bumptech/glide/a;->c:Ll/lpy;

    .line 5
    .line 6
    invoke-interface {v0}, Ll/lpy;->b()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/bumptech/glide/a;->b:Ll/w23;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/w23;->b()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/bumptech/glide/a;->f:Ll/o01;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/o01;->b()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public e()Ll/o01;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/a;->f:Ll/o01;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ll/w23;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/a;->b:Ll/w23;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Lcom/bumptech/glide/manager/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/a;->h:Lcom/bumptech/glide/manager/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/a;->d:Lcom/bumptech/glide/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public i()Lcom/bumptech/glide/c;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/a;->d:Lcom/bumptech/glide/c;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Lcom/bumptech/glide/Registry;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/a;->e:Lcom/bumptech/glide/Registry;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Lcom/bumptech/glide/manager/m;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/a;->g:Lcom/bumptech/glide/manager/m;

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Ll/m2d0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/a;->i:Ljava/util/List;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/bumptech/glide/a;->i:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/bumptech/glide/a;->i:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    monitor-exit v0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 22
    .line 23
    const-string p1, "Cannot register already registered manager"

    .line 24
    .line 25
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    throw p0

    .line 29
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    throw p0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    return-void
.end method

.method public onLowMemory()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/bumptech/glide/a;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/a;->r(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public p(Ll/cli0;)Z
    .locals 2
    .param p1    # Ll/cli0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/cli0<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/a;->i:Ljava/util/List;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/bumptech/glide/a;->i:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ll/m2d0;

    .line 21
    .line 22
    invoke-virtual {v1, p1}, Ll/m2d0;->A(Ll/cli0;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    monitor-exit v0

    .line 30
    return p0

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    monitor-exit v0

    .line 34
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    throw p0
.end method

.method public r(I)V
    .locals 3

    .line 1
    invoke-static {}, Ll/ylk0;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/bumptech/glide/a;->i:Ljava/util/List;

    .line 5
    .line 6
    monitor-enter v0

    .line 7
    :try_start_0
    iget-object v1, p0, Lcom/bumptech/glide/a;->i:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Ll/m2d0;

    .line 24
    .line 25
    invoke-virtual {v2, p1}, Ll/m2d0;->onTrimMemory(I)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    iget-object v0, p0, Lcom/bumptech/glide/a;->c:Ll/lpy;

    .line 33
    .line 34
    invoke-interface {v0, p1}, Ll/lpy;->a(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/bumptech/glide/a;->b:Ll/w23;

    .line 38
    .line 39
    invoke-interface {v0, p1}, Ll/w23;->a(I)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/bumptech/glide/a;->f:Ll/o01;

    .line 43
    .line 44
    invoke-interface {p0, p1}, Ll/o01;->a(I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    throw p0
.end method

.method public s(Ll/m2d0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/a;->i:Ljava/util/List;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/bumptech/glide/a;->i:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/bumptech/glide/a;->i:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    monitor-exit v0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 22
    .line 23
    const-string p1, "Cannot unregister not yet registered manager"

    .line 24
    .line 25
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    throw p0

    .line 29
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    throw p0
.end method
