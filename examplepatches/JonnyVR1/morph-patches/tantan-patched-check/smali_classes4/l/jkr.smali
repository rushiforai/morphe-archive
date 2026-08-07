.class public final synthetic Ll/jkr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/LikersBoostRemainingCountView;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/LikersBoostRemainingCountView;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jkr;->a:Lcom/p1/mobile/putong/core/newui/home/LikersBoostRemainingCountView;

    iput p2, p0, Ll/jkr;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jkr;->a:Lcom/p1/mobile/putong/core/newui/home/LikersBoostRemainingCountView;

    iget p0, p0, Ll/jkr;->b:I

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/LikersBoostRemainingCountView;->c(Lcom/p1/mobile/putong/core/newui/home/LikersBoostRemainingCountView;I)V

    return-void
.end method
