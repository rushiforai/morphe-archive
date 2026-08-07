.class public final synthetic Ll/mp30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/xp30;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/RiskSelfData;


# direct methods
.method public synthetic constructor <init>(Ll/xp30;Lcom/p1/mobile/putong/core/data/RiskSelfData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mp30;->a:Ll/xp30;

    iput-object p2, p0, Ll/mp30;->b:Lcom/p1/mobile/putong/core/data/RiskSelfData;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mp30;->a:Ll/xp30;

    iget-object p0, p0, Ll/mp30;->b:Lcom/p1/mobile/putong/core/data/RiskSelfData;

    invoke-static {v0, p0, p1}, Ll/xp30;->z(Ll/xp30;Lcom/p1/mobile/putong/core/data/RiskSelfData;Landroid/view/View;)V

    return-void
.end method
