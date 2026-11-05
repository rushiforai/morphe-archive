.class final Le/e/a/PopupReturn244$Pending;
.super Ljava/lang/Object;
.source "PopupReturn244.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PopupReturn244;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Pending"
.end annotation


# instance fields
.field adopted:Z

.field empty:Landroid/view/View;

.field finishing:Z

.field keeper:Le/e/a/MiniSession225$SurfaceKeeper;

.field loader:Ljava/lang/Object;

.field loaderListener:Ljava/lang/Object;

.field metadataDelivered:Z

.field model:Ljava/lang/Object;

.field normalIndex:I

.field normalParams:Landroid/view/ViewGroup$LayoutParams;

.field normalParent:Landroid/view/ViewGroup;

.field owner:Ljava/lang/Object;

.field playing:Z

.field service:Landroid/app/Service;

.field speed:F

.field target:Landroid/app/Activity;

.field timeout:Ljava/lang/Runnable;

.field token:J

.field video:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/app/Service;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PopupReturn244$Pending;->service:Landroid/app/Service;

    const-string v0, "e"

    invoke-static {p1, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iput-object v0, p0, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string v0, "k0"

    invoke-virtual {p1, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Le/e/a/PopupReturn244$Pending;->model:Ljava/lang/Object;

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    new-array v3, v1, [Ljava/lang/Object;

    const-string v4, "isPlaying"

    invoke-static {v0, v4, v2, v3}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p1

    iput-boolean p1, p0, Le/e/a/PopupReturn244$Pending;->playing:Z

    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Le/e/a/PopupReturn244$Pending;->speed:F

    :try_start_39
    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;

    const-string v2, "getPlaybackSpeed"

    new-array v3, v1, [Ljava/lang/Class;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v2, v3, v1}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    iput v0, p0, Le/e/a/PopupReturn244$Pending;->speed:F
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_39 .. :try_end_4d} :catch_4e

    goto :goto_4f

    :catch_4e
    move-exception v0

    :goto_4f
    iget v0, p0, Le/e/a/PopupReturn244$Pending;->speed:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_66

    iget v0, p0, Le/e/a/PopupReturn244$Pending;->speed:F

    invoke-static {v0}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v0

    if-nez v0, :cond_66

    iget v0, p0, Le/e/a/PopupReturn244$Pending;->speed:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_68

    :cond_66
    iput p1, p0, Le/e/a/PopupReturn244$Pending;->speed:F

    :cond_68
    return-void
.end method
