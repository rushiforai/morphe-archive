.class public final synthetic Ll/h19;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/x19;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/GrowthPushConfig;


# direct methods
.method public synthetic constructor <init>(Ll/x19;Ll/x20;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h19;->a:Ll/x19;

    iput-object p2, p0, Ll/h19;->b:Ll/x20;

    iput-object p3, p0, Ll/h19;->c:Lcom/p1/mobile/putong/core/data/GrowthPushConfig;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h19;->a:Ll/x19;

    iget-object v1, p0, Ll/h19;->b:Ll/x20;

    iget-object p0, p0, Ll/h19;->c:Lcom/p1/mobile/putong/core/data/GrowthPushConfig;

    invoke-static {v0, v1, p0, p1}, Ll/x19;->g(Ll/x19;Ll/x20;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Landroid/view/View;)V

    return-void
.end method
