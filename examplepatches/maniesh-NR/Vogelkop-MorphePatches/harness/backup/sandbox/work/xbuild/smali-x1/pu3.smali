.class public final Lpu3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:J

.field public final c:J

.field public final d:Lxnh;

.field public final e:Lvy;

.field public f:Z

.field public final synthetic g:Lcom/opera/android/BrowserActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Z)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpu3;->g:Lcom/opera/android/BrowserActivity;

    iput-boolean p2, p0, Lpu3;->a:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lpu3;->b:J

    sget-object p2, Lpn7;->b:Lon7;

    const/16 p2, 0x1e

    sget-object v0, Lun7;->f:Lun7;

    invoke-static {p2, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    iput-wide v0, p0, Lpu3;->c:J

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object p1

    iput-object p1, p0, Lpu3;->d:Lxnh;

    new-instance p2, Lvy;

    const/4 v0, 0x2

    invoke-direct {p2, p0, v0}, Lvy;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lpu3;->e:Lvy;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lpu3;->f:Z

    invoke-virtual {p1, p2}, Lno7;->g(Lmo7;)V

    return-void
.end method
