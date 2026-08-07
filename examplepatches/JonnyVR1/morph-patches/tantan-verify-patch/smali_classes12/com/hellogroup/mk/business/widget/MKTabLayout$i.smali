.class public Lcom/hellogroup/mk/business/widget/MKTabLayout$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/hellogroup/mk/business/widget/MKTabLayout$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/widget/MKTabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "i"
.end annotation


# instance fields
.field private final a:Landroidx/viewpager/widget/ViewPager;


# direct methods
.method public constructor <init>(Landroidx/viewpager/widget/ViewPager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$i;->a:Landroidx/viewpager/widget/ViewPager;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Lcom/hellogroup/mk/business/widget/MKTabLayout$f;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$i;->a:Landroidx/viewpager/widget/ViewPager;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$f;->d()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
