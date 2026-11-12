.class public final Lolm;
.super Lqlm;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 3

    const-string v0, "PRIMARY"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final h(Lr22;Ljava/util/Set;)Z
    .registers 4

    if-eqz p1, :cond_28

    iget-object p0, p1, Lr22;->c:Ljava/lang/Object;

    check-cast p0, Lblm;

    sget-object v0, Lblm;->b:Lblm;

    if-eq p0, v0, :cond_26

    check-cast p2, Ljava/lang/Iterable;

    invoke-static {p2}, Lkotlin/collections/CollectionsKt;->a0(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    if-eqz p0, :cond_28

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    iget-object p1, p1, Lr22;->d:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldlm;

    iget-object p0, p0, Ldlm;->c:Lr22;

    if-nez p0, :cond_28

    :cond_26
    const/4 p0, 0x1

    return p0

    :cond_28
    const/4 p0, 0x0

    return p0
.end method
