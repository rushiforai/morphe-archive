.class public final Lbx3;
.super Lhji;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lre7;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/opera/android/OperaApplication;

.field public final synthetic d:Lcx3;


# direct methods
.method public constructor <init>(Lcx3;Lre7;ZLcom/opera/android/OperaApplication;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lbx3;->a:Lre7;

    iput-boolean p3, p0, Lbx3;->b:Z

    iput-object p4, p0, Lbx3;->c:Lcom/opera/android/OperaApplication;

    iput-object p1, p0, Lbx3;->d:Lcx3;

    return-void
.end method


# virtual methods
.method public final createSheet(Lmej;Lb2l;)Ldej;
    .registers 4

    iget-object p2, p0, Lbx3;->a:Lre7;

    iget-boolean v0, p0, Lbx3;->b:Z

    iget-object p0, p0, Lbx3;->d:Lcx3;

    invoke-virtual {p0, p2, v0, p1}, Lcx3;->d(Lre7;ZLmej;)Lef7;

    move-result-object p0

    return-object p0
.end method

.method public final onFinished(Lhjm;)V
    .registers 10

    sget-object v0, Lhjm;->b:Lhjm;

    if-ne p1, v0, :cond_20

    iget-object p1, p0, Lbx3;->c:Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object v0, p1, Ld6j;->c:Lx5f;

    iget-object p0, p0, Lbx3;->a:Lre7;

    invoke-virtual {p0}, Lre7;->c()Lnc0;

    move-result-object v7

    iget-boolean p0, v0, Lx5f;->h:Z

    if-eqz p0, :cond_20

    const/4 v5, 0x0

    const/4 v6, 0x0

    sget-object v1, Lkc0;->b:Lkc0;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual/range {v0 .. v7}, Lx5f;->N(Lkc0;Lmc0;ZZZZLnc0;)V

    :cond_20
    return-void
.end method
