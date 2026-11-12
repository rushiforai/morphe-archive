.class public final Ltg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public a:Z

.field public b:Z

.field public c:Ljava/lang/Object;

.field public final synthetic d:Lf7f;


# direct methods
.method public constructor <init>(Lf7f;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltg;->d:Lf7f;

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-boolean v0, p0, Ltg;->b:Z

    if-eqz v0, :cond_11

    iget-boolean v0, p0, Ltg;->a:Z

    if-eqz v0, :cond_11

    iget-object v0, p0, Ltg;->c:Ljava/lang/Object;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    return-void

    :cond_11
    iput-object p1, p0, Ltg;->c:Ljava/lang/Object;

    const/4 v0, 0x1

    iput-boolean v0, p0, Ltg;->b:Z

    iget-object p0, p0, Ltg;->d:Lf7f;

    invoke-interface {p0, p1}, Lf7f;->d0(Ljava/lang/Object;)V

    return-void
.end method
