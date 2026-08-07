.class public Ll/w0r$j;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/w0r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "j"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/w0r$j$e;,
        Ll/w0r$j$c;,
        Ll/w0r$j$d;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/recyclerview/widget/RecyclerView$e0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/oze$a;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/oze$a;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public d:Landroid/widget/PopupWindow;

.field public e:I

.field public f:Landroidx/recyclerview/widget/RecyclerView;

.field public final synthetic g:Ll/w0r;


# direct methods
.method public constructor <init>(Ll/w0r;Ll/y20;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ll/oze$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/w0r$j;->g:Ll/w0r;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Ll/w0r$j;->e:I

    .line 8
    .line 9
    iput-object p3, p0, Ll/w0r$j;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p3, p0, Ll/w0r$j;->b:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/w0r$j;->F()V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Ll/w0r$j;->c:Ll/y20;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/w0r$j;->G()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic y(Ll/w0r$j;Ll/oze$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w0r$j;->C(Ll/oze$a;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/w0r$j;ILl/oze$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/w0r$j;->D(ILl/oze$a;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/w0r$j;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/w0r$j;->E(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/w0r$f;

    .line 7
    .line 8
    iget-object v1, p0, Ll/w0r$j;->g:Ll/w0r;

    .line 9
    .line 10
    iget p0, p0, Ll/w0r$j;->e:I

    .line 11
    .line 12
    invoke-direct {v0, v1, p0}, Ll/w0r$f;-><init>(Ll/w0r;I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic C(Ll/oze$a;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r$j;->c:Ll/y20;

    .line 2
    .line 3
    iget-object p1, p1, Ll/oze$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic D(ILl/oze$a;Landroid/view/View;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/w0r$j;->e:I

    .line 2
    .line 3
    if-ge p1, v0, :cond_0

    .line 4
    .line 5
    const-string p1, "rencent"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p1, "all"

    .line 9
    .line 10
    :goto_0
    const-string v0, "chat_emoji_type"

    .line 11
    .line 12
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    filled-new-array {p1}, [Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v0, "e_chat_emoji_click"

    .line 21
    .line 22
    const-string v1, "p_chat_view"

    .line 23
    .line 24
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/w0r$j;->g:Ll/w0r;

    .line 28
    .line 29
    iget-object p1, p1, Ll/w0r;->m:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->C2()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    invoke-static {}, Ll/tye;->c()Ll/tye;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object p2, p2, Ll/oze$a;->e:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Ll/tye;->l(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Ll/tye;->c()Ll/tye;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Ll/tye;->a()Ljava/util/ArrayList;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Ll/w0r$j;->b:Ljava/util/ArrayList;

    .line 57
    .line 58
    :cond_1
    iget-object p0, p0, Ll/w0r$j;->c:Ll/y20;

    .line 59
    .line 60
    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Ljava/lang/String;

    .line 65
    .line 66
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final E(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/w0r$j;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getItemDecorationCount()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    :goto_0
    if-lez p1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/w0r$j;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecorationAt(I)V

    .line 19
    .line 20
    .line 21
    add-int/lit8 p1, p1, -0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method public final F()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/w0r$j;->e:I

    .line 3
    .line 4
    iget-object v1, p0, Ll/w0r$j;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    sget-object v2, Ll/oze;->d:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-le v1, v2, :cond_1

    .line 17
    .line 18
    :goto_0
    iget-object v1, p0, Ll/w0r$j;->a:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-gt v0, v1, :cond_1

    .line 25
    .line 26
    iget-object v1, p0, Ll/w0r$j;->a:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Ll/oze$a;

    .line 33
    .line 34
    iget-object v1, v1, Ll/oze$a;->e:Ljava/lang/String;

    .line 35
    .line 36
    const-string v2, "all_text_tag_type"

    .line 37
    .line 38
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    iput v0, p0, Ll/w0r$j;->e:I

    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    return-void
.end method

.method public final G()V
    .locals 1

    .line 1
    const-string p0, "e_chat_emoji_click"

    .line 2
    .line 3
    const-string v0, "p_chat_view"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r$j;->a:Ljava/util/ArrayList;

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

.method public getItemViewType(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w0r$j;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/oze$a;

    .line 8
    .line 9
    iget-object v0, v0, Ll/oze$a;->e:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "recently_text_tag_type"

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :cond_0
    iget-object p0, p0, Ll/w0r$j;->a:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ll/oze$a;

    .line 28
    .line 29
    iget-object p0, p0, Ll/oze$a;->e:Ljava/lang/String;

    .line 30
    .line 31
    const-string p1, "all_text_tag_type"

    .line 32
    .line 33
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_1
    const/4 p0, 0x2

    .line 42
    return p0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 6

    .line 1
    instance-of v0, p1, Ll/w0r$j$d;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    check-cast p1, Ll/w0r$j$d;

    .line 6
    .line 7
    iget-object v0, p1, Ll/w0r$j$d;->a:Landroid/widget/ImageView;

    .line 8
    .line 9
    iget-object p1, p1, Ll/w0r$j$d;->b:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    iget-object v1, p0, Ll/w0r$j;->a:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/oze$a;

    .line 18
    .line 19
    iget v2, v1, Ll/oze$a;->d:I

    .line 20
    .line 21
    if-gtz v2, :cond_0

    .line 22
    .line 23
    new-instance p2, Ll/jye;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-object v3, v1, Ll/oze$a;->a:Ljava/lang/String;

    .line 30
    .line 31
    const/high16 v4, 0x41c00000    # 24.0f

    .line 32
    .line 33
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    invoke-direct {p2, v2, v3, v4, v5}, Ll/jye;-><init>(Landroid/content/Context;Ljava/lang/CharSequence;FI)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 41
    .line 42
    .line 43
    new-instance p2, Ll/i1r;

    .line 44
    .line 45
    invoke-direct {p2, p0, v1}, Ll/i1r;-><init>(Ll/w0r$j;Ll/oze$a;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 53
    .line 54
    .line 55
    iget-object v0, v1, Ll/oze$a;->a:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    const-string v2, "]"

    .line 62
    .line 63
    const-string v3, "["

    .line 64
    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 73
    .line 74
    iget v4, v1, Ll/oze$a;->b:I

    .line 75
    .line 76
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 91
    .line 92
    iget v3, v1, Ll/oze$a;->b:I

    .line 93
    .line 94
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    goto :goto_0

    .line 99
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iget-object v3, v1, Ll/oze$a;->a:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iget-object v2, v1, Ll/oze$a;->a:Ljava/lang/String;

    .line 117
    .line 118
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    new-instance v0, Ll/j1r;

    .line 122
    .line 123
    invoke-direct {v0, p0, p2, v1}, Ll/j1r;-><init>(Ll/w0r$j;ILl/oze$a;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 127
    .line 128
    .line 129
    new-instance p2, Ll/w0r$j$a;

    .line 130
    .line 131
    invoke-direct {p2, p0, p1, v1, v2}, Ll/w0r$j$a;-><init>(Ll/w0r$j;Landroid/widget/LinearLayout;Ll/oze$a;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 135
    .line 136
    .line 137
    new-instance p2, Ll/w0r$j$b;

    .line 138
    .line 139
    invoke-direct {p2, p0}, Ll/w0r$j$b;-><init>(Ll/w0r$j;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 143
    .line 144
    .line 145
    :cond_2
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    iget-object p2, p0, Ll/w0r$j;->g:Ll/w0r;

    .line 5
    .line 6
    iget-object p2, p2, Ll/w0r;->m:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    sget v1, Ll/qec0;->f3:I

    .line 13
    .line 14
    invoke-virtual {p2, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance p2, Ll/w0r$j$e;

    .line 19
    .line 20
    invoke-direct {p2, p0, p1}, Ll/w0r$j$e;-><init>(Ll/w0r$j;Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    return-object p2

    .line 24
    :cond_0
    iget-object v1, p0, Ll/w0r$j;->g:Ll/w0r;

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    if-ne p2, v2, :cond_1

    .line 28
    .line 29
    iget-object p2, v1, Ll/w0r;->m:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    sget v1, Ll/qec0;->d3:I

    .line 36
    .line 37
    invoke-virtual {p2, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance p2, Ll/w0r$j$c;

    .line 42
    .line 43
    invoke-direct {p2, p0, p1}, Ll/w0r$j$c;-><init>(Ll/w0r$j;Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    return-object p2

    .line 47
    :cond_1
    iget-object p2, v1, Ll/w0r;->m:Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    sget v1, Ll/qec0;->e3:I

    .line 54
    .line 55
    invoke-virtual {p2, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    const/4 v0, -0x1

    .line 64
    iput v0, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 65
    .line 66
    const/high16 v0, 0x42200000    # 40.0f

    .line 67
    .line 68
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    const/high16 v1, 0x42700000    # 60.0f

    .line 73
    .line 74
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    iput v0, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 79
    .line 80
    iput v1, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 81
    .line 82
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    .line 84
    .line 85
    new-instance p2, Ll/w0r$j$d;

    .line 86
    .line 87
    invoke-direct {p2, p0, p1}, Ll/w0r$j$d;-><init>(Ll/w0r$j;Landroid/view/View;)V

    .line 88
    .line 89
    .line 90
    return-object p2
.end method
