.class public final synthetic Ldlh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lglh;


# direct methods
.method public synthetic constructor <init>(Lglh;B)V
    .registers 3

    iput-byte p2, p0, Ldlh;->a:B

    iput-object p1, p0, Ldlh;->b:Lglh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Ldlh;->a:B

    iget-object p0, p0, Ldlh;->b:Lglh;

    packed-switch v0, :pswitch_data_76

    iget-object v0, p0, Lglh;->a:Ljlh;

    invoke-virtual {v0}, Ljlh;->m()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lglh;->i(Ljava/util/ArrayList;)V

    return-object v0

    :pswitch_11
    iget-object p0, p0, Lglh;->a:Ljlh;

    invoke-virtual {p0}, Ljlh;->m()Ljava/util/ArrayList;

    move-result-object p0

    new-instance v0, Ljava/util/HashSet;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_25
    :goto_25
    if-ge v2, v1, :cond_74

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lilh;

    iget-boolean v4, v3, Lilh;->g:Z

    if-nez v4, :cond_37

    iget-boolean v4, v3, Lilh;->h:Z

    if-eqz v4, :cond_25

    :cond_37
    iget-object v4, v3, Lilh;->f:Ljava/lang/String;

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    const-string v6, "content"

    invoke-virtual {v5}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_25

    new-instance v6, Ljava/io/File;

    const-string v7, "file"

    invoke-virtual {v5}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5b

    invoke-virtual {v5}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v4

    :cond_5b
    invoke-direct {v6, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_25

    invoke-virtual {v6}, Ljava/io/File;->canRead()Z

    move-result v4

    if-nez v4, :cond_25

    iget-wide v3, v3, Lilh;->a:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_25

    :cond_74
    return-object v0

    nop

    :pswitch_data_76
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
