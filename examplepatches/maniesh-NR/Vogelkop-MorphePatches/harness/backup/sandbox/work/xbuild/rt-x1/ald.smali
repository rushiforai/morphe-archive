.class public final synthetic Lald;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lk24;


# direct methods
.method public synthetic constructor <init>(Lk24;B)V
    .registers 3

    iput-byte p2, p0, Lald;->a:B

    iput-object p1, p0, Lald;->b:Lk24;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 3

    iget-byte v0, p0, Lald;->a:B

    iget-object p0, p0, Lald;->b:Lk24;

    packed-switch v0, :pswitch_data_26

    check-cast p0, Lrld;

    invoke-virtual {p0, p1}, Lrld;->o0(I)V

    return-void

    :pswitch_d
    check-cast p0, Lgld;

    iget-object p0, p0, Lgld;->s:Lu02;

    iget-object p0, p0, Lu02;->f:Ljava/lang/Object;

    check-cast p0, Lor2;

    iget-object p0, p0, Lor2;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageButton;

    if-nez p1, :cond_1f

    const p1, 0x7f080629

    goto :goto_22

    :cond_1f
    const p1, 0x7f080626

    :goto_22
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    return-void

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
