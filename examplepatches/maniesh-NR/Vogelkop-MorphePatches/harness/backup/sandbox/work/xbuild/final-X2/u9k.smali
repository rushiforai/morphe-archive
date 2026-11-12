.class public final Lu9k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpde;

.field public b:Ltn;


# direct methods
.method public constructor <init>(Lcom/opera/android/startup/WelcomeActivity;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lpde;

    sget-object v1, Lr9k;->a:Lr9k;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lu9k;->a:Lpde;

    new-instance v1, Lwt2;

    const/4 v2, 0x6

    invoke-direct {v1, p0, v2}, Lwt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, v1}, Le7d;->a(Landroid/content/Context;Lc7d;)V

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lr9k;

    if-eqz v0, :cond_2e

    new-instance v0, Ltn;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    new-instance v1, Ljri;

    const/16 v2, 0xe

    invoke-direct {v1, p0, p1, v2}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v0, v1}, Ltn;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lu9k;->b:Ltn;

    :cond_2e
    return-void
.end method
