.class public Ll/cxc0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/cxc0;->j()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterTagItem;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/cxc0;


# direct methods
.method public constructor <init>(Ll/cxc0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cxc0$c;->a:Ll/cxc0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterTagItem;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterTagItem;->getBindViewData()Ll/qi40;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget p0, p0, Ll/qi40;->a:I

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    const-string v0, "p_settings_view"

    .line 17
    .line 18
    if-ne p0, p1, :cond_0

    .line 19
    .line 20
    const-string p0, "e_intl_select_long_term_partner"

    .line 21
    .line 22
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const-string p0, "e_intl_select_short_term_fun"

    .line 27
    .line 28
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterTagItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cxc0$c;->a(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterTagItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
