.class public final Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u0000 \u00182\u00020\u0001:\u0001\u0018B\u0005\u00a2\u0006\u0002\u0010\u0002J\u000e\u0010\u0003\u001a\u00020\u00002\u0006\u0010\u0004\u001a\u00020\u0005J\u000e\u0010\u0006\u001a\u00020\u00002\u0006\u0010\u0007\u001a\u00020\u0008J\u000e\u0010\t\u001a\u00020\u00002\u0006\u0010\n\u001a\u00020\u000bJ\u000e\u0010\u000c\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u000eJ\u000e\u0010\u000f\u001a\u00020\u00002\u0006\u0010\u0010\u001a\u00020\u0011J\u000e\u0010\u0012\u001a\u00020\u00002\u0006\u0010\u0013\u001a\u00020\u0014J\u000e\u0010\u0015\u001a\u00020\u00002\u0006\u0010\u0016\u001a\u00020\u0017\u00a8\u0006\u0019"
    }
    d2 = {
        "Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;",
        "",
        "()V",
        "setApplicationContext",
        "context",
        "Landroid/content/Context;",
        "setSVGAGotoAdapter",
        "svgaGoto",
        "Lcom/immomo/svgaplayer/adapter/SVGAGotoAdapter;",
        "setSVGAImgLoadAdapter",
        "svgaImgLoad",
        "Lcom/immomo/svgaplayer/adapter/SVGAImgLoadAdapter;",
        "setSVGAMaxSize",
        "size",
        "",
        "setSVGAResLoadAdapter",
        "svgaResLoad",
        "Lcom/immomo/svgaplayer/adapter/SVGAResLoadAdapter;",
        "setSVGATagShow",
        "isShow",
        "",
        "setSVGAThreadAdapter",
        "svgaThread",
        "Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;",
        "Companion",
        "svgalibrary_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# static fields
.field public static final Companion:Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;

.field private static instance:Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;

.field private static mContext:Landroid/content/Context;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private static mMaxSize:I

.field private static mSVGAGotoAdapter:Lcom/immomo/svgaplayer/adapter/SVGAGotoAdapter;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private static mSVGAImgLoadAdapter:Lcom/immomo/svgaplayer/adapter/SVGAImgLoadAdapter;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private static mSVGAResLoadAdapter:Lcom/immomo/svgaplayer/adapter/SVGAResLoadAdapter;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private static mSVGAThreadAdapter:Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private static mShowDev:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->Companion:Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;

    .line 8
    .line 9
    const/16 v0, 0xa

    .line 10
    .line 11
    sput v0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mMaxSize:I

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$getInstance$cp()Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->instance:Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getMContext$cp()Landroid/content/Context;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getMMaxSize$cp()I
    .locals 1

    .line 1
    sget v0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mMaxSize:I

    .line 2
    .line 3
    return v0
.end method

.method public static final synthetic access$getMSVGAGotoAdapter$cp()Lcom/immomo/svgaplayer/adapter/SVGAGotoAdapter;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mSVGAGotoAdapter:Lcom/immomo/svgaplayer/adapter/SVGAGotoAdapter;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getMSVGAImgLoadAdapter$cp()Lcom/immomo/svgaplayer/adapter/SVGAImgLoadAdapter;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mSVGAImgLoadAdapter:Lcom/immomo/svgaplayer/adapter/SVGAImgLoadAdapter;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getMSVGAResLoadAdapter$cp()Lcom/immomo/svgaplayer/adapter/SVGAResLoadAdapter;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mSVGAResLoadAdapter:Lcom/immomo/svgaplayer/adapter/SVGAResLoadAdapter;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getMSVGAThreadAdapter$cp()Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mSVGAThreadAdapter:Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getMShowDev$cp()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mShowDev:Z

    .line 2
    .line 3
    return v0
.end method

.method public static final synthetic access$setInstance$cp(Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;)V
    .locals 0
    .param p0    # Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sput-object p0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->instance:Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setMContext$cp(Landroid/content/Context;)V
    .locals 0
    .param p0    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sput-object p0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setMMaxSize$cp(I)V
    .locals 0

    .line 1
    sput p0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mMaxSize:I

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setMSVGAGotoAdapter$cp(Lcom/immomo/svgaplayer/adapter/SVGAGotoAdapter;)V
    .locals 0
    .param p0    # Lcom/immomo/svgaplayer/adapter/SVGAGotoAdapter;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sput-object p0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mSVGAGotoAdapter:Lcom/immomo/svgaplayer/adapter/SVGAGotoAdapter;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setMSVGAImgLoadAdapter$cp(Lcom/immomo/svgaplayer/adapter/SVGAImgLoadAdapter;)V
    .locals 0
    .param p0    # Lcom/immomo/svgaplayer/adapter/SVGAImgLoadAdapter;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sput-object p0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mSVGAImgLoadAdapter:Lcom/immomo/svgaplayer/adapter/SVGAImgLoadAdapter;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setMSVGAResLoadAdapter$cp(Lcom/immomo/svgaplayer/adapter/SVGAResLoadAdapter;)V
    .locals 0
    .param p0    # Lcom/immomo/svgaplayer/adapter/SVGAResLoadAdapter;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sput-object p0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mSVGAResLoadAdapter:Lcom/immomo/svgaplayer/adapter/SVGAResLoadAdapter;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setMSVGAThreadAdapter$cp(Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;)V
    .locals 0
    .param p0    # Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sput-object p0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mSVGAThreadAdapter:Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setMShowDev$cp(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mShowDev:Z

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final setApplicationContext(Landroid/content/Context;)Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sput-object p1, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mContext:Landroid/content/Context;

    .line 5
    .line 6
    return-object p0
.end method

.method public final setSVGAGotoAdapter(Lcom/immomo/svgaplayer/adapter/SVGAGotoAdapter;)Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;
    .locals 0
    .param p1    # Lcom/immomo/svgaplayer/adapter/SVGAGotoAdapter;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sput-object p1, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mSVGAGotoAdapter:Lcom/immomo/svgaplayer/adapter/SVGAGotoAdapter;

    .line 5
    .line 6
    return-object p0
.end method

.method public final setSVGAImgLoadAdapter(Lcom/immomo/svgaplayer/adapter/SVGAImgLoadAdapter;)Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;
    .locals 0
    .param p1    # Lcom/immomo/svgaplayer/adapter/SVGAImgLoadAdapter;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sput-object p1, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mSVGAImgLoadAdapter:Lcom/immomo/svgaplayer/adapter/SVGAImgLoadAdapter;

    .line 5
    .line 6
    return-object p0
.end method

.method public final setSVGAMaxSize(I)Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sput p1, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mMaxSize:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final setSVGAResLoadAdapter(Lcom/immomo/svgaplayer/adapter/SVGAResLoadAdapter;)Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;
    .locals 0
    .param p1    # Lcom/immomo/svgaplayer/adapter/SVGAResLoadAdapter;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sput-object p1, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mSVGAResLoadAdapter:Lcom/immomo/svgaplayer/adapter/SVGAResLoadAdapter;

    .line 5
    .line 6
    return-object p0
.end method

.method public final setSVGATagShow(Z)Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sput-boolean p1, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mShowDev:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public final setSVGAThreadAdapter(Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;)Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;
    .locals 0
    .param p1    # Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sput-object p1, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->mSVGAThreadAdapter:Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;

    .line 5
    .line 6
    return-object p0
.end method
