.class public Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListImageItem;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListImageItem$a;
    }
.end annotation


# instance fields
.field public a:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/kzo;->a(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListImageItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListImageItem$a;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListImageItem$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListImageItem;->a:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListImageItem$a;->a(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListImageItem$a;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListImageItem;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
