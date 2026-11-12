.class public final synthetic Ldco;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Leua;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lv4g;


# direct methods
.method public synthetic constructor <init>(Lv4g;B)V
    .registers 3

    iput-byte p2, p0, Ldco;->a:B

    iput-object p1, p0, Ldco;->b:Lv4g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Ldco;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Ldco;->b:Lv4g;

    packed-switch v0, :pswitch_data_26

    iget-boolean v0, p0, Lv4g;->b:Z

    if-nez v0, :cond_16

    iput-boolean v1, p0, Lv4g;->b:Z

    iget-object p0, p0, Lv4g;->d:Ljava/lang/Object;

    check-cast p0, Lqsh;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lqsh;->e(Z)V

    :cond_16
    return-void

    :pswitch_17
    iget-boolean v0, p0, Lv4g;->b:Z

    if-nez v0, :cond_24

    iput-boolean v1, p0, Lv4g;->b:Z

    iget-object p0, p0, Lv4g;->d:Ljava/lang/Object;

    check-cast p0, Lqsh;

    invoke-virtual {p0, v1}, Lqsh;->e(Z)V

    :cond_24
    return-void

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_17
    .end packed-switch
.end method
