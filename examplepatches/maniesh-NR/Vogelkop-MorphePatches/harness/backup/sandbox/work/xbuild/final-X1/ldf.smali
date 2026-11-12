.class public final Lldf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lb59;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lx5f;Lwsf;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lb94;

    const/4 v1, 0x2

    invoke-direct {v0, p3, p4, v1}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 p3, 0x1

    new-array p3, p3, [Lbg1;

    const/4 p4, 0x0

    aput-object v0, p3, p4

    const-string p4, "onboarding_after_restore"

    invoke-static {p1, p2, p4, p3}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lldf;->a:Lb59;

    return-void
.end method
