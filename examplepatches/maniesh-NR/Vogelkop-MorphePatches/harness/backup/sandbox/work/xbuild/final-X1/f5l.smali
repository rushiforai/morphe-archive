.class public final synthetic Lf5l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lh5l;


# direct methods
.method public synthetic constructor <init>(Lh5l;B)V
    .registers 3

    iput-byte p2, p0, Lf5l;->a:B

    iput-object p1, p0, Lf5l;->b:Lh5l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    iget-byte p1, p0, Lf5l;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lf5l;->b:Lh5l;

    packed-switch p1, :pswitch_data_6a

    iget-object p1, p0, Lh5l;->e:Ls9i;

    iget-object v1, p0, Lh5l;->c:Lypd;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v2

    const/4 v3, 0x6

    invoke-static {v1, v2, v0, v3}, Lypd;->K(Lypd;III)V

    iget-object p0, p0, Lh5l;->i:Lu2l;

    if-eqz p0, :cond_27

    iget-object p0, p0, Lu2l;->a:Lb2l;

    invoke-virtual {p1, p0}, Ls9i;->Z(Lb2l;)Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-virtual {p1, p0}, Ls9i;->j0(Lb2l;)V

    goto :goto_27

    :cond_24
    invoke-virtual {v1, p0}, Lypd;->m(Lb2l;)V

    :cond_27
    :goto_27
    return-void

    :pswitch_28
    iget-object p1, p0, Lh5l;->i:Lu2l;

    if-eqz p1, :cond_49

    iget-object p1, p1, Lu2l;->a:Lb2l;

    invoke-static {p1}, Lexg;->f(Lb2l;)Z

    move-result v1

    iget-object p0, p0, Lh5l;->c:Lypd;

    if-eqz v1, :cond_40

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-virtual {p0, p1, v0, v0}, Lypd;->o0(Ljava/lang/Iterable;ZZ)V

    goto :goto_49

    :cond_40
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-virtual {p0, p1, v0, v0}, Lypd;->O(Ljava/lang/Iterable;ZZ)V

    :cond_49
    :goto_49
    return-void

    :pswitch_4a
    iget-object p1, p0, Lh5l;->e:Ls9i;

    iget-object p0, p0, Lh5l;->i:Lu2l;

    if-eqz p0, :cond_5b

    iget-object p0, p0, Lu2l;->a:Lb2l;

    invoke-virtual {p1, p0}, Ls9i;->Z(Lb2l;)Z

    move-result v0

    if-eqz v0, :cond_5b

    invoke-virtual {p1, p0}, Ls9i;->j0(Lb2l;)V

    :cond_5b
    return-void

    :pswitch_5c
    iget-object p1, p0, Lh5l;->i:Lu2l;

    if-eqz p1, :cond_69

    iget-object p0, p0, Lh5l;->c:Lypd;

    iget-object p1, p1, Lu2l;->a:Lb2l;

    sget-object v0, Lpdb;->b:Lpdb;

    invoke-virtual {p0, p1, v0}, Lypd;->p(Lb2l;Lpdb;)V

    :cond_69
    return-void

    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_5c
        :pswitch_4a
        :pswitch_28
    .end packed-switch
.end method
