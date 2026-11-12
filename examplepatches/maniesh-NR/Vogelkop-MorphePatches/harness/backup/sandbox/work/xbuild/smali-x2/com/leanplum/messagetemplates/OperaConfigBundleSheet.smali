.class public final Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\u0008\t\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J7\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u001f\u0010\u0013\u001a\n\u0012\u0004\u0012\u00020\u0012\u0018\u00010\u00112\u0006\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u001d\u0010\u0015\u001a\u00020\u000e2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0015\u0010\u0016R\u0014\u0010\u0017\u001a\u00020\u00128\u0006X\u0086T\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010\u0018R\u0014\u0010\u0019\u001a\u00020\u00128\u0006X\u0086T\u00a2\u0006\u0006\n\u0004\u0008\u0019\u0010\u0018R\u0014\u0010\u001a\u001a\u00020\u00128\u0002X\u0082T\u00a2\u0006\u0006\n\u0004\u0008\u001a\u0010\u0018\u00a8\u0006\u001b"
    }
    d2 = {
        "Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;",
        "",
        "<init>",
        "()V",
        "Lcom/leanplum/ActionContext;",
        "actionContext",
        "Ltcl;",
        "taskExecutor",
        "Lorm;",
        "usageReporter",
        "Lqln;",
        "wallpaperManager",
        "Lok5;",
        "uiProxy",
        "",
        "initializeSheetRequest",
        "(Lcom/leanplum/ActionContext;Ltcl;Lorm;Lqln;Lok5;)V",
        "",
        "",
        "extractCarouselWallpapers",
        "(Lcom/leanplum/ActionContext;)Ljava/util/List;",
        "register",
        "(Ltcl;Lorm;)V",
        "NAME",
        "Ljava/lang/String;",
        "PARAM_CAROUSEL_WALLPAPERS",
        "ARG_AVATAR_IMAGE",
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

.field private static final ARG_AVATAR_IMAGE:Ljava/lang/String; = "Avatar Image"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final INSTANCE:Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final NAME:Ljava/lang/String; = "Config Bundle Sheet"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final PARAM_CAROUSEL_WALLPAPERS:Ljava/lang/String; = "carousel_wallpapers"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;

    invoke-direct {v0}, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;-><init>()V

    sput-object v0, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;->INSTANCE:Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a(Lcom/leanplum/ActionContext;)Lcom/leanplum/messagetemplates/ResourceWrapper;
    .registers 1

    invoke-static {p0}, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;->initializeSheetRequest$lambda$0(Lcom/leanplum/ActionContext;)Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$initializeSheetRequest(Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;Lcom/leanplum/ActionContext;Ltcl;Lorm;Lqln;Lok5;)V
    .registers 6

    invoke-direct/range {p0 .. p5}, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;->initializeSheetRequest(Lcom/leanplum/ActionContext;Ltcl;Lorm;Lqln;Lok5;)V

    return-void
.end method

.method public static synthetic b(Lqln;Lorm;Lcom/leanplum/ActionContext;Lok5;Lcom/leanplum/messagetemplates/ResourceWrapper;)Lkotlin/Unit;
    .registers 5

    invoke-static {p0, p1, p2, p3, p4}, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;->initializeSheetRequest$lambda$1(Lqln;Lorm;Lcom/leanplum/ActionContext;Lok5;Lcom/leanplum/messagetemplates/ResourceWrapper;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method private final extractCarouselWallpapers(Lcom/leanplum/ActionContext;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/ActionContext;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/leanplum/ActionContext;->getContextualValues()Lcom/leanplum/ActionContext$ContextualValues;

    move-result-object p0

    const/4 p1, 0x0

    if-eqz p0, :cond_34

    iget-object p0, p0, Lcom/leanplum/ActionContext$ContextualValues;->parameters:Ljava/util/Map;

    if-eqz p0, :cond_34

    const-string v0, "carousel_wallpapers"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_34

    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_34

    check-cast p0, Ljava/lang/Iterable;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_22
    :goto_22
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_22

    invoke-interface {p1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_22

    :cond_34
    return-object p1
.end method

.method private final initializeSheetRequest(Lcom/leanplum/ActionContext;Ltcl;Lorm;Lqln;Lok5;)V
    .registers 12

    new-instance p0, Lodf;

    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lodf;-><init>(B)V

    check-cast p2, Lumi;

    invoke-virtual {p2, p0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    new-instance v0, Lws1;

    const/16 v5, 0xc

    move-object v3, p1

    move-object v2, p3

    move-object v1, p4

    move-object v4, p5

    invoke-direct/range {v0 .. v5}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnml;->b(Lnml;)V

    invoke-virtual {p0, v3}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method private static final initializeSheetRequest$lambda$0(Lcom/leanplum/ActionContext;)Lcom/leanplum/messagetemplates/ResourceWrapper;
    .registers 3

    const-string v0, "Avatar Image"

    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1a

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-eqz v1, :cond_1a

    sget-object v1, Lcom/leanplum/messagetemplates/ResourceWrapper;->Companion:Lcom/leanplum/messagetemplates/ResourceWrapper$Companion;

    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->streamNamed(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {v1, p0, v0}, Lcom/leanplum/messagetemplates/ResourceWrapper$Companion;->getResourceFromInputStream(Ljava/io/InputStream;Z)Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object p0

    return-object p0

    :cond_1a
    sget-object p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->EMPTY:Lcom/leanplum/messagetemplates/ResourceWrapper;

    return-object p0
.end method

.method private static final initializeSheetRequest$lambda$1(Lqln;Lorm;Lcom/leanplum/ActionContext;Lok5;Lcom/leanplum/messagetemplates/ResourceWrapper;)Lkotlin/Unit;
    .registers 12

    iget-object v0, p4, Lcom/leanplum/messagetemplates/ResourceWrapper;->image:Landroid/graphics/Bitmap;

    if-nez v0, :cond_1f

    iget-object p0, p0, Lqln;->k:Lvs8;

    iget-object p0, p0, Lvs8;->b:Lekc;

    check-cast p0, Lpde;

    sget-object p3, Lv08;->a:Lv08;

    invoke-static {p0, p3}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    invoke-virtual {p2}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object p0

    check-cast p1, Lx5f;

    const-string p2, "Unable to load avatar image for config bundle sheet"

    sget-object p3, Leg0;->e:Leg0;

    invoke-virtual {p1, p2, p3, p0}, Lx5f;->p0(Ljava/lang/String;Leg0;Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_1f
    new-instance v0, Lnk5;

    const-string v1, "Title"

    invoke-virtual {p2, v1}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Message"

    invoke-virtual {p2, v2}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "Primary Text"

    invoke-virtual {p2, v3}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p4, Lcom/leanplum/messagetemplates/ResourceWrapper;->image:Landroid/graphics/Bitmap;

    sget-object v5, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;->INSTANCE:Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;

    invoke-direct {v5, p2}, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;->extractCarouselWallpapers(Lcom/leanplum/ActionContext;)Ljava/util/List;

    move-result-object v5

    if-nez v5, :cond_3f

    sget-object v5, Ll08;->a:Ll08;

    :cond_3f
    invoke-direct/range {v0 .. v5}, Lnk5;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Ljava/util/List;)V

    new-instance v5, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$initializeSheetRequest$2$1;

    invoke-direct {v5, p2, p1, p4}, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$initializeSheetRequest$2$1;-><init>(Lcom/leanplum/ActionContext;Lorm;Lcom/leanplum/messagetemplates/ResourceWrapper;)V

    iget-object p2, p0, Lqln;->f:Lami;

    move-object v4, v0

    new-instance v0, Li61;

    const/4 v6, 0x1

    move-object v2, p0

    move-object v3, p1

    move-object v1, p3

    invoke-direct/range {v0 .. v6}, Li61;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Lami;->r(Ljava/lang/Runnable;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method


# virtual methods
.method public final register(Ltcl;Lorm;)V
    .registers 5
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

    const-string v0, "Avatar Image"

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->withFile(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    new-instance v0, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$register$1;

    invoke-direct {v0, p1, p2}, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$register$1;-><init>(Ltcl;Lorm;)V

    const-string p1, "Config Bundle Sheet"

    const/4 p2, 0x3

    invoke-static {p1, p2, p0, v0}, Lcom/leanplum/Leanplum;->defineAction(Ljava/lang/String;ILcom/leanplum/ActionArgs;Lcom/leanplum/callbacks/ActionCallback;)V

    return-void
.end method
