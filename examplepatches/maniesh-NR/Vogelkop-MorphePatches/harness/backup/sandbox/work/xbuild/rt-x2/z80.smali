.class public final Lz80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lz80;

.field public static final c:Lz80;

.field public static final d:Lz80;

.field public static final e:Lz80;

.field public static final f:Lz80;

.field public static final g:Lz80;

.field public static final h:Lz80;

.field public static final i:Lz80;

.field public static final j:Lz80;

.field public static final k:Lz80;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lz80;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lz80;-><init>(I)V

    sput-object v0, Lz80;->b:Lz80;

    new-instance v0, Lz80;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lz80;-><init>(I)V

    sput-object v0, Lz80;->c:Lz80;

    new-instance v0, Lz80;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lz80;-><init>(I)V

    sput-object v0, Lz80;->d:Lz80;

    new-instance v0, Lz80;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lz80;-><init>(I)V

    sput-object v0, Lz80;->e:Lz80;

    new-instance v0, Lz80;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lz80;-><init>(I)V

    sput-object v0, Lz80;->f:Lz80;

    new-instance v0, Lz80;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lz80;-><init>(I)V

    sput-object v0, Lz80;->g:Lz80;

    new-instance v0, Lz80;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lz80;-><init>(I)V

    sput-object v0, Lz80;->h:Lz80;

    new-instance v0, Lz80;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lz80;-><init>(I)V

    sput-object v0, Lz80;->i:Lz80;

    new-instance v0, Lz80;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lz80;-><init>(I)V

    sput-object v0, Lz80;->j:Lz80;

    new-instance v0, Lz80;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lz80;-><init>(I)V

    sput-object v0, Lz80;->k:Lz80;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lz80;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lz80;->a:B

    return p0
.end method
