.class public abstract Llgn;
.super Ll53;
.source "SourceFile"


# instance fields
.field public final synthetic c:Lmgn;


# direct methods
.method public constructor <init>(Lmgn;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llgn;->c:Lmgn;

    return-void
.end method


# virtual methods
.method public abstract a(Landroid/view/ViewGroup;Landroid/view/View;)Lrcn;
.end method

.method public final c(Landroid/view/ViewGroup;)Llz3;
    .registers 4

    iget-object v0, p0, Llgn;->c:Lmgn;

    invoke-virtual {v0}, Lmgn;->c()Lcom/opera/android/bar/OmniButtonView;

    move-result-object v1

    invoke-virtual {v0}, Lmgn;->e()Z

    move-result v0

    if-eqz v0, :cond_1b

    if-eqz v1, :cond_1b

    invoke-virtual {p0, p1, v1}, Llgn;->a(Landroid/view/ViewGroup;Landroid/view/View;)Lrcn;

    move-result-object p1

    new-instance v0, Lkgn;

    invoke-direct {v0, p0}, Lkgn;-><init>(Llgn;)V

    invoke-virtual {p1, v0}, Llz3;->a(Lkz3;)V

    return-object p1

    :cond_1b
    const/4 p0, 0x0

    return-object p0
.end method
