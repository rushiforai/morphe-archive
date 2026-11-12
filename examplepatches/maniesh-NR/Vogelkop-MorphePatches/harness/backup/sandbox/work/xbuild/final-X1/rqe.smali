.class public final synthetic Lrqe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxla;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Ll0c;

.field public final synthetic c:Lyte;

.field public final synthetic d:Ljtg;

.field public final synthetic e:Z

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ll0c;Lyte;Ljtg;ZLjava/lang/String;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrqe;->a:Landroid/content/Context;

    iput-object p2, p0, Lrqe;->b:Ll0c;

    iput-object p3, p0, Lrqe;->c:Lyte;

    iput-object p4, p0, Lrqe;->d:Ljtg;

    iput-boolean p5, p0, Lrqe;->e:Z

    iput-object p6, p0, Lrqe;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final f(Lyla;)V
    .registers 6

    if-nez p1, :cond_a

    iget-object p1, p0, Lrqe;->a:Landroid/content/Context;

    iget-object v0, p0, Lrqe;->b:Ll0c;

    invoke-static {p1, v0}, Laib;->H(Landroid/content/Context;Ll0c;)Lyla;

    move-result-object p1

    :cond_a
    iget-object v0, p0, Lrqe;->d:Ljtg;

    invoke-virtual {v0}, Ljtg;->b()Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-boolean v0, p0, Lrqe;->e:Z

    if-eqz v0, :cond_1c

    const-wide v0, 0x241000000220209L

    goto :goto_21

    :cond_1c
    const-wide v0, 0x240000000220209L

    :goto_21
    new-instance v2, Ld93;

    iget-object v3, p0, Lrqe;->f:Ljava/lang/String;

    invoke-direct {v2, p1, v0, v1, v3}, Ld93;-><init>(Lyla;JLjava/lang/String;)V

    iget-object p0, p0, Lrqe;->c:Lyte;

    invoke-virtual {p0, v2}, Lyte;->run(Ljava/lang/Object;)V

    return-void
.end method
