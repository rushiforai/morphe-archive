.class public final synthetic Ll/az60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/hz60;

.field public final synthetic b:Lcom/p1/mobile/putong/data/VerifyReason;


# direct methods
.method public synthetic constructor <init>(Ll/hz60;Lcom/p1/mobile/putong/data/VerifyReason;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/az60;->a:Ll/hz60;

    iput-object p2, p0, Ll/az60;->b:Lcom/p1/mobile/putong/data/VerifyReason;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/az60;->a:Ll/hz60;

    iget-object p0, p0, Ll/az60;->b:Lcom/p1/mobile/putong/data/VerifyReason;

    invoke-static {v0, p0, p1}, Ll/hz60;->q(Ll/hz60;Lcom/p1/mobile/putong/data/VerifyReason;Landroid/view/View;)V

    return-void
.end method
