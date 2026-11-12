.class public final Ll32;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public final b:Ljava/util/LinkedHashMap;

.field public final c:Ljava/util/LinkedHashMap;

.field public final d:Lk32;

.field public final e:Li7f;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 4

    sget-object v0, Lngh;->a:Lr16;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ll32;->a:Lumi;

    new-instance p2, Ljava/util/LinkedHashMap;

    invoke-direct {p2}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p2, p0, Ll32;->b:Ljava/util/LinkedHashMap;

    new-instance p2, Ljava/util/LinkedHashMap;

    invoke-direct {p2}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p2, p0, Ll32;->c:Ljava/util/LinkedHashMap;

    new-instance p2, Lk32;

    const/4 v0, 0x0

    invoke-direct {p2, p1, v0}, Lk32;-><init>(Landroid/content/Context;B)V

    iput-object p2, p0, Ll32;->d:Lk32;

    new-instance p1, Li7f;

    invoke-direct {p1}, Li7f;-><init>()V

    iput-object p1, p0, Ll32;->e:Li7f;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;ZLcv2;Lpa;)Ld12;
    .registers 14

    if-eqz p3, :cond_5

    iget-object v0, p0, Ll32;->c:Ljava/util/LinkedHashMap;

    goto :goto_7

    :cond_5
    iget-object v0, p0, Ll32;->b:Ljava/util/LinkedHashMap;

    :goto_7
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    const/4 v2, 0x0

    if-eqz v1, :cond_17

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ld32;

    goto :goto_18

    :cond_17
    move-object v1, v2

    :goto_18
    if-nez v1, :cond_58

    new-instance v1, Ld32;

    if-eqz p3, :cond_37

    new-instance p0, Lg32;

    invoke-direct {p0, v2}, Le32;-><init>(Lcv2;)V

    new-instance p2, Lc32;

    new-instance p3, Lf32;

    const/4 v2, 0x0

    invoke-direct {p3, v2}, Lf32;-><init>(B)V

    invoke-direct {p2, p3}, Lc32;-><init>(Lkotlin/jvm/functions/Function1;)V

    sget-object p3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p4, p3}, Lcv2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, p2}, Lf12;->i(Ld12;)V

    goto :goto_4c

    :cond_37
    new-instance v2, Lj32;

    sget-object p3, Lngh;->a:Lr16;

    new-instance v7, Lf9;

    const/16 p3, 0x8

    invoke-direct {v7, p0, p1, p2, p3}, Lf9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v3, p0, Ll32;->a:Lumi;

    iget-object v4, p0, Ll32;->d:Lk32;

    move-object v5, p1

    move-object v6, p4

    invoke-direct/range {v2 .. v7}, Lj32;-><init>(Lumi;Lcom/opera/android/Lazy;Ljava/lang/String;Lcv2;Lf9;)V

    move-object p0, v2

    :goto_4c
    invoke-direct {v1, p0, p5}, Ld32;-><init>(Le32;Lpa;)V

    new-instance p0, Ljava/lang/ref/WeakReference;

    invoke-direct {p0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_79

    :cond_58
    iget-object v2, v1, Ld32;->a:Le32;

    iget-object v3, v1, Ld32;->b:Lpa;

    iput-object p5, v1, Ld32;->b:Lpa;

    invoke-virtual {v3}, Lpa;->invoke()Ljava/lang/Object;

    iget-boolean v3, v1, Ld32;->c:Z

    if-eqz v3, :cond_6d

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual/range {p0 .. p5}, Ll32;->a(Ljava/lang/String;Ljava/lang/String;ZLcv2;Lpa;)Ld12;

    move-result-object p0

    return-object p0

    :cond_6d
    iget-object p0, v2, Lf12;->a:Ld12;

    if-eqz p0, :cond_77

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p4, p0}, Lcv2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_79

    :cond_77
    iput-object p4, v2, Le32;->c:Lcv2;

    :goto_79
    iget-object p0, v1, Ld32;->a:Le32;

    return-object p0
.end method
