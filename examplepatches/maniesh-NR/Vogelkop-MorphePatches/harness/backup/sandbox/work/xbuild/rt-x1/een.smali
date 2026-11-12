.class public final Leen;
.super Llgn;
.source "SourceFile"


# instance fields
.field public final synthetic d:Lfen;


# direct methods
.method public constructor <init>(Lfen;)V
    .registers 2

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Leen;->d:Lfen;

    invoke-direct {p0, p1}, Llgn;-><init>(Lmgn;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/ViewGroup;Landroid/view/View;)Lrcn;
    .registers 12

    new-instance v0, Lrcn;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcxc;->t(Landroid/content/Context;)Lcxc;

    move-result-object v2

    invoke-virtual {v2}, Lno7;->i()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lbxc;

    const/16 v3, 0x9

    invoke-virtual {v2, v3, v1}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1a

    :goto_18
    move-object v4, v2

    goto :goto_22

    :cond_1a
    const v2, 0x7f1413ae

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_18

    :goto_22
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcxc;->t(Landroid/content/Context;)Lcxc;

    move-result-object v2

    invoke-virtual {v2}, Lno7;->i()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lbxc;

    const/16 v3, 0xa

    invoke-virtual {v2, v3, v1}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3a

    :goto_38
    move-object v5, v2

    goto :goto_42

    :cond_3a
    const v2, 0x7f1413ad

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_38

    :goto_42
    sget-object v8, Lmf0;->e:Lmf0;

    const/4 v3, 0x0

    const/4 v6, 0x0

    const v7, 0x7f0d00ac

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v8}, Lrcn;-><init>(Landroid/view/ViewGroup;Landroid/view/View;ILjava/lang/CharSequence;Ljava/lang/CharSequence;Lwzg;ILmf0;)V

    new-instance p1, Lden;

    invoke-direct {p1, p0, v2}, Lden;-><init>(Leen;Landroid/view/View;)V

    invoke-virtual {v0, p1}, Llz3;->a(Lkz3;)V

    return-object v0
.end method
