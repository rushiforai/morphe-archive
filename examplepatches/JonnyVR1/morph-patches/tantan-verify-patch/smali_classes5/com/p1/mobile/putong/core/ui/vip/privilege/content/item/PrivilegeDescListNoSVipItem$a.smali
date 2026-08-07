.class public Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/h390;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a$a;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a$a;

.field public b:Z

.field public c:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/h390;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;Ljava/lang/String;ZLjava/util/List;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/List<",
            "Ll/h390;",
            ">;",
            "Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a$a;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;->c:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;

    .line 5
    .line 6
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;->b:Z

    .line 7
    .line 8
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;->d:Ljava/util/List;

    .line 9
    .line 10
    iput-object p5, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a$a;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;->e:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;->d:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a$a;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;->b:Z

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;->c:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;->e:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public getItemType()I
    .locals 0

    const/4 p0, 0x2

    return p0
.end method
