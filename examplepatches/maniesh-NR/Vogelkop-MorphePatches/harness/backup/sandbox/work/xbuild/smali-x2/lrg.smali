.class public final Llrg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhpg;


# static fields
.field public static final synthetic d:[Lxtb;


# instance fields
.field public a:Lkotlin/jvm/functions/Function1;

.field public final b:Ljava/util/ArrayList;

.field public final c:Lfz2;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lpee;

    const-class v1, Llrg;

    const-string v2, "currentState"

    const-string v3, "getCurrentState()Z"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v1, Luqh;->a:Lvqh;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Llrg;->d:[Lxtb;

    return-void
.end method

.method public constructor <init>(Z)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lh50;->H:Lh50;

    iput-object v0, p0, Llrg;->a:Lkotlin/jvm/functions/Function1;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Llrg;->b:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    new-instance v0, Lfz2;

    const/4 v1, 0x6

    invoke-direct {v0, p1, p0, v1}, Lfz2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, p0, Llrg;->c:Lfz2;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 4

    sget-object v0, Llrg;->d:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iget-object p0, p0, Llrg;->c:Lfz2;

    invoke-virtual {p0, v0, p1}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    return-void
.end method

.method public final b()Z
    .registers 3

    sget-object v0, Llrg;->d:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Llrg;->c:Lfz2;

    iget-object p0, p0, La7f;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public final c(Lcom/usercentrics/sdk/ui/components/UCToggle;)V
    .registers 11

    iget-object v0, p0, Llrg;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_e

    :cond_d
    const/4 v0, 0x0

    :goto_e
    if-eqz v0, :cond_33

    invoke-virtual {p0}, Llrg;->b()Z

    move-result v0

    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v1

    if-eq v0, v1, :cond_21

    invoke-virtual {p0}, Llrg;->b()Z

    move-result v0

    invoke-virtual {p1, v0}, Lcom/usercentrics/sdk/ui/components/UCToggle;->a(Z)V

    :cond_21
    new-instance v1, Ls2e;

    const/4 v7, 0x0

    const/16 v8, 0x1c

    const/4 v2, 0x1

    const-class v4, Llrg;

    const-string v5, "onStateChange"

    const-string v6, "onStateChange(Z)V"

    move-object v3, p0

    invoke-direct/range {v1 .. v8}, Ls2e;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iput-object v1, p1, Lcom/usercentrics/sdk/ui/components/UCToggle;->T:Lkotlin/jvm/functions/Function1;

    :cond_33
    return-void
.end method

.method public final dispose()V
    .registers 5

    iget-object v0, p0, Llrg;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v1, :cond_15

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lhpg;

    invoke-interface {v3}, Lhpg;->dispose()V

    goto :goto_7

    :cond_15
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    sget-object v0, Lh50;->G:Lh50;

    iput-object v0, p0, Llrg;->a:Lkotlin/jvm/functions/Function1;

    return-void
.end method
