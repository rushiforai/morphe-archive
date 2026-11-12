.class public final synthetic Ln7k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lv7k;


# direct methods
.method public synthetic constructor <init>(Lv7k;B)V
    .registers 3

    iput-byte p2, p0, Ln7k;->a:B

    iput-object p1, p0, Ln7k;->b:Lv7k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Ln7k;->a:B

    iget-object p0, p0, Ln7k;->b:Lv7k;

    packed-switch v0, :pswitch_data_74

    new-instance v0, Lp7k;

    invoke-direct {v0, p0}, Lp7k;-><init>(Lv7k;)V

    return-object v0

    :pswitch_d
    new-instance v1, Lvkn;

    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object v0

    iget-object v2, v0, Lc8k;->e:Lqln;

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object v0

    iget-object v3, v0, Lsm9;->n:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object v0

    iget-object v0, v0, Lsm9;->a:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v4, Lvjn;

    const/4 v5, 0x1

    invoke-direct {v4, v0, v5, v5}, Lvjn;-><init>(Landroid/content/Context;ZZ)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v5, 0x7f070150

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v6, 0x7f070151

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    iget-object v0, p0, Lv7k;->z:Ljp3;

    sget-object v7, Lv7k;->A:[Lxtb;

    const/4 v8, 0x2

    aget-object v7, v7, v8

    invoke-virtual {v0, p0, v7}, Ljp3;->a(Landroidx/fragment/app/Fragment;Lxtb;)Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Ltjn;

    invoke-direct/range {v1 .. v7}, Lvkn;-><init>(Lqln;Landroidx/recyclerview/widget/RecyclerView;Ln1;IILtjn;)V

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object p0

    iget-object p0, p0, Lsm9;->n:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v0, Lkkf;

    const/16 v2, 0x18

    invoke-direct {v0, v1, v2}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v2

    if-eqz v2, :cond_68

    invoke-static {v2, p0, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_68
    return-object v1

    :pswitch_69
    iget-object p0, p0, Lv7k;->t:Lua7;

    invoke-virtual {p0}, Lua7;->p()Ln37;

    move-result-object p0

    check-cast p0, Lm7k;

    iget-object p0, p0, Lm7k;->a:Lc8j;

    return-object p0

    :pswitch_data_74
    .packed-switch 0x0
        :pswitch_69
        :pswitch_d
    .end packed-switch
.end method
