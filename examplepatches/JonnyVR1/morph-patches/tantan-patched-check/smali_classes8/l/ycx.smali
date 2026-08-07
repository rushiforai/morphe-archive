.class public final synthetic Ll/ycx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/xcx$g;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/BreakIce;


# direct methods
.method public synthetic constructor <init>(Ll/xcx$g;Lcom/p1/mobile/putong/core/data/BreakIce;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ycx;->a:Ll/xcx$g;

    iput-object p2, p0, Ll/ycx;->b:Lcom/p1/mobile/putong/core/data/BreakIce;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ycx;->a:Ll/xcx$g;

    iget-object p0, p0, Ll/ycx;->b:Lcom/p1/mobile/putong/core/data/BreakIce;

    invoke-static {v0, p0, p1}, Ll/xcx$g;->E(Ll/xcx$g;Lcom/p1/mobile/putong/core/data/BreakIce;Landroid/view/View;)V

    return-void
.end method
