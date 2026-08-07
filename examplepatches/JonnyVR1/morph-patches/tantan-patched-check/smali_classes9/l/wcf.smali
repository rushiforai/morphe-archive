.class public final synthetic Ll/wcf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wcf;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    iput-object p2, p0, Ll/wcf;->b:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wcf;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;

    iget-object p0, p0, Ll/wcf;->b:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;->V(Lcom/p1/mobile/putong/core/ui/profile/exp/item/b;Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    return-void
.end method
