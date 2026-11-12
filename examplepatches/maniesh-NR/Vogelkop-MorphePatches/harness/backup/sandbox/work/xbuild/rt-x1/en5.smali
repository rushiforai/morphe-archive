.class public final Len5;
.super Lbn5;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final c:La5n;


# direct methods
.method public constructor <init>(Ljt;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Len5;->b:B

    iget-object v0, p1, Ljt;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Len5;->c:La5n;

    return-void
.end method

.method public constructor <init>(Lmn5;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Len5;->b:B

    .line 11
    iget-object v0, p1, Lmn5;->b:Lcom/opera/android/custom_views/StylingTextView;

    .line 12
    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    .line 13
    iput-object p1, p0, Len5;->c:La5n;

    return-void
.end method

.method private final X()V
    .registers 1

    return-void
.end method

.method private final Y()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final U(Lgn5;I)V
    .registers 4

    iget-byte p2, p0, Len5;->b:B

    iget-object p0, p0, Len5;->c:La5n;

    packed-switch p2, :pswitch_data_2c

    check-cast p1, Lfn5;

    check-cast p0, Lmn5;

    iget-object p0, p0, Lmn5;->b:Lcom/opera/android/custom_views/StylingTextView;

    iget p1, p1, Lfn5;->a:I

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void

    :pswitch_13
    check-cast p1, Ldn5;

    check-cast p0, Ljt;

    iget-object p0, p0, Ljt;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    iget p2, p1, Ldn5;->b:I

    new-instance v0, Lrxh;

    invoke-direct {v0, p2}, Lrxh;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget p1, p1, Ldn5;->c:I

    invoke-static {p1, p0}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    return-void

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method

.method public final V()V
    .registers 1

    iget-byte p0, p0, Len5;->b:B

    return-void
.end method
