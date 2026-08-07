.class public final synthetic Ll/z3s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a;

.field public final synthetic b:Ll/xwr$a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a;Ll/xwr$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z3s;->a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a;

    iput-object p2, p0, Ll/z3s;->b:Ll/xwr$a;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z3s;->a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a;

    iget-object p0, p0, Ll/z3s;->b:Ll/xwr$a;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a;->r(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a;Ll/xwr$a;Landroid/view/View;)V

    return-void
.end method
