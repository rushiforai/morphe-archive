.class public final synthetic Lf2l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyjj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx2l;


# direct methods
.method public synthetic constructor <init>(Lx2l;B)V
    .registers 3

    iput-byte p2, p0, Lf2l;->a:B

    iput-object p1, p0, Lf2l;->b:Lx2l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/i;
    .registers 5

    iget-byte v0, p0, Lf2l;->a:B

    iget-object p0, p0, Lf2l;->b:Lx2l;

    packed-switch v0, :pswitch_data_4a

    new-instance v0, Lnwj;

    iget-object v1, p0, Lx2l;->e:Lpde;

    iget-object p0, p0, Lx2l;->i:Lpde;

    new-instance v2, Lmwj;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v2, p1, v1, p0}, Lmwj;-><init>(Landroid/content/Context;Lpde;Lpde;)V

    invoke-direct {v0, v2}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    return-object v0

    :pswitch_1a
    sget v0, Lb38;->d:I

    iget-object p0, p0, Lx2l;->j:Lypd;

    new-instance v0, Lb38;

    const v1, 0x7f0d03f7

    const/4 v2, 0x0

    invoke-static {p1, v1, p1, v2}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_30

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-direct {v0, p1, p0}, Lb38;-><init>(Lcom/opera/android/custom_views/StylingImageButton;Lypd;)V

    goto :goto_36

    :cond_30
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 v0, 0x0

    :goto_36
    return-object v0

    :pswitch_37
    new-instance v0, Lc38;

    iget-object v1, p0, Lx2l;->e:Lpde;

    iget-object p0, p0, Lx2l;->i:Lpde;

    new-instance v2, Ld21;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v2, p1, v1, p0}, Ld21;-><init>(Landroid/content/Context;Lpde;Lpde;)V

    invoke-direct {v0, v2}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    return-object v0

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_37
        :pswitch_1a
    .end packed-switch
.end method
