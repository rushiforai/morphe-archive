.class Lcom/hellogroup/mk/business/widget/MKTabLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$i;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/widget/MKTabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field private a:Z

.field final synthetic b:Lcom/hellogroup/mk/business/widget/MKTabLayout;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/widget/MKTabLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$a;->b:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$a;->a:Z

    .line 2
    .line 3
    return-void
.end method

.method public onAdapterChanged(Landroidx/viewpager/widget/ViewPager;Ll/cf60;Ll/cf60;)V
    .locals 1
    .param p1    # Landroidx/viewpager/widget/ViewPager;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/cf60;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/cf60;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$a;->b:Lcom/hellogroup/mk/business/widget/MKTabLayout;

    .line 2
    .line 3
    iget-object v0, p2, Lcom/hellogroup/mk/business/widget/MKTabLayout;->z:Landroidx/viewpager/widget/ViewPager;

    .line 4
    .line 5
    if-ne v0, p1, :cond_0

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$a;->a:Z

    .line 8
    .line 9
    invoke-virtual {p2, p3, p0}, Lcom/hellogroup/mk/business/widget/MKTabLayout;->C(Ll/cf60;Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
