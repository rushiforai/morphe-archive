.class public abstract Ltp2;
.super Lhq2;
.source "SourceFile"


# instance fields
.field public final synthetic b:Liq2;


# direct methods
.method public constructor <init>(Liq2;Landroid/view/View;)V
    .registers 3

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Ltp2;->b:Liq2;

    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public abstract V(Lfw;)V
.end method

.method public final X(Lfw;)Ljava/lang/String;
    .registers 5

    iget-object v0, p1, Lfw;->b:Ljava/lang/String;

    iget-object p0, p0, Ltp2;->b:Liq2;

    iget-object v1, p0, Liq2;->K:Ljava/util/HashSet;

    sget-object v2, Lyp2;->a:Lyp2;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    iget-boolean v1, p1, Lfw;->c:Z

    if-nez v1, :cond_22

    :cond_12
    iget-object p0, p0, Liq2;->K:Ljava/util/HashSet;

    sget-object v1, Lyp2;->c:Lyp2;

    invoke-virtual {p0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_29

    iget-object p0, p1, Lfw;->a:Lew;

    sget-object p1, Lew;->j:Lew;

    if-ne p0, p1, :cond_29

    :cond_22
    const-string p0, "*"

    invoke-static {v0, p0}, Lsko;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_29
    return-object v0
.end method

.method public final Y(Lfw;Ljava/lang/String;)V
    .registers 5

    iget-object p0, p0, Ltp2;->b:Liq2;

    iget-object v0, p0, Liq2;->K:Ljava/util/HashSet;

    sget-object v1, Lyp2;->a:Lyp2;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    iget-boolean v0, p1, Lfw;->c:Z

    if-nez v0, :cond_20

    :cond_10
    iget-object v0, p0, Liq2;->K:Ljava/util/HashSet;

    sget-object v1, Lyp2;->c:Lyp2;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    iget-object v0, p1, Lfw;->a:Lew;

    sget-object v1, Lew;->j:Lew;

    if-ne v0, v1, :cond_30

    :cond_20
    invoke-static {p2}, Landroid/text/TextUtils;->getTrimmedLength(Ljava/lang/CharSequence;)I

    move-result p2

    if-nez p2, :cond_30

    const p2, 0x7f140d35

    invoke-virtual {p0, p2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lfw;->e:Ljava/lang/String;

    return-void

    :cond_30
    const/4 p0, 0x0

    iput-object p0, p1, Lfw;->e:Ljava/lang/String;

    return-void
.end method
