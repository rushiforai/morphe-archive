.class public Ll/sjg$a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/sjg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ll/coj;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Landroid/widget/PopupWindow;

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/coj;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/sjg;


# direct methods
.method public constructor <init>(Landroid/widget/PopupWindow;Ll/sjg;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/sjg$a;->d:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/sjg$a;->c:Landroid/widget/PopupWindow;

    .line 12
    .line 13
    iput-object p2, p0, Ll/sjg$a;->e:Ll/sjg;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic E(Ll/sjg$a;Ll/coj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sjg$a;->H(Ll/coj;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/coj;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/sjg$a;->F(Landroid/view/View;Ll/coj;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sjg$a;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

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
    iget-object p0, p0, Ll/sjg$a;->c:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget p2, Ll/yec0;->Y0:I

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public F(Landroid/view/View;Ll/coj;II)V
    .locals 3

    .line 1
    iget-object p3, p0, Ll/sjg$a;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    add-int/lit8 p3, p3, -0x1

    .line 8
    .line 9
    const/high16 v0, 0x42fc0000    # 126.0f

    .line 10
    .line 11
    if-ne p4, p3, :cond_0

    .line 12
    .line 13
    new-instance p3, Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result p4

    .line 19
    const/high16 v0, 0x42380000    # 46.0f

    .line 20
    .line 21
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-direct {p3, p4, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    new-instance p3, Landroid/view/ViewGroup$LayoutParams;

    .line 33
    .line 34
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result p4

    .line 38
    const/high16 v0, 0x42200000    # 40.0f

    .line 39
    .line 40
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-direct {p3, p4, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 48
    .line 49
    .line 50
    :goto_0
    sget p3, Ll/mdc0;->x2:I

    .line 51
    .line 52
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    check-cast p3, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 57
    .line 58
    sget p4, Ll/mdc0;->e4:I

    .line 59
    .line 60
    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object p4

    .line 64
    check-cast p4, Landroid/widget/TextView;

    .line 65
    .line 66
    iget-object v0, p2, Ll/coj;->e:Ll/h64;

    .line 67
    .line 68
    iget-object v0, v0, Ll/h64;->b:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    invoke-static {p2}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 74
    .line 75
    .line 76
    move-result-object p4

    .line 77
    iget-object v0, p2, Ll/coj;->e:Ll/h64;

    .line 78
    .line 79
    iget-object v0, v0, Ll/h64;->a:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v1, p2, Ll/coj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 82
    .line 83
    iget-boolean v2, p2, Ll/coj;->a:Z

    .line 84
    .line 85
    invoke-virtual {p4, v0, v1, v2}, Ll/nsv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;

    .line 86
    .line 87
    .line 88
    move-result-object p4

    .line 89
    sget v0, Ll/qa00;->v:I

    .line 90
    .line 91
    iget-object p4, p4, Ll/nsv;->a:Ljava/lang/Object;

    .line 92
    .line 93
    check-cast p4, Ll/coj;

    .line 94
    .line 95
    iget-object p4, p4, Ll/coj;->e:Ll/h64;

    .line 96
    .line 97
    iget-object p4, p4, Ll/h64;->c:Ljava/lang/String;

    .line 98
    .line 99
    const/4 v1, 0x0

    .line 100
    invoke-static {p3, v0, p4, v1, v1}, Ll/biv;->g(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    new-instance p3, Ll/rjg;

    .line 104
    .line 105
    invoke-direct {p3, p0, p2}, Ll/rjg;-><init>(Ll/sjg$a;Ll/coj;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public G(I)Ll/coj;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sjg$a;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/coj;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic H(Ll/coj;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/sjg$a;->c:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/widget/PopupWindow;->dismiss()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/sjg$a;->e:Ll/sjg;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/sjg;->w4(Ll/coj;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public I(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/coj;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/sjg$a;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sjg$a;->d:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

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
    invoke-virtual {p0, p1}, Ll/sjg$a;->G(I)Ll/coj;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
