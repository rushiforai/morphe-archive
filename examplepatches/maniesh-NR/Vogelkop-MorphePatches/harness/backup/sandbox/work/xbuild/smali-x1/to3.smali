.class public final synthetic Lto3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwo3;


# direct methods
.method public synthetic constructor <init>(Lwo3;B)V
    .registers 3

    iput-byte p2, p0, Lto3;->a:B

    iput-object p1, p0, Lto3;->b:Lwo3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lto3;->a:B

    iget-object p0, p0, Lto3;->b:Lwo3;

    packed-switch v0, :pswitch_data_28

    invoke-virtual {p0}, Lwo3;->J0()Lel9;

    move-result-object v0

    iget-object v0, v0, Lel9;->c:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Lwo3;->H0()V

    iget-object p0, p0, Lwo3;->G:Lwf;

    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    iput-boolean p0, v0, Landroidx/recyclerview/widget/RecyclerView;->t:Z

    new-instance v1, Llv2;

    invoke-direct {v1, p0}, Llv2;-><init>(B)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    return-void

    :pswitch_24
    invoke-virtual {p0}, Lwo3;->H0()V

    return-void

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_24
    .end packed-switch
.end method
