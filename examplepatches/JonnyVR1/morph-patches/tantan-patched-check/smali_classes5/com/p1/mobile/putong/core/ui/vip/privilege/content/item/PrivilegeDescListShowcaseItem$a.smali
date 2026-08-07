.class public Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/h390;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public final b:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public final c:Ll/lib0;

.field public final d:Ll/ndb0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Merchandise;Ll/lib0;Ll/ndb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->b:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->c:Ll/lib0;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->d:Ll/ndb0;

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;)Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->b:Lcom/p1/mobile/putong/core/data/Merchandise;

    return-object p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;)Ll/lib0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->c:Ll/lib0;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;)Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    return-object p0
.end method


# virtual methods
.method public getItemType()I
    .locals 0

    const/16 p0, 0xc

    return p0
.end method
