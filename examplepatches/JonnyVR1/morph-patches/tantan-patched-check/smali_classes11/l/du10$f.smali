.class Ll/du10$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/du10;->P(Ll/lpw;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/lpw;

.field final synthetic b:Ll/du10;


# direct methods
.method public constructor <init>(Ll/du10;Ll/lpw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/du10$f;->b:Ll/du10;

    .line 2
    .line 3
    iput-object p2, p0, Ll/du10$f;->a:Ll/lpw;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/du10$f;->b:Ll/du10;

    .line 2
    .line 3
    invoke-static {v0}, Ll/du10;->Z(Ll/du10;)Ll/cu10;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/du10$f;->b:Ll/du10;

    .line 10
    .line 11
    invoke-static {v0}, Ll/du10;->Z(Ll/du10;)Ll/cu10;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v0, p0, Ll/du10$f;->b:Ll/du10;

    .line 16
    .line 17
    invoke-static {v0}, Ll/du10;->Z(Ll/du10;)Ll/cu10;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/cu10;->o()Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v0, p0, Ll/du10$f;->b:Ll/du10;

    .line 26
    .line 27
    invoke-static {v0}, Ll/du10;->V(Ll/du10;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    new-instance v5, Ll/in50;

    .line 32
    .line 33
    iget-object p0, p0, Ll/du10$f;->a:Ll/lpw;

    .line 34
    .line 35
    invoke-direct {v5, p0}, Ll/in50;-><init>(Ll/lpw;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ll/kv0;->a()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v6

    .line 42
    const-string v4, ""

    .line 43
    .line 44
    invoke-virtual/range {v1 .. v6}, Ll/cu10;->j(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ll/lpw;Landroid/content/Context;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method
