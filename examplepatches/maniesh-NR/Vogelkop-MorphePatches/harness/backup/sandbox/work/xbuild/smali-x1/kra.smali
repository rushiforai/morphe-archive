.class public final Lkra;
.super Lqff;
.source "SourceFile"


# instance fields
.field public final a:Ly7;


# direct methods
.method public constructor <init>(Ly7;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkra;->a:Ly7;

    return-void
.end method


# virtual methods
.method public final a(Lpzh;[B)V
    .registers 3

    iget-object p0, p0, Lkra;->a:Ly7;

    invoke-interface {p0}, Ly7;->l()V

    return-void
.end method

.method public final c(Ljava/lang/String;Z)V
    .registers 3

    iget-object p0, p0, Lkra;->a:Ly7;

    invoke-interface {p0, p1, p2}, Ly7;->z(Ljava/lang/String;Z)V

    return-void
.end method

.method public final e(Lpzh;[B)V
    .registers 3

    invoke-virtual {p0, p1, p2}, Lkra;->a(Lpzh;[B)V

    return-void
.end method
