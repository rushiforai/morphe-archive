.class public final Lq8b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltn;


# direct methods
.method public constructor <init>(Ltn;B)V
    .registers 3

    iput-byte p2, p0, Lq8b;->a:B

    packed-switch p2, :pswitch_data_14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lq8b;->b:Ltn;

    return-void

    :pswitch_e
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lq8b;->b:Ltn;

    return-void

    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_e
    .end packed-switch
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 3

    iget-byte p1, p0, Lq8b;->a:B

    iget-object p0, p0, Lq8b;->b:Ltn;

    packed-switch p1, :pswitch_data_18

    const/4 p1, 0x1

    iput-boolean p1, p0, Ltn;->a:Z

    iget-object p0, p0, Ltn;->d:Ljava/lang/Object;

    check-cast p0, Lga6;

    const-wide/high16 p1, 0x7ff8000000000000L    # Double.NaN

    invoke-virtual {p0, p1, p2}, Lga6;->q(D)V

    return-void

    :pswitch_14
    invoke-virtual {p0}, Ltn;->v()V

    return-void

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method
