.class public final synthetic Ljel;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Llel;


# direct methods
.method public synthetic constructor <init>(Llel;B)V
    .registers 3

    iput-byte p2, p0, Ljel;->a:B

    iput-object p1, p0, Ljel;->b:Llel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 7

    iget-byte p1, p0, Ljel;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Ljel;->b:Llel;

    packed-switch p1, :pswitch_data_100

    iget-object p0, p0, Llel;->d:Lcom/opera/android/browser/OperaPageRootView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string v1, "make_default_banner.dismissed"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    const-string v1, "make_default_banner.show_count"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void

    :pswitch_28
    iget-object p0, p0, Llel;->d:Lcom/opera/android/browser/OperaPageRootView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->j()Lku5;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, LJ/N;->MphJ2uhp()Z

    move-result p1

    if-eqz p1, :cond_60

    iget-object p1, p0, Lku5;->a:Lc5o;

    invoke-virtual {p1}, Lc5o;->A()V

    iget-object p1, p0, Lku5;->c:Lqb7;

    new-instance v1, Lfu5;

    invoke-direct {v1, p0, v0}, Lfu5;-><init>(Lku5;B)V

    iget-object p0, p1, Lqb7;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Boolean;

    if-nez p0, :cond_5d

    iget-object p0, p1, Lqb7;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_60

    :cond_5d
    invoke-virtual {v1, p0}, Lfu5;->run(Ljava/lang/Object;)V

    :cond_60
    :goto_60
    return-void

    :pswitch_61
    iget-object p1, p0, Llel;->d:Lcom/opera/android/browser/OperaPageRootView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p0, p0, Llel;->g:Lumi;

    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljl4;

    const/16 v2, 0x19

    invoke-direct {v1, v0, v2}, Ljl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    new-instance v0, Lkw0;

    invoke-direct {v0, p1}, Lkw0;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lnml;->c(Ln5o;)Loml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Loml;->a(Ljava/lang/Object;Ljri;)V

    return-void

    :pswitch_8d
    iget-object p0, p0, Llel;->f:Lqt3;

    invoke-virtual {p0}, Lqt3;->run()V

    return-void

    :pswitch_93
    iget-object p0, p0, Llel;->d:Lcom/opera/android/browser/OperaPageRootView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->j()Lku5;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, LJ/N;->MphJ2uhp()Z

    move-result p1

    if-eqz p1, :cond_ff

    new-instance p1, Liu5;

    const-string v1, "Stockholm"

    const-string v2, "SEK:1200"

    const-string v3, "Grand Hotel Stockholm"

    invoke-direct {p1, v3, v1, v2}, Liu5;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Liu5;

    const-string v2, "Gothenburg"

    const-string v3, "SEK:890"

    const-string v4, "Hotel Mariaberg"

    invoke-direct {v1, v4, v2, v3}, Liu5;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    filled-new-array {p1, v1}, [Ljava/lang/Object;

    move-result-object p1

    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    :goto_ce
    if-ge v0, v2, :cond_db

    aget-object v3, p1, v0

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_ce

    :cond_db
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lku5;->f:Ljava/util/List;

    iget-object p1, p0, Lku5;->a:Lc5o;

    invoke-virtual {p1}, Lc5o;->A()V

    invoke-virtual {p0}, Lku5;->b()V

    iget-object p0, p0, Lku5;->e:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_ef
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_ff

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lju5;

    invoke-interface {p1}, Lju5;->onDataChanged()V

    goto :goto_ef

    :cond_ff
    return-void

    :pswitch_data_100
    .packed-switch 0x0
        :pswitch_93
        :pswitch_8d
        :pswitch_61
        :pswitch_28
    .end packed-switch
.end method
