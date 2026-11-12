.class public Lcom/opera/android/media/CaptureDevicesDialogDelegate;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J


# direct methods
.method public constructor <init>(J[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Lcom/opera/android/browser/dialog/DialogDelegate;)V
    .registers 8
    .param p3    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Lcom/opera/android/browser/dialog/DialogDelegate;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/opera/android/media/CaptureDevicesDialogDelegate;->a:J

    invoke-static {p3, p4}, Lcom/opera/android/media/CaptureDevicesDialogDelegate;->a([Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-static {p5, p6}, Lcom/opera/android/media/CaptureDevicesDialogDelegate;->a([Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p2

    new-instance p3, Lu59;

    const/16 p4, 0x15

    invoke-direct {p3, p0, p4}, Lu59;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p7, p1, p2, p3}, Lcom/opera/android/browser/dialog/DialogDelegate;->c(Ljava/util/List;Ljava/util/List;Lu59;)V

    return-void
.end method

.method public static a([Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;
    .registers 7

    if-nez p0, :cond_5

    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0

    :cond_5
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    :goto_c
    array-length v2, p0

    if-ge v1, v2, :cond_1e

    new-instance v2, Lfi4;

    aget-object v3, p0, v1

    aget-object v4, p1, v1

    invoke-direct {v2, v3, v4}, Lfi4;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    :cond_1e
    return-object v0
.end method

.method public static getAutomaticDeviceName(Lcom/opera/android/browser/chromium/ChromiumContent;)Ljava/lang/String;
    .registers 2
    .param p0    # Lcom/opera/android/browser/chromium/ChromiumContent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object p0

    if-nez p0, :cond_9

    const-string p0, ""

    return-object p0

    :cond_9
    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f140337

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
