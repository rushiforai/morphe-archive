.class public final synthetic Lg85;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lh85;


# direct methods
.method public synthetic constructor <init>(Lh85;B)V
    .registers 3

    iput-byte p2, p0, Lg85;->a:B

    iput-object p1, p0, Lg85;->b:Lh85;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte p1, p0, Lg85;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lg85;->b:Lh85;

    packed-switch p1, :pswitch_data_4c

    iget-object p1, p0, Lh85;->i:Lg2l;

    iget-object p1, p1, Lg2l;->a:Ljava/util/List;

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1}, Lexg;->g(Ljava/lang/Iterable;)Z

    move-result v1

    iget-object p0, p0, Lh85;->e:Lypd;

    if-eqz v1, :cond_1a

    invoke-virtual {p0, p1, v0, v0}, Lypd;->o0(Ljava/lang/Iterable;ZZ)V

    goto :goto_1d

    :cond_1a
    invoke-virtual {p0, p1, v0, v0}, Lypd;->O(Ljava/lang/Iterable;ZZ)V

    :goto_1d
    return-void

    :pswitch_1e
    invoke-virtual {p0}, Lh85;->c0()V

    return-void

    :pswitch_22
    sget-object p1, Lpdb;->b:Lpdb;

    iget-object v1, p0, Lh85;->e:Lypd;

    iget-object p0, p0, Lh85;->i:Lg2l;

    iget-object p0, p0, Lg2l;->a:Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p0

    sget-object v2, Lvr0;->z:Lvr0;

    invoke-virtual {v1, p0, p1, v2, v0}, Lypd;->g0(Ljava/util/Set;Lpdb;Lvr0;Z)V

    return-void

    :pswitch_36
    iget-object p1, p0, Lh85;->h:Ls9i;

    invoke-virtual {p1}, Ls9i;->Y()Z

    move-result p1

    if-eqz p1, :cond_42

    invoke-virtual {p0}, Lh85;->c0()V

    goto :goto_4b

    :cond_42
    iget-object p1, p0, Lh85;->e:Lypd;

    iget-object p0, p0, Lh85;->i:Lg2l;

    iget p0, p0, Lg2l;->b:I

    invoke-virtual {p1, p0}, Lypd;->r(I)V

    :goto_4b
    return-void

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_36
        :pswitch_22
        :pswitch_1e
    .end packed-switch
.end method
