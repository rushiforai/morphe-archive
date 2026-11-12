.class public final Lwq3;
.super Lvq3;
.source "SourceFile"


# instance fields
.field public final synthetic f:B


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;B)V
    .registers 3

    iput-byte p2, p0, Lwq3;->f:B

    invoke-direct {p0, p1}, Lvq3;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;IZB)V
    .registers 5

    .line 6
    iput-byte p4, p0, Lwq3;->f:B

    invoke-direct {p0, p1, p2, p3}, Lvq3;-><init>(Landroid/content/Context;IZ)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/ViewGroup;)V
    .registers 5

    iget-byte v0, p0, Lwq3;->f:B

    packed-switch v0, :pswitch_data_42

    invoke-super {p0, p1}, Lvq3;->a(Landroid/view/ViewGroup;)V

    return-void

    :pswitch_9
    invoke-static {p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->D(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    move-result-object v0

    const/high16 v1, 0x42400000    # 48.0f

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {v1, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    int-to-float p1, p1

    const v1, 0x40ba8f5c    # 5.83f

    mul-float/2addr p1, v1

    float-to-int p1, p1

    invoke-virtual {v0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->L(I)V

    const/4 p1, 0x0

    iput-boolean p1, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->K:Z

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->K(Z)V

    const/4 p1, 0x4

    invoke-virtual {v0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->M(I)V

    new-instance p1, Lrhj;

    const v1, 0x7f0a02d2

    iget-object v2, p0, Lvq3;->a:Lz46;

    invoke-virtual {v2, v1}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {p1, p0, v2, v1}, Lrhj;-><init>(Lwq3;Lz46;Landroid/view/View;)V

    iget-object p0, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a0:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :pswitch_data_42
    .packed-switch 0x2
        :pswitch_9
    .end packed-switch
.end method
