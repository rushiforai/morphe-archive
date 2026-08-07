.class public Lcom/p1/mobile/android/app/Act$m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/widget/ArrayAdapter;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Lcom/p1/mobile/android/app/Dialog;

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/widget/ArrayAdapter;Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/app/Act$m;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/android/app/Act$m;->a:Landroid/widget/ArrayAdapter;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/android/app/Act$m;->b:Ljava/util/ArrayList;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/android/app/Act$m;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Landroid/widget/ArrayAdapter;ILl/pf60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p2, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p2, Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act$m;->a:Landroid/widget/ArrayAdapter;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    const-string p2, "debug_tool_name"

    .line 10
    .line 11
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    filled-new-array {p1}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string p2, "e_debug_tool"

    .line 20
    .line 21
    const-string p4, "p_debug_tool_dialog_view"

    .line 22
    .line 23
    invoke-static {p2, p4, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act$m;->b:Ljava/util/ArrayList;

    .line 27
    .line 28
    iget-object p2, p0, Lcom/p1/mobile/android/app/Act$m;->a:Landroid/widget/ArrayAdapter;

    .line 29
    .line 30
    new-instance p4, Ll/n20;

    .line 31
    .line 32
    invoke-direct {p4, p2, p3}, Ll/n20;-><init>(Landroid/widget/ArrayAdapter;I)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1, p4}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Ll/pf60;

    .line 40
    .line 41
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast p1, Ll/x20;

    .line 44
    .line 45
    invoke-interface {p1}, Ll/x20;->call()V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$m;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 51
    .line 52
    .line 53
    return-void
.end method
