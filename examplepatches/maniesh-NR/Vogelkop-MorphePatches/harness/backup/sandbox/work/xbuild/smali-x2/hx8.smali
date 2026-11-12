.class public final Lhx8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldue;
.implements Lp5j;


# instance fields
.field public final a:Lj4c;

.field public final b:Lj4c;

.field public final c:Lyw8;

.field public d:Lbwf;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lyw8;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, p1, Lxv1;->P0:Lj4c;

    iput-object v0, p0, Lhx8;->a:Lj4c;

    iget-object p1, p1, Lxv1;->k0:Lj4c;

    iput-object p1, p0, Lhx8;->b:Lj4c;

    iput-object p2, p0, Lhx8;->c:Lyw8;

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "enable_newsfeed"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11

    const-string v0, "speed_dial.enabled"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_11

    return-void

    :cond_11
    invoke-virtual {p0}, Lhx8;->a()V

    return-void
.end method

.method public final a()V
    .registers 10

    iget-object v0, p0, Lhx8;->d:Lbwf;

    if-eqz v0, :cond_39

    iget-object p0, p0, Lhx8;->c:Lyw8;

    iget-object p0, p0, Lyw8;->a:Lbx8;

    iget-object v1, p0, Lbx8;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    :goto_11
    if-ge v5, v2, :cond_36

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lzw8;

    iget-object v6, v6, Lzw8;->a:Lbwf;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2d

    move v6, v3

    goto :goto_31

    :cond_2d
    invoke-virtual {v6, v0}, Lbwf;->equals(Ljava/lang/Object;)Z

    move-result v6

    :goto_31
    if-nez v6, :cond_37

    add-int/lit8 v4, v4, 0x1

    goto :goto_11

    :cond_36
    const/4 v4, -0x1

    :cond_37
    if-gez v4, :cond_3a

    :cond_39
    return-void

    :cond_3a
    new-instance v0, Lzw8;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzw8;

    iget-object v2, v2, Lzw8;->a:Lbwf;

    invoke-direct {v0, v2}, Lzw8;-><init>(Lbwf;)V

    invoke-virtual {v1, v4, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Landroidx/viewpager/widget/PagerAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public final b(Lcue;)V
    .registers 2

    invoke-virtual {p0}, Lhx8;->a()V

    return-void
.end method

.method public final c(Lbwf;)V
    .registers 5

    iget-object v0, p0, Lhx8;->d:Lbwf;

    iget-object v1, p0, Lhx8;->a:Lj4c;

    iget-object v2, p0, Lhx8;->b:Lj4c;

    if-eqz v0, :cond_1a

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfue;

    invoke-virtual {v0, p0}, Lfue;->e(Ldue;)V

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    :cond_1a
    iput-object p1, p0, Lhx8;->d:Lbwf;

    if-eqz p1, :cond_30

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lfue;

    invoke-virtual {p1, p0}, Lfue;->b(Ldue;)V

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    :cond_30
    return-void
.end method
