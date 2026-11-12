.class public final Lalb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Interpolator;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lalb;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getInterpolation(F)F
    .registers 3

    iget-byte p0, p0, Lalb;->a:B

    packed-switch p0, :pswitch_data_2a

    goto :goto_19

    :pswitch_6
    const p0, 0x3e0f5c29    # 0.14f

    cmpg-float v0, p1, p0

    if-gez v0, :cond_f

    div-float/2addr p1, p0

    goto :goto_18

    :cond_f
    const v0, 0x3f91eb85    # 1.14f

    mul-float/2addr p1, v0

    sub-float/2addr p1, p0

    const/high16 p0, 0x3f800000    # 1.0f

    sub-float p1, p0, p1

    :goto_18
    return p1

    :goto_19
    :pswitch_19
    const/high16 p0, 0x3f800000    # 1.0f

    sub-float/2addr p1, p0

    mul-float v0, p1, p1

    mul-float/2addr v0, p1

    mul-float/2addr v0, p1

    mul-float/2addr v0, p1

    add-float/2addr v0, p0

    return v0

    :pswitch_23
    mul-float p0, p1, p1

    mul-float/2addr p0, p1

    mul-float/2addr p0, p1

    mul-float/2addr p0, p1

    return p0

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_23
        :pswitch_23
        :pswitch_19
        :pswitch_19
        :pswitch_6
        :pswitch_19
        :pswitch_19
    .end packed-switch
.end method
