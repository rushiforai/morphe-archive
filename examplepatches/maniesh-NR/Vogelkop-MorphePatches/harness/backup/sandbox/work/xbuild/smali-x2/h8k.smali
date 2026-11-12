.class public final synthetic Lh8k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lj8k;


# direct methods
.method public synthetic constructor <init>(Lj8k;B)V
    .registers 3

    iput-byte p2, p0, Lh8k;->a:B

    iput-object p1, p0, Lh8k;->b:Lj8k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 8

    iget-byte v0, p0, Lh8k;->a:B

    iget-object p0, p0, Lh8k;->b:Lj8k;

    packed-switch v0, :pswitch_data_30

    check-cast p1, Lv8k;

    iget-object p1, p0, Lj8k;->d:Lor2;

    iget-object v0, p1, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {p0, v0}, Lj8k;->b0(Landroid/view/View;)V

    iget-object p1, p1, Lor2;->e:Ljava/lang/Object;

    check-cast p1, Landroid/widget/FrameLayout;

    invoke-virtual {p0, p1}, Lj8k;->b0(Landroid/view/View;)V

    return-void

    :pswitch_1a
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object p0, p0, Lj8k;->d:Lor2;

    iget-object p0, p0, Lor2;->c:Landroid/view/View;

    move-object v0, p0

    check-cast v0, Landroid/widget/LinearLayout;

    const/4 v4, 0x0

    const/16 v5, 0xa

    const/4 v2, 0x0

    move v3, v1

    invoke-static/range {v0 .. v5}, Lp37;->o0(Landroid/view/View;IIIII)V

    return-void

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_1a
    .end packed-switch
.end method
