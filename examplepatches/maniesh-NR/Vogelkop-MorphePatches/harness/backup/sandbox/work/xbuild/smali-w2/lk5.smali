.class public final synthetic Llk5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljvg;


# direct methods
.method public synthetic constructor <init>(Ljvg;B)V
    .registers 3

    iput-byte p2, p0, Llk5;->a:B

    iput-object p1, p0, Llk5;->b:Ljvg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte v0, p0, Llk5;->a:B

    sget-object v1, Lru0;->c:Lru0;

    const/4 v2, 0x0

    iget-object p0, p0, Llk5;->b:Ljvg;

    packed-switch v0, :pswitch_data_48

    iget-object v0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Lbmn;

    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Lqf;

    invoke-virtual {v0, p1, p0}, Lbmn;->g(Landroid/view/View;Lqf;)V

    return-void

    :pswitch_16
    iget-object p1, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast p1, Lbmn;

    invoke-virtual {p1, v1, v2}, Lbmn;->f(Lru0;Ljava/lang/String;)V

    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Lqf;

    invoke-virtual {p0}, Ldej;->b()V

    return-void

    :pswitch_25
    iget-object p1, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast p1, Lbmn;

    sget-object v0, Lru0;->e:Lru0;

    invoke-virtual {p1, v0, v2}, Lbmn;->f(Lru0;Ljava/lang/String;)V

    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Lqf;

    invoke-virtual {p0}, Ldej;->b()V

    invoke-virtual {p1}, Lbmn;->h()V

    return-void

    :pswitch_39
    iget-object p1, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast p1, Lbmn;

    invoke-virtual {p1, v1, v2}, Lbmn;->f(Lru0;Ljava/lang/String;)V

    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Lqf;

    invoke-virtual {p0}, Ldej;->b()V

    return-void

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_39
        :pswitch_25
        :pswitch_16
    .end packed-switch
.end method
