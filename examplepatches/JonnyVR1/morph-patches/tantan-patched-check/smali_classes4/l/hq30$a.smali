.class public Ll/hq30$a;
.super Landroidx/viewpager/widget/ViewPager$m;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hq30;->l()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/hq30;


# direct methods
.method public constructor <init>(Ll/hq30;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hq30$a;->a:Ll/hq30;

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
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/viewpager/widget/ViewPager$m;->onPageSelected(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/hq30$a;->a:Ll/hq30;

    .line 5
    .line 6
    iget-object v0, v0, Ll/hq30;->c:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->b(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/hq30$a;->a:Ll/hq30;

    .line 12
    .line 13
    invoke-static {v0}, Ll/hq30;->j(Ll/hq30;)Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/hq30$a;->a:Ll/hq30;

    .line 20
    .line 21
    invoke-static {p0}, Ll/hq30;->j(Ll/hq30;)Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iput p1, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;->picIndex:I

    .line 26
    .line 27
    :cond_0
    return-void
.end method
