.class public final synthetic Ll/pdr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;

.field public final synthetic b:Lcom/p1/mobile/putong/data/LetterWrapper;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;Lcom/p1/mobile/putong/data/LetterWrapper;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pdr;->a:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;

    iput-object p2, p0, Ll/pdr;->b:Lcom/p1/mobile/putong/data/LetterWrapper;

    iput p3, p0, Ll/pdr;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pdr;->a:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;

    iget-object v1, p0, Ll/pdr;->b:Lcom/p1/mobile/putong/data/LetterWrapper;

    iget p0, p0, Ll/pdr;->c:I

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;->E(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel$e;Lcom/p1/mobile/putong/data/LetterWrapper;ILandroid/view/View;)V

    return-void
.end method
