.class public Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/szo;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field public b:Ljava/lang/String;

.field public c:Landroid/text/SpannableStringBuilder;

.field public d:Ljava/lang/String;

.field public e:Lcom/p1/mobile/putong/core/data/Privilege;

.field public f:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public g:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a$a;


# direct methods
.method public constructor <init>(ILjava/lang/String;Landroid/text/SpannableStringBuilder;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem$a;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem$a;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem$a;->c:Landroid/text/SpannableStringBuilder;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem$a;->e:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListSeeItem$a;->f:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getItemType()I
    .locals 0

    const/4 p0, 0x3

    return p0
.end method
