.class public final Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/opera/android/settings/cleardata/OnboardingProfileReset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Request"
.end annotation


# instance fields
.field public final a:Lumi;

.field public final b:Lwx;

.field public c:Loml;

.field public d:I

.field public e:J


# direct methods
.method public constructor <init>(Lumi;Lwx;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->a:Lumi;

    iput-object p2, p0, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->b:Lwx;

    invoke-virtual {p0}, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 8

    iget-wide v0, p0, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->e:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_9

    return-void

    :cond_9
    invoke-static {p0}, LJ/N;->MHD5ixxA(Ljava/lang/Object;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->e:J

    new-instance v0, Lvdf;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lvdf;-><init>(Ljava/lang/Object;B)V

    iget-object v1, p0, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->a:Lumi;

    invoke-interface {v1, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    new-instance v1, Loml;

    invoke-direct {v1, v0}, Loml;-><init>(Lnml;)V

    iput-object v1, p0, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->c:Loml;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v6, 0x0

    const/4 v2, 0x0

    const-wide/16 v3, 0x1e

    invoke-virtual/range {v1 .. v6}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    return-void
.end method
