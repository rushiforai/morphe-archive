.class public final synthetic Ll/p100;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p100;->a:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    iput-object p2, p0, Ll/p100;->b:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;

    iput-object p3, p0, Ll/p100;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p100;->a:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;

    iget-object v1, p0, Ll/p100;->b:Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;

    iget-object p0, p0, Ll/p100;->c:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/view/MessageNewProfileSettingFunItem;->q(Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel$Type;Lcom/p1/mobile/putong/core/ui/messages/model/MessageNewProfileSettingViewModel;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
