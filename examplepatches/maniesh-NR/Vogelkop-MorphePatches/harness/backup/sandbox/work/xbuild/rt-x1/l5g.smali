.class public final synthetic Ll5g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Li5g;


# direct methods
.method public synthetic constructor <init>(Li5g;B)V
    .registers 3

    iput-byte p2, p0, Ll5g;->a:B

    iput-object p1, p0, Ll5g;->b:Li5g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    iget-byte p1, p0, Ll5g;->a:B

    const/4 v0, 0x1

    iget-object p0, p0, Ll5g;->b:Li5g;

    packed-switch p1, :pswitch_data_5a

    iget-object p0, p0, Li5g;->b:Lqfb;

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Lt5g;

    invoke-virtual {p0}, Lt5g;->I0()Lt6g;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sput-boolean v0, Lxgh;->a:Z

    invoke-virtual {p0}, Lt6g;->h()V

    return-void

    :pswitch_1b
    iget-object p0, p0, Li5g;->b:Lqfb;

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Lt5g;

    invoke-virtual {p0}, Lt5g;->I0()Lt6g;

    move-result-object p0

    iget-object p1, p0, Lt6g;->k:Lorm;

    sget-object v1, Lgm0;->m:Lgm0;

    check-cast p1, Lx5f;

    invoke-virtual {p1, v1}, Lx5f;->l0(Lgm0;)V

    iget-object p1, p0, Lt6g;->j:Lhxk;

    new-instance v1, Ls6g;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Ls6g;-><init>(Lt6g;B)V

    new-instance v2, Ls6g;

    invoke-direct {v2, p0, v0}, Ls6g;-><init>(Lt6g;B)V

    check-cast p1, Lkxk;

    iget-object p0, p1, Lkxk;->e:Lcom/opera/android/BrowserActivity;

    iget-object p1, p1, Lkxk;->d:Lwv1;

    iget-object p1, p1, Lwv1;->b:Lb6h;

    invoke-interface {p1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lzwk;

    new-instance v0, Ll31;

    const/4 v3, 0x3

    invoke-direct {v0, v1, v3}, Ll31;-><init>(Lkotlin/jvm/functions/Function0;B)V

    new-instance v1, Ll31;

    const/4 v3, 0x4

    invoke-direct {v1, v2, v3}, Ll31;-><init>(Lkotlin/jvm/functions/Function0;B)V

    invoke-static {p0, p1, v0, v1}, Lxih;->y(Landroid/content/Context;Lzwk;Ljava/lang/Runnable;Ll31;)V

    return-void

    nop

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method
