.class public Ll/y2;
.super Ll/h11;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/y2$a;
    }
.end annotation


# static fields
.field public static final c:I


# instance fields
.field public a:Lcom/p1/mobile/putong/core/view/CardLabelShowView2;

.field public b:Lv/VText;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/kec0;->Q6:I

    .line 2
    .line 3
    sput v0, Ll/y2;->c:I

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/h11;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->G6:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;

    .line 11
    .line 12
    iput-object v0, p0, Ll/y2;->a:Lcom/p1/mobile/putong/core/view/CardLabelShowView2;

    .line 13
    .line 14
    sget v0, Ll/adc0;->je:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lv/VText;

    .line 21
    .line 22
    iput-object p1, p0, Ll/y2;->b:Lv/VText;

    .line 23
    .line 24
    const/4 p0, 0x3

    .line 25
    invoke-static {p0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/4 v0, 0x1

    .line 30
    invoke-virtual {p1, p0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Ll/n3x;->a(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    iget-object p2, p0, Ll/y2;->a:Lcom/p1/mobile/putong/core/view/CardLabelShowView2;

    .line 12
    .line 13
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/view/CardLabelShowView2;->setLabel(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
