.class public final synthetic Lrk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwk;


# direct methods
.method public synthetic constructor <init>(Lwk;B)V
    .registers 3

    iput-byte p2, p0, Lrk;->a:B

    iput-object p1, p0, Lrk;->b:Lwk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Lrk;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lrk;->b:Lwk;

    packed-switch p1, :pswitch_data_1e

    iget-object p0, p0, Lwk;->z:Lrj;

    iget-object p0, p0, Lrj;->b:Lgjm;

    sget-object p1, Lvj;->a:Lvj;

    invoke-virtual {p0, p1, v0}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_12
    iget-object p0, p0, Lwk;->B:Lua7;

    iget-object p0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast p0, Lgjm;

    sget-object p1, Lij;->a:Lij;

    invoke-virtual {p0, p1, v0}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
