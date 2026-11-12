.class public final synthetic Lu8j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lc9j;


# direct methods
.method public synthetic constructor <init>(Lc9j;B)V
    .registers 3

    iput-byte p2, p0, Lu8j;->a:B

    iput-object p1, p0, Lu8j;->b:Lc9j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lu8j;->a:B

    iget-object p0, p0, Lu8j;->b:Lc9j;

    packed-switch v0, :pswitch_data_36

    iget-object p0, p0, Lc9j;->t:Lov0;

    iget-object p0, p0, Lov0;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/FadingRecyclerView;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_14
    sget-object v0, Lc9j;->w:[Lxtb;

    new-instance v1, Lyz7;

    iget-object p0, p0, Lc9j;->s:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Ly8j;

    const/4 v6, 0x0

    const/4 v3, 0x2

    const v4, 0x7f14103c

    const v5, 0x7f130035

    invoke-direct/range {v1 .. v6}, Lyz7;-><init>(Landroidx/recyclerview/widget/d;IIII)V

    return-object v1

    :pswitch_2d
    sget-object v0, Lc9j;->w:[Lxtb;

    new-instance v0, Ly8j;

    invoke-direct {v0, p0}, Ly8j;-><init>(Lc9j;)V

    return-object v0

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_2d
        :pswitch_14
    .end packed-switch
.end method
