.class public final Llka;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljka;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Llka;->a:B

    iput-object p1, p0, Llka;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lorb;
    .registers 11

    iget-byte v0, p0, Llka;->a:B

    const-string v1, "status"

    const-string v2, "file"

    const-string v3, "fileUrl"

    const-string v4, "mimeType"

    const-string v5, "name"

    const-string v6, "shodanId"

    const-string v7, "id"

    iget-object p0, p0, Llka;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_74

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    check-cast p0, Lk19;

    new-instance v8, Lorb;

    invoke-direct {v8}, Lorb;-><init>()V

    iget-object v9, p0, Lk19;->a:Ljava/lang/String;

    invoke-virtual {v8, v9, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v7, p0, Lk19;->b:Ljava/lang/String;

    invoke-virtual {v8, v7, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v6, p0, Lk19;->c:Ljava/lang/String;

    invoke-virtual {v8, v6, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v5, p0, Lk19;->d:Ljava/lang/String;

    invoke-virtual {v8, v5, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v4, p0, Lk19;->e:Ljava/lang/String;

    invoke-virtual {v8, v4, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lk19;->f:Ljava/lang/String;

    const-string v3, "thumbnailUrl"

    invoke-virtual {v8, p0, v3}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v8, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "success"

    invoke-virtual {v0, p0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0

    :pswitch_4a
    const-string v0, "processing"

    invoke-static {v1, v0}, Lvep;->p(Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v0

    check-cast p0, Lsaf;

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    iget-object v8, p0, Lsaf;->a:Ljava/lang/String;

    invoke-virtual {v1, v8, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v5, p0, Lsaf;->b:Ljava/lang/String;

    invoke-virtual {v1, v5, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v5, p0, Lsaf;->c:Ljava/lang/String;

    invoke-virtual {v1, v5, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v5, p0, Lsaf;->d:Ljava/lang/String;

    invoke-virtual {v1, v5, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lsaf;->e:Ljava/lang/String;

    invoke-virtual {v1, p0, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0

    :pswitch_data_74
    .packed-switch 0x0
        :pswitch_4a
    .end packed-switch
.end method
