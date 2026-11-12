.class public final synthetic Lagn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly9n;


# instance fields
.field public final synthetic a:Lcgn;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/Class;


# direct methods
.method public synthetic constructor <init>(Lcgn;Ljava/lang/String;Ljava/lang/Class;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lagn;->a:Lcgn;

    iput-object p2, p0, Lagn;->b:Ljava/lang/String;

    iput-object p3, p0, Lagn;->c:Ljava/lang/Class;

    return-void
.end method


# virtual methods
.method public final T(Landroid/view/View;II)V
    .registers 7

    if-lez p2, :cond_2a

    iget-object p1, p0, Lagn;->a:Lcgn;

    iget-object p2, p1, Lcgn;->C:Lx5f;

    iget-boolean p3, p2, Lx5f;->h:Z

    if-eqz p3, :cond_22

    iget-object p3, p2, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    invoke-static {p3, v0}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object p3

    new-instance v1, Lw5f;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lw5f;-><init>(B)V

    iget-object v2, p0, Lagn;->b:Ljava/lang/String;

    invoke-virtual {p3, v2, v1}, Lhi0;->b(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p2, v0}, Lx5f;->U0(Lx56;)V

    :cond_22
    iget-object p0, p0, Lagn;->c:Ljava/lang/Class;

    iput-object p0, p1, Lcgn;->R:Ljava/lang/Class;

    iget-object p0, p1, Lcgn;->Q:Lcom/opera/android/custom_views/VpnProBanner;

    if-nez p0, :cond_2b

    :cond_2a
    return-void

    :cond_2b
    iget-object p2, p1, Lltl;->g:Lwjj;

    if-eqz p2, :cond_36

    iget-object p2, p2, Lwjj;->d:Ljava/lang/Object;

    check-cast p2, Lcan;

    invoke-virtual {p2, p0}, Lcan;->a(Landroid/view/View;)V

    :cond_36
    const/4 p0, 0x0

    iput-object p0, p1, Lcgn;->Q:Lcom/opera/android/custom_views/VpnProBanner;

    return-void
.end method
