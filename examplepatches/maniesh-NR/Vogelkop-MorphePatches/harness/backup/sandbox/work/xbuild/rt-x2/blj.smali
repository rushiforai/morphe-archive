.class public abstract Lblj;
.super Leog;
.source "SourceFile"


# instance fields
.field public i:Lps5;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Luim;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract l0()V
.end method

.method public abstract m0(I)V
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1}, Landroidx/fragment/app/i;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lps5;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lbud;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lblj;->i:Lps5;

    iput-object p0, p1, Lbud;->c:Leog;

    iput-object p0, p1, Lps5;->e:Leog;

    const v0, 0x7f1413fa

    invoke-virtual {p1, v0}, Lps5;->setHeaderTitle(I)Landroid/view/ContextMenu;

    invoke-virtual {p0}, Lblj;->l0()V

    new-instance p1, Laxe;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Laxe;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Leog;->h:Landroid/view/MenuItem$OnMenuItemClickListener;

    iget-object p1, p0, Lblj;->i:Lps5;

    const/4 v0, 0x1

    invoke-virtual {p1, v0, v0, v0}, Lbud;->setGroupCheckable(IZZ)V

    iget-object p1, p0, Lblj;->i:Lps5;

    iput-object p1, p0, Leog;->d:Lps5;

    return-void
.end method
