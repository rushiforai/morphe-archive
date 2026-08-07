.class public final synthetic Ll/tp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/wp;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/InactivateReason;


# direct methods
.method public synthetic constructor <init>(Ll/wp;Lcom/p1/mobile/putong/core/data/InactivateReason;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tp;->a:Ll/wp;

    iput-object p2, p0, Ll/tp;->b:Lcom/p1/mobile/putong/core/data/InactivateReason;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tp;->a:Ll/wp;

    iget-object p0, p0, Ll/tp;->b:Lcom/p1/mobile/putong/core/data/InactivateReason;

    invoke-static {v0, p0, p1}, Ll/wp;->c(Ll/wp;Lcom/p1/mobile/putong/core/data/InactivateReason;Landroid/view/View;)V

    return-void
.end method
