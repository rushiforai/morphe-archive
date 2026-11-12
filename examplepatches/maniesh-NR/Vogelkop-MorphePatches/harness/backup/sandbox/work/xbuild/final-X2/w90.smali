.class public final Lw90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lw90;

.field public static final c:Lw90;

.field public static final d:Lw90;

.field public static final e:Lw90;

.field public static final f:Lw90;

.field public static final g:Lw90;

.field public static final h:Lw90;

.field public static final i:Lw90;

.field public static final j:Lw90;

.field public static final k:Lw90;

.field public static final l:Lw90;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lw90;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lw90;-><init>(I)V

    sput-object v0, Lw90;->b:Lw90;

    new-instance v0, Lw90;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lw90;-><init>(I)V

    sput-object v0, Lw90;->c:Lw90;

    new-instance v0, Lw90;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lw90;-><init>(I)V

    sput-object v0, Lw90;->d:Lw90;

    new-instance v0, Lw90;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lw90;-><init>(I)V

    sput-object v0, Lw90;->e:Lw90;

    new-instance v0, Lw90;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lw90;-><init>(I)V

    sput-object v0, Lw90;->f:Lw90;

    new-instance v0, Lw90;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lw90;-><init>(I)V

    sput-object v0, Lw90;->g:Lw90;

    new-instance v0, Lw90;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lw90;-><init>(I)V

    sput-object v0, Lw90;->h:Lw90;

    new-instance v0, Lw90;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lw90;-><init>(I)V

    sput-object v0, Lw90;->i:Lw90;

    new-instance v0, Lw90;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lw90;-><init>(I)V

    sput-object v0, Lw90;->j:Lw90;

    new-instance v0, Lw90;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lw90;-><init>(I)V

    sput-object v0, Lw90;->k:Lw90;

    new-instance v0, Lw90;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lw90;-><init>(I)V

    sput-object v0, Lw90;->l:Lw90;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lw90;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lw90;->a:B

    return p0
.end method
