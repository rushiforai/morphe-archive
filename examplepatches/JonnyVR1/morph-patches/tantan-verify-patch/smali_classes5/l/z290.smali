.class public final synthetic Ll/z290;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondSkinItem;

.field public final synthetic b:Lcom/p1/mobile/putong/app/PutongFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondSkinItem;Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z290;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondSkinItem;

    iput-object p2, p0, Ll/z290;->b:Lcom/p1/mobile/putong/app/PutongFrag;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z290;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondSkinItem;

    iget-object p0, p0, Ll/z290;->b:Lcom/p1/mobile/putong/app/PutongFrag;

    invoke-static {v0, p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondSkinItem;->d(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondSkinItem;Lcom/p1/mobile/putong/app/PutongFrag;Landroid/widget/CompoundButton;Z)V

    return-void
.end method
