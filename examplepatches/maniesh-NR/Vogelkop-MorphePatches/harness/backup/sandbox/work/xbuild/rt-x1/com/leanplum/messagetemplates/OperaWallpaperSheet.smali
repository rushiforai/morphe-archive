.class public final Lcom/leanplum/messagetemplates/OperaWallpaperSheet;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000c\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\'\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u001b\u0010\u0010\u001a\u00020\u000f*\u00020\u00042\u0006\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u001d\u0010\u0012\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0012\u0010\u0013R\u0014\u0010\u0014\u001a\u00020\r8\u0006X\u0086T\u00a2\u0006\u0006\n\u0004\u0008\u0014\u0010\u0015R\u0014\u0010\u0016\u001a\u00020\r8\u0002X\u0082T\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010\u0015R\u0014\u0010\u0017\u001a\u00020\r8\u0002X\u0082T\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010\u0015R\u0014\u0010\u0018\u001a\u00020\r8\u0002X\u0082T\u00a2\u0006\u0006\n\u0004\u0008\u0018\u0010\u0015R\u0014\u0010\u0019\u001a\u00020\r8\u0002X\u0082T\u00a2\u0006\u0006\n\u0004\u0008\u0019\u0010\u0015R\u0014\u0010\u001a\u001a\u00020\r8\u0002X\u0082T\u00a2\u0006\u0006\n\u0004\u0008\u001a\u0010\u0015\u00a8\u0006\u001b"
    }
    d2 = {
        "Lcom/leanplum/messagetemplates/OperaWallpaperSheet;",
        "",
        "<init>",
        "()V",
        "Lcom/leanplum/ActionContext;",
        "actionContext",
        "Ltcl;",
        "taskExecutor",
        "Lorm;",
        "usageReporter",
        "",
        "initializeSheetRequest",
        "(Lcom/leanplum/ActionContext;Ltcl;Lorm;)V",
        "",
        "argumentName",
        "Lcom/leanplum/messagetemplates/ResourceWrapper;",
        "loadResourceWrapper",
        "(Lcom/leanplum/ActionContext;Ljava/lang/String;)Lcom/leanplum/messagetemplates/ResourceWrapper;",
        "register",
        "(Ltcl;Lorm;)V",
        "NAME",
        "Ljava/lang/String;",
        "WALLPAPER_IDS",
        "AVATAR",
        "DARK_MODE_AVATAR",
        "CENTERED_TEXT",
        "THEME_IDS",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I = 0x0

.field private static final AVATAR:Ljava/lang/String; = "Avatar Image"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final CENTERED_TEXT:Ljava/lang/String; = "Center text"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final DARK_MODE_AVATAR:Ljava/lang/String; = "Avatar Image Dark"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final INSTANCE:Lcom/leanplum/messagetemplates/OperaWallpaperSheet;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final NAME:Ljava/lang/String; = "Wallpaper Sheet"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final THEME_IDS:Ljava/lang/String; = "Theme IDs"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final WALLPAPER_IDS:Ljava/lang/String; = "Wallpaper IDs"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/leanplum/messagetemplates/OperaWallpaperSheet;

    invoke-direct {v0}, Lcom/leanplum/messagetemplates/OperaWallpaperSheet;-><init>()V

    sput-object v0, Lcom/leanplum/messagetemplates/OperaWallpaperSheet;->INSTANCE:Lcom/leanplum/messagetemplates/OperaWallpaperSheet;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a(Lcom/opera/android/BrowserActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Lcom/leanplum/ActionContext;Lorm;Lkotlin/Pair;)Lkotlin/Unit;
    .registers 12

    invoke-static/range {p0 .. p11}, Lcom/leanplum/messagetemplates/OperaWallpaperSheet;->initializeSheetRequest$lambda$1(Lcom/opera/android/BrowserActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Lcom/leanplum/ActionContext;Lorm;Lkotlin/Pair;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$initializeSheetRequest(Lcom/leanplum/messagetemplates/OperaWallpaperSheet;Lcom/leanplum/ActionContext;Ltcl;Lorm;)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Lcom/leanplum/messagetemplates/OperaWallpaperSheet;->initializeSheetRequest(Lcom/leanplum/ActionContext;Ltcl;Lorm;)V

    return-void
.end method

.method public static synthetic b(Lcom/leanplum/ActionContext;)Lkotlin/Pair;
    .registers 1

    invoke-static {p0}, Lcom/leanplum/messagetemplates/OperaWallpaperSheet;->initializeSheetRequest$lambda$0(Lcom/leanplum/ActionContext;)Lkotlin/Pair;

    move-result-object p0

    return-object p0
.end method

.method private final initializeSheetRequest(Lcom/leanplum/ActionContext;Ltcl;Lorm;)V
    .registers 18

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->getCurrentActivity()Landroid/app/Activity;

    move-result-object p0

    instance-of v0, p0, Lcom/opera/android/BrowserActivity;

    const/4 v1, 0x0

    if-eqz v0, :cond_d

    check-cast p0, Lcom/opera/android/BrowserActivity;

    move-object v3, p0

    goto :goto_e

    :cond_d
    move-object v3, v1

    :goto_e
    if-nez v3, :cond_11

    return-void

    :cond_11
    const-string p0, "Title"

    invoke-virtual {p1, p0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string p0, "Message"

    invoke-virtual {p1, p0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string p0, "Primary Text"

    invoke-virtual {p1, p0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string p0, "Secondary Text"

    invoke-virtual {p1, p0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string p0, "Wallpaper IDs"

    invoke-virtual {p1, p0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string p0, "Center text"

    invoke-virtual {p1, p0}, Lcom/leanplum/ActionContext;->booleanNamed(Ljava/lang/String;)Z

    move-result v9

    const-string p0, "Secondary Action"

    invoke-virtual {p1, p0}, Lcom/leanplum/ActionContext;->objectNamed(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    const-string v0, "Theme IDs"

    invoke-virtual {p1, v0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_52

    check-cast p0, Ljava/util/Map;

    const-string v0, "URL"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_52

    move-object v1, p0

    check-cast v1, Ljava/lang/String;

    :cond_52
    move-object v10, v1

    new-instance p0, Lodf;

    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lodf;-><init>(B)V

    move-object/from16 v0, p2

    check-cast v0, Lumi;

    invoke-virtual {v0, p0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    new-instance v2, Llpf;

    move-object v12, p1

    move-object/from16 v13, p3

    invoke-direct/range {v2 .. v13}, Llpf;-><init>(Lcom/opera/android/BrowserActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Lcom/leanplum/ActionContext;Lorm;)V

    invoke-virtual {v0, v2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnml;->b(Lnml;)V

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method private static final initializeSheetRequest$lambda$0(Lcom/leanplum/ActionContext;)Lkotlin/Pair;
    .registers 5

    new-instance v0, Lkotlin/Pair;

    sget-object v1, Lcom/leanplum/messagetemplates/OperaWallpaperSheet;->INSTANCE:Lcom/leanplum/messagetemplates/OperaWallpaperSheet;

    const-string v2, "Avatar Image"

    invoke-direct {v1, p0, v2}, Lcom/leanplum/messagetemplates/OperaWallpaperSheet;->loadResourceWrapper(Lcom/leanplum/ActionContext;Ljava/lang/String;)Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object v2

    const-string v3, "Avatar Image Dark"

    invoke-direct {v1, p0, v3}, Lcom/leanplum/messagetemplates/OperaWallpaperSheet;->loadResourceWrapper(Lcom/leanplum/ActionContext;Ljava/lang/String;)Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object p0

    invoke-direct {v0, v2, p0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method private static final initializeSheetRequest$lambda$1(Lcom/opera/android/BrowserActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Lcom/leanplum/ActionContext;Lorm;Lkotlin/Pair;)Lkotlin/Unit;
    .registers 32

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p8

    move-object/from16 v3, p11

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    iget-object v5, v3, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v5, Lcom/leanplum/messagetemplates/ResourceWrapper;

    iget-object v12, v5, Lcom/leanplum/messagetemplates/ResourceWrapper;->image:Landroid/graphics/Bitmap;

    iget-object v5, v3, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v5, Lcom/leanplum/messagetemplates/ResourceWrapper;

    iget-object v13, v5, Lcom/leanplum/messagetemplates/ResourceWrapper;->image:Landroid/graphics/Bitmap;

    new-instance v5, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$initializeSheetRequest$2$1;

    move-object/from16 v6, p9

    move-object/from16 v7, p10

    invoke-direct {v5, v6, v7, v3}, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$initializeSheetRequest$2$1;-><init>(Lcom/leanplum/ActionContext;Lorm;Lkotlin/Pair;)V

    sget-object v3, Lymn;->n:Lxq3;

    if-nez v3, :cond_23e

    const/4 v3, 0x0

    const/16 v18, 0x0

    const/4 v6, 0x1

    const/16 v7, 0xa

    const/16 v8, 0x2c

    if-eqz v1, :cond_a6

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v9

    if-eqz v9, :cond_a6

    invoke-static {v3, v1, v8}, Laik;->r(ZLjava/lang/String;C)Ljava/util/ArrayList;

    move-result-object v9

    new-instance v10, Ljava/util/ArrayList;

    invoke-static {v9, v7}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v11

    invoke-direct {v10, v11}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v11

    move v14, v3

    :goto_4f
    if-ge v14, v11, :cond_9b

    invoke-virtual {v9, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    add-int/lit8 v14, v14, 0x1

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v16

    add-int/lit8 v16, v16, -0x1

    move/from16 p10, v3

    move/from16 p9, v8

    move/from16 v8, v16

    move/from16 v16, p10

    :goto_67
    if-gt v3, v8, :cond_85

    if-nez v16, :cond_6d

    move v7, v3

    goto :goto_6e

    :cond_6d
    move v7, v8

    :goto_6e
    invoke-virtual {v15, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-static {v7}, Lkotlin/text/CharsKt;->c(C)Z

    move-result v7

    if-nez v16, :cond_80

    if-nez v7, :cond_7d

    move/from16 v16, v6

    goto :goto_67

    :cond_7d
    add-int/lit8 v3, v3, 0x1

    goto :goto_67

    :cond_80
    if-eqz v7, :cond_85

    add-int/lit8 v8, v8, -0x1

    goto :goto_67

    :cond_85
    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v15, v3, v8}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lvq8;->m(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move/from16 v8, p9

    move/from16 v3, p10

    goto :goto_4f

    :cond_9b
    move/from16 p10, v3

    move/from16 p9, v8

    new-instance v3, Ljava/util/LinkedHashSet;

    invoke-direct {v3, v10}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    move-object v7, v3

    goto :goto_ac

    :cond_a6
    move/from16 p10, v3

    move/from16 p9, v8

    move-object/from16 v7, v18

    :goto_ac
    if-nez v7, :cond_b8

    sget-object v3, Lvmn;->d:Lvmn;

    new-instance v7, Lrw7;

    invoke-direct {v7, v3}, Lrw7;-><init>(Ljava/lang/Object;)V

    :goto_b5
    move v3, v6

    goto/16 :goto_136

    :cond_b8
    if-eqz v2, :cond_116

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_c2

    move-object v3, v2

    goto :goto_c4

    :cond_c2
    move-object/from16 v3, v18

    :goto_c4
    if-eqz v3, :cond_116

    invoke-interface {v7}, Ljava/util/Set;->size()I

    move-result v8

    new-array v9, v6, [C

    aput-char p9, v9, p10

    invoke-static {v3, v9}, Lkotlin/text/StringsKt;->X(Ljava/lang/CharSequence;[C)Ljava/util/List;

    move-result-object v3

    check-cast v3, Ljava/lang/Iterable;

    new-instance v9, Ljava/util/ArrayList;

    const/16 v10, 0xa

    invoke-static {v3, v10}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v10

    invoke-direct {v9, v10}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_e3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_100

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    if-lez v11, :cond_fa

    invoke-static {v10}, Lg7j;->d(Ljava/lang/String;)Lg7j;

    move-result-object v10

    goto :goto_fc

    :cond_fa
    move-object/from16 v10, v18

    :goto_fc
    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_e3

    :cond_100
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-eq v3, v8, :cond_108

    move-object/from16 v9, v18

    :cond_108
    if-nez v9, :cond_112

    sget-object v3, Lvmn;->c:Lvmn;

    new-instance v7, Lrw7;

    invoke-direct {v7, v3}, Lrw7;-><init>(Ljava/lang/Object;)V

    goto :goto_b5

    :cond_112
    move-object/from16 v16, v9

    :goto_114
    move v3, v6

    goto :goto_119

    :cond_116
    move-object/from16 v16, v18

    goto :goto_114

    :goto_119
    new-instance v6, Lumn;

    sget-object v8, Lxmn;->c:Ldrj;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v17, Lxmn;->d:Lxmn;

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    move-object/from16 v11, p5

    move/from16 v14, p6

    move-object/from16 v15, p7

    invoke-direct/range {v6 .. v17}, Lumn;-><init>(Ljava/util/LinkedHashSet;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;ZLjava/lang/String;Ljava/util/ArrayList;Lxmn;)V

    new-instance v7, Lsw7;

    invoke-direct {v7, v6}, Lsw7;-><init>(Ljava/lang/Object;)V

    :goto_136
    instance-of v6, v7, Lrw7;

    if-eqz v6, :cond_16a

    check-cast v7, Lrw7;

    iget-object v0, v7, Lrw7;->a:Ljava/lang/Object;

    check-cast v0, Lvmn;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    if-eqz v4, :cond_161

    if-eq v4, v3, :cond_158

    const/4 v2, 0x2

    if-ne v4, v2, :cond_154

    invoke-virtual {v0, v1}, Lvmn;->d(Ljava/io/Serializable;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v0}, Lwmn;->onInvalidData(Ljava/lang/String;)V

    goto/16 :goto_23e

    :cond_154
    invoke-static {}, Lh9o;->p()V

    return-object v18

    :cond_158
    invoke-virtual {v0, v2}, Lvmn;->d(Ljava/io/Serializable;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v0}, Lwmn;->onInvalidData(Ljava/lang/String;)V

    goto/16 :goto_23e

    :cond_161
    invoke-virtual {v0, v1}, Lvmn;->d(Ljava/io/Serializable;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v0}, Lwmn;->onInvalidData(Ljava/lang/String;)V

    goto/16 :goto_23e

    :cond_16a
    instance-of v1, v7, Lsw7;

    if-eqz v1, :cond_241

    check-cast v7, Lsw7;

    iget-object v1, v7, Lsw7;->a:Ljava/lang/Object;

    check-cast v1, Lumn;

    sget v2, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->Q0()Lqln;

    move-result-object v2

    sget-object v6, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v6

    check-cast v6, Lcom/opera/android/OperaApplication;

    invoke-virtual {v6}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v6

    iget-object v6, v6, Ld6j;->c:Lx5f;

    const-class v7, Ld8j;

    iget-object v8, v0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {v8, v7}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v7

    check-cast v7, Ld8j;

    iget-object v8, v1, Lumn;->a:Ljava/util/LinkedHashSet;

    invoke-virtual {v2, v8}, Lqln;->k(Ljava/util/Set;)Ljava/util/ArrayList;

    move-result-object v9

    iget-object v10, v2, Lqln;->f:Lami;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v11

    invoke-interface {v8}, Ljava/util/Set;->size()I

    move-result v12

    if-eq v11, v12, :cond_1a6

    move v11, v3

    goto :goto_1a8

    :cond_1a6
    move/from16 v11, p10

    :goto_1a8
    iget-object v12, v10, Lami;->e:Ljava/lang/Object;

    check-cast v12, Lvq8;

    invoke-virtual {v12}, Lvq8;->i()Z

    move-result v12

    if-eqz v12, :cond_201

    if-nez v11, :cond_201

    invoke-virtual {v9}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1f7

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->O()Leej;

    move-result-object v3

    invoke-virtual {v2, v8}, Lqln;->q(Ljava/util/Set;)V

    new-instance v8, Lxbf;

    invoke-direct {v8, v0, v2, v4, v5}, Lxbf;-><init>(Lcom/opera/android/BrowserActivity;Lqln;Lcom/opera/android/settings/SettingsManager;Lcom/leanplum/messagetemplates/OperaWallpaperSheet$initializeSheetRequest$2$1;)V

    new-instance v0, Lymn;

    iget-object v5, v3, Leej;->c:Lgjm;

    move-object/from16 p0, v0

    move-object/from16 p6, v1

    move-object/from16 p1, v2

    move-object/from16 p4, v3

    move-object/from16 p3, v4

    move-object/from16 p7, v5

    move-object/from16 p2, v6

    move-object/from16 p5, v7

    invoke-direct/range {p0 .. p7}, Lymn;-><init>(Lqln;Lx5f;Lcom/opera/android/settings/SettingsManager;Leej;Ld8j;Lumn;Lgjm;)V

    move-object/from16 v1, p0

    move-object/from16 v0, p4

    new-instance v2, Lxq3;

    const/16 v3, 0xf

    move/from16 v4, p10

    invoke-direct {v2, v3, v1, v8, v4}, Lxq3;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iget-object v0, v0, Leej;->a:Lnej;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {v0, v2, v1}, Lr22;->b(Ljjm;Lijm;)V

    sput-object v2, Lymn;->n:Lxq3;

    goto :goto_23e

    :cond_1f7
    sget-object v0, Lvmn;->d:Lvmn;

    invoke-virtual {v0, v8}, Lvmn;->d(Ljava/io/Serializable;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v0}, Lwmn;->onInvalidData(Ljava/lang/String;)V

    goto :goto_23e

    :cond_201
    move-object/from16 v19, v2

    move-object v2, v1

    move-object v1, v4

    move-object/from16 v4, v19

    new-instance v9, Lne5;

    move-object/from16 p4, v0

    move-object/from16 p7, v1

    move-object/from16 p3, v2

    move-object/from16 p5, v4

    move-object/from16 p2, v5

    move-object/from16 p6, v6

    move-object/from16 p8, v7

    move-object/from16 p1, v9

    invoke-direct/range {p1 .. p8}, Lne5;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    move-object/from16 v0, p1

    iget-object v1, v10, Lami;->e:Ljava/lang/Object;

    check-cast v1, Lvq8;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lcln;

    invoke-direct {v2, v1, v3, v0}, Lcln;-><init>(Lvq8;ZLgln;)V

    new-instance v0, Lq59;

    iget-object v3, v1, Lvq8;->i:Ljava/lang/Object;

    check-cast v3, Lqi5;

    iget-object v3, v3, Lqi5;->c:Lode;

    check-cast v3, Lh42;

    new-instance v4, Ls2g;

    const/16 v5, 0xc

    invoke-direct {v4, v1, v8, v2, v5}, Ls2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v0, v3, v4}, Lq59;-><init>(Lekc;Lcom/opera/api/Callback;)V

    :cond_23e
    :goto_23e
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :cond_241
    invoke-static {}, Lh9o;->p()V

    return-object v18
.end method

.method private final loadResourceWrapper(Lcom/leanplum/ActionContext;Ljava/lang/String;)Lcom/leanplum/messagetemplates/ResourceWrapper;
    .registers 3

    invoke-virtual {p1, p2}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_18

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    if-eqz p0, :cond_18

    sget-object p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->Companion:Lcom/leanplum/messagetemplates/ResourceWrapper$Companion;

    invoke-virtual {p1, p2}, Lcom/leanplum/ActionContext;->streamNamed(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lcom/leanplum/messagetemplates/ResourceWrapper$Companion;->getResourceFromInputStream(Ljava/io/InputStream;Z)Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object p0

    return-object p0

    :cond_18
    sget-object p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->EMPTY:Lcom/leanplum/messagetemplates/ResourceWrapper;

    return-object p0
.end method


# virtual methods
.method public final register(Ltcl;Lorm;)V
    .registers 6
    .param p1    # Ltcl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lorm;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    new-instance p0, Lcom/leanplum/ActionArgs;

    invoke-direct {p0}, Lcom/leanplum/ActionArgs;-><init>()V

    const-string v0, "Title"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Message"

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Primary Text"

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Secondary Text"

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Avatar Image"

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->withFile(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Avatar Image Dark"

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->withFile(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Wallpaper IDs"

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Theme IDs"

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Center text"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0, v2}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Secondary Action"

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    new-instance v0, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$register$1;

    invoke-direct {v0, p1, p2}, Lcom/leanplum/messagetemplates/OperaWallpaperSheet$register$1;-><init>(Ltcl;Lorm;)V

    const-string p1, "Wallpaper Sheet"

    const/4 p2, 0x3

    invoke-static {p1, p2, p0, v0}, Lcom/leanplum/Leanplum;->defineAction(Ljava/lang/String;ILcom/leanplum/ActionArgs;Lcom/leanplum/callbacks/ActionCallback;)V

    return-void
.end method
