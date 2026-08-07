.class public Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->b(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$a;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

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
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$a;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$a;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    instance-of p1, p1, Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$a;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$a;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->a:Ljava/lang/String;

    .line 30
    .line 31
    const-string v1, "suggest_end"

    .line 32
    .line 33
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    const/4 p0, 0x0

    .line 40
    invoke-static {p1, p0}, Ll/n3x;->B(Lcom/p1/mobile/android/app/Act;Z)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$a;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->a:Ljava/lang/String;

    .line 47
    .line 48
    const-string v1, "suggest_empty"

    .line 49
    .line 50
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-string v1, "marry_series_type_mate"

    .line 69
    .line 70
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->a2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    new-instance v2, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$a$a;

    .line 75
    .line 76
    invoke-direct {v2, p0, v0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$a$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView$a;Lcom/p1/mobile/putong/data/User;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method
