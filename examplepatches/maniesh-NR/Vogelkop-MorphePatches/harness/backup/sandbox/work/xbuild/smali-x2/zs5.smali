.class public final Lzs5;
.super Lcej;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public final b:Lqs5;

.field public final c:Lk73;

.field public final d:B

.field public final e:Lcom/opera/api/Callback;

.field public final f:Lx5f;

.field public final g:Lru9;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lqs5;Lk73;ILcom/opera/api/Callback;Lx5f;Lru9;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzs5;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iput-object p2, p0, Lzs5;->b:Lqs5;

    iput-object p3, p0, Lzs5;->c:Lk73;

    iput-byte p4, p0, Lzs5;->d:B

    iput-object p5, p0, Lzs5;->e:Lcom/opera/api/Callback;

    iput-object p6, p0, Lzs5;->f:Lx5f;

    iput-object p7, p0, Lzs5;->g:Lru9;

    return-void
.end method


# virtual methods
.method public final createSheet(Lmej;Lb2l;)Ldej;
    .registers 13

    new-instance v0, Lat5;

    iget-object v8, p0, Lzs5;->f:Lx5f;

    iget-object v9, p0, Lzs5;->g:Lru9;

    iget-object v2, p0, Lzs5;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v3, p0, Lzs5;->b:Lqs5;

    iget-object v4, p0, Lzs5;->c:Lk73;

    iget-byte v6, p0, Lzs5;->d:B

    iget-object v7, p0, Lzs5;->e:Lcom/opera/api/Callback;

    move-object v1, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v9}, Lat5;-><init>(Lmej;Lcom/opera/android/browser/chromium/ChromiumContent;Lqs5;Lk73;Lb2l;ILcom/opera/api/Callback;Lx5f;Lru9;)V

    return-object v0
.end method

.method public final createSheetHost(Landroid/content/Context;)Lmej;
    .registers 3

    new-instance p0, Ls8n;

    const v0, 0x7f040557

    invoke-direct {p0, p1, v0}, Ls8n;-><init>(Landroid/content/Context;I)V

    new-instance p1, Lvq3;

    invoke-direct {p1, p0}, Lvq3;-><init>(Landroid/content/Context;)V

    return-object p1
.end method

.method public final getDefaultPriority()Lijm;
    .registers 1

    sget-object p0, Lijm;->a:Lijm;

    return-object p0
.end method
