.class public final Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0008\u0004*\u00011\u0008\u0001\u0018\u00002\u00020\u0001B1\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0010\u0008\u0002\u0010\n\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\r\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u000eJ\u000f\u0010\u0010\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u000eJ\u000f\u0010\u0011\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u000eJ\u000f\u0010\u0012\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u000eJ+\u0010\u0019\u001a\u00020\t2\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u00132\u0006\u0010\u0016\u001a\u00020\u00152\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u0017H\u0016\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ\u0017\u0010\u001d\u001a\u00020\t2\u0006\u0010\u001c\u001a\u00020\u001bH\u0016\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\u0017\u0010\u001f\u001a\u00020\t2\u0006\u0010\u001c\u001a\u00020\u001bH\u0016\u00a2\u0006\u0004\u0008\u001f\u0010\u001eJ\u0017\u0010 \u001a\u00020\t2\u0006\u0010\u001c\u001a\u00020\u001bH\u0016\u00a2\u0006\u0004\u0008 \u0010\u001eJ\u000f\u0010!\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008!\u0010\u000eR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0003\u0010\"R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0005\u0010#R\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0007\u0010$R\u001c\u0010\n\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\u00088\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\n\u0010%R\u0018\u0010\'\u001a\u0004\u0018\u00010&8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\'\u0010(R\u0018\u0010*\u001a\u0004\u0018\u00010)8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008*\u0010+R\u0018\u0010-\u001a\u0004\u0018\u00010,8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008-\u0010.R\u0018\u0010/\u001a\u0004\u0018\u00010)8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008/\u0010+R\u0016\u00100\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00080\u0010$R\u0014\u00102\u001a\u0002018\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u00082\u00103\u00a8\u00064"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;",
        "Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;",
        "Landroidx/fragment/app/Fragment;",
        "fragment",
        "Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;",
        "media",
        "",
        "isTablet",
        "Lkotlin/Function0;",
        "",
        "onActionClick",
        "<init>",
        "(Landroidx/fragment/app/Fragment;Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;ZLkotlin/jvm/functions/Function0;)V",
        "prepareMedia",
        "()V",
        "playMedia",
        "addViewsForStreamMedia",
        "closeFullscreenDialog",
        "openFullscreenDialog",
        "Landroid/widget/RelativeLayout;",
        "relativeLayout",
        "Ll/brm;",
        "config",
        "Landroid/view/View$OnClickListener;",
        "clickListener",
        "setup",
        "(Landroid/widget/RelativeLayout;Ll/brm;Landroid/view/View$OnClickListener;)V",
        "Ll/ker;",
        "owner",
        "onResume",
        "(Ll/ker;)V",
        "onPause",
        "onStop",
        "cleanup",
        "Landroidx/fragment/app/Fragment;",
        "Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;",
        "Z",
        "Lkotlin/jvm/functions/Function0;",
        "Ll/psm;",
        "handle",
        "Ll/psm;",
        "Landroid/widget/FrameLayout;",
        "videoFrameLayout",
        "Landroid/widget/FrameLayout;",
        "Landroidx/activity/ComponentDialog;",
        "fullScreenDialog",
        "Landroidx/activity/ComponentDialog;",
        "videoFrameInDialog",
        "exoPlayerFullscreen",
        "com/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler$a",
        "onBackPressedCallback",
        "Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler$a;",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private exoPlayerFullscreen:Z

.field private final fragment:Landroidx/fragment/app/Fragment;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private fullScreenDialog:Landroidx/activity/ComponentDialog;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private handle:Ll/psm;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final isTablet:Z

.field private final media:Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final onActionClick:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final onBackPressedCallback:Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private videoFrameInDialog:Landroid/widget/FrameLayout;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private videoFrameLayout:Landroid/widget/FrameLayout;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/fragment/app/Fragment;Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;ZLkotlin/jvm/functions/Function0;)V
    .locals 0
    .param p1    # Landroidx/fragment/app/Fragment;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/Fragment;",
            "Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;",
            "Z",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->fragment:Landroidx/fragment/app/Fragment;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->media:Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;

    .line 13
    .line 14
    iput-boolean p3, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->isTablet:Z

    .line 15
    .line 16
    iput-object p4, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->onActionClick:Lkotlin/jvm/functions/Function0;

    .line 17
    .line 18
    new-instance p1, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler$a;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler$a;-><init>(Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->onBackPressedCallback:Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler$a;

    .line 24
    .line 25
    sget-object p1, Ll/osm;->INSTANCE:Ll/osm;

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/osm;->a()Ll/psm;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    sget-object p1, Ll/xel0;->d:Lcom/clevertap/android/sdk/video/VideoLibraryIntegrated;

    .line 34
    .line 35
    sget-object p2, Lcom/clevertap/android/sdk/video/VideoLibraryIntegrated;->MEDIA3:Lcom/clevertap/android/sdk/video/VideoLibraryIntegrated;

    .line 36
    .line 37
    if-ne p1, p2, :cond_0

    .line 38
    .line 39
    new-instance p1, Ll/rpx;

    .line 40
    .line 41
    invoke-direct {p1}, Ll/rpx;-><init>()V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    new-instance p1, Ll/aaf;

    .line 46
    .line 47
    invoke-direct {p1}, Ll/aaf;-><init>()V

    .line 48
    .line 49
    .line 50
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->handle:Ll/psm;

    .line 51
    .line 52
    return-void
.end method

.method public synthetic constructor <init>(Landroidx/fragment/app/Fragment;Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;ZLkotlin/jvm/functions/Function0;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_0

    const/4 p4, 0x0

    .line 53
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;-><init>(Landroidx/fragment/app/Fragment;Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;ZLkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method public static a(Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    return-object p0
.end method

.method public static final synthetic access$closeFullscreenDialog(Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->closeFullscreenDialog()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$getExoPlayerFullscreen$p(Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->exoPlayerFullscreen:Z

    .line 2
    .line 3
    return p0
.end method

.method private final addViewsForStreamMedia()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->videoFrameLayout:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->handle:Ll/psm;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    invoke-interface {v0}, Ll/psm;->a()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 19
    .line 20
    const/4 v2, -0x1

    .line 21
    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->videoFrameLayout:Landroid/widget/FrameLayout;

    .line 34
    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    :cond_2
    :goto_0
    return-void
.end method

.method public static b(Ll/svm;Landroid/view/ViewGroup$MarginLayoutParams;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget v0, p0, Ll/svm;->a:I

    .line 8
    .line 9
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 10
    .line 11
    iget v0, p0, Ll/svm;->b:I

    .line 12
    .line 13
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 14
    .line 15
    iget v0, p0, Ll/svm;->c:I

    .line 16
    .line 17
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 18
    .line 19
    iget p0, p0, Ll/svm;->d:I

    .line 20
    .line 21
    iput p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 22
    .line 23
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 24
    .line 25
    return-object p0
.end method

.method public static c(Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;Z)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->exoPlayerFullscreen:Z

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->onBackPressedCallback:Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler$a;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p1, v0}, Ll/jl50;->setEnabled(Z)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->openFullscreenDialog()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->closeFullscreenDialog()V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->onBackPressedCallback:Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler$a;

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    invoke-virtual {p0, p1}, Ll/jl50;->setEnabled(Z)V

    .line 25
    .line 26
    .line 27
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 28
    .line 29
    return-object p0
.end method

.method private final closeFullscreenDialog()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->handle:Ll/psm;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-interface {v0}, Ll/psm;->a()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-interface {v0, v2}, Ll/psm;->f(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->videoFrameInDialog:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->videoFrameLayout:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iput-boolean v2, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->exoPlayerFullscreen:Z

    .line 29
    .line 30
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->fullScreenDialog:Landroidx/activity/ComponentDialog;

    .line 31
    .line 32
    if-eqz p0, :cond_3

    .line 33
    .line 34
    invoke-virtual {p0}, Landroidx/activity/ComponentDialog;->dismiss()V

    .line 35
    .line 36
    .line 37
    :cond_3
    :goto_0
    return-void
.end method

.method private final openFullscreenDialog()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->handle:Ll/psm;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-interface {v0}, Ll/psm;->a()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-interface {v0, v2}, Ll/psm;->f(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->videoFrameLayout:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->fullScreenDialog:Landroidx/activity/ComponentDialog;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->fragment:Landroidx/fragment/app/Fragment;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    new-instance v3, Landroidx/activity/ComponentDialog;

    .line 35
    .line 36
    const v4, 0x103000a

    .line 37
    .line 38
    .line 39
    invoke-direct {v3, v0, v4}, Landroidx/activity/ComponentDialog;-><init>(Landroid/content/Context;I)V

    .line 40
    .line 41
    .line 42
    iput-object v3, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->fullScreenDialog:Landroidx/activity/ComponentDialog;

    .line 43
    .line 44
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 45
    .line 46
    const/4 v5, -0x1

    .line 47
    invoke-direct {v4, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 48
    .line 49
    .line 50
    new-instance v5, Landroid/widget/FrameLayout;

    .line 51
    .line 52
    invoke-direct {v5, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 53
    .line 54
    .line 55
    iput-object v5, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->videoFrameInDialog:Landroid/widget/FrameLayout;

    .line 56
    .line 57
    invoke-virtual {v3, v5, v4}, Landroidx/activity/ComponentDialog;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 58
    .line 59
    .line 60
    new-instance v0, Ll/lsm;

    .line 61
    .line 62
    invoke-direct {v0}, Ll/lsm;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {v5, v0}, Ll/kx3;->c(Landroid/view/View;Lkotlin/jvm/functions/Function2;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->fragment:Landroidx/fragment/app/Fragment;

    .line 69
    .line 70
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    invoke-virtual {v3}, Landroidx/activity/ComponentDialog;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    iget-object v4, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->onBackPressedCallback:Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler$a;

    .line 81
    .line 82
    invoke-virtual {v3, v0, v4}, Landroidx/activity/OnBackPressedDispatcher;->a(Ll/ker;Ll/jl50;)V

    .line 83
    .line 84
    .line 85
    :cond_2
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->videoFrameInDialog:Landroid/widget/FrameLayout;

    .line 86
    .line 87
    if-eqz v0, :cond_3

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 90
    .line 91
    .line 92
    :cond_3
    iput-boolean v2, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->exoPlayerFullscreen:Z

    .line 93
    .line 94
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->fullScreenDialog:Landroidx/activity/ComponentDialog;

    .line 95
    .line 96
    if-eqz p0, :cond_4

    .line 97
    .line 98
    invoke-virtual {p0}, Landroidx/activity/ComponentDialog;->show()V

    .line 99
    .line 100
    .line 101
    :cond_4
    :goto_0
    return-void
.end method

.method private final playMedia()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->handle:Ll/psm;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/psm;->play()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private final prepareMedia()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->handle:Ll/psm;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->fragment:Landroidx/fragment/app/Fragment;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    iget-boolean v2, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->isTablet:Z

    .line 16
    .line 17
    invoke-interface {v0, v1, v2}, Ll/psm;->i(Landroid/content/Context;Z)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Ll/msm;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/msm;-><init>(Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {v0, v1}, Ll/psm;->h(Lkotlin/jvm/functions/Function1;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {v0}, Ll/psm;->g()V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->onActionClick:Lkotlin/jvm/functions/Function0;

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    new-instance v2, Ll/nsm;

    .line 36
    .line 37
    invoke-direct {v2, v1}, Ll/nsm;-><init>(Lkotlin/jvm/functions/Function0;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {v0, v2}, Ll/psm;->c(Lkotlin/jvm/functions/Function0;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->addViewsForStreamMedia()V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->fragment:Landroidx/fragment/app/Fragment;

    .line 47
    .line 48
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->media:Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->c()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-interface {v0, v1, p0}, Ll/psm;->e(Landroid/content/Context;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method


# virtual methods
.method public cleanup()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->handle:Ll/psm;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/psm;->pause()V

    .line 6
    .line 7
    .line 8
    :cond_0
    sget-object p0, Ll/osm;->INSTANCE:Ll/osm;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/osm;->c()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onPause(Ll/ker;)V
    .locals 2
    .param p1    # Ll/ker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->fragment:Landroidx/fragment/app/Fragment;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_2

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/app/Activity;->isChangingConfigurations()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    const/4 v0, 0x1

    .line 17
    if-ne p1, v0, :cond_2

    .line 18
    .line 19
    iget-boolean p1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->exoPlayerFullscreen:Z

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->closeFullscreenDialog()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->onBackPressedCallback:Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler$a;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {v0, v1}, Ll/jl50;->setEnabled(Z)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->handle:Ll/psm;

    .line 33
    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-interface {p0}, Ll/psm;->d()V

    .line 38
    .line 39
    .line 40
    sget-object v0, Ll/osm;->INSTANCE:Ll/osm;

    .line 41
    .line 42
    invoke-virtual {v0, p0, p1}, Ll/osm;->d(Ll/psm;Z)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->handle:Ll/psm;

    .line 47
    .line 48
    if-eqz p0, :cond_3

    .line 49
    .line 50
    invoke-interface {p0}, Ll/psm;->b()V

    .line 51
    .line 52
    .line 53
    :cond_3
    :goto_0
    return-void
.end method

.method public onResume(Ll/ker;)V
    .locals 0
    .param p1    # Ll/ker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->prepareMedia()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->playMedia()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onStop(Ll/ker;)V
    .locals 1
    .param p1    # Ll/ker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->fragment:Landroidx/fragment/app/Fragment;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/app/Activity;->isChangingConfigurations()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    const/4 v0, 0x1

    .line 17
    if-ne p1, v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->handle:Ll/psm;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-interface {p0}, Ll/psm;->b()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public setup(Landroid/widget/RelativeLayout;Ll/brm;Landroid/view/View$OnClickListener;)V
    .locals 0
    .param p1    # Landroid/widget/RelativeLayout;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/brm;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Landroid/view/View$OnClickListener;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ll/brm;->d()I

    .line 5
    .line 6
    .line 7
    move-result p3

    .line 8
    if-eqz p3, :cond_1

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/brm;->d()I

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    check-cast p3, Landroid/widget/FrameLayout;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p3, 0x0

    .line 24
    :goto_0
    iput-object p3, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->videoFrameLayout:Landroid/widget/FrameLayout;

    .line 25
    .line 26
    :cond_1
    if-eqz p1, :cond_2

    .line 27
    .line 28
    invoke-virtual {p2}, Ll/brm;->c()I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Landroid/widget/ImageView;

    .line 37
    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    const/16 p2, 0x8

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 43
    .line 44
    .line 45
    :cond_2
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->prepareMedia()V

    .line 46
    .line 47
    .line 48
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->playMedia()V

    .line 49
    .line 50
    .line 51
    sget-object p1, Ll/osm;->INSTANCE:Ll/osm;

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/osm;->b()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_3

    .line 58
    .line 59
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->onBackPressedCallback:Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler$a;

    .line 60
    .line 61
    const/4 p2, 0x1

    .line 62
    invoke-virtual {p1, p2}, Ll/jl50;->setEnabled(Z)V

    .line 63
    .line 64
    .line 65
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->openFullscreenDialog()V

    .line 66
    .line 67
    .line 68
    :cond_3
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->videoFrameLayout:Landroid/widget/FrameLayout;

    .line 69
    .line 70
    if-eqz p1, :cond_4

    .line 71
    .line 72
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;->media:Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->a()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-static {p1, p0}, Ll/crm;->a(Landroid/view/View;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_4
    return-void
.end method
