.class public Ll/mu;
.super Ll/lb2;
.source "SourceFile"


# instance fields
.field public e:Z

.field public f:I

.field public g:Ll/uyh0;

.field public h:Ll/uyh0;

.field public i:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(ZILl/uyh0;Ll/uyh0;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/mu;->e:Z

    .line 5
    .line 6
    iput p2, p0, Ll/mu;->f:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/mu;->g:Ll/uyh0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/mu;->h:Ll/uyh0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/mu;->i:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/mu;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Ll/mu;->f:I

    .line 6
    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x2

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x1

    .line 12
    return p0
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mu;->i:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    iget p0, p0, Ll/mu;->f:I

    .line 6
    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    sget p0, Lcom/p1/mobile/putong/account/R$string;->w2:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget p0, Lcom/p1/mobile/putong/account/R$string;->x2:I

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    sget p0, Lcom/p1/mobile/putong/account/R$string;->x2:I

    .line 16
    .line 17
    :goto_0
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    if-ne p1, p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget p2, p0, Ll/mu;->f:I

    .line 4
    .line 5
    if-lez p2, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/mu;->g:Ll/uyh0;

    .line 8
    .line 9
    :goto_0
    iget-object p0, p0, Ll/uyh0;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object p0, p0, Ll/mu;->h:Ll/uyh0;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :goto_1
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method
