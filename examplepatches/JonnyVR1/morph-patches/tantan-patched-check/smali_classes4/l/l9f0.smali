.class public final synthetic Ll/l9f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/p9f0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;


# direct methods
.method public synthetic constructor <init>(Ll/p9f0;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l9f0;->a:Ll/p9f0;

    iput-object p2, p0, Ll/l9f0;->b:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l9f0;->a:Ll/p9f0;

    iget-object p0, p0, Ll/l9f0;->b:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;

    invoke-static {v0, p0, p1}, Ll/p9f0;->E(Ll/p9f0;Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/SidesSlipItemData;Landroid/view/View;)V

    return-void
.end method
