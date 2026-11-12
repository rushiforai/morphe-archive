.class public final Lcom/opera/android/browser/NativeStatsTracker;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lx5f;


# direct methods
.method public constructor <init>(Lx5f;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/browser/NativeStatsTracker;->a:Lx5f;

    return-void
.end method


# virtual methods
.method public final logGooglePageWithCaptcha()V
    .registers 4

    iget-object p0, p0, Lcom/opera/android/browser/NativeStatsTracker;->a:Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, v0}, Lx56;->z(Lzpa;)Lq56;

    move-result-object v0

    const/16 v2, 0x10

    invoke-virtual {v0, v2}, Ljf0;->e(I)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final logYatLookupErrorPage()V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/browser/NativeStatsTracker;->a:Lx5f;

    sget-object v0, Lfv0;->d:Lfv0;

    invoke-virtual {p0, v0}, Lx5f;->S0(Lfv0;)V

    return-void
.end method

.method public final logYatLookupUrlRedirect()V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/browser/NativeStatsTracker;->a:Lx5f;

    sget-object v0, Lfv0;->b:Lfv0;

    invoke-virtual {p0, v0}, Lx5f;->S0(Lfv0;)V

    return-void
.end method

.method public final logYatLookupYatRedirect()V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/browser/NativeStatsTracker;->a:Lx5f;

    sget-object v0, Lfv0;->c:Lfv0;

    invoke-virtual {p0, v0}, Lx5f;->S0(Lfv0;)V

    return-void
.end method
