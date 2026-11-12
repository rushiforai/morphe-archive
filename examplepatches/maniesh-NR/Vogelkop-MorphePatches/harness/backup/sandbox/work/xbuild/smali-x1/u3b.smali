.class public final Lu3b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly9n;


# instance fields
.field public final a:Lyzb;


# direct methods
.method public constructor <init>(Lyzb;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lu3b;->a:Lyzb;

    return-void
.end method


# virtual methods
.method public final T(Landroid/view/View;II)V
    .registers 4

    const/16 p3, 0x64

    if-ne p2, p3, :cond_38

    invoke-virtual {p1}, Landroid/view/View;->isShown()Z

    move-result p2

    if-eqz p2, :cond_38

    iget-object p0, p0, Lu3b;->a:Lyzb;

    iget-object p0, p0, Lyzb;->b:Ljava/lang/Object;

    check-cast p0, Lp12;

    iget-object p2, p0, Lp12;->d:Ljava/lang/Object;

    check-cast p2, Lx79;

    iget-object p2, p2, Lx79;->a:Ljava/lang/Object;

    check-cast p2, Lcan;

    invoke-virtual {p2, p1}, Lcan;->a(Landroid/view/View;)V

    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lru9;

    iget-object p1, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p2, "main.menu.premium_promo.top.impressions"

    const/4 p3, 0x0

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    add-int/lit8 p1, p1, 0x1

    iget-object p3, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p3, Landroid/content/SharedPreferences$Editor;

    invoke-interface {p3, p2, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_38
    return-void
.end method
