.class public Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tzo;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/CharSequence;

.field public c:Lcom/p1/mobile/putong/core/data/PurchaseType;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/CharSequence;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem$a;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem$a;->b:Ljava/lang/CharSequence;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem$a;->c:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getItemType()I
    .locals 0

    const/4 p0, 0x5

    return p0
.end method
