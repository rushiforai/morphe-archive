.class public final Lq22;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkz3;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lq22;->a:B

    iput-object p1, p0, Lq22;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Lhjm;)V
    .registers 4

    iget-byte v0, p0, Lq22;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lq22;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_38

    check-cast p0, Llqn;

    iput-object v1, p0, Llqn;->K:Lsba;

    return-void

    :pswitch_d
    check-cast p0, Ljmn;

    iput-object v1, p0, Ljmn;->B:Lexd;

    return-void

    :pswitch_12
    sget-object v0, Lhjm;->a:Lhjm;

    if-ne p1, v0, :cond_31

    check-cast p0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string v0, "main.menu.button.hint.closed"

    const/4 v1, 0x1

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_31
    return-void

    :pswitch_32
    check-cast p0, Lx22;

    iput-object v1, p0, Lx22;->u:Lsba;

    return-void

    nop

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_32
        :pswitch_12
        :pswitch_d
    .end packed-switch
.end method
