.class public final Lit3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lsni;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lit3;->a:B

    iput-object p1, p0, Lit3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final Y(Z)V
    .registers 3

    iget-byte v0, p0, Lit3;->a:B

    iget-object p0, p0, Lit3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_24

    check-cast p0, Lxwe;

    iget-object p0, p0, Lxwe;->g:Lvwe;

    invoke-virtual {p0}, Lvwe;->a()V

    return-void

    :pswitch_f
    check-cast p0, Ljt3;

    iget-object v0, p0, Ljt3;->g:Lkze;

    iget-boolean p0, p0, Ljt3;->i:Z

    if-eqz p0, :cond_1b

    if-nez p1, :cond_1b

    const/4 p0, 0x1

    goto :goto_1c

    :cond_1b
    const/4 p0, 0x0

    :goto_1c
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-static {v0, p0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
