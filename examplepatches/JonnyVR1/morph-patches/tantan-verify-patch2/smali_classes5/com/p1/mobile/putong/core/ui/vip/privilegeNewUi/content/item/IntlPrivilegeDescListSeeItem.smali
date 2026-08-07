.class public Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem$a;
    }
.end annotation


# instance fields
.field public a:Lv/VIcon;

.field public b:Lv/VText;

.field public c:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem$a;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem$a;->g:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem$a;->e:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 6
    .line 7
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a$a;->a(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/yzo;->a(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem$a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem;->a:Lv/VIcon;

    .line 2
    .line 3
    iget v1, p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem$a;->a:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem;->b:Lv/VText;

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem$a;->b:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem;->b:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem$a;->c:Landroid/text/SpannableStringBuilder;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem;->c:Lv/VText;

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem$a;->c:Landroid/text/SpannableStringBuilder;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem$a;->d:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    :goto_0
    new-instance v0, Ll/wzo;

    .line 47
    .line 48
    invoke-direct {v0, p1}, Ll/wzo;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem$a;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
