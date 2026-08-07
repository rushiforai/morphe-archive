.class public final synthetic Ll/lef;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/oef;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Question;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Answer;


# direct methods
.method public synthetic constructor <init>(Ll/oef;Lcom/p1/mobile/putong/core/data/Question;Lcom/p1/mobile/putong/data/Answer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lef;->a:Ll/oef;

    iput-object p2, p0, Ll/lef;->b:Lcom/p1/mobile/putong/core/data/Question;

    iput-object p3, p0, Ll/lef;->c:Lcom/p1/mobile/putong/data/Answer;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lef;->a:Ll/oef;

    iget-object v1, p0, Ll/lef;->b:Lcom/p1/mobile/putong/core/data/Question;

    iget-object p0, p0, Ll/lef;->c:Lcom/p1/mobile/putong/data/Answer;

    invoke-static {v0, v1, p0, p1}, Ll/oef;->V(Ll/oef;Lcom/p1/mobile/putong/core/data/Question;Lcom/p1/mobile/putong/data/Answer;Landroid/view/View;)V

    return-void
.end method
