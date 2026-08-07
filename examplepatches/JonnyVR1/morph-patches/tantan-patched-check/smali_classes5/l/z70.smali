.class public final synthetic Ll/z70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/a80;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Contract;


# direct methods
.method public synthetic constructor <init>(Ll/a80;Lcom/p1/mobile/putong/data/Contract;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z70;->a:Ll/a80;

    iput-object p2, p0, Ll/z70;->b:Lcom/p1/mobile/putong/data/Contract;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z70;->a:Ll/a80;

    iget-object p0, p0, Ll/z70;->b:Lcom/p1/mobile/putong/data/Contract;

    invoke-static {v0, p0, p1}, Ll/a80;->E(Ll/a80;Lcom/p1/mobile/putong/data/Contract;Landroid/view/View;)V

    return-void
.end method
