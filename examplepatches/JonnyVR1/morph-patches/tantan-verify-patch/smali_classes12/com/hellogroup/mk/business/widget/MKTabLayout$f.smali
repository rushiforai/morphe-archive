.class public final Lcom/hellogroup/mk/business/widget/MKTabLayout$f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/widget/MKTabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "f"
.end annotation


# instance fields
.field private a:Ljava/lang/Object;

.field private b:Ljava/lang/CharSequence;

.field private c:Ljava/lang/CharSequence;

.field private d:I

.field private e:Landroid/view/View;

.field private f:Lcom/hellogroup/mk/business/widget/MKTabLayout$g;

.field g:Lcom/hellogroup/mk/business/widget/MKTabLayout;

.field h:Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->d:I

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)Lcom/hellogroup/mk/business/widget/MKTabLayout$g;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->f:Lcom/hellogroup/mk/business/widget/MKTabLayout$g;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public b()Ljava/lang/CharSequence;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->c:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->e:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->g:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->getSelectedTabPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->d:I

    .line 10
    .line 11
    if-ne v0, p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_1
    const-string p0, "Tab not attached to a TabLayout"

    .line 18
    .line 19
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public f()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->g:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->h:Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->a:Ljava/lang/Object;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->b:Ljava/lang/CharSequence;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->c:Ljava/lang/CharSequence;

    .line 11
    .line 12
    const/4 v1, -0x1

    .line 13
    iput v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->d:I

    .line 14
    .line 15
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->e:Landroid/view/View;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->f:Lcom/hellogroup/mk/business/widget/MKTabLayout$g;

    .line 18
    .line 19
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->g:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->A(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "Tab not attached to a TabLayout"

    .line 10
    .line 11
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public h(Ljava/lang/CharSequence;)Lcom/hellogroup/mk/business/widget/MKTabLayout$f;
    .locals 0
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->c:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->l()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public i(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public j(Lcom/hellogroup/mk/business/widget/MKTabLayout$g;)Lcom/hellogroup/mk/business/widget/MKTabLayout$f;
    .locals 1
    .param p1    # Lcom/hellogroup/mk/business/widget/MKTabLayout$g;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-object p0

    .line 4
    :cond_0
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->f:Lcom/hellogroup/mk/business/widget/MKTabLayout$g;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->g:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$g;->a(Lcom/hellogroup/mk/business/widget/MKTabLayout;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->e:Landroid/view/View;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->l()V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public k(Ljava/lang/CharSequence;)Lcom/hellogroup/mk/business/widget/MKTabLayout$f;
    .locals 1
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->b:Ljava/lang/CharSequence;

    .line 2
    .line 3
    const-class p1, Lcom/hellogroup/mk/business/widget/MKTabLayout$e;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->f:Lcom/hellogroup/mk/business/widget/MKTabLayout$g;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->f:Lcom/hellogroup/mk/business/widget/MKTabLayout$g;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    check-cast v0, Lcom/hellogroup/mk/business/widget/MKTabLayout$e;

    .line 16
    .line 17
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->b:Ljava/lang/CharSequence;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$e;->f(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    if-nez v0, :cond_1

    .line 24
    .line 25
    new-instance p1, Lcom/hellogroup/mk/business/widget/MKTabLayout$e;

    .line 26
    .line 27
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->b:Ljava/lang/CharSequence;

    .line 28
    .line 29
    invoke-direct {p1, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$e;-><init>(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->j(Lcom/hellogroup/mk/business/widget/MKTabLayout$g;)Lcom/hellogroup/mk/business/widget/MKTabLayout$f;

    .line 33
    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string p1, "Can not setText with TabInfo="

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    const/4 p0, 0x0

    .line 54
    return-object p0
.end method

.method public l()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->h:Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$TabView;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
