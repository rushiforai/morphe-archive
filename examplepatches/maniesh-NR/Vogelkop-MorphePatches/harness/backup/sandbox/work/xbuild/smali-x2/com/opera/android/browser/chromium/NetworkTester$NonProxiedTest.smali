.class public final Lcom/opera/android/browser/chromium/NetworkTester$NonProxiedTest;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:J

.field public final b:Ldcl;


# direct methods
.method public constructor <init>(Ldcl;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/browser/chromium/NetworkTester$NonProxiedTest;->b:Ldcl;

    invoke-static {p0}, LJ/N;->MIR5g6Sp(Ljava/lang/Object;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/opera/android/browser/chromium/NetworkTester$NonProxiedTest;->a:J

    return-void
.end method


# virtual methods
.method public final onTestCompleted(I)V
    .registers 7

    iget-wide v0, p0, Lcom/opera/android/browser/chromium/NetworkTester$NonProxiedTest;->a:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_9

    return-void

    :cond_9
    invoke-static {v0, v1}, LJ/N;->MDxXurEr(J)V

    iput-wide v2, p0, Lcom/opera/android/browser/chromium/NetworkTester$NonProxiedTest;->a:J

    iget-object p0, p0, Lcom/opera/android/browser/chromium/NetworkTester$NonProxiedTest;->b:Ldcl;

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Lcdn;

    if-nez p1, :cond_1e

    iget p1, p0, Lcdn;->l:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_1e

    const/4 p1, 0x4

    iput p1, p0, Lcdn;->l:I

    :cond_1e
    iget-object p1, p0, Lcdn;->n:Lssi;

    invoke-virtual {p1}, Lssi;->run()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcdn;->q:Lcom/opera/android/browser/chromium/NetworkTester$NonProxiedTest;

    return-void
.end method
