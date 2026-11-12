.class public final Lvug;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lslk;

.field public final c:Lohg;

.field public final d:Lyvg;

.field public final e:Ljtg;

.field public final f:Lorm;

.field public final g:Lnak;

.field public final h:Lnak;

.field public final i:Lnak;

.field public final j:Lnak;


# direct methods
.method public constructor <init>(Lslk;Lohg;Lyvg;Ljtg;Lorm;)V
    .registers 6

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p1, p0, Lvug;->b:Lslk;

    iput-object p2, p0, Lvug;->c:Lohg;

    iput-object p3, p0, Lvug;->d:Lyvg;

    iput-object p4, p0, Lvug;->e:Ljtg;

    iput-object p5, p0, Lvug;->f:Lorm;

    new-instance p1, Ltug;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ltug;-><init>(Z)V

    invoke-static {p1}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p1

    iput-object p1, p0, Lvug;->g:Lnak;

    const/4 p2, 0x0

    invoke-static {p2}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object p2

    iput-object p2, p0, Lvug;->h:Lnak;

    iput-object p1, p0, Lvug;->i:Lnak;

    iput-object p2, p0, Lvug;->j:Lnak;

    return-void
.end method


# virtual methods
.method public final f(Lky9;)V
    .registers 4

    sget-object v0, Ley9;->a:Ley9;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/16 v1, 0x1b

    iget-object p0, p0, Lvug;->f:Lorm;

    if-eqz v0, :cond_14

    const-string p1, "already claimed"

    check-cast p0, Lx5f;

    invoke-virtual {p0, v1, p1}, Lx5f;->R(ILjava/lang/String;)V

    return-void

    :cond_14
    sget-object v0, Lhy9;->a:Lhy9;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    const-string p1, "not available"

    check-cast p0, Lx5f;

    invoke-virtual {p0, v1, p1}, Lx5f;->R(ILjava/lang/String;)V

    return-void

    :cond_24
    instance-of p0, p1, Lfy9;

    if-nez p0, :cond_43

    sget-object p0, Lgy9;->a:Lgy9;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_43

    sget-object p0, Liy9;->a:Liy9;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_43

    sget-object p0, Ljy9;->a:Ljy9;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_43

    invoke-static {}, Lh9o;->p()V

    :cond_43
    return-void
.end method

.method public final g(Lh4k;)V
    .registers 4

    instance-of v0, p1, Ld4k;

    const/16 v1, 0x1b

    iget-object p0, p0, Lvug;->f:Lorm;

    if-eqz v0, :cond_18

    check-cast p1, Ld4k;

    iget-object p1, p1, Ld4k;->a:Ljava/lang/String;

    const-string v0, "integrity error: "

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    check-cast p0, Lx5f;

    invoke-virtual {p0, v1, p1}, Lx5f;->R(ILjava/lang/String;)V

    return-void

    :cond_18
    sget-object v0, La4k;->a:La4k;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    const-string p1, "already claimed"

    check-cast p0, Lx5f;

    invoke-virtual {p0, v1, p1}, Lx5f;->R(ILjava/lang/String;)V

    return-void

    :cond_28
    sget-object p0, Lb4k;->a:Lb4k;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_53

    sget-object p0, Lc4k;->a:Lc4k;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_53

    sget-object p0, Le4k;->a:Le4k;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_53

    sget-object p0, Lf4k;->a:Lf4k;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_53

    sget-object p0, Lg4k;->a:Lg4k;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_53

    invoke-static {}, Lh9o;->p()V

    :cond_53
    return-void
.end method
