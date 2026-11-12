.class public final Ljyg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public b:I

.field public c:I

.field public d:Landroid/os/ParcelFileDescriptor;

.field public e:I

.field public f:Landroid/print/PrintAttributes$MediaSize;

.field public g:Landroid/print/PrintAttributes$Margins;

.field public h:[I

.field public i:Llld;

.field public j:Lorg/chromium/printing/Printable;

.field public k:B

.field public l:Lpjg;

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Liyg;

.field public final r:Lfyg;


# direct methods
.method public constructor <init>(Lorg/chromium/printing/Printable;Liyg;II)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Ljyg;->b:I

    iput v0, p0, Ljyg;->c:I

    const/4 v0, 0x0

    iput-byte v0, p0, Ljyg;->k:B

    iput-object p1, p0, Ljyg;->j:Lorg/chromium/printing/Printable;

    invoke-interface {p1}, Lorg/chromium/printing/Printable;->a()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Ljyg;->a:Ljava/lang/String;

    iput-object p2, p0, Ljyg;->q:Liyg;

    iput p3, p0, Ljyg;->b:I

    iput p4, p0, Ljyg;->c:I

    new-instance p1, Lfyg;

    invoke-direct {p1, p0}, Lfyg;-><init>(Ljyg;)V

    iput-object p1, p0, Ljyg;->r:Lfyg;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-object v0, p0, Ljyg;->d:Landroid/os/ParcelFileDescriptor;

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v1, 0x0

    :try_start_6
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_9} :catch_e
    .catchall {:try_start_6 .. :try_end_9} :catchall_a

    goto :goto_e

    :catchall_a
    move-exception v0

    iput-object v1, p0, Ljyg;->d:Landroid/os/ParcelFileDescriptor;

    throw v0

    :catch_e
    :goto_e
    iput-object v1, p0, Ljyg;->d:Landroid/os/ParcelFileDescriptor;

    return-void
.end method

.method public final b()V
    .registers 4

    iget-boolean v0, p0, Ljyg;->p:Z

    if-nez v0, :cond_38

    const/4 v0, 0x1

    iput-boolean v0, p0, Ljyg;->p:Z

    const/4 v1, 0x0

    iput-boolean v1, p0, Ljyg;->n:Z

    const/4 v2, -0x1

    iput v2, p0, Ljyg;->b:I

    iput v2, p0, Ljyg;->c:I

    iput-boolean v1, p0, Ljyg;->o:Z

    invoke-virtual {p0}, Ljyg;->a()V

    iget-byte v1, p0, Ljyg;->k:B

    if-ne v1, v0, :cond_21

    iget-object v0, p0, Ljyg;->i:Llld;

    if-eqz v0, :cond_21

    iget-object v1, p0, Ljyg;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Llld;->k0(Ljava/lang/CharSequence;)V

    :cond_21
    const/4 v0, 0x2

    iput-byte v0, p0, Ljyg;->k:B

    const/4 v0, 0x0

    iput-object v0, p0, Ljyg;->i:Llld;

    iget-object v1, p0, Ljyg;->l:Lpjg;

    iput-object v0, p0, Ljyg;->l:Lpjg;

    iput-object v0, p0, Ljyg;->j:Lorg/chromium/printing/Printable;

    iput-object v0, p0, Ljyg;->q:Liyg;

    iput-object v0, p0, Ljyg;->f:Landroid/print/PrintAttributes$MediaSize;

    iput-object v0, p0, Ljyg;->h:[I

    if-eqz v1, :cond_38

    invoke-virtual {v1}, Lpjg;->run()V

    :cond_38
    return-void
.end method
