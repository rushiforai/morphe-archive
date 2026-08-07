.class public final synthetic Ll/d0g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d0g;->a:Lcom/p1/mobile/putong/data/User;

    iput-object p2, p0, Ll/d0g;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d0g;->a:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/d0g;->b:Landroid/view/View;

    invoke-static {v0, p0, p1}, Ll/h0g;->F(Lcom/p1/mobile/putong/data/User;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
