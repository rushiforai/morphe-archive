.class public final synthetic Ll/wlp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/slp$c;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/slp$c;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wlp;->a:Ll/slp$c;

    iput-object p2, p0, Ll/wlp;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wlp;->a:Ll/slp$c;

    iget-object p0, p0, Ll/wlp;->b:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Ll/slp$c;->y(Ll/slp$c;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
