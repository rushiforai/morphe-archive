.class public final Ll92;
.super Landroid/graphics/drawable/LayerDrawable;
.source "SourceFile"


# static fields
.field public static final synthetic b:I


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>([Landroid/graphics/drawable/Drawable;B)V
    .registers 3

    iput-byte p2, p0, Ll92;->a:B

    invoke-direct {p0, p1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public final onLevelChange(I)Z
    .registers 3

    iget-byte v0, p0, Ll92;->a:B

    packed-switch v0, :pswitch_data_c

    invoke-super {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->onLevelChange(I)Z

    move-result p0

    return p0

    :pswitch_a
    const/4 p0, 0x0

    return p0

    :pswitch_data_c
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method
