.class public final synthetic Laj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcr9;


# instance fields
.field public final synthetic a:Lej;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/util/ArrayList;

.field public final synthetic d:Lkotlin/jvm/functions/Function2;


# direct methods
.method public synthetic constructor <init>(Lej;ZLjava/util/ArrayList;Lkotlin/jvm/functions/Function2;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laj;->a:Lej;

    iput-boolean p2, p0, Laj;->b:Z

    iput-object p3, p0, Laj;->c:Ljava/util/ArrayList;

    iput-object p4, p0, Laj;->d:Lkotlin/jvm/functions/Function2;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    check-cast p1, Lcj;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, p0, Laj;->a:Lej;

    iget-object v2, v1, Lej;->a:Ljava/util/LinkedHashSet;

    invoke-interface {v2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    if-nez v0, :cond_26

    iget-boolean p1, p0, Laj;->b:Z

    if-eqz p1, :cond_26

    new-instance p1, Lve5;

    const/4 v0, 0x7

    invoke-direct {p1, v0}, Lve5;-><init>(B)V

    iget-object v0, p0, Laj;->c:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2, p1}, Lej;->a(Ljava/util/ArrayList;ZLkotlin/jvm/functions/Function2;)V

    :cond_26
    iget-object p0, p0, Laj;->d:Lkotlin/jvm/functions/Function2;

    invoke-interface {p0, p2, p3}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
