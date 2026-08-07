.class public Ll/a80;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/data/Contract;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Contract;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Lcom/p1/mobile/putong/app/PutongAct;

.field public e:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Landroid/view/View;",
            "Lcom/p1/mobile/putong/data/Contract;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/app/PutongAct;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/a80;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/a80;->c:Ljava/util/ArrayList;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic E(Ll/a80;Lcom/p1/mobile/putong/data/Contract;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/a80;->H(Lcom/p1/mobile/putong/data/Contract;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/data/Contract;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/a80;->F(Landroid/view/View;Lcom/p1/mobile/putong/data/Contract;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a80;->c:Ljava/util/ArrayList;

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
    iget-object p0, p0, Ll/a80;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/kec0;->ef:I

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

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/data/Contract;II)V
    .locals 6

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/SubsItemView;

    .line 2
    .line 3
    iget-object p3, p2, Lcom/p1/mobile/putong/data/Contract;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    new-instance p3, Ll/bkj0;

    .line 12
    .line 13
    iget-object p4, p0, Ll/a80;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Do:I

    .line 16
    .line 17
    invoke-virtual {p4, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    iget-object v0, p0, Ll/a80;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 22
    .line 23
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Eo:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Ll/a80;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 30
    .line 31
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Fo:I

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-direct {p3, p4, v0, v1}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    new-instance p3, Ll/bkj0;

    .line 42
    .line 43
    iget-object p4, p2, Lcom/p1/mobile/putong/data/Contract;->itemName:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v0, p0, Ll/a80;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 46
    .line 47
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Go:I

    .line 48
    .line 49
    sget-object v2, Ll/pzi0;->d:Ljava/text/SimpleDateFormat;

    .line 50
    .line 51
    new-instance v3, Ljava/util/Date;

    .line 52
    .line 53
    iget-wide v4, p2, Lcom/p1/mobile/putong/data/Contract;->signTime:D

    .line 54
    .line 55
    double-to-long v4, v4

    .line 56
    invoke-direct {v3, v4, v5}, Ljava/util/Date;-><init>(J)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2, v3}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object v1, p0, Ll/a80;->d:Lcom/p1/mobile/putong/app/PutongAct;

    .line 72
    .line 73
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Co:I

    .line 74
    .line 75
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-direct {p3, p4, v0, v1}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    :goto_0
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/ui/settings/SubsItemView;->c(Ll/bkj0;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/settings/SubsItemView;->c:Lv/VText;

    .line 86
    .line 87
    new-instance p3, Ll/z70;

    .line 88
    .line 89
    invoke-direct {p3, p0, p2}, Ll/z70;-><init>(Ll/a80;Lcom/p1/mobile/putong/data/Contract;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/data/Contract;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/a80;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    if-gt p1, v0, :cond_1

    .line 10
    .line 11
    if-gez p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/a80;->c:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/data/Contract;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public final synthetic H(Lcom/p1/mobile/putong/data/Contract;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a80;->e:Ll/z20;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/a80;->e:Ll/z20;

    .line 10
    .line 11
    invoke-interface {p0, p2, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public I(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Contract;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/a80;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/a80;->c:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public J(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Landroid/view/View;",
            "Lcom/p1/mobile/putong/data/Contract;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/a80;->e:Ll/z20;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/a80;->G(I)Lcom/p1/mobile/putong/data/Contract;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
