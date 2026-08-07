.class public Lv/VPageIndicator_Action$b;
.super Landroid/database/DataSetObserver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/VPageIndicator_Action;->setViewPager(Landroidx/viewpager/widget/ViewPager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lv/VPageIndicator_Action;


# direct methods
.method public constructor <init>(Lv/VPageIndicator_Action;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VPageIndicator_Action$b;->a:Lv/VPageIndicator_Action;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/VPageIndicator_Action$b;->a:Lv/VPageIndicator_Action;

    .line 2
    .line 3
    invoke-static {v0}, Lv/VPageIndicator_Action;->b(Lv/VPageIndicator_Action;)Ll/cf60;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/cf60;->getCount()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-static {v0, v1}, Lv/VPageIndicator_Action;->f(Lv/VPageIndicator_Action;I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lv/VPageIndicator_Action$b;->a:Lv/VPageIndicator_Action;

    .line 15
    .line 16
    invoke-static {p0}, Ll/kkl0;->a0(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
