.class public final synthetic Lne9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lj4c;

.field public final synthetic b:J

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lj4c;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lne9;->a:Lj4c;

    iput-wide p2, p0, Lne9;->b:J

    iput-object p4, p0, Lne9;->c:Ljava/lang/String;

    iput-object p5, p0, Lne9;->d:Ljava/lang/String;

    iput-object p6, p0, Lne9;->e:Ljava/lang/String;

    iput-object p7, p0, Lne9;->f:Ljava/lang/String;

    iput-object p8, p0, Lne9;->g:Ljava/lang/String;

    iput-object p9, p0, Lne9;->h:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 14

    iget-object v0, p0, Lne9;->a:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbf9;

    invoke-virtual {v0}, Lbf9;->r()I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_15

    invoke-virtual {v0}, Lbf9;->q()Lpc9;

    move-result-object v3

    if-nez v3, :cond_16

    :cond_15
    return-void

    :cond_16
    const/4 v12, 0x1

    iget-wide v4, p0, Lne9;->b:J

    iget-object v6, p0, Lne9;->c:Ljava/lang/String;

    iget-object v7, p0, Lne9;->d:Ljava/lang/String;

    iget-object v8, p0, Lne9;->e:Ljava/lang/String;

    iget-object v9, p0, Lne9;->f:Ljava/lang/String;

    iget-object v10, p0, Lne9;->g:Ljava/lang/String;

    iget-object v11, p0, Lne9;->h:Ljava/lang/String;

    invoke-virtual/range {v3 .. v12}, Lpc9;->f(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method
