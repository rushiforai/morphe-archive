.class public final synthetic Ll/y1l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/WebSubscriptionLandPageConfig;

.field public final synthetic b:Ll/c2l;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/WebSubscriptionLandPageConfig;Ll/c2l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y1l;->a:Lcom/p1/mobile/putong/core/data/WebSubscriptionLandPageConfig;

    iput-object p2, p0, Ll/y1l;->b:Ll/c2l;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y1l;->a:Lcom/p1/mobile/putong/core/data/WebSubscriptionLandPageConfig;

    iget-object p0, p0, Ll/y1l;->b:Ll/c2l;

    invoke-static {v0, p0, p1}, Ll/c2l;->d(Lcom/p1/mobile/putong/core/data/WebSubscriptionLandPageConfig;Ll/c2l;Landroid/view/View;)V

    return-void
.end method
