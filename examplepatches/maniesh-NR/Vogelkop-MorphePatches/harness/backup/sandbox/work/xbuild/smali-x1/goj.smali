.class public final Lgoj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final synthetic a:Lqsh;


# direct methods
.method public constructor <init>(Lqsh;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgoj;->a:Lqsh;

    return-void
.end method


# virtual methods
.method public final L(Lb2l;Z)V
    .registers 3

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->m()Z

    move-result p1

    if-eqz p1, :cond_21

    iget-object p0, p0, Lgoj;->a:Lqsh;

    iget-object p1, p0, Lqsh;->c:Ljava/lang/Object;

    check-cast p1, Lk6l;

    sget-object p2, Lp6l;->b:Lp6l;

    invoke-virtual {p1, p2}, Lk6l;->s(Lp6l;)I

    move-result p1

    if-nez p1, :cond_21

    iget-object p0, p0, Lqsh;->b:Ljava/lang/Object;

    check-cast p0, Leoj;

    iget-object p0, p0, Leoj;->d:Lhoj;

    invoke-interface {p0}, Lhoj;->removeAll()V

    :cond_21
    return-void
.end method
