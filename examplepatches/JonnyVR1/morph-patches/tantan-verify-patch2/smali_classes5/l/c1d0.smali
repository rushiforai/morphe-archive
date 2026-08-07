.class public final synthetic Ll/c1d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/report/e$c;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/report/e$c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c1d0;->a:Lcom/p1/mobile/putong/core/ui/report/e$c;

    iput-object p2, p0, Ll/c1d0;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c1d0;->a:Lcom/p1/mobile/putong/core/ui/report/e$c;

    iget-object p0, p0, Ll/c1d0;->b:Landroid/view/View;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/report/e$c;->E(Lcom/p1/mobile/putong/core/ui/report/e$c;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
