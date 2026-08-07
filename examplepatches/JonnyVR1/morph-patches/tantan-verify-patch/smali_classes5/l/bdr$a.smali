.class public Ll/bdr$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bdr;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Landroid/widget/ScrollView;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;


# direct methods
.method public constructor <init>(Landroid/widget/ScrollView;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/bdr$a;->b:Landroid/widget/ScrollView;

    .line 2
    .line 3
    iput-object p2, p0, Ll/bdr$a;->c:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Ll/bdr$a;->a:Z

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/bdr$a;Landroid/widget/ScrollView;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bdr$a;->b(Landroid/widget/ScrollView;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    return-void
.end method


# virtual methods
.method public final synthetic b(Landroid/widget/ScrollView;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V
    .locals 1

    .line 1
    const/16 v0, 0x82

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/widget/ScrollView;->fullScroll(I)Z

    .line 4
    .line 5
    .line 6
    iget-boolean p1, p0, Ll/bdr$a;->a:Z

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p2, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->l:Lv/VEditText;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 13
    .line 14
    .line 15
    :cond_0
    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Ll/bdr$a;->a:Z

    .line 17
    .line 18
    return-void
.end method

.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/bdr$a;->b:Landroid/widget/ScrollView;

    .line 2
    .line 3
    iget-object p2, p0, Ll/bdr$a;->c:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;

    .line 4
    .line 5
    new-instance p3, Ll/adr;

    .line 6
    .line 7
    invoke-direct {p3, p0, p1, p2}, Ll/adr;-><init>(Ll/bdr$a;Landroid/widget/ScrollView;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method
