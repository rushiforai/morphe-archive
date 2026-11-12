.class public final Lete;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lx5f;

.field public final b:Lb59;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lx5f;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lete;->a:Lx5f;

    const/4 p3, 0x0

    new-array p3, p3, [Lbg1;

    const-string v0, "news.session.tracker"

    invoke-static {p1, p2, v0, p3}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lete;->b:Lb59;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Lete;->b:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_session"

    invoke-static {v0, v1}, Lam2;->x(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V

    iget-object p0, p0, Lete;->a:Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_18

    return-void

    :cond_18
    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, v0}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v2

    invoke-virtual {v2, v0}, Lfi0;->z(Lzpa;)Llj0;

    move-result-object v0

    const/4 v2, 0x3

    invoke-virtual {v0, v2}, Ljf0;->e(I)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method
