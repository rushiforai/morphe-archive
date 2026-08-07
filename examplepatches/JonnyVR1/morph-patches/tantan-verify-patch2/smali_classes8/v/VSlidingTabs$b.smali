.class public Lv/VSlidingTabs$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/VSlidingTabs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic a:Lv/VSlidingTabs;


# direct methods
.method public constructor <init>(Lv/VSlidingTabs;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VSlidingTabs$b;->a:Lv/VSlidingTabs;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lv/VSlidingTabs;Ll/qzk0;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lv/VSlidingTabs$b;-><init>(Lv/VSlidingTabs;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lv/VSlidingTabs$b;->a:Lv/VSlidingTabs;

    .line 3
    .line 4
    invoke-static {v1}, Lv/VSlidingTabs;->b(Lv/VSlidingTabs;)Lv/VSlidingTabStrip;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-ge v0, v1, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Lv/VSlidingTabs$b;->a:Lv/VSlidingTabs;

    .line 15
    .line 16
    invoke-static {v1}, Lv/VSlidingTabs;->b(Lv/VSlidingTabs;)Lv/VSlidingTabStrip;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    if-ne p1, v1, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Lv/VSlidingTabs$b;->a:Lv/VSlidingTabs;

    .line 27
    .line 28
    invoke-static {p0}, Lv/VSlidingTabs;->d(Lv/VSlidingTabs;)Landroidx/viewpager/widget/ViewPager;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    return-void
.end method
