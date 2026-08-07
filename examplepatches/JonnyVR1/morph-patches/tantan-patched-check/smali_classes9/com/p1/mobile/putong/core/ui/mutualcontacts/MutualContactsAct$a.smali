.class public Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct$a;
.super Ll/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a<",
        "Lcom/p1/mobile/putong/data/Contact;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Contact;",
            ">;"
        }
    .end annotation
.end field

.field public d:Z

.field public final synthetic e:Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct$a;->e:Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/a;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct$a;->c:Ljava/util/List;

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct$a;->d:Z

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public e(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/a;->getCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sub-int/2addr v0, p1

    .line 6
    const/4 p1, 0x5

    .line 7
    if-ge v0, p1, :cond_0

    .line 8
    .line 9
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct$a;->d:Z

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct$a;->e:Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->b2(Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Ll/dkb;->s9(Ljava/lang/String;)Lrx/c;

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/data/Contact;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct$a;->s(Landroid/view/View;Lcom/p1/mobile/putong/data/Contact;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct$a;->e:Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/kec0;->je:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public p()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Contact;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct$a;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Landroid/view/View;Lcom/p1/mobile/putong/data/Contact;II)V
    .locals 0

    .line 1
    sget p0, Ll/adc0;->N5:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lv/VDraweeView;

    .line 8
    .line 9
    sget p3, Ll/adc0;->je:I

    .line 10
    .line 11
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    check-cast p3, Landroid/widget/TextView;

    .line 16
    .line 17
    sget p4, Ll/adc0;->p6:I

    .line 18
    .line 19
    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Landroid/widget/TextView;

    .line 24
    .line 25
    invoke-static {p2, p0, p1}, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct;->k2(Lcom/p1/mobile/putong/data/Contact;Lv/VDraweeView;Landroid/widget/TextView;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p2, Lcom/p1/mobile/putong/data/Contact;->name:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->lookups:Ljava/util/List;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct$a;->c:Ljava/util/List;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->next:Ljava/lang/String;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    :goto_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/mutualcontacts/MutualContactsAct$a;->d:Z

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 15
    .line 16
    .line 17
    return-void
.end method
