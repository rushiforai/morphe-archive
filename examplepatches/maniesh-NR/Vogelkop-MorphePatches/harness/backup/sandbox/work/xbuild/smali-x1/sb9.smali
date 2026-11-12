.class public final synthetic Lsb9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltb9;

.field public final synthetic c:Ljb9;


# direct methods
.method public synthetic constructor <init>(Ltb9;Ljb9;B)V
    .registers 4

    iput-byte p3, p0, Lsb9;->a:B

    iput-object p1, p0, Lsb9;->b:Ltb9;

    iput-object p2, p0, Lsb9;->c:Ljb9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .registers 4

    iget-byte p1, p0, Lsb9;->a:B

    const/4 v0, 0x1

    iget-object v1, p0, Lsb9;->c:Ljb9;

    iget-object p0, p0, Lsb9;->b:Ltb9;

    packed-switch p1, :pswitch_data_12

    invoke-virtual {p0, v1}, Ltb9;->f0(Lja2;)V

    return v0

    :pswitch_e
    invoke-virtual {p0, v1}, Ltb9;->f0(Lja2;)V

    return v0

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
