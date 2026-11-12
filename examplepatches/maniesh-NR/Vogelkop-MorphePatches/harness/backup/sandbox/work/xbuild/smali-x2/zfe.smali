.class public final Lzfe;
.super Lhji;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lgcj;Lfcj;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lzfe;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzfe;->b:Ljava/lang/Object;

    iput-object p2, p0, Lzfe;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lltl;Ljava/lang/Object;B)V
    .registers 4

    .line 11
    iput-byte p3, p0, Lzfe;->a:B

    iput-object p2, p0, Lzfe;->b:Ljava/lang/Object;

    iput-object p1, p0, Lzfe;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final createSheet(Lmej;Lb2l;)Ldej;
    .registers 19

    move-object/from16 v0, p0

    iget-byte v1, v0, Lzfe;->a:B

    iget-object v2, v0, Lzfe;->b:Ljava/lang/Object;

    iget-object v3, v0, Lzfe;->c:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_62

    new-instance v4, Lkuj;

    check-cast v3, Ljuj;

    iget-object v6, v3, Ljuj;->u:Ldx3;

    iget-object v7, v3, Ljuj;->v:Lumi;

    iget-object v8, v3, Ljuj;->s:Landroid/net/Uri;

    move-object v9, v2

    check-cast v9, Ljava/lang/String;

    iget-object v10, v3, Ljuj;->t:Landroid/net/Uri;

    new-instance v11, Lmni;

    const/16 v1, 0x10

    invoke-direct {v11, v0, v1}, Lmni;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v5, p1

    invoke-direct/range {v4 .. v11}, Lkuj;-><init>(Lmej;Ldx3;Lumi;Landroid/net/Uri;Ljava/lang/String;Landroid/net/Uri;Lmni;)V

    return-object v4

    :pswitch_27
    new-instance v5, Lueh;

    check-cast v2, Lgcj;

    iget-object v7, v2, Lgcj;->t:Lumi;

    iget-object v8, v2, Lgcj;->r:Ldx3;

    iget-object v9, v2, Lgcj;->s:Lag7;

    new-instance v10, Lnqi;

    const/4 v0, 0x5

    invoke-direct {v10, v2, v0}, Lnqi;-><init>(Ljava/lang/Object;B)V

    new-instance v11, Lj3i;

    const/16 v0, 0x17

    invoke-direct {v11, v2, v0}, Lj3i;-><init>(Ljava/lang/Object;B)V

    check-cast v3, Lfcj;

    iget-object v12, v3, Lfcj;->c:Landroid/net/Uri;

    iget-object v13, v3, Lfcj;->a:Ljava/lang/String;

    iget-wide v14, v3, Lfcj;->d:J

    move-object/from16 v6, p1

    invoke-direct/range {v5 .. v15}, Lueh;-><init>(Lmej;Lumi;Ldx3;Lag7;Lnqi;Lj3i;Landroid/net/Uri;Ljava/lang/String;J)V

    return-object v5

    :pswitch_4c
    new-instance v5, Lif7;

    check-cast v3, Lfge;

    iget-object v7, v3, Lfge;->r:Lcom/opera/android/BrowserActivity;

    iget-object v8, v3, Lfge;->s:Ltcl;

    iget-object v9, v3, Lfge;->x:Lrc9;

    move-object v10, v2

    check-cast v10, Lib9;

    iget-object v11, v3, Lfge;->v:Lx5f;

    move-object/from16 v6, p1

    invoke-direct/range {v5 .. v11}, Lif7;-><init>(Lmej;Ldx3;Ltcl;Lrc9;Lib9;Lx5f;)V

    return-object v5

    nop

    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_4c
        :pswitch_27
    .end packed-switch
.end method
