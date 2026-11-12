.class public final synthetic Lx8g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldkj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvl6;


# direct methods
.method public synthetic constructor <init>(Lvl6;B)V
    .registers 3

    iput-byte p2, p0, Lx8g;->a:B

    iput-object p1, p0, Lx8g;->b:Lvl6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-byte v0, p0, Lx8g;->a:B

    iget-object p0, p0, Lx8g;->b:Lvl6;

    packed-switch v0, :pswitch_data_2a

    new-instance v0, La0c;

    invoke-direct {v0}, La0c;-><init>()V

    const/16 v1, 0x1003

    invoke-static {v0, v1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object v0

    iget-object p0, p0, Lvl6;->c:Ljava/lang/Object;

    check-cast p0, Lfp1;

    invoke-virtual {v0, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_1a
    invoke-virtual {p0}, Lvl6;->R()V

    iget-object v0, p0, Lvl6;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object p0, p0, Lvl6;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-static {v0, p0}, Lwwc;->i(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_1a
    .end packed-switch
.end method
