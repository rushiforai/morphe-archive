.class public final LG/h;
.super LD/g;
.source "SourceFile"


# instance fields
.field public final o:LG/g;


# direct methods
.method public constructor <init>(Landroid/widget/TextView;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, LG/g;

    invoke-direct {v0, p1}, LG/g;-><init>(Landroid/widget/TextView;)V

    iput-object v0, p0, LG/h;->o:LG/g;

    return-void
.end method


# virtual methods
.method public final N(Z)V
    .locals 1

    sget-object v0, Landroidx/emoji2/text/k;->k:Landroidx/emoji2/text/k;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, LG/h;->o:LG/g;

    invoke-virtual {v0, p1}, LG/g;->N(Z)V

    return-void
.end method

.method public final O(Z)V
    .locals 2

    sget-object v0, Landroidx/emoji2/text/k;->k:Landroidx/emoji2/text/k;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, LG/h;->o:LG/g;

    if-nez v0, :cond_1

    iput-boolean p1, v1, LG/g;->q:Z

    return-void

    :cond_1
    invoke-virtual {v1, p1}, LG/g;->O(Z)V

    return-void
.end method

.method public final u([Landroid/text/InputFilter;)[Landroid/text/InputFilter;
    .locals 1

    sget-object v0, Landroidx/emoji2/text/k;->k:Landroidx/emoji2/text/k;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    return-object p1

    :cond_1
    iget-object v0, p0, LG/h;->o:LG/g;

    invoke-virtual {v0, p1}, LG/g;->u([Landroid/text/InputFilter;)[Landroid/text/InputFilter;

    move-result-object p1

    return-object p1
.end method
