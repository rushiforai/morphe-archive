.class public Ll/jzw$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jzw;->i(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:I

.field public final synthetic b:Ll/jzw;


# direct methods
.method public constructor <init>(Ll/jzw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jzw$a;->b:Ll/jzw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 2

    .line 1
    iget v0, p0, Ll/jzw$a;->a:I

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/jzw$a;->b:Ll/jzw;

    .line 6
    .line 7
    iget-object v0, v0, Ll/jzw;->h:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iput p1, p0, Ll/jzw$a;->a:I

    .line 14
    .line 15
    return-void
.end method

.method public b(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jzw$a;->b:Ll/jzw;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jzw;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public d(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jzw$a;->b:Ll/jzw;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/jzw;->k(Ll/jzw;I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/jzw$a;->b:Ll/jzw;

    .line 7
    .line 8
    invoke-static {p0}, Ll/jzw;->j(Ll/jzw;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
