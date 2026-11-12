.class public final Lza9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfel;
.implements Lqyl;


# instance fields
.field public a:Z

.field public b:Z


# direct methods
.method public constructor <init>(Lygh;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-class v0, Landroidx/camera/camera2/compat/quirk/CaptureIntentPreviewQuirk;

    invoke-virtual {p1, v0}, Lygh;->c(Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :cond_f
    if-ge v3, v1, :cond_20

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Landroidx/camera/camera2/compat/quirk/CaptureIntentPreviewQuirk;

    invoke-interface {v4}, Landroidx/camera/camera2/compat/quirk/CaptureIntentPreviewQuirk;->b()Z

    move-result v4

    if-eqz v4, :cond_f

    const/4 v2, 0x1

    :cond_20
    iput-boolean v2, p0, Lza9;->a:Z

    const-class v0, Landroidx/camera/camera2/compat/quirk/ImageCaptureFailedForVideoSnapshotQuirk;

    invoke-virtual {p1, v0}, Lygh;->a(Ljava/lang/Class;)Z

    move-result p1

    iput-boolean p1, p0, Lza9;->b:Z

    return-void
.end method

.method public synthetic constructor <init>(ZZ)V
    .registers 3

    .line 43
    iput-boolean p1, p0, Lza9;->a:Z

    iput-boolean p2, p0, Lza9;->b:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lwwh;)Ljava/util/Map;
    .registers 4

    if-eqz p1, :cond_17

    iget v0, p1, Lwwh;->a:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_17

    iget-boolean v0, p0, Lza9;->a:Z

    if-eqz v0, :cond_17

    sget-object p0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_CAPTURE_INTENT:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 p1, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p0, p1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    :cond_17
    if-eqz p1, :cond_2e

    iget p1, p1, Lwwh;->a:I

    const/4 v0, 0x4

    if-ne p1, v0, :cond_2e

    iget-boolean p0, p0, Lza9;->b:Z

    if-eqz p0, :cond_2e

    sget-object p0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_CAPTURE_INTENT:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 p1, 0x2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p0, p1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    :cond_2e
    sget-object p0, Ln08;->a:Ln08;

    return-object p0
.end method

.method public final b()Ljava/lang/Boolean;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final c()Lyn0;
    .registers 1

    sget-object p0, Lyn0;->l:Lyn0;

    return-object p0
.end method

.method public final d(Lru9;)V
    .registers 5

    iget-boolean v0, p0, Lza9;->b:Z

    if-eqz v0, :cond_3d

    iget-boolean v0, p0, Lza9;->a:Z

    if-eqz v0, :cond_3d

    const/4 v0, 0x0

    iput-boolean v0, p0, Lza9;->a:Z

    iget-object p0, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "startpage.installed_with_minigame"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_17

    const/4 p0, 0x3

    goto :goto_18

    :cond_17
    const/4 p0, 0x2

    :goto_18
    iget-object v1, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "startpage.minigame_entry_point_impressions"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    if-lt v0, p0, :cond_27

    const/4 v1, 0x0

    :cond_27
    if-eqz v1, :cond_3d

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result p0

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    add-int/lit8 p0, p0, 0x1

    iget-object v0, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, v2, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    :cond_3d
    return-void
.end method

.method public final e()Z
    .registers 1

    iget-boolean p0, p0, Lza9;->b:Z

    return p0
.end method

.method public final f()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

.method public final g()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final h()Z
    .registers 1

    iget-boolean p0, p0, Lza9;->a:Z

    return p0
.end method

.method public final i()Lzn0;
    .registers 1

    sget-object p0, Lzn0;->c:Lzn0;

    return-object p0
.end method

.method public final j()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method
