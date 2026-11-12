.class public final synthetic Lrb9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltb9;

.field public final synthetic c:Ljb9;


# direct methods
.method public synthetic constructor <init>(Ltb9;Ljb9;B)V
    .registers 4

    iput-byte p3, p0, Lrb9;->a:B

    iput-object p1, p0, Lrb9;->b:Ltb9;

    iput-object p2, p0, Lrb9;->c:Ljb9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Lrb9;->a:B

    iget-object v0, p0, Lrb9;->c:Ljb9;

    iget-object p0, p0, Lrb9;->b:Ltb9;

    packed-switch p1, :pswitch_data_1a

    iget-object p0, p0, Ltb9;->m:Lvk2;

    iget-object p1, v0, Ljb9;->g:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lvk2;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_11
    iget-object p0, p0, Ltb9;->m:Lvk2;

    iget-object p1, v0, Ljb9;->g:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lvk2;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
