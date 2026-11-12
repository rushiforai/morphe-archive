.class public final synthetic Lykh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lalh;

.field public final synthetic c:Lblh;


# direct methods
.method public synthetic constructor <init>(Lalh;Lblh;B)V
    .registers 4

    iput-byte p3, p0, Lykh;->a:B

    iput-object p1, p0, Lykh;->b:Lalh;

    iput-object p2, p0, Lykh;->c:Lblh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte v0, p0, Lykh;->a:B

    iget-object v1, p0, Lykh;->c:Lblh;

    iget-object p0, p0, Lykh;->b:Lalh;

    packed-switch v0, :pswitch_data_3c

    iget-object p0, p0, Lalh;->j:Lwkh;

    if-eqz p0, :cond_17

    iget-object p0, p0, Lwkh;->a:Lilh;

    new-instance v0, Lh0h;

    invoke-direct {v0, v1, p1, p0}, Lh0h;-><init>(Lblh;Landroid/view/View;Lilh;)V

    invoke-virtual {v0, p1}, Lo73;->p(Landroid/view/View;)V

    :cond_17
    return-void

    :pswitch_18
    iget-object p1, p0, Lalh;->j:Lwkh;

    if-eqz p1, :cond_3a

    iget-object p1, p1, Lwkh;->a:Lilh;

    iget-object v0, p0, Lyzi;->b:Ltzi;

    iget-boolean v0, v0, Ltzi;->g:Z

    if-eqz v0, :cond_2f

    iget-object v0, v1, Lblh;->d:Le5d;

    iget-wide v1, p1, Lilh;->a:J

    invoke-virtual {v0, v1, v2}, Le5d;->d(J)V

    invoke-virtual {p0}, Lalh;->h0()V

    goto :goto_3a

    :cond_2f
    iget-object p0, v1, Lblh;->j:Lnlh;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v1, v0}, Lnlh;->K0(Ljava/util/List;ZZZ)V

    :cond_3a
    :goto_3a
    return-void

    nop

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method
