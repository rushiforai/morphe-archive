.class public abstract Lcom/opera/android/downloads/DownloadManagerObserver;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/chromium/OperaBrowserContext;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p0, p1}, LJ/N;->Mfi4c_0o(Ljava/lang/Object;Ljava/lang/Object;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/opera/android/downloads/DownloadManagerObserver;->a:J

    return-void
.end method


# virtual methods
.method public final finalize()V
    .registers 3

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadManagerObserver;->a:J

    invoke-static {v0, v1}, LJ/N;->M1TDJPsf(J)V

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method public abstract onDownloadCreated(Lcom/opera/android/downloads/DownloadItem;Ljava/lang/String;II)V
    .param p1    # Lcom/opera/android/downloads/DownloadItem;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method
