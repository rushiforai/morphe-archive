.class public final synthetic Ll/jdd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/view/RollAnimView;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/view/RollAnimView;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jdd0;->a:Lcom/p1/mobile/putong/live/base/view/RollAnimView;

    iput p2, p0, Ll/jdd0;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jdd0;->a:Lcom/p1/mobile/putong/live/base/view/RollAnimView;

    iget p0, p0, Ll/jdd0;->b:I

    check-cast p1, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->u(Lcom/p1/mobile/putong/live/base/view/RollAnimView;ILcom/p1/mobile/putong/live/base/view/RollAnimView$a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
