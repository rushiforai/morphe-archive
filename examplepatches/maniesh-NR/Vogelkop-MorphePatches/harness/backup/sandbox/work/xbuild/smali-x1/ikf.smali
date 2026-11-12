.class public final synthetic Likf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:J

.field public final synthetic c:Lcom/opera/android/browser/OperaDownloadManagerDelegate$TargetCallback;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(ZJLcom/opera/android/browser/OperaDownloadManagerDelegate$TargetCallback;Ljava/lang/String;Z)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Likf;->a:Z

    iput-wide p2, p0, Likf;->b:J

    iput-object p4, p0, Likf;->c:Lcom/opera/android/browser/OperaDownloadManagerDelegate$TargetCallback;

    iput-object p5, p0, Likf;->d:Ljava/lang/String;

    iput-boolean p6, p0, Likf;->e:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    iget-object v4, p0, Likf;->d:Ljava/lang/String;

    iget-boolean v5, p0, Likf;->e:Z

    iget-boolean v0, p0, Likf;->a:Z

    iget-wide v1, p0, Likf;->b:J

    iget-object v3, p0, Likf;->c:Lcom/opera/android/browser/OperaDownloadManagerDelegate$TargetCallback;

    invoke-static/range {v0 .. v5}, Lcom/opera/android/browser/OperaDownloadManagerDelegate;->onShowDownloadPathDialog(ZJLcom/opera/android/browser/OperaDownloadManagerDelegate$TargetCallback;Ljava/lang/String;Z)V

    return-void
.end method
