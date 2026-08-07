.class public Ll/cxc0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/cxc0;->A3(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/cxc0;


# direct methods
.method public constructor <init>(Ll/cxc0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cxc0$a;->a:Ll/cxc0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/cxc0$a;->a:Ll/cxc0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/cxc0;->c(Ll/cxc0;)Ll/xi40;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ll/o1i0;->i()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterTagItem;

    .line 12
    .line 13
    iget-object v0, p0, Ll/cxc0$a;->a:Ll/cxc0;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterTagItem;->getBindViewData()Ll/qi40;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p1, p1, Ll/qi40;->d:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0, p1}, Ll/cxc0;->d(Ll/cxc0;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string p1, ""

    .line 28
    .line 29
    invoke-static {v0, p1}, Ll/cxc0;->d(Ll/cxc0;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :goto_0
    iget-object p1, p0, Ll/cxc0$a;->a:Ll/cxc0;

    .line 33
    .line 34
    invoke-static {p1}, Ll/cxc0;->b(Ll/cxc0;)Ll/bxc0;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p0, p0, Ll/cxc0$a;->a:Ll/cxc0;

    .line 39
    .line 40
    invoke-static {p0}, Ll/cxc0;->a(Ll/cxc0;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p1, p0}, Ll/bxc0;->f0(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
