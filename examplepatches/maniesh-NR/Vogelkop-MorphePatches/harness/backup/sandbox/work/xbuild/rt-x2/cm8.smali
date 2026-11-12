.class public final Lcm8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljvk;


# instance fields
.field public final synthetic a:Ldg7;

.field public final synthetic b:Ldm8;


# direct methods
.method public constructor <init>(Ldm8;Ldg7;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcm8;->a:Ldg7;

    iput-object p1, p0, Lcm8;->b:Ldm8;

    return-void
.end method


# virtual methods
.method public final h(Landroidx/recyclerview/widget/i;[Lhvk;)V
    .registers 3

    iget-object p0, p0, Lcm8;->b:Ldm8;

    iget-object p0, p0, Ldm8;->w:Lmvk;

    const/4 p1, 0x1

    aput-object p0, p2, p1

    const/4 p1, 0x0

    aput-object p0, p2, p1

    return-void
.end method

.method public final k(Landroidx/recyclerview/widget/i;Lhvk;)V
    .registers 3

    check-cast p1, Lpmj;

    iget-object p1, p1, Lpmj;->c:Ljava/lang/String;

    if-nez p1, :cond_7

    return-void

    :cond_7
    iget-object p0, p0, Lcm8;->a:Ldg7;

    invoke-virtual {p0, p1}, Ldg7;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final n(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method
