.class public final synthetic Lza3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnScrollChangeListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lza3;->a:B

    iput-object p1, p0, Lza3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onScrollChange(Landroid/view/View;IIII)V
    .registers 14

    iget-byte v0, p0, Lza3;->a:B

    iget-object p0, p0, Lza3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_56

    check-cast p0, Luvi;

    iget-object p0, p0, Luvi;->a:Lcan;

    new-instance p1, Lmni;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Lmni;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :pswitch_15
    check-cast p0, Lnoc;

    if-eq p2, p4, :cond_1c

    invoke-virtual {p0}, Lnoc;->a()V

    :cond_1c
    return-void

    :pswitch_1d
    check-cast p0, Lx79;

    invoke-virtual {p0}, Lx79;->O()V

    return-void

    :pswitch_23
    check-cast p0, Lks3;

    iget-object v0, p0, Lks3;->g:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lab3;

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v6}, Lab3;->onScrollChange(Landroid/view/View;IIII)V

    iget-object p0, p0, Lks3;->h:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 p2, 0x0

    :goto_3b
    if-ge p2, p1, :cond_54

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    add-int/lit8 p2, p2, 0x1

    check-cast p3, Landroid/view/View$OnScrollChangeListener;

    move v7, v6

    move v6, v5

    move v5, v4

    move v4, v3

    move-object v3, v2

    move-object v2, p3

    invoke-interface/range {v2 .. v7}, Landroid/view/View$OnScrollChangeListener;->onScrollChange(Landroid/view/View;IIII)V

    move-object v2, v3

    move v3, v4

    move v4, v5

    move v5, v6

    move v6, v7

    goto :goto_3b

    :cond_54
    return-void

    nop

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_23
        :pswitch_1d
        :pswitch_15
    .end packed-switch
.end method
