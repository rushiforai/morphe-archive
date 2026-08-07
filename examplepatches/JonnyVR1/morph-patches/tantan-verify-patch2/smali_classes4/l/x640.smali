.class public final synthetic Ll/x640;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/RiskOtherData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/data/RiskOtherData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x640;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    iput-object p2, p0, Ll/x640;->b:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x640;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    iget-object p0, p0, Ll/x640;->b:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->u1(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/data/RiskOtherData;Landroid/view/View;)V

    return-void
.end method
