.class public final synthetic La23;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lb23;

.field public final synthetic c:Lbz0;


# direct methods
.method public synthetic constructor <init>(Lb23;Lbz0;B)V
    .registers 4

    iput-byte p3, p0, La23;->a:B

    iput-object p1, p0, La23;->b:Lb23;

    iput-object p2, p0, La23;->c:Lbz0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 6

    iget-byte p1, p0, La23;->a:B

    const v0, 0x7f0a00d9

    iget-object v1, p0, La23;->c:Lbz0;

    iget-object p0, p0, La23;->b:Lb23;

    packed-switch p1, :pswitch_data_7a

    invoke-virtual {v1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lb23;->b(Landroid/content/Context;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    invoke-virtual {p0}, Lb23;->e()I

    move-result p0

    const v2, 0x7f0a00da

    invoke-virtual {v1, v2}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v3, 0x7f0a080a

    invoke-virtual {v1, v3}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    if-eqz v2, :cond_4c

    if-eqz v0, :cond_4c

    if-eqz v3, :cond_4c

    invoke-virtual {v1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    invoke-virtual {v0, p0, p0, p0, p0}, Landroid/view/View;->setPaddingRelative(IIII)V

    invoke-virtual {v2, p1}, Landroid/view/View;->setBackgroundResource(I)V

    :cond_4c
    return-void

    :pswitch_4d
    invoke-virtual {v1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lb23;->d(Landroid/content/Context;)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    const p1, 0x7f0a00d8

    invoke-virtual {v1, p1}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    if-eqz p1, :cond_78

    if-eqz v0, :cond_78

    if-eqz p0, :cond_70

    const/4 v1, 0x0

    goto :goto_72

    :cond_70
    const/16 v1, 0x8

    :goto_72
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_78
    return-void

    nop

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_4d
    .end packed-switch
.end method
