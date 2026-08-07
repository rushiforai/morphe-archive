.class public Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->o(IIZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Z

.field public final synthetic c:I

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;IZI)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$b;->d:Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$b;->a:I

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$b;->b:Z

    .line 6
    .line 7
    iput p4, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$b;->c:I

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$b;->d:Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->b(Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$b;->a:I

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    if-ne p1, v0, :cond_1

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$b;->d:Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;

    .line 19
    .line 20
    const/16 v0, 0x8

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$b;->d:Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->d(Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;I)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$b;->b:Z

    .line 33
    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$b;->d:Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;

    .line 37
    .line 38
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$b;->c:I

    .line 39
    .line 40
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->d(Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;I)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$b;->d:Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;

    .line 44
    .line 45
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->c(Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;)I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    const/16 v0, 0x64

    .line 50
    .line 51
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->k(II)V

    .line 52
    .line 53
    .line 54
    :cond_2
    :goto_0
    return-void
.end method
