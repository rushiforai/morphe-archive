.class public final Lgu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lgu0;

.field public static final c:Lgu0;

.field public static final d:Lgu0;

.field public static final e:Lgu0;

.field public static final f:Lgu0;

.field public static final g:Lgu0;

.field public static final h:Lgu0;

.field public static final i:Lgu0;

.field public static final j:Lgu0;

.field public static final k:Lgu0;

.field public static final l:Lgu0;

.field public static final m:Lgu0;

.field public static final n:Lgu0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lgu0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lgu0;-><init>(I)V

    sput-object v0, Lgu0;->b:Lgu0;

    new-instance v0, Lgu0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lgu0;-><init>(I)V

    sput-object v0, Lgu0;->c:Lgu0;

    new-instance v0, Lgu0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lgu0;-><init>(I)V

    sput-object v0, Lgu0;->d:Lgu0;

    new-instance v0, Lgu0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lgu0;-><init>(I)V

    sput-object v0, Lgu0;->e:Lgu0;

    new-instance v0, Lgu0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lgu0;-><init>(I)V

    sput-object v0, Lgu0;->f:Lgu0;

    new-instance v0, Lgu0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lgu0;-><init>(I)V

    sput-object v0, Lgu0;->g:Lgu0;

    new-instance v0, Lgu0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lgu0;-><init>(I)V

    sput-object v0, Lgu0;->h:Lgu0;

    new-instance v0, Lgu0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lgu0;-><init>(I)V

    sput-object v0, Lgu0;->i:Lgu0;

    new-instance v0, Lgu0;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lgu0;-><init>(I)V

    sput-object v0, Lgu0;->j:Lgu0;

    new-instance v0, Lgu0;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lgu0;-><init>(I)V

    sput-object v0, Lgu0;->k:Lgu0;

    new-instance v0, Lgu0;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lgu0;-><init>(I)V

    sput-object v0, Lgu0;->l:Lgu0;

    new-instance v0, Lgu0;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lgu0;-><init>(I)V

    sput-object v0, Lgu0;->m:Lgu0;

    new-instance v0, Lgu0;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lgu0;-><init>(I)V

    sput-object v0, Lgu0;->n:Lgu0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lgu0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lgu0;->a:B

    return p0
.end method
