.class public Lz7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public f:Z

.field public g:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 8

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 32
    const-string v2, "application/json"

    const-string v3, "GET"

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lz7;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;B)V
    .registers 15

    packed-switch p3, :pswitch_data_20

    const/4 v2, 0x0

    const-string v3, "POST"

    const-string v4, "application/json"

    move-object v0, p0

    move-object v1, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lz7;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :pswitch_f
    move-object v0, p0

    move-object v1, p1

    move-object v5, p2

    const-string v7, "application/json"

    const-string v8, "POST"

    const-string v9, "application/json"

    move-object v6, v1

    move-object v10, v5

    move-object v5, v0

    invoke-direct/range {v5 .. v10}, Lz7;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x1
        :pswitch_f
    .end packed-switch
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lz7;->a:Ljava/lang/String;

    .line 35
    iput-object p2, p0, Lz7;->b:Ljava/lang/String;

    .line 36
    iput-object p3, p0, Lz7;->c:Ljava/lang/String;

    .line 37
    iput-object p4, p0, Lz7;->d:Ljava/lang/String;

    .line 38
    iput-object p5, p0, Lz7;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lz7;->e:Ljava/lang/String;

    return-object p0
.end method

.method public b()Z
    .registers 1

    iget-object p0, p0, Lz7;->e:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public c(Lfvh;)V
    .registers 4

    iget-object v0, p0, Lz7;->b:Ljava/lang/String;

    if-eqz v0, :cond_9

    const-string v1, "accept"

    invoke-virtual {p1, v1, v0}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_9
    invoke-virtual {p0}, Lz7;->b()Z

    move-result v0

    iget-object v1, p0, Lz7;->c:Ljava/lang/String;

    if-eqz v0, :cond_1a

    new-instance v0, Lmvh;

    invoke-direct {v0, p0}, Lmvh;-><init>(Lz7;)V

    invoke-virtual {p1, v1, v0}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    return-void

    :cond_1a
    const-string p0, "POST"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_37

    const-string p0, "PUT"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_37

    const-string p0, "GET"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_36

    const/4 p0, 0x0

    invoke-virtual {p1, v1, p0}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    :cond_36
    return-void

    :cond_37
    const/4 p0, 0x0

    new-array p0, p0, [B

    invoke-static {p0}, Lrvh;->create([B)Lrvh;

    move-result-object p0

    invoke-virtual {p1, v1, p0}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    return-void
.end method
