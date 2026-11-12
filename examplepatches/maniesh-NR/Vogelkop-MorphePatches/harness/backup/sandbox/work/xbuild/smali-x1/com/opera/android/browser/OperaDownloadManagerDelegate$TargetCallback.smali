.class public Lcom/opera/android/browser/OperaDownloadManagerDelegate$TargetCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/opera/android/browser/OperaDownloadManagerDelegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TargetCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/opera/api/Callback;"
    }
.end annotation


# instance fields
.field public final a:J


# direct methods
.method public constructor <init>(J)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/opera/android/browser/OperaDownloadManagerDelegate$TargetCallback;->a:J

    return-void
.end method


# virtual methods
.method public final finalize()V
    .registers 3

    iget-wide v0, p0, Lcom/opera/android/browser/OperaDownloadManagerDelegate$TargetCallback;->a:J

    invoke-static {p0, v0, v1}, LJ/N;->MgCi$nPM(Ljava/lang/Object;J)V

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method public final run(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Ljava/lang/String;

    iget-wide v0, p0, Lcom/opera/android/browser/OperaDownloadManagerDelegate$TargetCallback;->a:J

    invoke-static {p0, v0, v1, p1}, LJ/N;->MkE07MDU(Ljava/lang/Object;JLjava/lang/Object;)V

    return-void
.end method
