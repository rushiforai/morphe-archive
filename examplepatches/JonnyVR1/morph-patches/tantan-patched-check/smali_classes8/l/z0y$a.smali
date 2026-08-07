.class public Ll/z0y$a;
.super Landroidx/viewpager/widget/ViewPager$m;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/z0y;->A(IIZIZLcom/p1/mobile/putong/data/Gender;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/data/Gender;

.field public final synthetic d:Ll/z0y;


# direct methods
.method public constructor <init>(Ll/z0y;IZLcom/p1/mobile/putong/data/Gender;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z0y$a;->d:Ll/z0y;

    .line 2
    .line 3
    iput p2, p0, Ll/z0y$a;->a:I

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/z0y$a;->b:Z

    .line 6
    .line 7
    iput-object p4, p0, Ll/z0y$a;->c:Lcom/p1/mobile/putong/data/Gender;

    .line 8
    .line 9
    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager$m;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onPageSelected(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z0y$a;->d:Ll/z0y;

    .line 2
    .line 3
    iget-object v0, v0, Ll/z0y;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->q()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/z0y$a;->d:Ll/z0y;

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    iget p1, p0, Ll/z0y$a;->a:I

    .line 13
    .line 14
    if-lez p1, :cond_0

    .line 15
    .line 16
    invoke-static {v0}, Ll/z0y;->k(Ll/z0y;)Ll/uyh0;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-static {v0}, Ll/z0y;->l(Ll/z0y;)Ll/uyh0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    :goto_0
    invoke-static {v0, p1}, Ll/z0y;->m(Ll/z0y;Ll/uyh0;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/z0y$a;->d:Ll/z0y;

    .line 29
    .line 30
    invoke-static {p1}, Ll/z0y;->j(Ll/z0y;)Ll/y20;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object v0, p0, Ll/z0y$a;->d:Ll/z0y;

    .line 35
    .line 36
    invoke-static {v0}, Ll/z0y;->i(Ll/z0y;)Ll/uyh0;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/z0y$a;->d:Ll/z0y;

    .line 44
    .line 45
    iget-boolean v0, p0, Ll/z0y$a;->b:Z

    .line 46
    .line 47
    iget-object p0, p0, Ll/z0y$a;->c:Lcom/p1/mobile/putong/data/Gender;

    .line 48
    .line 49
    invoke-virtual {p1, v0, p0}, Ll/z0y;->q(ZLcom/p1/mobile/putong/data/Gender;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method
