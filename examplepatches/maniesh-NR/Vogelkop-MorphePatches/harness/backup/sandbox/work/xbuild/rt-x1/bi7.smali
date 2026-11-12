.class public final synthetic Lbi7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhi7;


# direct methods
.method public synthetic constructor <init>(Lhi7;B)V
    .registers 3

    iput-byte p2, p0, Lbi7;->a:B

    iput-object p1, p0, Lbi7;->b:Lhi7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lbi7;->a:B

    const/high16 v1, 0x40000000    # 2.0f

    iget-object p0, p0, Lbi7;->b:Lhi7;

    packed-switch v0, :pswitch_data_48

    iget-object p0, p0, Lhi7;->e:Ligi;

    iget-object v0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    int-to-float v0, v0

    iget-object p0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    :goto_1c
    int-to-float p0, p0

    div-float/2addr p0, v1

    add-float/2addr p0, v0

    :goto_1f
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    :pswitch_24
    iget-object p0, p0, Lhi7;->e:Ligi;

    iget-object v0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    int-to-float v0, v0

    iget-object p0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    goto :goto_1c

    :pswitch_38
    iget-object p0, p0, Lhi7;->e:Ligi;

    iget-object p0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    int-to-float p0, p0

    div-float/2addr p0, v1

    const/high16 v0, 0x40200000    # 2.5f

    mul-float/2addr p0, v0

    goto :goto_1f

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_38
        :pswitch_24
    .end packed-switch
.end method
