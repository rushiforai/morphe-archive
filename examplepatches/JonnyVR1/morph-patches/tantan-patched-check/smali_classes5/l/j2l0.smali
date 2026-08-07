.class public final synthetic Ll/j2l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/util/verificationoptimization/VerificationAct;

.field public final synthetic b:I

.field public final synthetic c:Ll/bm5;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/util/verificationoptimization/VerificationAct;ILl/bm5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j2l0;->a:Lcom/p1/mobile/putong/core/util/verificationoptimization/VerificationAct;

    iput p2, p0, Ll/j2l0;->b:I

    iput-object p3, p0, Ll/j2l0;->c:Ll/bm5;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j2l0;->a:Lcom/p1/mobile/putong/core/util/verificationoptimization/VerificationAct;

    iget v1, p0, Ll/j2l0;->b:I

    iget-object p0, p0, Ll/j2l0;->c:Ll/bm5;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/util/verificationoptimization/VerificationAct;->Z1(Lcom/p1/mobile/putong/core/util/verificationoptimization/VerificationAct;ILl/bm5;Landroid/view/View;)V

    return-void
.end method
