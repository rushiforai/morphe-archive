.class public abstract Lxf7;
.super Lcom/opera/android/downloads/DownloadManagerObserver;
.source "SourceFile"


# instance fields
.field public final b:Lcom/opera/android/downloads/DownloadPauseManager;

.field public final c:Lumi;

.field public final synthetic d:Lag7;


# direct methods
.method public constructor <init>(Lag7;Lcom/opera/android/browser/chromium/OperaBrowserContext;Lumi;)V
    .registers 4

    iput-object p1, p0, Lxf7;->d:Lag7;

    invoke-direct {p0, p2}, Lcom/opera/android/downloads/DownloadManagerObserver;-><init>(Lcom/opera/android/browser/chromium/OperaBrowserContext;)V

    iget-boolean p1, p2, Lcom/opera/android/browser/chromium/OperaBrowserContext;->a:Z

    invoke-static {p1}, LJ/N;->M9HCHaTE(Z)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/downloads/DownloadPauseManager;

    iput-object p1, p0, Lxf7;->b:Lcom/opera/android/downloads/DownloadPauseManager;

    iput-object p3, p0, Lxf7;->c:Lumi;

    return-void
.end method


# virtual methods
.method public a()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public onDownloadCreated(Lcom/opera/android/downloads/DownloadItem;Ljava/lang/String;II)V
    .registers 9

    iget-object p2, p0, Lxf7;->d:Lag7;

    iget-object p4, p2, Lag7;->a:Ljava/util/ArrayList;

    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :cond_a
    :goto_a
    if-ge v2, v0, :cond_1d

    invoke-virtual {p4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lcv3;

    invoke-virtual {v3, p0, p1, p3}, Lcv3;->a(Lxf7;Lcom/opera/android/downloads/DownloadItem;I)Z

    move-result v3

    if-eqz v3, :cond_a

    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_1d
    if-nez v1, :cond_26

    iget-object p2, p2, Lag7;->e:Lcv3;

    if-eqz p2, :cond_26

    invoke-virtual {p2, p0, p1, p3}, Lcv3;->a(Lxf7;Lcom/opera/android/downloads/DownloadItem;I)Z

    :cond_26
    return-void
.end method
