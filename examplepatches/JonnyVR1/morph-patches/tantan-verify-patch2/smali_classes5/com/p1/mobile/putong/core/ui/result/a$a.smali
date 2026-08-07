.class public Lcom/p1/mobile/putong/core/ui/result/a$a;
.super Landroidx/viewpager/widget/ViewPager$m;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/result/a;->o()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/result/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/result/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/a$a;->a:Lcom/p1/mobile/putong/core/ui/result/a;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager$m;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageSelected(I)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroidx/viewpager/widget/ViewPager$m;->onPageSelected(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/a$a;->a:Lcom/p1/mobile/putong/core/ui/result/a;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/result/a;->g(Lcom/p1/mobile/putong/core/ui/result/a;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-ge p1, v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/a$a;->a:Lcom/p1/mobile/putong/core/ui/result/a;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/result/a;->h(Lcom/p1/mobile/putong/core/ui/result/a;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/result/a$a;->a:Lcom/p1/mobile/putong/core/ui/result/a;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/result/a;->g(Lcom/p1/mobile/putong/core/ui/result/a;)Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lcom/p1/mobile/putong/core/data/Privilege;

    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/gul0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/a$a;->a:Lcom/p1/mobile/putong/core/ui/result/a;

    .line 38
    .line 39
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/result/a;->g(Lcom/p1/mobile/putong/core/ui/result/a;)Ljava/util/ArrayList;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Lcom/p1/mobile/putong/core/data/Privilege;

    .line 48
    .line 49
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/a;->j(Lcom/p1/mobile/putong/core/ui/result/a;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method
