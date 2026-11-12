.class public final Lcom/opera/android/PushedContentHandler$Request;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/opera/android/PushedContentHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Request"
.end annotation


# instance fields
.field public final a:J

.field public b:Loml;

.field public c:I

.field public d:J

.field public final synthetic e:Lcom/opera/android/PushedContentHandler;


# direct methods
.method public constructor <init>(Lcom/opera/android/PushedContentHandler;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/PushedContentHandler$Request;->e:Lcom/opera/android/PushedContentHandler;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/opera/android/PushedContentHandler$Request;->a:J

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 8

    invoke-static {p0}, LJ/N;->Mty95z0W(Ljava/lang/Object;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/opera/android/PushedContentHandler$Request;->d:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lcom/opera/android/PushedContentHandler$Request;->e:Lcom/opera/android/PushedContentHandler;

    iget-object v0, v0, Lcom/opera/android/PushedContentHandler;->g:Lumi;

    new-instance v1, Lpjg;

    const/16 v2, 0xd

    invoke-direct {v1, p0, v2}, Lpjg;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    new-instance v1, Loml;

    invoke-direct {v1, v0}, Loml;-><init>(Lnml;)V

    iput-object v1, p0, Lcom/opera/android/PushedContentHandler$Request;->b:Loml;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v6, 0x0

    const/4 v2, 0x0

    const-wide/16 v3, 0x1e

    invoke-virtual/range {v1 .. v6}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    :cond_2b
    return-void
.end method

.method public final onCompleted(Z)V
    .registers 7

    iget-wide v0, p0, Lcom/opera/android/PushedContentHandler$Request;->d:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_d

    invoke-static {v0, v1}, LJ/N;->MBqsUtXh(J)V

    iput-wide v2, p0, Lcom/opera/android/PushedContentHandler$Request;->d:J

    :cond_d
    iget-object v0, p0, Lcom/opera/android/PushedContentHandler$Request;->b:Loml;

    const/4 v1, 0x0

    if-eqz v0, :cond_18

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Loml;->cancel(Z)Z

    iput-object v1, p0, Lcom/opera/android/PushedContentHandler$Request;->b:Loml;

    :cond_18
    iget-object v0, p0, Lcom/opera/android/PushedContentHandler$Request;->e:Lcom/opera/android/PushedContentHandler;

    iget-object v0, v0, Lcom/opera/android/PushedContentHandler;->g:Lumi;

    new-instance v2, Lgh2;

    const/16 v3, 0x9

    invoke-direct {v2, v3, p0, p1}, Lgh2;-><init>(BLjava/lang/Object;Z)V

    invoke-interface {v0, v2}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method
