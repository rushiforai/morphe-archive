.class public final synthetic Lqb6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;
.implements Ln5o;


# instance fields
.field public final synthetic a:Lcom/opera/android/ui/catalog/widget/OperaListItem;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V
    .registers 2

    iput-object p1, p0, Lqb6;->a:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Lqb6;->a:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 4

    iget-object p0, p0, Lqb6;->a:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p2

    invoke-virtual {p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->isChecked()Z

    move-result p0

    invoke-virtual {p2, p0, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void
.end method
