.class public final synthetic Ll/dp30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/AppealInfo;

.field public final synthetic b:Ll/pf60;

.field public final synthetic c:Ll/xp30;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/AppealInfo;Ll/pf60;Ll/xp30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dp30;->a:Lcom/p1/mobile/putong/core/data/AppealInfo;

    iput-object p2, p0, Ll/dp30;->b:Ll/pf60;

    iput-object p3, p0, Ll/dp30;->c:Ll/xp30;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dp30;->a:Lcom/p1/mobile/putong/core/data/AppealInfo;

    iget-object v1, p0, Ll/dp30;->b:Ll/pf60;

    iget-object p0, p0, Ll/dp30;->c:Ll/xp30;

    invoke-static {v0, v1, p0, p1}, Ll/xp30;->E(Lcom/p1/mobile/putong/core/data/AppealInfo;Ll/pf60;Ll/xp30;Landroid/view/View;)V

    return-void
.end method
