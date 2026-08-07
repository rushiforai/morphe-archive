.class public Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$c;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->R0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$c;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onFinished()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$c;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->l:Lv/VImage;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
