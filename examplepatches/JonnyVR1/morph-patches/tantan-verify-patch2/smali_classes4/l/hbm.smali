.class public final synthetic Ll/hbm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hbm;->a:Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;

    iput-object p2, p0, Ll/hbm;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hbm;->a:Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;

    iget-object p0, p0, Ll/hbm;->b:Ll/y20;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;->b(Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard;Ll/y20;Landroid/view/View;)V

    return-void
.end method
