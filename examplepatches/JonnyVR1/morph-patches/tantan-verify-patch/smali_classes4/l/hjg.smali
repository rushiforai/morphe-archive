.class public final synthetic Ll/hjg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hjg;->a:Landroid/view/View;

    iput-object p2, p0, Ll/hjg;->b:Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hjg;->a:Landroid/view/View;

    iget-object p0, p0, Ll/hjg;->b:Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/helpcenter/FaqAct$a;->E(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/helpcenter/Questions$b;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
