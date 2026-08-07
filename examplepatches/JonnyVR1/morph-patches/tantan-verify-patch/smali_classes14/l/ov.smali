.class public final synthetic Ll/ov;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/qv;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;


# direct methods
.method public synthetic constructor <init>(Ll/qv;Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ov;->a:Ll/qv;

    iput-object p2, p0, Ll/ov;->b:Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ov;->a:Ll/qv;

    iget-object p0, p0, Ll/ov;->b:Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;

    invoke-static {v0, p0, p1}, Ll/qv;->c(Ll/qv;Lcom/p1/mobile/putong/core/data/LogoutRecommendUser;Landroid/view/View;)V

    return-void
.end method
