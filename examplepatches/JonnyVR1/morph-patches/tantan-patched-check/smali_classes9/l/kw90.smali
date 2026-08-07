.class public final synthetic Ll/kw90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/mw90;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/mw90;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kw90;->a:Ll/mw90;

    iput-object p2, p0, Ll/kw90;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kw90;->a:Ll/mw90;

    iget-object p0, p0, Ll/kw90;->b:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Ll/mw90;->c(Ll/mw90;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
