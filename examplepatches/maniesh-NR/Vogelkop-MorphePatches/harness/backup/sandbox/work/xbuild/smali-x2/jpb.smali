.class public final Ljpb;
.super Llpb;
.source "SourceFile"


# instance fields
.field public final synthetic e:B


# direct methods
.method public synthetic constructor <init>(Lqq6;ZLjava/lang/String;Ljava/lang/String;B)V
    .registers 6

    iput-byte p5, p0, Ljpb;->e:B

    invoke-direct {p0, p1, p2, p3, p4}, Llpb;-><init>(Lqq6;ZLjava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final e(Laz0;Landroid/widget/LinearLayout;)V
    .registers 4

    iget-byte v0, p0, Ljpb;->e:B

    packed-switch v0, :pswitch_data_14

    invoke-super {p0, p1, p2}, Llpb;->e(Laz0;Landroid/widget/LinearLayout;)V

    return-void

    :pswitch_9
    invoke-super {p0, p1, p2}, Llpb;->e(Laz0;Landroid/widget/LinearLayout;)V

    iget-object p0, p1, Laz0;->a:Lwy0;

    const/4 p1, 0x0

    iput-object p1, p0, Lwy0;->i:Ljava/lang/CharSequence;

    iput-object p1, p0, Lwy0;->j:Landroid/content/DialogInterface$OnClickListener;

    return-void

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method
