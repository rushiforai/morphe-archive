.class public Lcom/tencent/could/huiyansdk/manager/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/could/huiyansdk/manager/a$a;
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Landroidx/fragment/app/FragmentManager;

.field public c:Landroidx/fragment/app/k;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/manager/a;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Lcom/tencent/could/huiyansdk/fragments/BaseFragment;
    .locals 2

    .line 36
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/manager/a;->b:Landroidx/fragment/app/FragmentManager;

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 37
    :cond_0
    sget v1, Lcom/tencent/could/huiyansdk/R$id;->txy_main_fragment:I

    invoke-virtual {p0, v1}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    move-result-object p0

    .line 38
    instance-of v1, p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;

    if-eqz v1, :cond_1

    .line 39
    check-cast p0, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;

    return-object p0

    :cond_1
    return-object v0
.end method

.method public a(Landroidx/fragment/app/Fragment;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/a;->b:Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/manager/a;->c:Landroidx/fragment/app/k;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/a;->b:Landroidx/fragment/app/FragmentManager;

    .line 15
    .line 16
    sget v1, Lcom/tencent/could/huiyansdk/R$id;->txy_main_fragment:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/manager/a;->c:Landroidx/fragment/app/k;

    .line 22
    .line 23
    invoke-virtual {p0, v1, p1}, Landroidx/fragment/app/k;->s(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-virtual {p0, p1}, Landroidx/fragment/app/k;->g(Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Landroidx/fragment/app/k;->i()I

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method
