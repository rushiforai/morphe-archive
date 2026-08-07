.class public Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag$a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/Question;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag;

.field public d:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Question;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag$a;->d:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag$a;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag$a;Lcom/p1/mobile/putong/core/data/Question;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag$a;->H(Lcom/p1/mobile/putong/core/data/Question;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/Question;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag$a;->F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Question;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag$a;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p2, Ll/kec0;->E2:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Question;II)V
    .locals 2

    .line 1
    sget p3, Ll/adc0;->je:I

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    check-cast p3, Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 8
    .line 9
    sget p4, Ll/adc0;->L:I

    .line 10
    .line 11
    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p4

    .line 15
    check-cast p4, Landroid/widget/ImageView;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag$a;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Ll/dbc0;->Ah:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p4, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    invoke-static {p4, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    new-instance p3, Ll/dif;

    .line 42
    .line 43
    invoke-direct {p3, p0, p2}, Ll/dif;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag$a;Lcom/p1/mobile/putong/core/data/Question;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/core/data/Question;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag$a;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/Question;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic H(Lcom/p1/mobile/putong/core/data/Question;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag$a;->c:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag;->e5(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag;Lcom/p1/mobile/putong/core/data/Question;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public I(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Question;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag$a;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag$a;->d:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag$a;->G(I)Lcom/p1/mobile/putong/core/data/Question;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
