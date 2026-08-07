.class public Ll/t190$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/t190;->c(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:I

.field public b:Z

.field public final synthetic c:Ll/t190;


# direct methods
.method public constructor <init>(Ll/t190;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t190$a;->c:Ll/t190;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 2

    .line 1
    iget v0, p0, Ll/t190$a;->a:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    iput-boolean v1, p0, Ll/t190$a;->b:Z

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    if-nez p1, :cond_1

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Ll/t190$a;->b:Z

    .line 16
    .line 17
    :cond_1
    :goto_0
    iput p1, p0, Ll/t190$a;->a:I

    .line 18
    .line 19
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/t190$a;->b:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/t190$a;->c:Ll/t190;

    .line 6
    .line 7
    invoke-static {p1}, Ll/t190;->g(Ll/t190;)Ll/kcg0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Ll/t190$a;->c:Ll/t190;

    .line 18
    .line 19
    invoke-static {p1}, Ll/t190;->g(Ll/t190;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p1}, Ll/kcg0;->unsubscribe()V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/t190$a;->c:Ll/t190;

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-static {p0, p1}, Ll/t190;->h(Ll/t190;Ll/kcg0;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method
