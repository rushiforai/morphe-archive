.class public final synthetic Lre9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lpc9;


# direct methods
.method public synthetic constructor <init>(JLjava/lang/String;Lpc9;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lre9;->a:J

    iput-object p3, p0, Lre9;->b:Ljava/lang/String;

    iput-object p4, p0, Lre9;->c:Lpc9;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 14

    check-cast p1, Lje9;

    iget-wide v0, p1, Lje9;->a:J

    iget-object v5, p1, Lje9;->b:Ljava/lang/String;

    iget-wide v2, p0, Lre9;->a:J

    cmp-long v0, v2, v0

    if-nez v0, :cond_26

    iget-object v0, p0, Lre9;->b:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-wide v3, p1, Lje9;->a:J

    iget-object v6, p1, Lje9;->c:Ljava/lang/String;

    iget-object v7, p1, Lje9;->d:Ljava/lang/String;

    iget-object v8, p1, Lje9;->e:Ljava/lang/String;

    iget-object v9, p1, Lje9;->f:Ljava/lang/String;

    iget-object v10, p1, Lje9;->g:Ljava/lang/String;

    const/4 v11, 0x1

    iget-object v2, p0, Lre9;->c:Lpc9;

    invoke-virtual/range {v2 .. v11}, Lpc9;->f(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    :cond_26
    return-void
.end method
