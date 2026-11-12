.class public final Ljlf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lhz;

.field public final b:Ljava/lang/Object;

.field public final c:Lb59;


# direct methods
.method public constructor <init>(Lcom/opera/android/OperaApplication;Lhz;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Ljlf;->b:Ljava/lang/Object;

    sget-object v0, Lvml;->d:Lumi;

    new-instance v1, La00;

    const/4 v2, 0x7

    invoke-direct {v1, p0, v2}, La00;-><init>(Ljava/lang/Object;B)V

    const/4 v2, 0x1

    new-array v2, v2, [Lbg1;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const-string v1, "opera_job_failure_tracker"

    invoke-static {p1, v0, v1, v2}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Ljlf;->c:Lb59;

    iput-object p2, p0, Ljlf;->a:Lhz;

    return-void
.end method
