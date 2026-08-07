.class public Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeItemPicUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeItemPicUtils$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeItemPicUtils$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeItemPicUtils;->a:Ljava/util/HashMap;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeItemPicUtils$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeItemPicUtils$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeItemPicUtils;->b:Ljava/util/HashMap;

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeItemPicUtils$3;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeItemPicUtils$3;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeItemPicUtils;->c:Ljava/util/List;

    .line 21
    .line 22
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/data/Privilege;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "en"

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeItemPicUtils;->b:Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ll/pf60;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move-object v0, v1

    .line 28
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-nez v2, :cond_1

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeItemPicUtils;->a:Ljava/util/HashMap;

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ll/pf60;

    .line 41
    .line 42
    :cond_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_4

    .line 47
    .line 48
    sget-object v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeItemPicUtils;->c:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-eqz p0, :cond_2

    .line 55
    .line 56
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    xor-int/lit8 p0, p0, 0x1

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    invoke-static {}, Ll/c17;->u0()Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    :goto_1
    if-eqz p0, :cond_3

    .line 76
    .line 77
    iget-object p0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 78
    .line 79
    :goto_2
    check-cast p0, Ljava/lang/String;

    .line 80
    .line 81
    return-object p0

    .line 82
    :cond_3
    iget-object p0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_4
    return-object v1
.end method
