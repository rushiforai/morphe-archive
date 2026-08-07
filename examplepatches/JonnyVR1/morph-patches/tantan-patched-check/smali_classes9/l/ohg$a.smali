.class public Ll/ohg$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/q5m;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ohg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ohg;


# direct methods
.method public constructor <init>(Ll/ohg;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ohg$a;->a:Ll/ohg;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/iig;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ohg$a;->a:Ll/ohg;

    .line 2
    .line 3
    iget-object p1, p1, Ll/ohg;->j:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/d3q;

    .line 20
    .line 21
    check-cast v0, Ll/iig;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/iig;->K()Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BFansRecallUser;->isSelected()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    const/4 p1, 0x0

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 p1, 0x1

    .line 36
    :goto_0
    iget-object v0, p0, Ll/ohg$a;->a:Ll/ohg;

    .line 37
    .line 38
    invoke-static {v0}, Ll/ohg;->e0(Ll/ohg;)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    iget-object p0, p0, Ll/ohg$a;->a:Ll/ohg;

    .line 45
    .line 46
    invoke-static {p0}, Ll/ohg;->e0(Ll/ohg;)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 51
    .line 52
    .line 53
    :cond_2
    return-void
.end method
