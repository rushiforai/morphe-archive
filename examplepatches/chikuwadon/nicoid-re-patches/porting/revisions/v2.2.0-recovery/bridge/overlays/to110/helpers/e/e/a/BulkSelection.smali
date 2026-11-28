.class public final Le/e/a/BulkSelection;
.super Ljava/lang/Object;
.source "BulkSelection.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/BulkSelection$SelectionMark;
    }
.end annotation


# static fields
.field private static final ACTIVE:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/app/Activity;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final BUSY:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final FOOTERS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Landroid/widget/LinearLayout;",
            ">;"
        }
    .end annotation
.end field

.field private static final OWNERS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 15
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/BulkSelection;->ACTIVE:Ljava/util/Map;

    .line 16
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/BulkSelection;->FOOTERS:Ljava/util/Map;

    .line 17
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/BulkSelection;->OWNERS:Ljava/util/Map;

    .line 18
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Le/e/a/BulkSelection;->BUSY:Ljava/util/Set;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static activity(Ljava/lang/Object;)Landroid/app/Activity;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 23
    invoke-static {p0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "o0"

    invoke-static {p0, v0}, Le/e/a/BulkSelection;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    :goto_0
    check-cast p0, Landroid/app/Activity;

    return-object p0
.end method

.method static bind(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 7

    .line 109
    sget-object v0, Le/e/a/BulkSelection;->OWNERS:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    if-nez p1, :cond_0

    move-object p1, v0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    :goto_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 110
    :cond_1
    :try_start_0
    invoke-static {p1}, Le/e/a/BulkSelection;->selecting(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    return v1

    :cond_2
    invoke-static {p2}, Le/e/a/BulkSelection;->checked(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setLongClickable(Z)V

    .line 111
    if-eqz v2, :cond_3

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v0

    const v3, 0xffffff

    and-int/2addr v0, v3

    const/high16 v3, 0x33000000

    or-int/2addr v0, v3

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 112
    invoke-virtual {p0}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewOverlay;->clear()V

    new-instance v0, Le/e/a/BulkSelection$SelectionMark;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3, v2}, Le/e/a/BulkSelection$SelectionMark;-><init>(Landroid/content/Context;Z)V

    new-instance v2, Le/e/a/BulkSelection$$ExternalSyntheticLambda16;

    invoke-direct {v2, p0, v0}, Le/e/a/BulkSelection$$ExternalSyntheticLambda16;-><init>(Landroid/view/View;Le/e/a/BulkSelection$SelectionMark;)V

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    invoke-virtual {p0, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    invoke-virtual {p0}, Landroid/view/View;->getOverlay()Landroid/view/ViewOverlay;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/ViewOverlay;->add(Landroid/graphics/drawable/Drawable;)V

    .line 113
    new-instance v0, Le/e/a/BulkSelection$$ExternalSyntheticLambda17;

    invoke-direct {v0, p2, p1}, Le/e/a/BulkSelection$$ExternalSyntheticLambda17;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    .line 114
    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/BulkSelection;->log(Ljava/lang/Exception;)V

    return v1
.end method

.method static button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 6

    .line 75
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p1

    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setTextSize(F)V

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setMinimumWidth(I)V

    new-instance v2, Le/e/a/BulkSelection$$ExternalSyntheticLambda1;

    invoke-direct {v2, p2}, Le/e/a/BulkSelection$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v2, 0x30

    invoke-static {v0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {p2, v1, v0, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p0, p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method static cache(Ljava/lang/Object;)Z
    .registers 2

    .line 20
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "com.sauzask.nicoid.NicoidCacheManagerActivity"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method static checked(Ljava/lang/Object;)Z
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 25
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "a"

    invoke-virtual {v1, v4, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "isselect"

    aput-object v3, v2, v5

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method static confirmDelete(Ljava/lang/Object;)V
    .registers 8

    .line 80
    :try_start_0
    invoke-static {p0}, Le/e/a/BulkSelection;->activity(Ljava/lang/Object;)Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p0}, Le/e/a/BulkSelection;->rows(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    return-void

    .line 81
    :cond_1
    invoke-static {v0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string/jumbo v3, "\u9078\u629e\u3057\u305f\u52d5\u753b\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    const-string v4, "Remove selected videos?"

    const-string v5, "\u522a\u9664\u6240\u9078\u5f71\u7247\uff1f"

    invoke-static {v0, v3, v4, v5}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "\u4ef6\u9078\u629e\u3057\u3066\u3044\u307e\u3059"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " videos selected"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "\u5df2\u9078\u53d6 "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " \u90e8\u5f71\u7247"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v3, v4, v5}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 82
    const-string v3, "\u524a\u9664"

    const-string v4, "Delete"

    const-string v5, "\u522a\u9664"

    invoke-static {v0, v3, v4, v5}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Le/e/a/BulkSelection$$ExternalSyntheticLambda3;

    invoke-direct {v4, p0, v1}, Le/e/a/BulkSelection$$ExternalSyntheticLambda3;-><init>(Ljava/lang/Object;Ljava/util/ArrayList;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string v1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string v2, "Cancel"

    const-string v3, "\u53d6\u6d88"

    invoke-static {v0, v1, v2, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 81
    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    .line 83
    goto :goto_1

    .line 80
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Le/e/a/BulkSelection;->checked(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 83
    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/BulkSelection;->log(Ljava/lang/Exception;)V

    .line 84
    :goto_1
    return-void
.end method

.method static countLabel(Landroid/content/Context;I)Landroid/widget/TextView;
    .registers 3

    .line 36
    invoke-static {p0, p1}, Le/e/a/BulkSelection;->countText(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0xe

    invoke-static {p0, p1, v0}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p0

    const p1, 0x800013

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 p1, 0x41500000    # 13.0f

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    return-object p0
.end method

.method static countText(Landroid/content/Context;I)Ljava/lang/String;
    .registers 6

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "\u4ef6\u9078\u629e"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " selected"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u5df2\u9078\u53d6 "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, " \u9805"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v0, v1, p1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static delete(Ljava/lang/Object;Ljava/util/ArrayList;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    invoke-static {p0, p1}, Le/e/a/AccountRemoval227;->delete(Ljava/lang/Object;Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 88
    :cond_0
    const/4 v0, 0x1

    :try_start_0
    invoke-static {p0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p0}, Le/e/a/BulkSelection;->activity(Ljava/lang/Object;)Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Le/e/a/CacheControl110;->stop(Landroid/content/Context;)V

    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Le/e/a/BulkSelection$$ExternalSyntheticLambda4;

    invoke-direct {v3, p1, v1}, Le/e/a/BulkSelection$$ExternalSyntheticLambda4;-><init>(Ljava/util/ArrayList;Landroid/app/Activity;)V

    const-string p1, "nicoid-cache-delete"

    invoke-direct {v2, v3, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    return-void

    .line 89
    :cond_1
    invoke-static {p0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "h0"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_2

    invoke-static {p0, p1}, Le/e/a/BulkSelection;->deleteAccountHistory(Ljava/lang/Object;Ljava/util/ArrayList;)V

    return-void

    .line 90
    :cond_2
    invoke-static {p0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "e.e.a.i"

    goto :goto_0

    :cond_3
    const-string v1, "e.e.a.z1"

    .line 91
    :goto_0
    invoke-static {p0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, -0x1

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    if-nez v2, :cond_5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v7, "g0"

    invoke-virtual {v2, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    const/16 v7, 0x8

    if-ne v2, v7, :cond_5

    .line 92
    invoke-static {p0}, Le/e/a/BulkSelection;->rows(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v7, v2, [Z

    const/4 v8, 0x0

    :goto_1
    if-lt v8, v2, :cond_4

    .line 93
    const-string p1, "com.sauzask.nicoid.LocalHistoryBulkDelete"

    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    new-array v1, v5, [Ljava/lang/Class;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    aput-object v2, v1, v6

    const-class v2, [Z

    aput-object v2, v1, v0

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p1

    new-array v1, v5, [Ljava/lang/Object;

    aput-object p0, v1, v6

    aput-object v7, v1, v0

    invoke-virtual {p1, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/DialogInterface$OnClickListener;

    invoke-interface {p1, v4, v3}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    .line 94
    goto :goto_3

    .line 92
    :cond_4
    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {p1, v9}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v9

    aput-boolean v9, v7, v8

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 94
    :cond_5
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/Class;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    aput-object v7, v2, v6

    const-class v7, Ljava/util/ArrayList;

    aput-object v7, v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/Object;

    aput-object p0, v2, v6

    aput-object p1, v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/DialogInterface$OnClickListener;

    invoke-interface {p1, v4, v3}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 95
    :catch_0
    move-exception p1

    invoke-static {p1}, Le/e/a/BulkSelection;->log(Ljava/lang/Exception;)V

    :try_start_1
    invoke-static {p0}, Le/e/a/BulkSelection;->activity(Ljava/lang/Object;)Landroid/app/Activity;

    move-result-object p1

    invoke-static {p0}, Le/e/a/BulkSelection;->activity(Ljava/lang/Object;)Landroid/app/Activity;

    move-result-object p0

    const-string v1, "\u524a\u9664\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    const-string v2, "Unable to delete"

    const-string v3, "\u522a\u9664\u5931\u6557"

    invoke-static {p0, v1, v2, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0, v0}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    move-exception p0

    :goto_2
    nop

    .line 96
    :goto_3
    return-void
.end method

.method static deleteAccountHistory(Ljava/lang/Object;Ljava/util/ArrayList;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 98
    invoke-static {p0}, Le/e/a/BulkSelection;->activity(Ljava/lang/Object;)Landroid/app/Activity;

    move-result-object v1

    const-string v0, "p0"

    invoke-static {p0, v0}, Le/e/a/BulkSelection;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {p0}, Le/e/a/BulkSelection;->rows(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v4

    sget-object v0, Le/e/a/BulkSelection;->BUSY:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 99
    :cond_0
    new-instance v6, Ljava/lang/Thread;

    new-instance v7, Le/e/a/BulkSelection$$ExternalSyntheticLambda0;

    move-object v0, v7

    move-object v2, p1

    move-object v3, p0

    invoke-direct/range {v0 .. v5}, Le/e/a/BulkSelection$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;)V

    .line 106
    nop

    .line 99
    const-string p0, "nicoid-history-delete"

    invoke-direct {v6, v7, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 106
    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 107
    return-void
.end method

.method static deleteOne(Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 6

    .line 85
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-static {p0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "Delete cache?"

    const-string v2, "\u522a\u9664\u5feb\u53d6\uff1f"

    const-string v3, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    goto :goto_0

    :cond_0
    const-string v1, "Delete watch history?"

    const-string v2, "\u522a\u9664\u89c0\u770b\u7d00\u9304\uff1f"

    const-string/jumbo v3, "\u8996\u8074\u5c65\u6b74\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    :goto_0
    invoke-static {p0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u524a\u9664"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/BulkSelection$$ExternalSyntheticLambda14;

    invoke-direct {v2, p0, p1}, Le/e/a/BulkSelection$$ExternalSyntheticLambda14;-><init>(Landroid/app/Activity;Ljava/lang/Object;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method static done(Ljava/lang/Object;)V
    .registers 2

    .line 77
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p0, v0}, Le/e/a/BulkSelection;->selectAll(Ljava/lang/Object;Z)V

    invoke-static {p0}, Le/e/a/BulkSelection;->selecting(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Le/e/a/BulkSelection;->toggleMode(Ljava/lang/Object;)V

    :cond_0
    invoke-static {p0}, Le/e/a/BulkSelection;->refresh(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/BulkSelection;->log(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static enter(Ljava/lang/Object;I)Z
    .registers 7

    .line 48
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 49
    :cond_0
    :try_start_0
    invoke-static {p0}, Le/e/a/BulkSelection;->rows(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v1

    if-ltz p1, :cond_5

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt p1, v2, :cond_1

    goto :goto_3

    .line 50
    :cond_1
    invoke-static {p0}, Le/e/a/BulkSelection;->selecting(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-static {p0}, Le/e/a/BulkSelection;->toggleMode(Ljava/lang/Object;)V

    goto :goto_1

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3, v0}, Le/e/a/BulkSelection;->set(Ljava/lang/Object;Z)V

    goto :goto_0

    .line 51
    :cond_3
    :goto_1
    sget-object v2, Le/e/a/BulkSelection;->OWNERS:Ljava/util/Map;

    invoke-static {p0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    const-string v3, "C"

    goto :goto_2

    :cond_4
    const-string v3, "p0"

    :goto_2
    invoke-static {p0, v3}, Le/e/a/BulkSelection;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    const/4 v1, 0x1

    invoke-static {p1, v1}, Le/e/a/BulkSelection;->set(Ljava/lang/Object;Z)V

    invoke-static {p0}, Le/e/a/BulkSelection;->install(Ljava/lang/Object;)V

    invoke-static {p0}, Le/e/a/BulkSelection;->refresh(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    .line 49
    :cond_5
    :goto_3
    return v0

    .line 53
    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/BulkSelection;->log(Ljava/lang/Exception;)V

    return v0
.end method

.method static findList(Landroid/view/View;)Landroid/view/View;
    .registers 3

    .line 73
    instance-of v0, p0, Landroid/widget/ListView;

    if-eqz v0, :cond_0

    invoke-static {p0}, Le/e/a/SelectionContainer193;->outer(Landroid/view/View;)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_3

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/BulkSelection;->findList(Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2

    return-object v1

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    const/4 p0, 0x0

    return-object p0
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 19
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static install(Ljava/lang/Object;)V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 56
    invoke-static {p0}, Le/e/a/BulkSelection;->activity(Ljava/lang/Object;)Landroid/app/Activity;

    move-result-object v0

    invoke-static {p0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "y"

    goto :goto_0

    :cond_0
    const-string v1, "Z"

    :goto_0
    invoke-static {p0, v1}, Le/e/a/BulkSelection;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 57
    const v2, 0x7f08019a

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    const v3, 0x7f0801bd

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    .line 58
    if-eqz v2, :cond_8

    if-eqz v3, :cond_8

    .line 59
    const v4, 0x7f0801be

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout;

    .line 61
    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_1
    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v7

    const/16 v8, 0x8

    const/4 v9, -0x1

    if-lt v6, v7, :cond_6

    .line 62
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-static {p0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    const-string v6, "S"

    goto :goto_2

    :cond_1
    const-string v6, "selectionCount"

    :goto_2
    invoke-virtual {v4, v6}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 63
    if-eqz v6, :cond_2

    invoke-static {v6}, Le/e/a/SelectionUi191;->headerView(Landroid/widget/TextView;)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    instance-of v7, v7, Landroid/view/ViewGroup;

    if-eqz v7, :cond_2

    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    check-cast v7, Landroid/view/ViewGroup;

    invoke-virtual {v7, v6}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 64
    :cond_2
    invoke-static {v0, v5}, Le/e/a/BulkSelection;->countLabel(Landroid/content/Context;I)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v4, p0, v6}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 66
    invoke-static {p0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    const-string v1, "A"

    invoke-static {p0, v1}, Le/e/a/BulkSelection;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    goto :goto_3

    :cond_3
    invoke-static {v1}, Le/e/a/BulkSelection;->findList(Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    .line 67
    :goto_3
    if-eqz v1, :cond_5

    .line 68
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    instance-of v4, v4, Landroid/widget/LinearLayout;

    if-nez v4, :cond_4

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v7

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    invoke-static {v0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v11

    invoke-virtual {v4, v11, v7, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v4, v9, v5, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v11, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    :cond_4
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout;

    new-instance v5, Le/e/a/BulkSelection$$ExternalSyntheticLambda6;

    invoke-direct {v5, p0}, Le/e/a/BulkSelection$$ExternalSyntheticLambda6;-><init>(Ljava/lang/Object;)V

    new-instance v7, Le/e/a/BulkSelection$$ExternalSyntheticLambda7;

    invoke-direct {v7, p0}, Le/e/a/BulkSelection$$ExternalSyntheticLambda7;-><init>(Ljava/lang/Object;)V

    invoke-static {v6, v5, v7}, Le/e/a/SelectionUi191;->header(Landroid/widget/TextView;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;

    move-result-object v5

    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v1

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2

    invoke-direct {v6, v9, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5, v1, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 70
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->removeAllViews()V

    invoke-virtual {v2, v8}, Landroid/widget/LinearLayout;->setVisibility(I)V

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->removeAllViews()V

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput v7, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    new-instance v1, Le/e/a/BulkSelection$$ExternalSyntheticLambda8;

    invoke-direct {v1, p0}, Le/e/a/BulkSelection$$ExternalSyntheticLambda8;-><init>(Ljava/lang/Object;)V

    new-instance v2, Le/e/a/BulkSelection$$ExternalSyntheticLambda9;

    invoke-direct {v2, p0}, Le/e/a/BulkSelection$$ExternalSyntheticLambda9;-><init>(Ljava/lang/Object;)V

    invoke-static {v0, v1, v2}, Le/e/a/SelectionUi191;->footer(Landroid/content/Context;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-static {v1, p0}, Le/e/a/BulkMove211;->installNative(Landroid/widget/LinearLayout;Ljava/lang/Object;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v9, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    sget-object v2, Le/e/a/BulkSelection;->FOOTERS:Ljava/util/Map;

    invoke-interface {v2, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Le/e/a/BulkSelection;->ACTIVE:Ljava/util/Map;

    invoke-interface {v1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    .line 72
    return-void

    .line 67
    :cond_5
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Missing list column"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 61
    :cond_6
    invoke-virtual {v4, v6}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getId()I

    move-result v10

    if-ne v10, v9, :cond_7

    instance-of v9, v7, Landroid/view/ViewGroup;

    if-eqz v9, :cond_7

    move-object v9, v7

    check-cast v9, Landroid/view/ViewGroup;

    invoke-virtual {v9}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v9

    if-nez v9, :cond_7

    invoke-virtual {v7, v8}, Landroid/view/View;->setVisibility(I)V

    :cond_7
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_1

    .line 58
    :cond_8
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Missing selection controls"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static synthetic lambda$0(Ljava/lang/Object;)V
    .registers 2

    .line 69
    const/4 v0, 0x1

    invoke-static {p0, v0}, Le/e/a/BulkSelection;->selectAll(Ljava/lang/Object;Z)V

    return-void
.end method

.method static synthetic lambda$1(Ljava/lang/Object;)V
    .registers 2

    .line 69
    const/4 v0, 0x0

    invoke-static {p0, v0}, Le/e/a/BulkSelection;->selectAll(Ljava/lang/Object;Z)V

    return-void
.end method

.method static synthetic lambda$10(Landroid/app/Activity;Ljava/lang/Object;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 85
    invoke-static {p0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    const-string p2, "videourl"

    invoke-static {p1, p2}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Le/e/a/BulkSelection$$ExternalSyntheticLambda5;

    invoke-direct {p2, p0}, Le/e/a/BulkSelection$$ExternalSyntheticLambda5;-><init>(Landroid/app/Activity;)V

    invoke-static {p0, p1, p2}, Le/e/a/CacheControl110;->remove(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void

    :cond_0
    :try_start_0
    const-string p2, "F"

    invoke-static {p0, p2}, Le/e/a/BulkSelection;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {p0}, Le/e/a/BulkSelection;->selecting(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-static {p0}, Le/e/a/BulkSelection;->toggleMode(Ljava/lang/Object;)V

    :cond_1
    invoke-static {p0, p2}, Le/e/a/BulkSelection;->delete(Ljava/lang/Object;Ljava/util/ArrayList;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/BulkSelection;->log(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$12(Ljava/util/ArrayList;Landroid/app/Activity;)V
    .registers 6

    .line 88
    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Le/e/a/CacheControl110;->await()V

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v1, 0x1

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    move v0, v1

    goto :goto_1

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    const-string v3, "videourl"

    invoke-static {v2, v3}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Le/e/a/CacheControl110;->delete(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :catch_0
    move-exception p0

    :goto_1
    new-instance p0, Le/e/a/BulkSelection$$ExternalSyntheticLambda15;

    invoke-direct {p0, p1, v0}, Le/e/a/BulkSelection$$ExternalSyntheticLambda15;-><init>(Landroid/app/Activity;Z)V

    invoke-virtual {p1, p0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$13(Landroid/app/Activity;Z)V
    .registers 3

    .line 88
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    goto :goto_0

    :cond_0
    const-string p1, "\u524a\u9664\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_1
    :goto_0
    return-void
.end method

.method static synthetic lambda$14(Landroid/app/Activity;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;)V
    .registers 13

    .line 99
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 100
    :try_start_0
    invoke-static {p0}, Le/e/a/VideoDetails;->initializeCookies(Landroid/content/Context;)V

    .line 101
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 104
    goto :goto_1

    .line 101
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    const-string v2, "videourl"

    invoke-static {v1, v2}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v3, :cond_1

    goto :goto_0

    .line 102
    :cond_1
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "https://nvapi.nicovideo.jp/v2/users/me/watch/history?target="

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "DELETE"

    new-instance v5, Le/e/a/NetworkTask;

    invoke-direct {v5}, Le/e/a/NetworkTask;-><init>()V

    const/4 v6, 0x1

    invoke-static {v2, v3, v6, v5}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    :try_start_2
    invoke-static {v1}, Le/e/a/BulkSelection;->log(Ljava/lang/Exception;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 104
    :catch_1
    move-exception v0

    invoke-static {v0}, Le/e/a/BulkSelection;->log(Ljava/lang/Exception;)V

    .line 105
    :goto_1
    new-instance v7, Le/e/a/BulkSelection$$ExternalSyntheticLambda2;

    move-object v0, v7

    move-object v1, p2

    move-object v2, p0

    move-object v3, p3

    move-object v5, p4

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Le/e/a/BulkSelection$$ExternalSyntheticLambda2;-><init>(Ljava/lang/Object;Landroid/app/Activity;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    invoke-virtual {p0, v7}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 106
    return-void
.end method

.method static synthetic lambda$15(Ljava/lang/Object;Landroid/app/Activity;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V
    .registers 8

    .line 105
    sget-object v0, Le/e/a/BulkSelection;->BUSY:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    check-cast p4, Landroid/widget/BaseAdapter;

    invoke-virtual {p4}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    :try_start_0
    invoke-static {p0}, Le/e/a/BulkSelection;->updateCount(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/BulkSelection;->log(Ljava/lang/Exception;)V

    :goto_1
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p0

    invoke-virtual {p5}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-eq p0, p2, :cond_1

    const-string p0, "Some history entries could not be deleted"

    const-string/jumbo p2, "\u90e8\u5206\u7d00\u9304\u7121\u6cd5\u522a\u9664"

    const-string p3, "\u4e00\u90e8\u306e\u5c65\u6b74\u3092\u524a\u9664\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p1, p3, p0, p2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x1

    invoke-static {p1, p0, p2}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_1
    return-void

    :cond_2
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    :try_start_1
    invoke-static {v0, v1}, Le/e/a/BulkSelection;->set(Ljava/lang/Object;Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method static synthetic lambda$16(Landroid/view/View;Le/e/a/BulkSelection$SelectionMark;)V
    .registers 5

    .line 112
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0x28

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    sub-int/2addr v1, v0

    const/4 v2, 0x0

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    invoke-virtual {p1, v1, v2, p0, v0}, Le/e/a/BulkSelection$SelectionMark;->setBounds(IIII)V

    return-void
.end method

.method static synthetic lambda$17(Ljava/lang/Object;Ljava/lang/Object;Landroid/view/View;)V
    .registers 3

    .line 113
    :try_start_0
    invoke-static {p0}, Le/e/a/BulkSelection;->checked(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    const/4 p2, 0x1

    :goto_0
    invoke-static {p0, p2}, Le/e/a/BulkSelection;->set(Ljava/lang/Object;Z)V

    invoke-static {p1}, Le/e/a/BulkSelection;->refresh(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/BulkSelection;->log(Ljava/lang/Exception;)V

    :goto_1
    return-void
.end method

.method static synthetic lambda$2(Ljava/lang/Object;)V
    .registers 1

    .line 71
    invoke-static {p0}, Le/e/a/BulkSelection;->confirmDelete(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$3(Ljava/lang/Object;)V
    .registers 1

    .line 71
    invoke-static {p0}, Le/e/a/BulkSelection;->done(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$4(Ljava/lang/Object;Landroid/view/MenuItem;)Z
    .registers 3

    invoke-static {p0}, Le/e/a/Revision201;->selectMenu(Ljava/lang/Object;)V

    const/4 v0, 0x1

    return v0
.end method

.method static synthetic lambda$5(Ljava/lang/Object;)V
    .registers 2

    .line 74
    const/4 v0, 0x1

    invoke-static {p0, v0}, Le/e/a/BulkSelection;->selectAll(Ljava/lang/Object;Z)V

    return-void
.end method

.method static synthetic lambda$6(Ljava/lang/Object;)V
    .registers 2

    .line 74
    const/4 v0, 0x0

    invoke-static {p0, v0}, Le/e/a/BulkSelection;->selectAll(Ljava/lang/Object;Z)V

    return-void
.end method

.method static synthetic lambda$7(Ljava/lang/Object;)V
    .registers 2

    .line 74
    const-string v0, "com.sauzask.nicoid.NicoidVideoListFragment$j"

    invoke-static {p0, v0}, Le/e/a/BulkSelection;->nativeClick(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$8(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 75
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$9(Ljava/lang/Object;Ljava/util/ArrayList;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 82
    invoke-static {p0, p1}, Le/e/a/BulkSelection;->delete(Ljava/lang/Object;Ljava/util/ArrayList;)V

    return-void
.end method

.method static log(Ljava/lang/Exception;)V
    .registers 3

    .line 122
    const-string v0, "nicoid-selection"

    const-string v1, "Selection operation failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public static menu(Landroid/app/Activity;Landroid/view/Menu;)V
    .registers 8

    invoke-static {p0, p1}, Le/e/a/BulkVideoActions215;->menu(Landroid/app/Activity;Landroid/view/Menu;)V

    .line 74
    sget-object v0, Le/e/a/BulkSelection;->ACTIVE:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    :try_start_0
    invoke-static {p0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v1, :cond_0

    move-object v0, p0

    goto :goto_0

    :cond_0
    :try_start_1
    const-string v1, "F"

    invoke-static {p0, v1}, Le/e/a/BulkSelection;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception p0

    goto/16 :goto_3

    :cond_1
    :goto_0
    if-nez v0, :cond_2

    return-void

    :cond_2
    :try_start_2
    invoke-static {v0}, Le/e/a/BulkSelection;->selecting(Ljava/lang/Object;)Z

    move-result v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    const/4 v2, 0x4

    const-string v3, "h0"

    const/4 v4, 0x5

    const-string v5, "g0"

    if-nez v1, :cond_4

    :try_start_3
    invoke-static {v0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v1

    if-eq v1, v2, :cond_3

    if-eq p0, v4, :cond_3

    const/16 v1, 0x8

    if-eq p0, v1, :cond_3

    const/16 v1, 0x9

    if-eq p0, v1, :cond_3

    return-void

    :cond_3
    const-string/jumbo p0, "\u8907\u6570\u9078\u629e"

    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Le/e/a/Revision201;->selectionEntry(Landroid/view/Menu;Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p0

    new-instance p1, Le/e/a/BulkSelection$$ExternalSyntheticLambda10;

    invoke-direct {p1, v0}, Le/e/a/BulkSelection$$ExternalSyntheticLambda10;-><init>(Ljava/lang/Object;)V

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    return-void

    :cond_4
    invoke-static {v0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v1

    if-ne v1, v4, :cond_5

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v1

    if-eq v1, v2, :cond_5

    const/4 v1, 0x1

    goto :goto_1

    :cond_5
    const/4 v1, 0x0

    :goto_1
    new-instance v2, Le/e/a/BulkSelection$$ExternalSyntheticLambda11;

    invoke-direct {v2, v0}, Le/e/a/BulkSelection$$ExternalSyntheticLambda11;-><init>(Ljava/lang/Object;)V

    new-instance v3, Le/e/a/BulkSelection$$ExternalSyntheticLambda12;

    invoke-direct {v3, v0}, Le/e/a/BulkSelection$$ExternalSyntheticLambda12;-><init>(Ljava/lang/Object;)V

    if-eqz v1, :cond_6

    new-instance v1, Le/e/a/BulkSelection$$ExternalSyntheticLambda13;

    invoke-direct {v1, v0}, Le/e/a/BulkSelection$$ExternalSyntheticLambda13;-><init>(Ljava/lang/Object;)V

    goto :goto_2

    :cond_6
    const/4 v1, 0x0

    :goto_2
    invoke-static {p1, p0, v2, v3, v1}, Le/e/a/SelectionUi191;->menu(Landroid/view/Menu;Landroid/content/Context;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_4

    :goto_3
    invoke-static {p0}, Le/e/a/BulkSelection;->log(Ljava/lang/Exception;)V

    :goto_4
    return-void
.end method

.method public static modeChanged(Ljava/lang/Object;)V
    .registers 4

    invoke-static {p0}, Le/e/a/BulkVideoActions215;->onSelectionChanged(Ljava/lang/Object;)V

    .line 30
    :try_start_0
    invoke-static {p0}, Le/e/a/BulkSelection;->selecting(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Le/e/a/BulkSelection;->OWNERS:Ljava/util/Map;

    invoke-static {p0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "C"

    goto :goto_0

    :cond_0
    const-string v1, "p0"

    :goto_0
    invoke-static {p0, v1}, Le/e/a/BulkSelection;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/BulkSelection;->install(Ljava/lang/Object;)V

    goto :goto_3

    .line 31
    :cond_1
    sget-object v0, Le/e/a/BulkSelection;->FOOTERS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Le/e/a/BulkSelection;->ACTIVE:Ljava/util/Map;

    invoke-static {p0}, Le/e/a/BulkSelection;->activity(Ljava/lang/Object;)Landroid/app/Activity;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/BulkSelection;->activity(Ljava/lang/Object;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    invoke-static {p0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "S"

    goto :goto_1

    :cond_2
    const-string v0, "selectionCount"

    :goto_1
    invoke-static {p0, v0}, Le/e/a/BulkSelection;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Landroid/widget/TextView;

    if-eqz v1, :cond_3

    check-cast v0, Landroid/widget/TextView;

    invoke-static {v0}, Le/e/a/SelectionUi191;->headerView(Landroid/widget/TextView;)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_3
    invoke-static {p0}, Le/e/a/BulkSelection;->rows(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_4

    .line 32
    :goto_3
    invoke-static {p0}, Le/e/a/BulkSelection;->refresh(Ljava/lang/Object;)V

    .line 33
    goto :goto_4

    .line 31
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Le/e/a/BulkSelection;->set(Ljava/lang/Object;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 33
    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/BulkSelection;->log(Ljava/lang/Exception;)V

    .line 34
    :goto_4
    return-void
.end method

.method static nativeClick(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 6

    .line 78
    :try_start_0
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Class;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p1

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p0, v0, v3

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View$OnClickListener;

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/BulkSelection;->log(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static owner(Landroid/widget/AdapterView;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 42
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/widget/AdapterView;->getOnItemLongClickListener()Landroid/widget/AdapterView$OnItemLongClickListener;

    move-result-object p0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 43
    const-string v2, "com.sauzask.nicoid.NicoidCacheManagerActivity$c"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v3, "a"

    if-eqz v2, :cond_1

    :try_start_1
    invoke-static {p0, v3}, Le/e/a/BulkSelection;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 44
    :cond_1
    const-string v2, "com.sauzask.nicoid.NicoidVideoListFragment$f"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {p0, v3}, Le/e/a/BulkSelection;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "g0"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "h0"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const/4 v3, 0x4

    if-eq v2, v3, :cond_2

    const/4 v2, 0x5

    if-eq v1, v2, :cond_2

    const/16 v2, 0x8

    if-eq v1, v2, :cond_2

    const/16 v2, 0x9

    if-ne v1, v2, :cond_3

    :cond_2
    return-object p0

    .line 45
    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/BulkSelection;->log(Ljava/lang/Exception;)V

    :cond_3
    return-object v0
.end method

.method static refresh(Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {p0}, Le/e/a/BulkVideoActions215;->onSelectionChanged(Ljava/lang/Object;)V

    .line 26
    invoke-static {p0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "C"

    goto :goto_0

    :cond_0
    const-string v0, "p0"

    :goto_0
    invoke-static {p0, v0}, Le/e/a/BulkSelection;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "updateSelectionCount"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/BulkSelection;->updateCount(Ljava/lang/Object;)V

    return-void
.end method

.method static rows(Ljava/lang/Object;)Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/ArrayList<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 22
    invoke-static {p0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "z"

    goto :goto_0

    :cond_0
    const-string v0, "a0"

    :goto_0
    invoke-static {p0, v0}, Le/e/a/BulkSelection;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/ArrayList;

    return-object p0
.end method

.method static selectAll(Ljava/lang/Object;Z)V
    .registers 4

    .line 76
    :try_start_0
    invoke-static {p0}, Le/e/a/BulkSelection;->rows(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p0}, Le/e/a/BulkSelection;->refresh(Ljava/lang/Object;)V

    goto :goto_1

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1, p1}, Le/e/a/BulkSelection;->set(Ljava/lang/Object;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    invoke-static {p0}, Le/e/a/BulkSelection;->log(Ljava/lang/Exception;)V

    :goto_1
    return-void
.end method

.method static selecting(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 21
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {p0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "G"

    goto :goto_0

    :cond_0
    const-string v1, "k0"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method static set(Ljava/lang/Object;Z)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Ljava/lang/Object;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    const-string v3, "a"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "isselect"

    aput-object v2, v1, v4

    aput-object p1, v1, v5

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method static toggleMode(Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {p0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "s"

    goto :goto_0

    :cond_0
    const-string v1, "Y"

    :goto_0
    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method static updateCount(Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 38
    invoke-static {p0}, Le/e/a/BulkSelection;->rows(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_4

    .line 39
    invoke-static {p0}, Le/e/a/BulkSelection;->cache(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "S"

    goto :goto_1

    :cond_1
    const-string v0, "selectionCount"

    :goto_1
    invoke-static {p0, v0}, Le/e/a/BulkSelection;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v3, v0, Landroid/widget/TextView;

    if-eqz v3, :cond_3

    check-cast v0, Landroid/widget/TextView;

    invoke-static {p0}, Le/e/a/BulkSelection;->rows(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-static {v0, v2, v3}, Le/e/a/SelectionUi191;->selection(Landroid/widget/TextView;II)V

    invoke-static {v0}, Le/e/a/SelectionUi191;->headerView(Landroid/widget/TextView;)Landroid/view/View;

    move-result-object v0

    invoke-static {p0}, Le/e/a/BulkSelection;->selecting(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_2

    :cond_2
    const/16 v1, 0x8

    :goto_2
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_3
    sget-object v0, Le/e/a/BulkSelection;->FOOTERS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/widget/LinearLayout;

    invoke-static {p0, v2}, Le/e/a/SelectionUi191;->enabled(Landroid/widget/LinearLayout;I)V

    invoke-static {p0, v2}, Le/e/a/BulkMove211;->refresh(Landroid/widget/LinearLayout;I)V

    .line 40
    return-void

    .line 38
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Le/e/a/BulkSelection;->checked(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method
