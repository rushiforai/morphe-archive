.class public final Le/e/a/VideoMiniPlayer;
.super Ljava/lang/Object;
.source "VideoMiniPlayer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/VideoMiniPlayer$CommentLayer;,
        Le/e/a/VideoMiniPlayer$Gestures;,
        Le/e/a/VideoMiniPlayer$Placement;
    }
.end annotation


# static fields
.field private static final ATTACHED:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/widget/FrameLayout;",
            "Ljava/lang/ref/WeakReference<",
            "Le/e/a/VideoMiniPlayer$Gestures;",
            ">;>;"
        }
    .end annotation
.end field

.field static final AUDIO_ONLY:Ljava/lang/String; = "nicoid_mini_audio_only"

.field private static final BACKGROUND_STYLE:Ljava/lang/String; = "video_background_presentation"

.field private static final COMMENTS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/widget/FrameLayout;",
            "Le/e/a/VideoMiniPlayer$CommentLayer;",
            ">;"
        }
    .end annotation
.end field

.field private static final PLACEMENTS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Ljava/lang/Object;",
            "Le/e/a/VideoMiniPlayer$Placement;",
            ">;"
        }
    .end annotation
.end field

.field private static audioOnly:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Service;",
            ">;"
        }
    .end annotation
.end field

.field private static audioTransferOwner:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 32
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/VideoMiniPlayer;->audioOnly:Ljava/lang/ref/WeakReference;

    .line 34
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/VideoMiniPlayer;->PLACEMENTS:Ljava/util/WeakHashMap;

    .line 35
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/VideoMiniPlayer;->COMMENTS:Ljava/util/WeakHashMap;

    .line 36
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/VideoMiniPlayer;->ATTACHED:Ljava/util/WeakHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static attachComments(Landroid/widget/FrameLayout;Landroid/view/View;Ljava/lang/Object;)V
    .registers 7

    .line 104
    :try_start_0
    instance-of v0, p2, Le/e/a/MiniSession225$Session;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 105
    check-cast p2, Le/e/a/MiniSession225$Session;

    iget-object p2, p2, Le/e/a/MiniSession225$Session;->owner:Ljava/lang/Object;

    const-string v0, "g1"

    invoke-static {p2, v0}, Le/e/a/Dev139;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    goto :goto_0

    .line 107
    :cond_0
    check-cast p2, Le/e/a/DirectBackground235$State;

    iget-object p2, p2, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-nez p2, :cond_1

    move-object p2, v1

    goto :goto_0

    .line 108
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    const-string v0, "k0"

    invoke-static {p2, v0}, Le/e/a/Dev139;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p2

    invoke-virtual {p2, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    :goto_0
    if-eqz p2, :cond_2

    .line 110
    const-string v0, "a"

    invoke-static {p2, v0}, Le/e/a/Dev139;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    move-object v1, p2

    check-cast v1, Landroid/view/View;

    :cond_2
    if-eqz v1, :cond_3

    .line 111
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    instance-of p2, p2, Landroid/view/ViewGroup;

    if-eqz p2, :cond_3

    .line 112
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    check-cast p2, Landroid/view/ViewGroup;

    .line 113
    new-instance v0, Le/e/a/VideoMiniPlayer$CommentLayer;

    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v2

    .line 114
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 113
    invoke-direct {v0, v1, p2, v2, v3}, Le/e/a/VideoMiniPlayer$CommentLayer;-><init>(Landroid/view/View;Landroid/view/ViewGroup;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 116
    sget-object v2, Le/e/a/VideoMiniPlayer;->COMMENTS:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 118
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    move-result p1

    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v0, -0x1

    invoke-direct {p2, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1, p1, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_3
    return-void

    :catch_0
    move-exception p1

    goto :goto_1

    :catch_1
    move-exception p1

    .line 120
    :goto_1
    invoke-static {p0}, Le/e/a/VideoMiniPlayer;->detachComments(Landroid/widget/FrameLayout;)V

    .line 121
    const-string p0, "nicoid-mini"

    const-string p2, "Could not attach the comment layer"

    invoke-static {p0, p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public static canTransfer(Landroid/content/Context;Ljava/lang/Object;)Z
    .registers 2

    .line 540
    invoke-static {p1}, Le/e/a/VideoMiniPlayer;->usesAudioOnly(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    invoke-static {p0}, Le/e/a/NoMini;->canDrawOverlays(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method private static changeMode(Ljava/lang/Object;Z)V
    .registers 5

    .line 505
    :try_start_0
    instance-of v0, p0, Le/e/a/MiniSession225$Session;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 506
    check-cast p0, Le/e/a/MiniSession225$Session;

    .line 507
    iget-object v0, p0, Le/e/a/MiniSession225$Session;->owner:Ljava/lang/Object;

    invoke-static {v0}, Le/e/a/MiniSession225;->owns(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 508
    iget-object p1, p0, Le/e/a/MiniSession225$Session;->owner:Ljava/lang/Object;

    goto :goto_0

    :cond_0
    move-object p1, v0

    :goto_0
    sput-object p1, Le/e/a/VideoMiniPlayer;->audioTransferOwner:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 511
    :try_start_1
    iget-object p0, p0, Le/e/a/MiniSession225$Session;->owner:Ljava/lang/Object;

    invoke-static {p0, v1}, Le/e/a/PlaybackTransfer221;->popup(Ljava/lang/Object;Z)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 513
    :try_start_2
    sput-object v0, Le/e/a/VideoMiniPlayer;->audioTransferOwner:Ljava/lang/Object;

    return-void

    :catchall_0
    move-exception p0

    sput-object v0, Le/e/a/VideoMiniPlayer;->audioTransferOwner:Ljava/lang/Object;

    .line 514
    throw p0

    .line 517
    :cond_1
    check-cast p0, Le/e/a/DirectBackground235$State;

    .line 518
    iget-object v0, p0, Le/e/a/DirectBackground235$State;->service:Landroid/app/Service;

    if-eqz v0, :cond_3

    .line 519
    invoke-static {v0}, Le/e/a/DirectBackground235;->owns(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    if-eqz p1, :cond_2

    .line 521
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p1, Le/e/a/VideoMiniPlayer;->audioOnly:Ljava/lang/ref/WeakReference;

    .line 522
    invoke-static {p0}, Le/e/a/VideoMiniPlayer;->leaveDirectHost(Le/e/a/DirectBackground235$State;)V

    .line 523
    invoke-virtual {p0, v1}, Le/e/a/DirectBackground235$State;->close(Z)V

    return-void

    .line 526
    :cond_2
    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    const-string p1, "url"

    const-string v2, "f"

    invoke-static {v0, v2}, Le/e/a/Dev139;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, p1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    .line 527
    invoke-static {v0, p0}, Le/e/a/Media3PlaybackHandoff;->showPopup(Landroid/app/Service;Landroid/content/Intent;)Z

    move-result p0

    if-nez p0, :cond_3

    .line 528
    invoke-static {v0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_3

    .line 530
    const-string p0, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f\u306b\u306f\u4ed6\u306e\u30a2\u30d7\u30ea\u306e\u4e0a\u306b\u8868\u793a\u3059\u308b\u6a29\u9650\u304c\u5fc5\u8981\u3067\u3059"

    .line 531
    const-string p1, "Allow display over other apps for popup playback"

    .line 532
    const-string/jumbo v2, "\u61f8\u6d6e\u64ad\u653e\u9700\u8981\u986f\u793a\u65bc\u5176\u4ed6\u61c9\u7528\u7a0b\u5f0f\u4e0a\u5c64\u7684\u6b0a\u9650"

    .line 529
    invoke-static {v0, p0, p1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0, v1}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    .line 532
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V
    :try_end_2
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    :cond_3
    return-void

    :catch_0
    move-exception p0

    goto :goto_1

    :catch_1
    move-exception p0

    .line 535
    :goto_1
    const-string p1, "nicoid-mini"

    const-string v0, "Could not switch playback mode"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method private static configureGlyph(Landroid/widget/Button;Landroid/graphics/drawable/Drawable;)V
    .registers 6

    if-nez p0, :cond_0

    return-void

    .line 157
    :cond_0
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0x15

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    const/4 v1, 0x0

    .line 158
    invoke-virtual {p1, v1, v1, v0, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 159
    const-string v0, ""

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/16 v0, 0x11

    .line 160
    invoke-virtual {p0, v0}, Landroid/widget/Button;->setGravity(I)V

    const/4 v0, 0x0

    .line 161
    invoke-virtual {p0, v0, p1, v0, v0}, Landroid/widget/Button;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 162
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v2

    const/16 v3, 0x22

    invoke-static {v2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    sub-int/2addr v3, v2

    ushr-int/lit8 v3, v3, 0x1

    invoke-virtual {p0, v1, v3, v1, v1}, Landroid/widget/Button;->setPadding(IIII)V

    .line 163
    invoke-static {p0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    return-void
.end method

.method public static detachComments(Landroid/widget/FrameLayout;)V
    .registers 5

    .line 126
    sget-object v0, Le/e/a/VideoMiniPlayer;->COMMENTS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/VideoMiniPlayer$CommentLayer;

    if-eqz v0, :cond_1

    .line 128
    iget-object v1, v0, Le/e/a/VideoMiniPlayer$CommentLayer;->view:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-ne v1, p0, :cond_0

    iget-object v1, v0, Le/e/a/VideoMiniPlayer$CommentLayer;->view:Landroid/view/View;

    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 129
    :cond_0
    iget-object p0, v0, Le/e/a/VideoMiniPlayer$CommentLayer;->view:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    if-nez p0, :cond_1

    .line 130
    iget-object p0, v0, Le/e/a/VideoMiniPlayer$CommentLayer;->original:Landroid/view/ViewGroup;

    iget-object v1, v0, Le/e/a/VideoMiniPlayer$CommentLayer;->view:Landroid/view/View;

    iget v2, v0, Le/e/a/VideoMiniPlayer$CommentLayer;->index:I

    iget-object v3, v0, Le/e/a/VideoMiniPlayer$CommentLayer;->original:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 131
    iget-object v0, v0, Le/e/a/VideoMiniPlayer$CommentLayer;->params:Landroid/view/ViewGroup$LayoutParams;

    .line 130
    invoke-virtual {p0, v1, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    :cond_1
    return-void
.end method

.method private static findParent(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Landroid/preference/PreferenceGroup;
    .registers 6

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    const/4 v1, 0x0

    .line 484
    :goto_0
    invoke-virtual {p0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v2

    if-lt v1, v2, :cond_1

    return-object v0

    .line 485
    :cond_1
    invoke-virtual {p0, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    .line 486
    invoke-virtual {v2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    return-object p0

    .line 487
    :cond_2
    instance-of v3, v2, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_3

    .line 488
    check-cast v2, Landroid/preference/PreferenceGroup;

    invoke-static {v2, p1}, Le/e/a/VideoMiniPlayer;->findParent(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Landroid/preference/PreferenceGroup;

    move-result-object v2

    if-eqz v2, :cond_3

    return-object v2

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static floating(Landroid/content/Context;)Z
    .registers 3

    .line 449
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 450
    const-string v0, "video_background_presentation"

    const-string v1, "floating"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 449
    const-string v0, "bottom"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method private static icon(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/widget/Button;
    .registers 5

    .line 150
    const-string v0, ""

    invoke-static {p0, v0, p2, p3}, Le/e/a/PlaybackBar221;->button(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/widget/Button;

    move-result-object p0

    .line 151
    invoke-static {p0, p1}, Le/e/a/VideoMiniPlayer;->configureGlyph(Landroid/widget/Button;Landroid/graphics/drawable/Drawable;)V

    return-object p0
.end method

.method public static install(Landroid/widget/FrameLayout;Le/e/a/MiniChrome236;Landroid/view/View;Ljava/lang/Object;)V
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    .line 41
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v4

    .line 42
    instance-of v5, v3, Le/e/a/MiniSession225$Session;

    if-eqz v5, :cond_0

    invoke-static {}, Le/e/a/Media3PlaybackHandoff;->closeOtherPopup()V

    .line 43
    :cond_0
    invoke-static {v4}, Le/e/a/VideoMiniPlayer;->floating(Landroid/content/Context;)Z

    move-result v6

    if-nez v6, :cond_1

    return-void

    .line 44
    :cond_1
    new-instance v6, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v6}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/high16 v7, -0x1000000

    .line 45
    invoke-virtual {v6, v7}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/16 v7, 0xa

    .line 46
    invoke-static {v4, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v6, v7}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 47
    invoke-virtual {v0, v6}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v6, 0x1

    .line 48
    invoke-virtual {v0, v6}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V

    const/4 v7, 0x0

    .line 49
    invoke-virtual {v2, v7}, Landroid/view/View;->setBackgroundColor(I)V

    .line 50
    const-string v8, "Return to player"

    const-string/jumbo v9, "\u8fd4\u56de\u64ad\u653e\u5668"

    const-string v10, "\u518d\u751f\u753b\u9762\u3078\u623b\u308b"

    invoke-static {v4, v10, v8, v9}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 51
    iget-object v8, v1, Le/e/a/MiniChrome236;->row:Landroid/widget/LinearLayout;

    .line 53
    invoke-virtual {v8, v7, v7, v7, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/high16 v9, -0x4b000000

    .line 54
    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 55
    iget-object v9, v1, Le/e/a/MiniChrome236;->thumbnail:Landroid/widget/ImageView;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 56
    iget-object v1, v1, Le/e/a/MiniChrome236;->words:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v10}, Landroid/widget/LinearLayout;->setVisibility(I)V

    move v1, v7

    .line 57
    :goto_0
    invoke-virtual {v8}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v9

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v11, -0x1

    if-lt v1, v9, :cond_6

    .line 63
    invoke-static {v4}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v1

    .line 64
    new-instance v9, Le/e/a/MiniGlyph;

    const-string v12, "popup"

    invoke-direct {v9, v12, v1}, Le/e/a/MiniGlyph;-><init>(Ljava/lang/String;I)V

    .line 65
    const-string v12, "Popup playback"

    const-string/jumbo v13, "\u61f8\u6d6e\u64ad\u653e"

    const-string v14, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    invoke-static {v4, v14, v12, v13}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 66
    new-instance v13, Le/e/a/VideoMiniPlayer$0;

    invoke-direct {v13, v3}, Le/e/a/VideoMiniPlayer$0;-><init>(Ljava/lang/Object;)V

    .line 64
    invoke-static {v4, v9, v12, v13}, Le/e/a/VideoMiniPlayer;->icon(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/widget/Button;

    move-result-object v9

    .line 67
    new-instance v12, Le/e/a/MiniGlyph;

    const-string v13, "background"

    invoke-direct {v12, v13, v1}, Le/e/a/MiniGlyph;-><init>(Ljava/lang/String;I)V

    .line 68
    const-string v13, "Background playback"

    const-string/jumbo v14, "\u80cc\u666f\u64ad\u653e"

    const-string v15, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f"

    invoke-static {v4, v15, v13, v14}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 69
    new-instance v14, Le/e/a/VideoMiniPlayer$1;

    invoke-direct {v14, v3}, Le/e/a/VideoMiniPlayer$1;-><init>(Ljava/lang/Object;)V

    .line 67
    invoke-static {v4, v12, v13, v14}, Le/e/a/VideoMiniPlayer;->icon(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Landroid/view/View$OnClickListener;)Landroid/widget/Button;

    move-result-object v12

    if-eqz v5, :cond_2

    .line 71
    move-object v13, v3

    check-cast v13, Le/e/a/MiniSession225$Session;

    iget-object v13, v13, Le/e/a/MiniSession225$Session;->play:Landroid/widget/Button;

    goto :goto_1

    :cond_2
    move-object v13, v3

    check-cast v13, Le/e/a/DirectBackground235$State;

    iget-object v13, v13, Le/e/a/DirectBackground235$State;->play:Landroid/widget/Button;

    .line 72
    :goto_1
    invoke-virtual {v8}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v14

    sub-int/2addr v14, v6

    invoke-virtual {v8, v14}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/Button;

    .line 73
    new-instance v15, Le/e/a/MiniGlyph;

    move/from16 v16, v6

    const-string v6, "play"

    invoke-direct {v15, v6, v1}, Le/e/a/MiniGlyph;-><init>(Ljava/lang/String;I)V

    invoke-static {v13, v15}, Le/e/a/VideoMiniPlayer;->configureGlyph(Landroid/widget/Button;Landroid/graphics/drawable/Drawable;)V

    .line 74
    new-instance v6, Le/e/a/MiniGlyph;

    const-string v13, "close"

    invoke-direct {v6, v13, v1}, Le/e/a/MiniGlyph;-><init>(Ljava/lang/String;I)V

    invoke-static {v14, v6}, Le/e/a/VideoMiniPlayer;->configureGlyph(Landroid/widget/Button;Landroid/graphics/drawable/Drawable;)V

    .line 75
    invoke-virtual {v8}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v7, v11, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v9, v1, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 76
    invoke-virtual {v8}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v7, v11, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v12, v1, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 77
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v6, 0x22

    invoke-static {v4, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    const/16 v6, 0x30

    invoke-direct {v1, v11, v4, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 78
    invoke-virtual {v8, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    if-eqz v5, :cond_3

    .line 80
    new-instance v1, Le/e/a/VideoMiniPlayer$2;

    invoke-direct {v1, v3}, Le/e/a/VideoMiniPlayer$2;-><init>(Ljava/lang/Object;)V

    goto :goto_2

    .line 81
    :cond_3
    new-instance v1, Le/e/a/VideoMiniPlayer$3;

    invoke-direct {v1, v3}, Le/e/a/VideoMiniPlayer$3;-><init>(Ljava/lang/Object;)V

    :goto_2
    move-object v6, v1

    .line 82
    sget-object v1, Le/e/a/VideoMiniPlayer;->PLACEMENTS:Ljava/util/WeakHashMap;

    new-instance v4, Le/e/a/VideoMiniPlayer$4;

    invoke-direct {v4}, Le/e/a/VideoMiniPlayer$4;-><init>()V

    invoke-virtual {v1, v3, v4}, Ljava/util/WeakHashMap;->computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/VideoMiniPlayer$Placement;

    .line 83
    new-instance v9, Le/e/a/VideoMiniPlayer$Gestures;

    invoke-direct {v9, v0, v8, v1, v2}, Le/e/a/VideoMiniPlayer$Gestures;-><init>(Landroid/widget/FrameLayout;Landroid/widget/LinearLayout;Le/e/a/VideoMiniPlayer$Placement;Landroid/view/View;)V

    invoke-static {v3}, Le/e/a/PlaybackPresentation;->miniRatio(Ljava/lang/Object;)F

    move-result v4

    iput v4, v9, Le/e/a/VideoMiniPlayer$Gestures;->heightPerWidth:F

    .line 85
    sget-object v1, Le/e/a/VideoMiniPlayer;->ATTACHED:Ljava/util/WeakHashMap;

    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v9}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v0, v4}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    invoke-virtual {v2, v9}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 87
    :goto_3
    invoke-virtual {v8}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lt v7, v1, :cond_4

    .line 91
    new-instance v1, Le/e/a/VideoMiniPlayer$5;

    invoke-direct {v1, v8, v6, v9}, Le/e/a/VideoMiniPlayer$5;-><init>(Landroid/widget/LinearLayout;Ljava/lang/Runnable;Le/e/a/VideoMiniPlayer$Gestures;)V

    invoke-virtual {v2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 95
    # getter for: Le/e/a/VideoMiniPlayer$Gestures;->hideControls:Ljava/lang/Runnable;
    invoke-static {v9}, Le/e/a/VideoMiniPlayer$Gestures;->access$1(Le/e/a/VideoMiniPlayer$Gestures;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 96
    invoke-static {v0}, Le/e/a/VideoMiniPlayer;->raiseFloating(Landroid/view/View;)V

    invoke-static {v0, v2, v3}, Le/e/a/VideoMiniPlayer;->attachComments(Landroid/widget/FrameLayout;Landroid/view/View;Ljava/lang/Object;)V

    .line 97
    invoke-virtual {v9}, Le/e/a/VideoMiniPlayer$Gestures;->layout()V

    return-void

    .line 88
    :cond_4
    invoke-virtual {v8, v7}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 89
    instance-of v4, v1, Landroid/widget/Button;

    if-eqz v4, :cond_5

    invoke-virtual {v1, v9}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    :cond_5
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    :cond_6
    move/from16 v16, v6

    .line 58
    invoke-virtual {v8, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 59
    instance-of v9, v6, Landroid/widget/Button;

    if-eqz v9, :cond_7

    .line 60
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v7, v11, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v6, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_7
    add-int/lit8 v1, v1, 0x1

    move/from16 v6, v16

    goto/16 :goto_0
.end method

.method public static isAudioOnly(Ljava/lang/Object;)Z
    .registers 2

    .line 573
    sget-object v0, Le/e/a/VideoMiniPlayer;->audioOnly:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Le/e/a/VideoMiniPlayer;->audioOnly:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static labelBackMode(Landroid/preference/PreferenceActivity;)V
    .registers 7

    .line 464
    const-string v0, "video_background_presentation"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-nez v1, :cond_0

    .line 465
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    const-string v2, "back_playback"

    invoke-static {v1, v2}, Le/e/a/VideoMiniPlayer;->findParent(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Landroid/preference/PreferenceGroup;

    move-result-object v1

    if-nez v1, :cond_1

    :cond_0
    return-void

    .line 467
    :cond_1
    new-instance v2, Landroid/preference/ListPreference;

    invoke-direct {v2, p0}, Landroid/preference/ListPreference;-><init>(Landroid/content/Context;)V

    .line 468
    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setKey(Ljava/lang/String;)V

    .line 469
    const-string v0, "Background playback display"

    .line 470
    const-string/jumbo v3, "\u80cc\u666f\u64ad\u653e\u986f\u793a"

    .line 469
    const-string v4, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f\u306e\u8868\u793a"

    invoke-static {p0, v4, v0, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setTitle(Ljava/lang/CharSequence;)V

    const/4 v0, 0x2

    .line 471
    new-array v0, v0, [Ljava/lang/CharSequence;

    .line 472
    const-string v3, "Mini player"

    const-string/jumbo v4, "\u8ff7\u4f60\u64ad\u653e\u5668"

    const-string v5, "\u30df\u30cb\u30d7\u30ec\u30fc\u30e4\u30fc"

    invoke-static {p0, v5, v3, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v0, v4

    .line 473
    const-string v3, "Bottom panel"

    .line 474
    const-string/jumbo v4, "\u756b\u9762\u4e0b\u65b9"

    .line 473
    const-string/jumbo v5, "\u753b\u9762\u4e0b\u90e8"

    invoke-static {p0, v5, v3, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v3, 0x1

    aput-object p0, v0, v3

    .line 471
    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 476
    const-string p0, "bottom"

    const-string v0, "floating"

    filled-new-array {v0, p0}, [Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 477
    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 478
    const-string p0, "%s"

    invoke-virtual {v2, p0}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 479
    invoke-virtual {v1, v2}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    return-void
.end method

.method static synthetic lambda$0(Ljava/lang/Object;Landroid/view/View;)V
    .registers 2

    const/4 p1, 0x0

    .line 66
    invoke-static {p0, p1}, Le/e/a/VideoMiniPlayer;->changeMode(Ljava/lang/Object;Z)V

    return-void
.end method

.method static synthetic lambda$1(Ljava/lang/Object;Landroid/view/View;)V
    .registers 2

    const/4 p1, 0x1

    .line 69
    invoke-static {p0, p1}, Le/e/a/VideoMiniPlayer;->changeMode(Ljava/lang/Object;Z)V

    return-void
.end method

.method static synthetic lambda$2(Ljava/lang/Object;)V
    .registers 2

    .line 80
    check-cast p0, Le/e/a/MiniSession225$Session;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Le/e/a/MiniSession225$Session;->settle(Z)V

    return-void
.end method

.method static synthetic lambda$3(Ljava/lang/Object;)V
    .registers 2

    .line 81
    check-cast p0, Le/e/a/DirectBackground235$State;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Le/e/a/DirectBackground235$State;->settle(Z)V

    return-void
.end method

.method static synthetic lambda$4(Ljava/lang/Object;)Le/e/a/VideoMiniPlayer$Placement;
    .registers 2

    .line 82
    new-instance p0, Le/e/a/VideoMiniPlayer$Placement;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Le/e/a/VideoMiniPlayer$Placement;-><init>(Le/e/a/VideoMiniPlayer$Placement;)V

    return-object p0
.end method

.method static synthetic lambda$5(Landroid/widget/LinearLayout;Ljava/lang/Runnable;Le/e/a/VideoMiniPlayer$Gestures;Landroid/view/View;)V
    .registers 4

    .line 92
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result p0

    if-nez p0, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void

    .line 93
    :cond_0
    invoke-virtual {p2}, Le/e/a/VideoMiniPlayer$Gestures;->showControls()V

    return-void
.end method

.method public static layout(Landroid/widget/FrameLayout;)V
    .registers 2

    .line 182
    sget-object v0, Le/e/a/VideoMiniPlayer;->ATTACHED:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/ref/WeakReference;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    .line 183
    :cond_0
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/VideoMiniPlayer$Gestures;

    :goto_0
    if-eqz p0, :cond_1

    .line 184
    invoke-virtual {p0}, Le/e/a/VideoMiniPlayer$Gestures;->layout()V

    :cond_1
    return-void
.end method

.method public static layoutFloating(Landroid/widget/FrameLayout;)Z
    .registers 2

    if-eqz p0, :cond_0

    .line 458
    sget-object v0, Le/e/a/VideoMiniPlayer;->ATTACHED:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 459
    invoke-static {p0}, Le/e/a/VideoMiniPlayer;->layout(Landroid/widget/FrameLayout;)V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static leaveDirectHost(Le/e/a/DirectBackground235$State;)V
    .registers 1

    .line 500
    iget-object p0, p0, Le/e/a/DirectBackground235$State;->video:Landroid/view/View;

    invoke-static {p0}, Le/e/a/Media3PlaybackHandoff;->suspendVideoOutput(Landroid/view/View;)V

    return-void
.end method

.method public static leaveHost(Le/e/a/MiniSession225$Session;)V
    .registers 1

    .line 496
    iget-object p0, p0, Le/e/a/MiniSession225$Session;->video:Landroid/view/View;

    invoke-static {p0}, Le/e/a/Media3PlaybackHandoff;->suspendVideoOutput(Landroid/view/View;)V

    return-void
.end method

.method public static markAudioOnly(Landroid/content/Intent;Ljava/lang/Object;)V
    .registers 3

    .line 548
    invoke-static {p1}, Le/e/a/VideoMiniPlayer;->usesAudioOnly(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 549
    const-string p1, "nicoid_mini_audio_only"

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    const-string p1, "isBackgroundPlay"

    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    :cond_0
    return-void
.end method

.method public static playGlyph(Landroid/widget/Button;Ljava/lang/CharSequence;)V
    .registers 5

    .line 167
    invoke-virtual {p0}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_2

    .line 168
    invoke-virtual {p0}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/FrameLayout;

    if-eqz v0, :cond_2

    .line 169
    sget-object v0, Le/e/a/VideoMiniPlayer;->ATTACHED:Ljava/util/WeakHashMap;

    invoke-virtual {p0}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 170
    const-string v0, "\u25b6"

    invoke-virtual {v0, p1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "play"

    goto :goto_0

    :cond_0
    const-string p1, "pause"

    .line 171
    :goto_0
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v0

    .line 172
    invoke-virtual {p0}, Landroid/widget/Button;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const/4 v2, 0x1

    aget-object v1, v1, v2

    .line 173
    instance-of v2, v1, Le/e/a/MiniGlyph;

    if-eqz v2, :cond_1

    check-cast v1, Le/e/a/MiniGlyph;

    invoke-virtual {v1, p1, v0}, Le/e/a/MiniGlyph;->matches(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    .line 174
    :cond_1
    new-instance v1, Le/e/a/MiniGlyph;

    invoke-direct {v1, p1, v0}, Le/e/a/MiniGlyph;-><init>(Ljava/lang/String;I)V

    invoke-static {p0, v1}, Le/e/a/VideoMiniPlayer;->configureGlyph(Landroid/widget/Button;Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 177
    :cond_2
    invoke-virtual {p0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private static raiseFloating(Landroid/view/View;)V
    .registers 6

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_2

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    if-eq v4, p0, :cond_0

    invoke-virtual {v4}, Landroid/view/View;->getZ()F

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/high16 v4, 0x3f800000    # 1.0f

    add-float/2addr v3, v4

    invoke-virtual {p0, v3}, Landroid/view/View;->setZ(F)V

    invoke-virtual {p0}, Landroid/view/View;->bringToFront()V

    :cond_2
    return-void
.end method

.method public static reservedHeight(Landroid/view/View;I)I
    .registers 2

    .line 454
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Le/e/a/VideoMiniPlayer;->floating(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    return p1
.end method

.method public static serviceStarted(Landroid/app/Service;Landroid/content/Intent;)V
    .registers 4

    if-eqz p1, :cond_1

    .line 564
    const-string v0, "MediaButtonCode"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 565
    const-string v0, "nicoid_mini_audio_only"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 566
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p1, Le/e/a/VideoMiniPlayer;->audioOnly:Ljava/lang/ref/WeakReference;

    return-void

    .line 567
    :cond_0
    sget-object p1, Le/e/a/VideoMiniPlayer;->audioOnly:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-ne p1, p0, :cond_1

    .line 568
    sget-object p0, Le/e/a/VideoMiniPlayer;->audioOnly:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->clear()V

    :cond_1
    return-void
.end method

.method public static startAudioOnly(Landroid/content/Context;Landroid/content/Intent;)Z
    .registers 4

    .line 554
    const-string v0, "nicoid_mini_audio_only"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    return v1

    .line 556
    :cond_0
    invoke-static {p0, p1}, Le/e/a/CacheFolders;->startForegroundService(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;

    const/4 p0, 0x1

    return p0
.end method

.method private static usesAudioOnly(Ljava/lang/Object;)Z
    .registers 2

    .line 544
    sget-object v0, Le/e/a/VideoMiniPlayer;->audioTransferOwner:Ljava/lang/Object;

    if-eqz v0, :cond_0

    if-ne v0, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
