.class public final Leco;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkx3;


# instance fields
.field public final synthetic a:Lcom/opera/android/search/YandexPromotionTabHelper;


# direct methods
.method public constructor <init>(Lcom/opera/android/search/YandexPromotionTabHelper;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Leco;->a:Lcom/opera/android/search/YandexPromotionTabHelper;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/String;)V
    .registers 2

    if-nez p1, :cond_1b

    iget-object p0, p0, Leco;->a:Lcom/opera/android/search/YandexPromotionTabHelper;

    iget-object p0, p0, Lcom/opera/android/search/YandexPromotionTabHelper;->a:Lp12;

    iget-object p0, p0, Lp12;->a:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_1b
    return-void
.end method
