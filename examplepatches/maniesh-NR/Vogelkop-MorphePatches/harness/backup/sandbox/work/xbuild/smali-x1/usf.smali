.class public final synthetic Lusf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Z

.field public final synthetic c:Z

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(ZZZZ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lusf;->a:Z

    iput-boolean p2, p0, Lusf;->b:Z

    iput-boolean p3, p0, Lusf;->c:Z

    iput-boolean p4, p0, Lusf;->d:Z

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    check-cast p1, Lak0;

    iget-object p1, p1, Lak0;->f:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsr0;

    iget-object v0, p1, Lsr0;->a:Lqr0;

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-boolean v3, p0, Lusf;->a:Z

    invoke-virtual {v0, v1, v2, v3}, Ljf0;->r(IIZ)V

    iget-object p1, p1, Lsr0;->a:Lqr0;

    iget-boolean v0, p0, Lusf;->b:Z

    invoke-virtual {p1, v2, v2, v0}, Ljf0;->r(IIZ)V

    const/4 v0, 0x2

    iget-boolean v1, p0, Lusf;->c:Z

    invoke-virtual {p1, v0, v2, v1}, Ljf0;->r(IIZ)V

    const/4 v0, 0x3

    iget-boolean p0, p0, Lusf;->d:Z

    invoke-virtual {p1, v0, v2, p0}, Ljf0;->r(IIZ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
