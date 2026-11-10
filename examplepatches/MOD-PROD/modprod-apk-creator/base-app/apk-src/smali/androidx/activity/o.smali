.class public final Landroidx/activity/o;
.super Lb0/d;
.source "SourceFile"

# interfaces
.implements La0/a;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, Landroidx/activity/o;->a:I

    iput-object p2, p0, Landroidx/activity/o;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 8

    iget v0, p0, Landroidx/activity/o;->a:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Landroidx/activity/o;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/activity/l;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sget-object v2, Lb0/f;->a:Lb0/g;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lb0/b;

    const-class v3, Landroidx/lifecycle/D;

    invoke-direct {v2, v3}, Lb0/b;-><init>(Ljava/lang/Class;)V

    new-instance v4, LI/d;

    invoke-interface {v2}, Lb0/a;->a()Ljava/lang/Class;

    move-result-object v2

    const-string v5, "null cannot be cast to non-null type java.lang.Class<T of kotlin.jvm.JvmClassMappingKt.<get-java>>"

    invoke-static {v2, v5}, Lb0/c;->c(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v4, v2}, LI/d;-><init>(Ljava/lang/Class;)V

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v2, 0x0

    new-array v4, v2, [LI/d;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [LI/d;

    array-length v4, v1

    invoke-static {v1, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [LI/d;

    const-string v4, "initializers"

    invoke-static {v1, v4}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0}, Landroidx/activity/l;->b()Landroidx/lifecycle/G;

    move-result-object v4

    sget-object v5, LI/a;->b:LI/a;

    const-string v6, "initialExtras"

    invoke-static {v5, v6}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v6, Ljava/util/LinkedHashMap;

    invoke-direct {v6}, Ljava/util/LinkedHashMap;-><init>()V

    iget-object v5, v5, LI/b;->a:Ljava/util/LinkedHashMap;

    invoke-interface {v6, v5}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v5

    if-eqz v5, :cond_0

    sget-object v5, Landroidx/lifecycle/F;->a:Landroidx/lifecycle/F;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v7

    invoke-interface {v6, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    sget-object v5, Landroidx/lifecycle/B;->a:Landroidx/lifecycle/F;

    invoke-interface {v6, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v5, Landroidx/lifecycle/B;->b:Landroidx/lifecycle/F;

    invoke-interface {v6, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v5

    if-eqz v5, :cond_1

    sget-object v5, Landroidx/lifecycle/B;->c:Landroidx/lifecycle/F;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    invoke-interface {v6, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    const-string v0, "store"

    invoke-static {v4, v0}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, v4, Landroidx/lifecycle/G;->a:Ljava/util/LinkedHashMap;

    const-string v4, "androidx.lifecycle.internal.SavedStateHandlesVM"

    invoke-virtual {v0, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/lifecycle/E;

    invoke-virtual {v3, v5}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    const-string v0, "null cannot be cast to non-null type T of androidx.lifecycle.ViewModelProvider.get"

    invoke-static {v5, v0}, Lb0/c;->c(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    new-instance v5, Ljava/util/LinkedHashMap;

    invoke-direct {v5}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-interface {v5, v6}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    sget-object v6, Landroidx/lifecycle/F;->b:Landroidx/lifecycle/F;

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :try_start_0
    array-length v5, v1

    const/4 v6, 0x0

    :goto_0
    if-ge v2, v5, :cond_4

    aget-object v7, v1, v2

    iget-object v7, v7, LI/d;->a:Ljava/lang/Class;

    invoke-virtual {v7, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    new-instance v6, Landroidx/lifecycle/D;

    invoke-direct {v6}, Landroidx/lifecycle/D;-><init>()V
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    if-eqz v6, :cond_6

    invoke-interface {v0, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/lifecycle/E;

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Landroidx/lifecycle/E;->a()V

    :cond_5
    move-object v5, v6

    :goto_1
    check-cast v5, Landroidx/lifecycle/D;

    return-object v5

    :cond_6
    :try_start_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "No initializer set for given class "

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catch Ljava/lang/AbstractMethodError; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Factory.create(String) is unsupported.  This Factory requires `CreationExtras` to be passed into `create` method."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    iget-object v0, p0, Landroidx/activity/o;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/activity/v;

    invoke-virtual {v0}, Landroidx/activity/v;->a()V

    sget-object v0, LU/c;->c:LU/c;

    return-object v0

    :pswitch_1
    iget-object v0, p0, Landroidx/activity/o;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/activity/v;

    iget-object v1, v0, Landroidx/activity/v;->b:LV/a;

    invoke-virtual {v1}, LV/a;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/AbstractList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v1

    :cond_7
    invoke-interface {v1}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_8

    invoke-interface {v1}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Landroidx/fragment/app/k;

    iget-boolean v4, v4, Landroidx/fragment/app/k;->a:Z

    if-eqz v4, :cond_7

    goto :goto_2

    :cond_8
    move-object v2, v3

    :goto_2
    check-cast v2, Landroidx/fragment/app/k;

    iput-object v3, v0, Landroidx/activity/v;->c:Landroidx/fragment/app/k;

    sget-object v0, LU/c;->c:LU/c;

    return-object v0

    :pswitch_2
    iget-object v0, p0, Landroidx/activity/o;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/activity/v;

    invoke-virtual {v0}, Landroidx/activity/v;->a()V

    sget-object v0, LU/c;->c:LU/c;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
