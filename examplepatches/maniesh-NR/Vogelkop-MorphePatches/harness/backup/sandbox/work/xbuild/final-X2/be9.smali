.class public final synthetic Lbe9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lswl;


# instance fields
.field public final synthetic a:Lle9;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Lqe9;

.field public final synthetic h:Lj12;


# direct methods
.method public synthetic constructor <init>(Lle9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lqe9;Lj12;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbe9;->a:Lle9;

    iput-object p2, p0, Lbe9;->b:Ljava/lang/String;

    iput-object p3, p0, Lbe9;->c:Ljava/lang/String;

    iput-object p4, p0, Lbe9;->d:Ljava/lang/String;

    iput-object p5, p0, Lbe9;->e:Ljava/lang/String;

    iput-object p6, p0, Lbe9;->f:Ljava/lang/String;

    iput-object p7, p0, Lbe9;->g:Lqe9;

    iput-object p8, p0, Lbe9;->h:Lj12;

    return-void
.end method


# virtual methods
.method public final run()Lqwl;
    .registers 11

    iget-object v1, p0, Lbe9;->a:Lle9;

    iget-object v0, v1, Lle9;->d:Loji;

    invoke-virtual {v0}, Loji;->r()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_c

    const/4 p0, 0x0

    return-object p0

    :cond_c
    new-instance v0, Lce9;

    iget-object v3, p0, Lbe9;->b:Ljava/lang/String;

    iget-object v4, p0, Lbe9;->c:Ljava/lang/String;

    iget-object v5, p0, Lbe9;->d:Ljava/lang/String;

    iget-object v6, p0, Lbe9;->e:Ljava/lang/String;

    iget-object v7, p0, Lbe9;->f:Ljava/lang/String;

    iget-object v8, p0, Lbe9;->g:Lqe9;

    iget-object v9, p0, Lbe9;->h:Lj12;

    invoke-direct/range {v0 .. v9}, Lce9;-><init>(Lle9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lqe9;Lj12;)V

    return-object v0
.end method
