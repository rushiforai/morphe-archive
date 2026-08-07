.class public final synthetic Ll/qzo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;

.field public final synthetic b:I

.field public final synthetic c:Lv/VText;

.field public final synthetic d:I

.field public final synthetic e:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;ILv/VText;ILjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qzo;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;

    iput p2, p0, Ll/qzo;->b:I

    iput-object p3, p0, Ll/qzo;->c:Lv/VText;

    iput p4, p0, Ll/qzo;->d:I

    iput-object p5, p0, Ll/qzo;->e:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/qzo;->a:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;

    iget v1, p0, Ll/qzo;->b:I

    iget-object v2, p0, Ll/qzo;->c:Lv/VText;

    iget v3, p0, Ll/qzo;->d:I

    iget-object p0, p0, Ll/qzo;->e:Ljava/lang/Runnable;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;->a(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeDescListItem;ILv/VText;ILjava/lang/Runnable;)V

    return-void
.end method
