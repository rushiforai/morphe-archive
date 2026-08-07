.class public final synthetic Ll/g390;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem;

.field public final synthetic b:Lcom/p1/mobile/putong/app/PutongFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem;Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g390;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem;

    iput-object p2, p0, Ll/g390;->b:Lcom/p1/mobile/putong/app/PutongFrag;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g390;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem;

    iget-object p0, p0, Ll/g390;->b:Lcom/p1/mobile/putong/app/PutongFrag;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem;Lcom/p1/mobile/putong/app/PutongFrag;Landroid/view/View;)V

    return-void
.end method
