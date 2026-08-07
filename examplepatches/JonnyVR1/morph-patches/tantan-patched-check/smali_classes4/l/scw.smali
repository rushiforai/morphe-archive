.class public final synthetic Ll/scw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;ILcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/scw;->a:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;

    iput p2, p0, Ll/scw;->b:I

    iput-object p3, p0, Ll/scw;->c:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;

    iput-object p4, p0, Ll/scw;->d:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/scw;->a:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;

    iget v1, p0, Ll/scw;->b:I

    iget-object v2, p0, Ll/scw;->c:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;

    iget-object p0, p0, Ll/scw;->d:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->c(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;ILcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
