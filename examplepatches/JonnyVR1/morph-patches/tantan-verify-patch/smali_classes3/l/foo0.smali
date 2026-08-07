.class public final synthetic Ll/foo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/koo0;

.field public final synthetic b:Landroid/widget/TextView;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;


# direct methods
.method public synthetic constructor <init>(Ll/koo0;Landroid/widget/TextView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/foo0;->a:Ll/koo0;

    iput-object p2, p0, Ll/foo0;->b:Landroid/widget/TextView;

    iput-object p3, p0, Ll/foo0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/foo0;->a:Ll/koo0;

    iget-object v1, p0, Ll/foo0;->b:Landroid/widget/TextView;

    iget-object p0, p0, Ll/foo0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    invoke-static {v0, v1, p0, p1}, Ll/koo0;->e(Ll/koo0;Landroid/widget/TextView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;Landroid/view/View;)V

    return-void
.end method
