.class public abstract Lr41;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final a(Lih5;I)V
    .registers 5

    check-cast p0, Lvt9;

    const v0, 0x5e9b7ab6

    invoke-virtual {p0, v0}, Lvt9;->Y(I)Lvt9;

    const/4 v0, 0x0

    if-eqz p1, :cond_d

    const/4 v1, 0x1

    goto :goto_e

    :cond_d
    move v1, v0

    :goto_e
    and-int/lit8 v2, p1, 0x1

    invoke-virtual {p0, v2, v1}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_44

    sget-object v1, Lcab;->a:Lhp7;

    invoke-virtual {p0, v1}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_3a

    const v1, -0x70b1c301

    invoke-virtual {p0, v1}, Lvt9;->W(I)V

    sget-object v1, Lorg/jetbrains/compose/resources/AndroidContextProvider;->a:Landroid/content/Context;

    sget-object v1, Lj41;->b:Lhp7;

    invoke-virtual {p0, v1}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    sput-object v1, Lorg/jetbrains/compose/resources/AndroidContextProvider;->a:Landroid/content/Context;

    invoke-virtual {p0, v0}, Lvt9;->p(Z)V

    goto :goto_47

    :cond_3a
    const v1, -0x70b0a1f4    # -1.0224001E-29f

    invoke-virtual {p0, v1}, Lvt9;->W(I)V

    invoke-virtual {p0, v0}, Lvt9;->p(Z)V

    goto :goto_47

    :cond_44
    invoke-virtual {p0}, Lvt9;->Q()V

    :goto_47
    invoke-virtual {p0}, Lvt9;->r()Lznh;

    move-result-object p0

    if-eqz p0, :cond_56

    new-instance v0, Lve5;

    const/16 v1, 0xe

    invoke-direct {v0, v1, p1}, Lve5;-><init>(BI)V

    iput-object v0, p0, Lznh;->d:Lkotlin/jvm/functions/Function2;

    :cond_56
    return-void
.end method

.method public static final b()Landroid/content/Context;
    .registers 1

    invoke-static {}, Landroidx/test/platform/app/InstrumentationRegistry;->getInstrumentation()Landroid/app/Instrumentation;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Instrumentation;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method
