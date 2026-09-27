.class public final Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;
.super Ljava/lang/Object;
.source "CaptionQuickToggle.java"


# static fields
.field private static shortsMenuAt:J = 0x0L

.field private static shortsVideo:Ljava/lang/String; = ""


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addNativeRow(Ljava/lang/Object;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Landroid/view/View$OnClickListener;I)I
    .registers 5

    const/4 p0, -0x1

    return p0
.end method

.method public static dismissNative()V
    .registers 0

    return-void
.end method

.method static synthetic lambda$onMenu$0(Landroid/app/Activity;Landroid/view/View;)V
    .registers 2

    .line 24
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;->toggle(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_9

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;->dismissNative()V

    :cond_9
    return-void
.end method

.method public static nativeContainer(Ljava/lang/Object;)Landroid/widget/LinearLayout;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method static normalizeNativeGap(Landroid/widget/LinearLayout;)V
    .registers 5

    if-eqz p0, :cond_46

    .line 32
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_a

    goto :goto_46

    .line 33
    :cond_a
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    .line 34
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-nez v0, :cond_19

    goto :goto_46

    .line 35
    :cond_19
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_2f

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    invoke-virtual {p0, v0, v1, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 36
    :cond_2f
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_46

    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 38
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-lez v2, :cond_46

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_46
    :goto_46
    return-void
.end method

.method public static observeMenuPath(Ljava/lang/String;[B)V
    .registers 3

    .line 8
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;->shortsOpen()Z

    move-result v0

    if-eqz v0, :cond_47

    if-eqz p0, :cond_47

    const-string v0, "overflow_menu_item.e"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_47

    if-nez p1, :cond_13

    goto :goto_47

    .line 9
    :cond_13
    const-string v0, "captions_sheet"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_47

    const-string v0, "quality_sheet"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_24

    goto :goto_47

    .line 10
    :cond_24
    new-instance p0, Ljava/lang/String;

    sget-object v0, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-direct {p0, p1, v0}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 11
    const-string p1, "closed_caption"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_3b

    const-string p1, "closed_captions"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_47

    :cond_3b
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p0

    sput-wide p0, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;->shortsMenuAt:J

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->currentVideoIdSnapshot()Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;->shortsVideo:Ljava/lang/String;

    :cond_47
    :goto_47
    return-void
.end method

.method public static onMenu(Ljava/lang/Object;I)I
    .registers 9

    .line 14
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;->activity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_ac

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;->aiInstalled()Z

    move-result v1

    if-nez v1, :cond_e

    goto/16 :goto_ac

    .line 17
    :cond_e
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;->shortsOpen()Z

    move-result v1

    if-eqz v1, :cond_19

    .line 18
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->shortsFlyoutMenuEnabled(Landroid/content/Context;)Z

    move-result v2

    goto :goto_1d

    :cond_19
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->flyoutMenuEnabled(Landroid/content/Context;)Z

    move-result v2

    :goto_1d
    const-wide/16 v3, 0x0

    if-nez v2, :cond_28

    .line 19
    sput-wide v3, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;->shortsMenuAt:J

    const-string p0, ""

    sput-object p0, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;->shortsVideo:Ljava/lang/String;

    return p1

    .line 20
    :cond_28
    sget-wide v5, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;->shortsMenuAt:J

    cmp-long v2, v5, v3

    if-lez v2, :cond_4b

    if-eqz v1, :cond_4b

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    sget-wide v5, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;->shortsMenuAt:J

    sub-long/2addr v1, v5

    const-wide/16 v5, 0x5dc

    cmp-long v1, v1, v5

    if-gez v1, :cond_4b

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;->shortsVideo:Ljava/lang/String;

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->currentVideoIdSnapshot()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4b

    const/4 v1, 0x1

    goto :goto_4c

    :cond_4b
    const/4 v1, 0x0

    .line 21
    :goto_4c
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;->topMenu()Z

    move-result v2

    if-nez v2, :cond_55

    if-nez v1, :cond_55

    goto :goto_ac

    :cond_55
    sput-wide v3, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;->shortsMenuAt:J

    .line 22
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ai_title"

    invoke-static {v0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->get(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " \u00b7 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->enabled(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_73

    const-string v2, "on"

    goto :goto_75

    :cond_73
    const-string v2, "off"

    :goto_75
    invoke-static {v0, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->get(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 23
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "drawable"

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "deepseek_caption_settings"

    invoke-virtual {v2, v5, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_94

    const/4 v2, 0x0

    goto :goto_98

    :cond_94
    invoke-virtual {v0, v2}, Landroid/app/Activity;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 24
    :goto_98
    new-instance v3, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle$$ExternalSyntheticLambda0;

    invoke-direct {v3, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;)V

    invoke-static {p0, v2, v1, v3, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;->addNativeRow(Ljava/lang/Object;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Landroid/view/View$OnClickListener;I)I

    move-result v0

    if-gez v0, :cond_a4

    goto :goto_ac

    .line 26
    :cond_a4
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;->nativeContainer(Ljava/lang/Object;)Landroid/widget/LinearLayout;

    move-result-object p0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;->normalizeNativeGap(Landroid/widget/LinearLayout;)V

    return v0

    :cond_ac
    :goto_ac
    return p1
.end method

.method static setEngine(Landroid/content/Context;Z)Z
    .registers 7

    const/4 v0, 0x1

    if-eqz p1, :cond_1e

    .line 43
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object v1

    iget-object v1, v1, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1e

    const-string p1, "configure_api"

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->get(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    const/4 p0, 0x0

    return p0

    .line 44
    :cond_1e
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->enabled(Landroid/content/Context;)Z

    move-result v1

    .line 47
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->saveEnabled(Landroid/content/Context;Z)V

    .line 48
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->refreshConfiguration(Landroid/content/Context;)V

    .line 49
    sget-object v2, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->DEFERRED:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    .line 50
    :try_start_2a
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->refreshNativeTrack()Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    move-result-object v2
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_2e} :catch_2f

    goto :goto_3d

    :catch_2f
    move-exception v3

    .line 51
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "ENGINE_NATIVE_REFRESH_DEFERRED"

    invoke-static {p0, v4, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    :goto_3d
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->forceNativeRendererScan()V

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->kick()V

    .line 53
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "enabled="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, ";native="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ";session="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, ";choice_known="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->known()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "ENGINE_MODE_SAVED"

    invoke-static {p0, v4, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    if-eq v1, p1, :cond_93

    .line 54
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->DEFERRED:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    if-ne v2, v1, :cond_93

    if-eqz p1, :cond_85

    .line 55
    const-string p1, "mode_pending"

    goto :goto_87

    :cond_85
    const-string p1, "mode_off_pending"

    :goto_87
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->get(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    goto :goto_ae

    :cond_93
    if-eqz p1, :cond_ae

    .line 56
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->isOn()Z

    move-result p1

    if-eqz p1, :cond_ae

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->translates()Z

    move-result p1

    if-nez p1, :cond_ae

    .line 57
    const-string p1, "choose_translation"

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->get(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_ae
    :goto_ae
    return v0
.end method

.method public static shortsOpen()Z
    .registers 1

    const/4 v0, 0x0

    return v0
.end method

.method static toggle(Landroid/content/Context;)Z
    .registers 2

    .line 29
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->enabled(Landroid/content/Context;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionQuickToggle;->setEngine(Landroid/content/Context;Z)Z

    move-result p0

    return p0
.end method

.method public static topMenu()Z
    .registers 1

    const/4 v0, 0x0

    return v0
.end method
