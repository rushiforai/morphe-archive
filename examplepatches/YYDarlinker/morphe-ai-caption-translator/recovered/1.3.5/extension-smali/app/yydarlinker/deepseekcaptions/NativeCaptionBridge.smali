.class public final Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;
.super Ljava/lang/Object;
.source "NativeCaptionBridge.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;,
        Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;
    }
.end annotation


# static fields
.field private static final SELECTION_LOCK:Ljava/lang/Object;

.field private static volatile context:Landroid/content/Context;

.field private static final selections:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;",
            ">;"
        }
    .end annotation
.end field

.field private static switchingManager:Ljava/lang/Object;

.field private static visibleVideo:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 64
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->SELECTION_LOCK:Ljava/lang/Object;

    .line 65
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->selections:Ljava/util/LinkedHashMap;

    .line 66
    const-string v0, ""

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->visibleVideo:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static activateSnapshot(Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;Z)V
    .registers 4

    if-eqz p1, :cond_b

    .line 199
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->language:Ljava/lang/String;

    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->translated:Z

    iget-boolean v1, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->asr:Z

    invoke-static {p1, v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->select(Ljava/lang/String;ZZ)V

    .line 200
    :cond_b
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->enabled()Z

    move-result p1

    if-nez p1, :cond_12

    return-void

    .line 201
    :cond_12
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->manager:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->rememberAsrTracks(Ljava/lang/Object;)V

    .line 202
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->currentTrack(Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_24

    .line 203
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->selectedUrl:Ljava/lang/String;

    goto :goto_28

    :cond_24
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->url(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 204
    :goto_28
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->noteAiTrackSelected()V

    .line 205
    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->translated:Z

    if-eqz v0, :cond_38

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->noteAiTarget(Ljava/lang/String;)V

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->activate(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_3d

    .line 206
    :cond_38
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lapp/yydarlinker/deepseekcaptions/ContextualUnitCaptionController;->activateSource(Landroid/content/Context;Ljava/lang/String;)V

    .line 207
    :goto_3d
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->forceNativeRendererScan()V

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->kick()V

    .line 208
    sget-object p1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->context:Landroid/content/Context;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "same_video=true;source_only="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean p0, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->translated:Z

    xor-int/lit8 p0, p0, 0x1

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "ENGINE_SNAPSHOT_ACTIVATED"

    invoke-static {p1, v0, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static applySelection(Ljava/lang/Object;Z)V
    .registers 6

    .line 41
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;->aiInstalled()Z

    move-result v0

    if-nez v0, :cond_8

    goto/16 :goto_72

    .line 43
    :cond_8
    const-string v0, "DISABLE_CAPTIONS_OPTION"

    if-nez p0, :cond_e

    move-object v1, v0

    goto :goto_12

    :cond_e
    :try_start_e
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->language(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 44
    :goto_12
    const-string v2, "AUTO_TRANSLATE_CAPTIONS_OPTION"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b

    goto :goto_72

    :cond_1b
    const/4 v2, 0x0

    if-eqz p0, :cond_64

    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_25

    goto :goto_64

    .line 49
    :cond_25
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->url(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 50
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->isYouTubeTimedTextUrl(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_30

    goto :goto_72

    .line 51
    :cond_30
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromUrl(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object v3

    if-eqz v3, :cond_37

    const/4 v2, 0x1

    :cond_37
    if-eqz p1, :cond_46

    .line 52
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->vss(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "a."

    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    invoke-static {v1, v2, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->select(Ljava/lang/String;ZZ)V

    .line 53
    :cond_46
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->enabled()Z

    move-result p0

    if-nez p0, :cond_4d

    goto :goto_72

    .line 54
    :cond_4d
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionButtonController;->noteAiTrackSelected()V

    if-eqz v2, :cond_5b

    .line 56
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionLifecycleRestore;->noteAiTarget(Ljava/lang/String;)V

    .line 57
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->context:Landroid/content/Context;

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->activate(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_60

    .line 58
    :cond_5b
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->context:Landroid/content/Context;

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ContextualUnitCaptionController;->activateSource(Landroid/content/Context;Ljava/lang/String;)V

    .line 59
    :goto_60
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionMusicSuppressor;->kick()V

    return-void

    :cond_64
    :goto_64
    if-eqz p1, :cond_69

    .line 46
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->toggle(Z)V

    .line 47
    :cond_69
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->enabled()Z

    move-result p0

    if-eqz p0, :cond_72

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->deactivateFromNativeCaptionState()V
    :try_end_72
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_72} :catch_73

    :cond_72
    :goto_72
    return-void

    :catch_73
    move-exception p0

    .line 61
    sget-object p1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->context:Landroid/content/Context;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "AI_SELECTION_FAILED"

    invoke-static {p1, v0, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static augmentMetadata(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 1

    return-object p0
.end method

.method public static augmentTranslations(Ljava/util/List;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "*>;)",
            "Ljava/util/List<",
            "*>;"
        }
    .end annotation

    .line 17
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;->simplifiedInstalled()Z

    move-result v0

    if-eqz v0, :cond_93

    if-eqz p0, :cond_93

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_10

    goto/16 :goto_93

    .line 20
    :cond_10
    :try_start_10
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_15
    :goto_15
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_5a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 21
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->language(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 22
    invoke-static {v4}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->rank(Ljava/lang/String;)I

    move-result v4

    if-ne v4, v3, :cond_4c

    .line 23
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->cloneSimplified(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_31

    goto :goto_93

    .line 24
    :cond_31
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v2

    invoke-interface {v1, v2, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 25
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$$ExternalSyntheticLambda0;-><init>()V

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$$ExternalSyntheticLambda1;

    invoke-direct {v2}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$$ExternalSyntheticLambda1;-><init>()V

    invoke-static {v1, v0, v2}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->insertSimplified(Ljava/util/List;Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_4c
    if-nez v1, :cond_15

    .line 27
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->url(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->isYouTubeTimedTextUrl(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_15

    move-object v1, v2

    goto :goto_15

    :cond_5a
    if-nez v1, :cond_5d

    goto :goto_93

    .line 30
    :cond_5d
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->cloneSimplified(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_64

    goto :goto_93

    .line 32
    :cond_64
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    add-int/2addr v2, v3

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 33
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v1, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    new-instance v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$$ExternalSyntheticLambda0;-><init>()V

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$$ExternalSyntheticLambda2;

    invoke-direct {v2}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$$ExternalSyntheticLambda2;-><init>()V

    invoke-static {v1, v0, v2}, Lapp/yydarlinker/deepseekcaptions/LanguageMenuOrder;->insertSimplified(Ljava/util/List;Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/List;

    move-result-object p0
    :try_end_82
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_82} :catch_83

    return-object p0

    :catch_83
    move-exception v0

    .line 35
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->context:Landroid/content/Context;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-string v2, "AI_MENU_INSERT_FAILED"

    invoke-static {v1, v2, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :cond_93
    :goto_93
    return-object p0
.end method

.method private static canActivateSnapshot(Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;)Z
    .registers 5

    .line 188
    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->off:Z

    const/4 v1, 0x0

    if-nez v0, :cond_4f

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->video:Ljava/lang/String;

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->currentVideoIdSnapshot()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4f

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->video:Ljava/lang/String;

    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->selectedUrl:Ljava/lang/String;

    .line 189
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->videoIdFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    goto :goto_4f

    .line 190
    :cond_20
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->manager:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    const/4 v2, 0x1

    if-nez v0, :cond_2a

    return v2

    .line 192
    :cond_2a
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->ownsManager(Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;)Z

    move-result v3

    if-nez v3, :cond_31

    return v1

    .line 194
    :cond_31
    :try_start_31
    iget-boolean v3, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->translated:Z

    if-eqz v3, :cond_3a

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->translatedTracks(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_3e

    :cond_3a
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->nativeTracks(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    :goto_3e
    if-eqz v0, :cond_4e

    .line 195
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4e

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->currentTrack(Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;)Ljava/lang/Object;

    move-result-object p0
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_4a} :catch_4f

    if-eqz p0, :cond_4d

    goto :goto_4e

    :cond_4d
    return v1

    :cond_4e
    :goto_4e
    return v2

    :catch_4f
    :cond_4f
    :goto_4f
    return v1
.end method

.method private static captureSelection(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/String;)V
    .registers 19

    move-object/from16 v6, p4

    const-string v7, "owner=caption_model;foreground="

    const-string v0, "model_track_mismatch;model_foreground="

    .line 100
    sget-object v8, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->SELECTION_LOCK:Ljava/lang/Object;

    monitor-enter v8

    if-eqz p0, :cond_15

    .line 102
    :try_start_b
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->switchingManager:Ljava/lang/Object;

    if-ne p0, v1, :cond_15

    monitor-exit v8

    return-void

    :catchall_11
    move-exception v0

    move-object p0, v0

    goto/16 :goto_181

    :cond_15
    if-nez p1, :cond_1a

    .line 103
    const-string v1, "DISABLE_CAPTIONS_OPTION"

    goto :goto_1e

    :cond_1a
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->language(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_1e
    move-object v9, v1

    .line 104
    const-string v1, "AUTO_TRANSLATE_CAPTIONS_OPTION"

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_29

    monitor-exit v8

    return-void

    :cond_29
    const/4 v10, 0x0

    const/4 v11, 0x1

    if-eqz p1, :cond_38

    .line 105
    const-string v1, "DISABLE_CAPTIONS_OPTION"

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_36

    goto :goto_38

    :cond_36
    move v12, v10

    goto :goto_39

    :cond_38
    :goto_38
    move v12, v11

    :goto_39
    if-eqz v12, :cond_44

    if-nez v6, :cond_42

    .line 106
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->modelVideo(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_4c

    :cond_42
    move-object v1, v6

    goto :goto_4c

    :cond_44
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->url(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->videoIdFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 107
    :goto_4c
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->currentVideoIdSnapshot()Ljava/lang/String;

    move-result-object v13

    if-eqz v6, :cond_5c

    if-eqz v12, :cond_5c

    .line 110
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_5c

    monitor-exit v8

    return-void

    :cond_5c
    if-eqz v6, :cond_91

    .line 111
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_91

    if-nez v12, :cond_91

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_91

    .line 112
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->context:Landroid/content/Context;

    const-string p1, "NATIVE_APPLIED_OWNER_REJECTED"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    invoke-virtual {v6, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ";track_foreground="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 112
    invoke-static {p0, p1, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    monitor-exit v8

    return-void

    .line 115
    :cond_91
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a1

    if-eqz v12, :cond_a1

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->latestForManager(Ljava/lang/Object;)Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;

    move-result-object v0

    if-eqz v0, :cond_a1

    iget-object v1, v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->video:Ljava/lang/String;

    .line 117
    :cond_a1
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_af

    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_af

    monitor-exit v8

    return-void

    :cond_af
    if-nez v12, :cond_bd

    .line 118
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->url(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->isYouTubeTimedTextUrl(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_bd

    monitor-exit v8

    return-void

    .line 119
    :cond_bd
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;

    move-object v2, p0

    move-object v3, p1

    move-object/from16 v4, p2

    move/from16 v5, p3

    invoke-direct/range {v0 .. v5}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    if-eqz v6, :cond_fd

    .line 120
    sget-object v2, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->context:Landroid/content/Context;

    const-string v5, "NATIVE_TRACK_APPLIED"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 121
    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v7, ";off="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v7, ";translated="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v7, v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->translated:Z

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v7, ";reason="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v7, p3

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 120
    invoke-static {v2, v5, v6}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    :cond_fd
    sget-object v2, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->selections:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, v1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2, v1, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    :goto_105
    sget-object v2, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->selections:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->size()I

    move-result v5

    const/4 v6, 0x6

    if-le v5, v6, :cond_11e

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_105

    .line 124
    :cond_11e
    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_135

    invoke-virtual {v13, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_135

    .line 125
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->context:Landroid/content/Context;

    const-string p1, "NATIVE_SELECTION_BACKGROUND"

    const-string v0, "visible_state_preserved"

    invoke-static {p0, p1, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v8

    return-void

    .line 127
    :cond_135
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->rememberAsrTracks(Ljava/lang/Object;)V

    .line 128
    instance-of p0, v4, Ljava/lang/Enum;

    if-eqz p0, :cond_14d

    const-string p0, "PREFERRED_TRACK"

    move-object v1, v4

    check-cast v1, Ljava/lang/Enum;

    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_14d

    move p0, v11

    goto :goto_14e

    :cond_14d
    move p0, v10

    :goto_14e
    if-eqz p0, :cond_16b

    .line 129
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;->memoryInstalled()Z

    move-result v1

    if-eqz v1, :cond_16b

    if-eqz v12, :cond_15c

    .line 130
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->off()V

    goto :goto_16b

    .line 131
    :cond_15c
    const-string v1, "_OPTION"

    invoke-virtual {v9, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_16b

    iget-boolean v1, v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->translated:Z

    iget-boolean v0, v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->asr:Z

    invoke-static {v9, v1, v0}, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->select(Ljava/lang/String;ZZ)V

    :cond_16b
    :goto_16b
    if-nez v12, :cond_17b

    if-nez p0, :cond_17b

    .line 133
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->known()Z

    move-result p0

    if-eqz p0, :cond_17b

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->isOn()Z

    move-result p0

    if-nez p0, :cond_17c

    :cond_17b
    move v10, v11

    :cond_17c
    invoke-static {p1, v10}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->applySelection(Ljava/lang/Object;Z)V

    .line 134
    monitor-exit v8

    return-void

    :goto_181
    monitor-exit v8
    :try_end_182
    .catchall {:try_start_b .. :try_end_182} :catchall_11

    throw p0
.end method

.method public static cloneSimplified(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method private static currentSelection()Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;
    .registers 2

    .line 151
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->currentVideoIdSnapshot()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_c

    const/4 v0, 0x0

    return-object v0

    :cond_c
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->selections:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;

    return-object v0
.end method

.method private static currentTrack(Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;)Ljava/lang/Object;
    .registers 7

    .line 173
    iget-boolean v0, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->off:Z

    const/4 v1, 0x0

    if-nez v0, :cond_8f

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->ownsManager(Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;)Z

    move-result v0

    if-nez v0, :cond_d

    goto/16 :goto_8f

    .line 174
    :cond_d
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->manager:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_16

    return-object v1

    .line 176
    :cond_16
    :try_start_16
    iget-boolean v2, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->translated:Z

    if-eqz v2, :cond_1f

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->translatedTracks(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_23

    :cond_1f
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->nativeTracks(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    :goto_23
    if-eqz v0, :cond_76

    .line 177
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_76

    .line 178
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_75

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->video:Ljava/lang/String;

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->url(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->videoIdFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2f

    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->language:Ljava/lang/String;

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->language(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2f

    iget-boolean v3, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->translated:Z

    .line 179
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->url(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromUrl(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object v4

    if-eqz v4, :cond_63

    const/4 v4, 0x1

    goto :goto_64

    :cond_63
    const/4 v4, 0x0

    :goto_64
    if-ne v3, v4, :cond_2f

    iget-boolean v3, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->asr:Z

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->vss(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "a."

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4
    :try_end_72
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_72} :catch_8f

    if-ne v3, v4, :cond_2f

    return-object v2

    :cond_75
    return-object v1

    .line 183
    :cond_76
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->track:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_8f

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->video:Ljava/lang/String;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->url(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->videoIdFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8f

    return-object v0

    :catch_8f
    :cond_8f
    :goto_8f
    return-object v1
.end method

.method public static displayName(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 1

    .line 272
    const-string p0, ""

    return-object p0
.end method

.method static enabled()Z
    .registers 1

    .line 11
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;->aiInstalled()Z

    move-result v0

    if-eqz v0, :cond_14

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->context:Landroid/content/Context;

    if-eqz v0, :cond_14

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->context:Landroid/content/Context;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    return v0

    :cond_14
    const/4 v0, 0x0

    return v0
.end method

.method static initialize(Landroid/content/Context;)V
    .registers 1

    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sput-object p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->context:Landroid/content/Context;

    return-void
.end method

.method static synthetic lambda$augmentTranslations$0(Ljava/lang/Object;)Ljava/lang/String;
    .registers 1

    .line 25
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->displayName(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$augmentTranslations$1(Ljava/lang/Object;)Ljava/lang/String;
    .registers 1

    .line 33
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->displayName(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static language(Ljava/lang/Object;)Ljava/lang/String;
    .registers 1

    .line 273
    const-string p0, ""

    return-object p0
.end method

.method private static latestForManager(Ljava/lang/Object;)Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;
    .registers 5

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    .line 155
    :cond_4
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->selections:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_e
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_24

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;

    iget-object v3, v2, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->manager:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-ne v3, p0, :cond_e

    move-object v0, v2

    goto :goto_e

    :cond_24
    return-object v0
.end method

.method private static modelVideo(Ljava/lang/Object;)Ljava/lang/String;
    .registers 5

    .line 164
    const-string v0, ""

    if-nez p0, :cond_5

    return-object v0

    .line 165
    :cond_5
    :try_start_5
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->nativeModelVideo(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_12

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_12

    return-object v1

    .line 166
    :cond_12
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->nativeTracks(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    if-nez p0, :cond_19

    return-object v0

    .line 167
    :cond_19
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    move-object v1, v0

    :goto_1e
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_48

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->url(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->videoIdFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_37

    goto :goto_1e

    .line 168
    :cond_37
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_46

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_46

    const-string p0, "mixed_model"
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_45} :catch_49

    return-object p0

    :cond_46
    move-object v1, v2

    goto :goto_1e

    :cond_48
    return-object v1

    :catch_49
    return-object v0
.end method

.method public static nativeModelVideo(Ljava/lang/Object;)Ljava/lang/String;
    .registers 1

    .line 262
    const-string p0, ""

    return-object p0
.end method

.method public static nativeTracks(Ljava/lang/Object;)Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List<",
            "*>;"
        }
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public static onNativeAppliedEvent(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/String;)V
    .registers 8

    .line 91
    instance-of v0, p3, Ljava/lang/Enum;

    if-eqz v0, :cond_22

    move-object v0, p3

    check-cast v0, Ljava/lang/Enum;

    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v0

    const-string v1, "PREFERRED_TRACK"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    if-eqz p2, :cond_21

    .line 92
    const-string v0, "DISABLE_CAPTIONS_OPTION"

    invoke-static {p2}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->language(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_22

    :cond_21
    const/4 p1, 0x0

    .line 93
    :cond_22
    invoke-static {p0, p1, p3, p4, p5}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->onNativeSelectionApplied(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/String;)V

    return-void
.end method

.method public static onNativeSelection(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 83
    invoke-static {p0, p1, p2, v0, v1}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->captureSelection(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/String;)V

    return-void
.end method

.method public static onNativeSelectionApplied(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/String;)V
    .registers 5

    if-nez p4, :cond_5

    .line 96
    :try_start_2
    const-string p4, ""

    goto :goto_9

    :cond_5
    invoke-virtual {p4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p4

    :goto_9
    invoke-static {p0, p1, p2, p3, p4}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->captureSelection(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/String;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_c} :catch_d

    return-void

    :catch_d
    move-exception p0

    .line 97
    sget-object p1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->context:Landroid/content/Context;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    const-string p2, "NATIVE_APPLIED_CAPTURE_FAILED"

    invoke-static {p1, p2, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static onNativeSelectionWithReason(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .registers 5

    const/4 v0, 0x0

    .line 81
    invoke-static {p0, p1, p2, p3, v0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->captureSelection(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/String;)V

    return-void
.end method

.method public static onNativeTrackApplied(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 2

    return-void
.end method

.method public static onSelection(Ljava/lang/Object;)V
    .registers 2

    const/4 v0, 0x1

    .line 39
    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->applySelection(Ljava/lang/Object;Z)V

    return-void
.end method

.method static onVideoId(Ljava/lang/String;)V
    .registers 4

    if-nez p0, :cond_5

    .line 137
    const-string p0, ""

    goto :goto_9

    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 138
    :goto_9
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->SELECTION_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 139
    :try_start_c
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->visibleVideo:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    monitor-exit v0

    return-void

    .line 140
    :cond_16
    sput-object p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->visibleVideo:Ljava/lang/String;

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->reset()V

    .line 141
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_23

    monitor-exit v0

    return-void

    .line 142
    :cond_23
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->selections:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;

    if-nez p0, :cond_2f

    .line 143
    monitor-exit v0

    return-void

    .line 144
    :cond_2f
    iget-boolean v1, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->off:Z

    if-eqz v1, :cond_39

    const/4 p0, 0x0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->toggle(Z)V

    monitor-exit v0

    return-void

    .line 145
    :cond_39
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->currentTrack(Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;)Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x1

    if-eqz v1, :cond_44

    .line 146
    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->applySelection(Ljava/lang/Object;Z)V

    goto :goto_4d

    .line 147
    :cond_44
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->canActivateSnapshot(Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;)Z

    move-result v1

    if-eqz v1, :cond_4d

    invoke-static {p0, v2}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->activateSnapshot(Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;Z)V

    .line 148
    :cond_4d
    :goto_4d
    monitor-exit v0

    return-void

    :catchall_4f
    move-exception p0

    monitor-exit v0
    :try_end_51
    .catchall {:try_start_c .. :try_end_51} :catchall_4f

    throw p0
.end method

.method private static ownsManager(Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;)Z
    .registers 5

    .line 159
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->manager:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_a

    return v1

    .line 160
    :cond_a
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->latestForManager(Ljava/lang/Object;)Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;

    move-result-object v2

    if-eqz v2, :cond_1b

    iget-object v2, v2, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->video:Ljava/lang/String;

    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->video:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1b

    return v1

    .line 161
    :cond_1b
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->modelVideo(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2f

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->video:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2e

    goto :goto_2f

    :cond_2e
    return v1

    :cond_2f
    :goto_2f
    const/4 p0, 0x1

    return p0
.end method

.method static refreshNativeTrack()Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;
    .registers 7

    .line 211
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->SELECTION_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 212
    :try_start_3
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->known()Z

    move-result v1

    if-eqz v1, :cond_13

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->isOn()Z

    move-result v1

    if-nez v1, :cond_13

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->CAPTIONS_OFF:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    monitor-exit v0

    return-object v1

    .line 213
    :cond_13
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->currentSelection()Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;

    move-result-object v1

    if-nez v1, :cond_1d

    .line 214
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->DEFERRED:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    monitor-exit v0

    return-object v1

    .line 217
    :cond_1d
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->enabled()Z

    move-result v2

    if-eqz v2, :cond_46

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->canActivateSnapshot(Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;)Z

    move-result v2

    if-eqz v2, :cond_46

    .line 218
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionChoice;->known()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->activateSnapshot(Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;Z)V

    .line 219
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->ownsManager(Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;)Z

    move-result v2

    if-eqz v2, :cond_42

    iget-object v2, v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->origin:Ljava/lang/Object;

    if-eqz v2, :cond_42

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->currentTrack(Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_46

    :cond_42
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->AI_STARTED:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    monitor-exit v0

    return-object v1

    .line 221
    :cond_46
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->ownsManager(Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;)Z

    move-result v2

    if-eqz v2, :cond_d9

    iget-object v2, v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->origin:Ljava/lang/Object;

    if-nez v2, :cond_52

    goto/16 :goto_d9

    .line 222
    :cond_52
    iget-boolean v2, v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->off:Z

    if-eqz v2, :cond_5a

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->CAPTIONS_OFF:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    monitor-exit v0

    return-object v1

    .line 223
    :cond_5a
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->currentTrack(Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;)Ljava/lang/Object;

    move-result-object v2

    iget-object v3, v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->manager:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-eqz v2, :cond_d5

    if-nez v3, :cond_69

    goto :goto_d5

    .line 225
    :cond_69
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->currentVideoIdSnapshot()Ljava/lang/String;

    move-result-object v4

    .line 226
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_7f

    iget-object v5, v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->video:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7f

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->DEFERRED:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    monitor-exit v0

    return-object v1

    .line 227
    :cond_7f
    invoke-static {v3}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->rememberAsrTracks(Ljava/lang/Object;)V
    :try_end_82
    .catchall {:try_start_3 .. :try_end_82} :catchall_dd

    const/4 v4, 0x0

    .line 229
    :try_start_83
    sput-object v3, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->switchingManager:Ljava/lang/Object;

    .line 230
    iget-object v5, v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->origin:Ljava/lang/Object;

    iget v6, v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->reason:I

    invoke-static {v3, v4, v5, v6}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->selectNative(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 232
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->currentVideoIdSnapshot()Ljava/lang/String;

    move-result-object v5

    .line 233
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_a4

    iget-object v6, v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->video:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_a4

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->DEFERRED:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;
    :try_end_a0
    .catchall {:try_start_83 .. :try_end_a0} :catchall_d1

    .line 235
    :try_start_a0
    sput-object v4, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->switchingManager:Ljava/lang/Object;

    monitor-exit v0
    :try_end_a3
    .catchall {:try_start_a0 .. :try_end_a3} :catchall_dd

    return-object v1

    .line 234
    :cond_a4
    :try_start_a4
    iget-object v5, v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->origin:Ljava/lang/Object;

    iget v6, v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->reason:I

    invoke-static {v3, v2, v5, v6}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->selectNative(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    :try_end_ab
    .catchall {:try_start_a4 .. :try_end_ab} :catchall_d1

    .line 235
    :try_start_ab
    sput-object v4, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->switchingManager:Ljava/lang/Object;

    .line 236
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->currentVideoIdSnapshot()Ljava/lang/String;

    move-result-object v3

    .line 237
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_c3

    iget-object v1, v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->video:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c3

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->DEFERRED:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    monitor-exit v0

    return-object v1

    .line 238
    :cond_c3
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->enabled()Z

    move-result v1

    if-eqz v1, :cond_cd

    const/4 v1, 0x0

    invoke-static {v2, v1}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->applySelection(Ljava/lang/Object;Z)V

    .line 239
    :cond_cd
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->APPLIED:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    monitor-exit v0

    return-object v1

    :catchall_d1
    move-exception v1

    .line 235
    sput-object v4, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->switchingManager:Ljava/lang/Object;

    throw v1

    .line 224
    :cond_d5
    :goto_d5
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->DEFERRED:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    monitor-exit v0

    return-object v1

    .line 221
    :cond_d9
    :goto_d9
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;->DEFERRED:Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Refresh;

    monitor-exit v0

    return-object v1

    :catchall_dd
    move-exception v1

    .line 240
    monitor-exit v0
    :try_end_df
    .catchall {:try_start_ab .. :try_end_df} :catchall_dd

    throw v1
.end method

.method private static rememberAsrTracks(Ljava/lang/Object;)V
    .registers 4

    .line 244
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->enabled()Z

    move-result v0

    if-eqz v0, :cond_2d

    if-nez p0, :cond_9

    goto :goto_2d

    .line 245
    :cond_9
    :try_start_9
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->nativeTracks(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_2d

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_13
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 246
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->language(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->vss(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->url(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lapp/yydarlinker/deepseekcaptions/NativeAsrTrackReference;->remember(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_2c} :catch_2d

    goto :goto_13

    :catch_2d
    :cond_2d
    :goto_2d
    return-void
.end method

.method public static resolveRemembered(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    .line 250
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->rememberAsrTracks(Ljava/lang/Object;)V

    .line 251
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;->memoryInstalled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_59

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->decision()I

    move-result v0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_12

    goto :goto_59

    .line 252
    :cond_12
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->translated()Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->translatedTracks(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    goto :goto_21

    :cond_1d
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->nativeTracks(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    :goto_21
    if-eqz p0, :cond_59

    .line 254
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_27
    :goto_27
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_59

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->language()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->language(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_27

    .line 255
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->translated()Z

    move-result v1

    if-nez v1, :cond_58

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->vss(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "a."

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->asr()Z

    move-result v2

    if-ne v1, v2, :cond_56

    goto :goto_58

    :cond_56
    move-object v1, v0

    goto :goto_27

    :cond_58
    :goto_58
    return-object v0

    :cond_59
    :goto_59
    return-object v1
.end method

.method public static restoreDecision()I
    .registers 1

    .line 260
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/CaptionAddonSupport;->memoryInstalled()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, -0x1

    return v0

    :cond_8
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RememberedCaptionSelection;->decision()I

    move-result v0

    return v0
.end method

.method public static selectNative(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .registers 4

    return-void
.end method

.method public static simplifiedUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 265
    const-string v0, "zh-Hans"

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->withCode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static simplifiedVss(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 267
    const-string v0, "tzh-Hans"

    if-nez p0, :cond_5

    return-object v0

    :cond_5
    const/16 v1, 0x2e

    .line 268
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 269
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-gez v1, :cond_15

    const-string p0, ""

    goto :goto_19

    :cond_15
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    :goto_19
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static suppressNativeDraw()Z
    .registers 1

    .line 14
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->enabled()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DynamicCaptionController;->isVisibleActive()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    return v0

    :cond_e
    const/4 v0, 0x0

    return v0
.end method

.method public static translatedTracks(Ljava/lang/Object;)Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List<",
            "*>;"
        }
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public static url(Ljava/lang/Object;)Ljava/lang/String;
    .registers 1

    .line 275
    const-string p0, ""

    return-object p0
.end method

.method public static vss(Ljava/lang/Object;)Ljava/lang/String;
    .registers 1

    .line 274
    const-string p0, ""

    return-object p0
.end method
