.class public final synthetic Lz3i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:Lj4c;

.field public final synthetic b:Lwjh;

.field public final synthetic c:Le3j;

.field public final synthetic d:Landroid/content/Context;

.field public final synthetic e:Lj4c;

.field public final synthetic f:Ldj9;

.field public final synthetic g:Lj4c;

.field public final synthetic h:Lv1a;

.field public final synthetic i:Lj4c;

.field public final synthetic j:Lj4c;


# direct methods
.method public synthetic constructor <init>(Lj4c;Lwjh;Le3j;Landroid/content/Context;Lj4c;Ldj9;Lj4c;Lv1a;Lj4c;Lj4c;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lz3i;->a:Lj4c;

    iput-object p2, p0, Lz3i;->b:Lwjh;

    iput-object p3, p0, Lz3i;->c:Le3j;

    iput-object p4, p0, Lz3i;->d:Landroid/content/Context;

    iput-object p5, p0, Lz3i;->e:Lj4c;

    iput-object p6, p0, Lz3i;->f:Ldj9;

    iput-object p7, p0, Lz3i;->g:Lj4c;

    iput-object p8, p0, Lz3i;->h:Lv1a;

    iput-object p9, p0, Lz3i;->i:Lj4c;

    iput-object p10, p0, Lz3i;->j:Lj4c;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 22

    move-object/from16 v0, p0

    iget-object v1, v0, Lz3i;->a:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lv3e;

    new-instance v2, Lha6;

    new-instance v3, Lw3e;

    iget-object v1, v0, Lz3i;->b:Lwjh;

    invoke-direct {v3, v1}, Lw3e;-><init>(Lwjh;)V

    iget-object v1, v1, Lwjh;->d:Ljava/lang/Object;

    check-cast v1, Ljg8;

    sget-object v4, Lxne;->b:Lii;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lt9f;

    iget-object v5, v0, Lz3i;->c:Le3j;

    invoke-virtual {v5}, Lno7;->i()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ld3j;

    const/16 v6, 0x20

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Ld3j;->d(IZ)Lc3j;

    move-result-object v5

    const/4 v6, 0x0

    if-eqz v5, :cond_46

    iget-object v7, v5, Lc3j;->d:Ljava/lang/Comparable;

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    if-nez v9, :cond_3e

    move-object v7, v6

    goto :goto_44

    :cond_3e
    const-string v9, "https://"

    invoke-virtual {v9, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    :goto_44
    if-nez v7, :cond_48

    :cond_46
    const-string v7, "https://missions.opera-api.com"

    :cond_48
    if-eqz v5, :cond_4f

    iget-object v5, v5, Lqsh;->b:Ljava/lang/Object;

    move-object v6, v5

    check-cast v6, Ljava/lang/String;

    :cond_4f
    if-nez v6, :cond_53

    const-string v6, ""

    :cond_53
    new-instance v5, Lil5;

    invoke-direct {v5, v7, v6}, Lil5;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v6, Lu3e;

    iget-object v7, v0, Lz3i;->d:Landroid/content/Context;

    invoke-direct {v6, v7}, Lu3e;-><init>(Landroid/content/Context;)V

    new-instance v10, Lx3e;

    iget-object v9, v0, Lz3i;->e:Lj4c;

    invoke-direct {v10, v9}, Lx3e;-><init>(Lj4c;)V

    new-instance v11, La4e;

    invoke-direct {v11, v7}, La4e;-><init>(Landroid/content/Context;)V

    new-instance v12, Lp5e;

    invoke-direct {v12, v7}, Lp5e;-><init>(Landroid/content/Context;)V

    new-instance v13, Lw5e;

    new-instance v9, Lj3i;

    const/4 v14, 0x1

    invoke-direct {v9, v8, v14}, Lj3i;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v13, v9}, Lw5e;-><init>(Lj3i;)V

    new-instance v14, La6e;

    iget-object v9, v0, Lz3i;->f:Ldj9;

    invoke-direct {v14, v1, v9, v7}, La6e;-><init>(Ljg8;Ldj9;Landroid/content/Context;)V

    new-instance v15, Lu4i;

    iget-object v9, v0, Lz3i;->g:Lj4c;

    invoke-direct {v15, v7, v9}, Lu4i;-><init>(Landroid/content/Context;Lj4c;)V

    new-instance v16, Ll8e;

    invoke-direct/range {v16 .. v16}, Ljava/lang/Object;-><init>()V

    new-instance v9, Lb6e;

    move-object/from16 v17, v2

    iget-object v2, v0, Lz3i;->h:Lv1a;

    invoke-direct {v9, v2}, Lb6e;-><init>(Lv1a;)V

    iget-object v2, v0, Lz3i;->i:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v18, v2

    check-cast v18, Ly5e;

    new-instance v2, Lv5e;

    invoke-direct {v2, v7, v1}, Lv5e;-><init>(Landroid/content/Context;Ljg8;)V

    new-instance v1, Lm3i;

    iget-object v0, v0, Lz3i;->j:Lj4c;

    invoke-direct {v1, v7, v0}, Lm3i;-><init>(Landroid/content/Context;Lj4c;)V

    move-object/from16 v19, v2

    move-object/from16 v2, v17

    move-object/from16 v17, v9

    move-object v9, v8

    move-object/from16 v20, v1

    invoke-direct/range {v2 .. v20}, Lha6;-><init>(Lw3e;Lt9f;Lil5;Lu3e;Landroid/content/Context;Lv3e;Lv3e;Lx3e;La4e;Lp5e;Lw5e;La6e;Lu4i;Ll8e;Lb6e;Ly5e;Lv5e;Lm3i;)V

    return-object v2
.end method
