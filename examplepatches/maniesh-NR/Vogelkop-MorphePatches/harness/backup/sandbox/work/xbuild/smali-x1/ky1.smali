.class public final Lky1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroidx/fragment/app/r;

.field public final b:Lumi;

.field public final c:Lj4c;

.field public final d:Lj4c;

.field public final e:Lj4c;

.field public final f:Lj4c;

.field public final g:Lj4c;

.field public final h:Lj4c;

.field public final i:Lj4c;

.field public final j:Lzv3;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/r;Lumi;Lj4c;Lj4c;Lj4c;Lj4c;Lj4c;Lj4c;Lj4c;Lzv3;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lky1;->a:Landroidx/fragment/app/r;

    iput-object p2, p0, Lky1;->b:Lumi;

    iput-object p3, p0, Lky1;->c:Lj4c;

    iput-object p4, p0, Lky1;->d:Lj4c;

    iput-object p5, p0, Lky1;->e:Lj4c;

    iput-object p6, p0, Lky1;->f:Lj4c;

    iput-object p7, p0, Lky1;->g:Lj4c;

    iput-object p8, p0, Lky1;->h:Lj4c;

    iput-object p9, p0, Lky1;->i:Lj4c;

    iput-object p10, p0, Lky1;->j:Lzv3;

    return-void
.end method


# virtual methods
.method public final a(Lndc;Lcy1;Lgy1;)Liy1;
    .registers 20

    move-object/from16 v0, p0

    iget-object v1, v0, Lky1;->g:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Ldz1;

    iget-object v1, v0, Lky1;->c:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lq32;

    iget-object v1, v0, Lky1;->d:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lx12;

    iget-object v1, v0, Lky1;->e:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Lny1;

    iget-object v1, v0, Lky1;->f:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Lqy1;

    iget-object v1, v0, Lky1;->h:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v12, v1

    check-cast v12, Li52;

    iget-object v1, v0, Lky1;->i:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v13, v1

    check-cast v13, La52;

    new-instance v2, Liy1;

    new-instance v14, Ljy1;

    const/4 v1, 0x0

    invoke-direct {v14, v0, v1}, Ljy1;-><init>(Lky1;B)V

    new-instance v15, Ljy1;

    const/4 v1, 0x1

    invoke-direct {v15, v0, v1}, Ljy1;-><init>(Lky1;B)V

    iget-object v4, v0, Lky1;->b:Lumi;

    move-object/from16 v3, p1

    move-object/from16 v5, p2

    move-object/from16 v11, p3

    invoke-direct/range {v2 .. v15}, Liy1;-><init>(Lndc;Lumi;Lcy1;Ldz1;Lq32;Lx12;Lny1;Lqy1;Lgy1;Li52;La52;Ljy1;Ljy1;)V

    return-object v2
.end method
