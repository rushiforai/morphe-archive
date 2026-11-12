.class public abstract Lty8;
.super Lzx8;
.source "SourceFile"


# instance fields
.field public final m:I

.field public final n:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorb;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lzx8;-><init>(Lorb;Ljava/lang/String;)V

    const-string p2, "player_time"

    iget-object v0, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v0, p2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p2

    iput p2, p0, Lty8;->m:I

    const-string p2, "publisher_id"

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lty8;->n:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a(Lorb;)V
    .registers 4

    invoke-super {p0, p1}, Lzx8;->a(Lorb;)V

    const-string v0, "player_time"

    iget v1, p0, Lty8;->m:I

    invoke-virtual {p1, v1, v0}, Lorb;->n(ILjava/lang/String;)V

    iget-object p0, p0, Lty8;->n:Ljava/lang/String;

    if-eqz p0, :cond_13

    const-string v0, "publisher_id"

    invoke-virtual {p1, p0, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_13
    return-void
.end method
