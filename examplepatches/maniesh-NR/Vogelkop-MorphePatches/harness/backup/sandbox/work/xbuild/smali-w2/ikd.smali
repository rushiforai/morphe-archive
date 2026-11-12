.class public final Likd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lorg/chromium/services/media_session/MediaMetadata;

.field public b:Z

.field public c:Ljava/lang/String;

.field public d:I

.field public e:Z

.field public f:I

.field public g:Landroid/graphics/Bitmap;

.field public h:Landroid/graphics/Bitmap;

.field public i:B

.field public j:I

.field public k:Landroid/content/Intent;

.field public l:Lkkd;

.field public m:Ljava/util/HashSet;

.field public n:Lorg/chromium/services/media_session/MediaPosition;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Likd;->c:Ljava/lang/String;

    const/high16 v0, -0x80000000

    iput v0, p0, Likd;->d:I

    const/4 v1, 0x1

    iput-boolean v1, p0, Likd;->e:Z

    const/4 v1, 0x7

    iput-byte v1, p0, Likd;->i:B

    iput v0, p0, Likd;->j:I

    return-void
.end method


# virtual methods
.method public final a()Ljkd;
    .registers 16

    new-instance v0, Ljkd;

    iget-object v1, p0, Likd;->a:Lorg/chromium/services/media_session/MediaMetadata;

    iget-boolean v2, p0, Likd;->b:Z

    iget-object v3, p0, Likd;->c:Ljava/lang/String;

    iget v4, p0, Likd;->d:I

    iget-boolean v5, p0, Likd;->e:Z

    iget v6, p0, Likd;->f:I

    iget-object v7, p0, Likd;->g:Landroid/graphics/Bitmap;

    iget-object v8, p0, Likd;->h:Landroid/graphics/Bitmap;

    iget-byte v9, p0, Likd;->i:B

    iget v10, p0, Likd;->j:I

    iget-object v11, p0, Likd;->k:Landroid/content/Intent;

    iget-object v12, p0, Likd;->l:Lkkd;

    iget-object v13, p0, Likd;->m:Ljava/util/HashSet;

    iget-object v14, p0, Likd;->n:Lorg/chromium/services/media_session/MediaPosition;

    invoke-direct/range {v0 .. v14}, Ljkd;-><init>(Lorg/chromium/services/media_session/MediaMetadata;ZLjava/lang/String;IZILandroid/graphics/Bitmap;Landroid/graphics/Bitmap;IILandroid/content/Intent;Lkkd;Ljava/util/HashSet;Lorg/chromium/services/media_session/MediaPosition;)V

    return-object v0
.end method
