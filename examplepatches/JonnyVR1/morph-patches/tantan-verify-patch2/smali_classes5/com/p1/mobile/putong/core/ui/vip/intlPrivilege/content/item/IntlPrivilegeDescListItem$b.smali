.class public Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tzo;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem$b$a;
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem$b$a;

.field public d:Lcom/p1/mobile/putong/core/data/Privilege;

.field public e:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public f:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 1

    const/4 v0, 0x0

    .line 16
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem$b;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem$b$a;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem$b$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem$b;->f:Z

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem$b;->a:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem$b;->d:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 10
    .line 11
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem$b;->c:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem$b$a;

    .line 12
    .line 13
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem$b;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public getItemType()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
