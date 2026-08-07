.class public Ll/r600$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/r600;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/r600;


# direct methods
.method public constructor <init>(Ll/r600;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r600$a;->a:Ll/r600;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/r600$a;->a:Ll/r600;

    .line 2
    .line 3
    iget-object v0, v0, Ll/r600;->e:Lv/VPager;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/r600$a;->a:Ll/r600;

    .line 12
    .line 13
    iget-object v0, v0, Ll/r600;->g:Ll/r600$c;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Ll/r600$a;->a:Ll/r600;

    .line 22
    .line 23
    iget-object v0, v0, Ll/r600;->g:Ll/r600$c;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/r600$c;->getCount()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-lez v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Ll/r600$a;->a:Ll/r600;

    .line 32
    .line 33
    iget-object v0, v0, Ll/r600;->e:Lv/VPager;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    iget-object v2, p0, Ll/r600$a;->a:Ll/r600;

    .line 40
    .line 41
    iget-object v2, v2, Ll/r600;->g:Ll/r600$c;

    .line 42
    .line 43
    invoke-virtual {v2}, Ll/r600$c;->getCount()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    add-int/lit8 v2, v2, -0x1

    .line 48
    .line 49
    if-lt v1, v2, :cond_0

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    iget-object v1, p0, Ll/r600$a;->a:Ll/r600;

    .line 54
    .line 55
    iget-object v1, v1, Ll/r600;->e:Lv/VPager;

    .line 56
    .line 57
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    add-int/lit8 v1, v1, 0x1

    .line 62
    .line 63
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/r600$a;->a:Ll/r600;

    .line 67
    .line 68
    invoke-static {p0}, Ll/r600;->n(Ll/r600;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    return-void
.end method
