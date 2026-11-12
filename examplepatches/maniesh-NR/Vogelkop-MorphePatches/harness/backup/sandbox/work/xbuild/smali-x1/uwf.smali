.class public final Luwf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcz3;


# instance fields
.field public a:Landroid/util/Pair;

.field public final b:Landroid/view/ViewGroup;

.field public final c:Lgbf;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Lgbf;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luwf;->b:Landroid/view/ViewGroup;

    iput-object p2, p0, Luwf;->c:Lgbf;

    iget-object p1, p2, Lgbf;->p:Li7f;

    invoke-virtual {p1, p0}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-object p0, p0, Luwf;->a:Landroid/util/Pair;

    if-nez p0, :cond_5

    return-void

    :cond_5
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p0, Lq2f;

    sget-object v0, Lhjm;->b:Lhjm;

    invoke-virtual {p0, v0}, Lq2f;->f(Lhjm;)V

    return-void
.end method

.method public final b()V
    .registers 1

    iget-object p0, p0, Luwf;->a:Landroid/util/Pair;

    if-eqz p0, :cond_b

    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p0, Lq2f;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_b
    return-void
.end method
