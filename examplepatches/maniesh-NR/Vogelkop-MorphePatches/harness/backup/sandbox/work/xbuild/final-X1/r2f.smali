.class public final Lr2f;
.super Lo93;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public d:Z

.field public final e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lr2f;->c:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lr2f;->e:Ljava/lang/Object;

    iput-boolean p2, p0, Lr2f;->d:Z

    return-void
.end method

.method public constructor <init>(Lr6l;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lr2f;->c:B

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lr2f;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)Lgtj;
    .registers 6

    iget-byte v0, p0, Lr2f;->c:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_3e

    iget-object v0, p0, Lr2f;->e:Ljava/lang/Object;

    check-cast v0, Lr6l;

    invoke-interface {v0}, Lr6l;->h()Lpxh;

    move-result-object v0

    const/16 v2, 0x1388

    const/4 v3, 0x0

    invoke-static {p1, v0, v2, v3}, Lgtj;->d(Landroid/view/View;Lpxh;ILandroid/view/View;)Lgtj;

    move-result-object p1

    new-instance v0, Lpkm;

    invoke-direct {v0, p0, v1}, Lpkm;-><init>(Ljava/lang/Object;B)V

    const p0, 0x7f1412ee

    invoke-virtual {p1, p0, v0}, Lgtj;->f(ILandroid/view/View$OnClickListener;)V

    return-object p1

    :pswitch_21
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f140b69

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v1}, Lgtj;->e(Landroid/view/View;Ljava/lang/CharSequence;I)Lgtj;

    move-result-object p1

    new-instance v0, Lzvd;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Lzvd;-><init>(Ljava/lang/Object;B)V

    const p0, 0x7f14041c

    invoke-virtual {p1, p0, v0}, Lgtj;->f(ILandroid/view/View$OnClickListener;)V

    return-object p1

    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_21
    .end packed-switch
.end method
