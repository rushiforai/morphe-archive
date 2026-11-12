.class public final synthetic Lmll;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lykj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpll;


# direct methods
.method public synthetic constructor <init>(Lpll;B)V
    .registers 3

    iput-byte p2, p0, Lmll;->a:B

    iput-object p1, p0, Lmll;->b:Lpll;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final k(Lg3d;)Ljava/lang/Object;
    .registers 2

    iget-byte p1, p0, Lmll;->a:B

    iget-object p0, p0, Lmll;->b:Lpll;

    packed-switch p1, :pswitch_data_26

    sget p1, Lcom/opera/android/widget/ThemeableLottieAnimationView;->x:I

    iget p0, p0, Lpll;->b:I

    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result p0

    int-to-float p0, p0

    const/high16 p1, 0x437f0000    # 255.0f

    div-float/2addr p0, p1

    const/high16 p1, 0x42c80000    # 100.0f

    mul-float/2addr p0, p1

    float-to-int p0, p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_1c
    sget p1, Lcom/opera/android/widget/ThemeableLottieAnimationView;->x:I

    iget p0, p0, Lpll;->b:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_1c
    .end packed-switch
.end method
