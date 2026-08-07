.class public Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->g4(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag$a;->a:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag$a;->a:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->d5(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag$a;->a:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->e5(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/br5;->l()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    const/16 p1, 0xa

    .line 24
    .line 25
    if-le p4, p1, :cond_0

    .line 26
    .line 27
    add-int/2addr p2, p3

    .line 28
    if-le p2, p1, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag$a;->a:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->g5(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag$a;->a:Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    if-ne p2, p1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p1, 0x0

    .line 8
    :goto_0
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;->f5(Lcom/p1/mobile/putong/core/newui/messages/compliment/WhisperListFrag;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
