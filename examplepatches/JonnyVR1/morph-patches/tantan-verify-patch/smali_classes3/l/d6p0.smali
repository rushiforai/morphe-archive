.class public final synthetic Ll/d6p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/e6p0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;


# direct methods
.method public synthetic constructor <init>(Ll/e6p0;Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d6p0;->a:Ll/e6p0;

    iput-object p2, p0, Ll/d6p0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d6p0;->a:Ll/e6p0;

    iget-object p0, p0, Ll/d6p0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    invoke-static {v0, p0, p1}, Ll/e6p0;->L(Ll/e6p0;Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;Landroid/view/View;)V

    return-void
.end method
