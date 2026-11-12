.class public final synthetic Lamn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lsni;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Lcej;


# direct methods
.method public synthetic constructor <init>(Lcej;Landroid/content/Context;B)V
    .registers 4

    iput-byte p3, p0, Lamn;->a:B

    iput-object p1, p0, Lamn;->c:Lcej;

    iput-object p2, p0, Lamn;->b:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final Y(Z)V
    .registers 3

    iget-byte p1, p0, Lamn;->a:B

    iget-object v0, p0, Lamn;->b:Landroid/content/Context;

    iget-object p0, p0, Lamn;->c:Lcej;

    packed-switch p1, :pswitch_data_16

    check-cast p0, Log5;

    invoke-virtual {p0, v0}, Log5;->d(Landroid/content/Context;)V

    return-void

    :pswitch_f
    check-cast p0, Lxq3;

    invoke-virtual {p0, v0}, Lxq3;->b(Landroid/content/Context;)V

    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
