.class public Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/h390;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Lcom/p1/mobile/putong/core/data/Privilege;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;->c:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;->b:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;)Lcom/p1/mobile/putong/core/data/Privilege;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;->c:Lcom/p1/mobile/putong/core/data/Privilege;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;->a:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public getItemType()I
    .locals 0

    const/16 p0, 0xa

    return p0
.end method
