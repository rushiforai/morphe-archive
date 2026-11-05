.class Le/e/a/ListActions$1;
.super Ljava/lang/Object;
.source "ListActions.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/ListActions;->lambda$18(Landroid/app/Activity;Ljava/lang/Object;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$fragment:Ljava/lang/Object;

.field private final synthetic val$type:I


# direct methods
.method constructor <init>(Landroid/app/Activity;ILjava/lang/Object;)V
    .registers 4

    .line 113
    iput-object p1, p0, Le/e/a/ListActions$1;->val$a:Landroid/app/Activity;

    iput p2, p0, Le/e/a/ListActions$1;->val$type:I

    iput-object p3, p0, Le/e/a/ListActions$1;->val$fragment:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 113
    instance-of p1, p2, Landroid/widget/TextView;

    if-eqz p1, :cond_e

    move-object p1, p2

    check-cast p1, Landroid/widget/TextView;

    invoke-static {p2}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_e
    iget-object p1, p0, Le/e/a/ListActions$1;->val$a:Landroid/app/Activity;

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p4, "history_sort_v2_"

    invoke-direct {p2, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p4, p0, Le/e/a/ListActions$1;->val$type:I

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p1, p0, Le/e/a/ListActions$1;->val$fragment:Ljava/lang/Object;

    # invokes: Le/e/a/ListActions;->sortHistory(Ljava/lang/Object;I)V
    invoke-static {p1, p3}, Le/e/a/ListActions;->access$4(Ljava/lang/Object;I)V

    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    return-void
.end method
