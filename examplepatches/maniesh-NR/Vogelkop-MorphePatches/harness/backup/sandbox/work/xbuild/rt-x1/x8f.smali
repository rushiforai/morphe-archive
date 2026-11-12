.class public final synthetic Lx8f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(JJ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lx8f;->a:J

    iput-wide p3, p0, Lx8f;->b:J

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 9

    check-cast p1, Lilh;

    if-eqz p1, :cond_b

    iget-object v0, p1, Lilh;->j:Ljava/lang/String;

    iget-object p1, p1, Lilh;->f:Ljava/lang/String;

    move-object v6, p1

    move-object v5, v0

    goto :goto_f

    :cond_b
    const-string v0, ""

    move-object v5, v0

    move-object v6, v5

    :goto_f
    iget-wide v1, p0, Lx8f;->a:J

    iget-wide v3, p0, Lx8f;->b:J

    invoke-static/range {v1 .. v6}, LJ/N;->MFLyNg5d(JJLjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method
