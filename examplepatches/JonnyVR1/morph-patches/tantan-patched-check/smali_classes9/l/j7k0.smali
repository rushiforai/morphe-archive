.class public final synthetic Ll/j7k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/d8k0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;


# direct methods
.method public synthetic constructor <init>(Ll/d8k0;Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j7k0;->a:Ll/d8k0;

    iput-object p2, p0, Ll/j7k0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j7k0;->a:Ll/d8k0;

    iget-object p0, p0, Ll/j7k0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    invoke-static {v0, p0, p1}, Ll/d8k0;->V(Ll/d8k0;Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;Landroid/view/View;)V

    return-void
.end method
