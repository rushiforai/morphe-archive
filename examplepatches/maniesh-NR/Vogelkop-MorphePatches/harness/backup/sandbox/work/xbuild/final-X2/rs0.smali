.class public final Lrs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lrs0;

.field public static final c:Lrs0;

.field public static final d:Lrs0;

.field public static final e:Lrs0;

.field public static final f:Lrs0;

.field public static final g:Lrs0;

.field public static final h:Lrs0;

.field public static final i:Lrs0;

.field public static final j:Lrs0;

.field public static final k:Lrs0;

.field public static final l:Lrs0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lrs0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lrs0;-><init>(I)V

    sput-object v0, Lrs0;->b:Lrs0;

    new-instance v0, Lrs0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lrs0;-><init>(I)V

    sput-object v0, Lrs0;->c:Lrs0;

    new-instance v0, Lrs0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lrs0;-><init>(I)V

    sput-object v0, Lrs0;->d:Lrs0;

    new-instance v0, Lrs0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lrs0;-><init>(I)V

    sput-object v0, Lrs0;->e:Lrs0;

    new-instance v0, Lrs0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lrs0;-><init>(I)V

    sput-object v0, Lrs0;->f:Lrs0;

    new-instance v0, Lrs0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lrs0;-><init>(I)V

    sput-object v0, Lrs0;->g:Lrs0;

    new-instance v0, Lrs0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lrs0;-><init>(I)V

    sput-object v0, Lrs0;->h:Lrs0;

    new-instance v0, Lrs0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lrs0;-><init>(I)V

    sput-object v0, Lrs0;->i:Lrs0;

    new-instance v0, Lrs0;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lrs0;-><init>(I)V

    sput-object v0, Lrs0;->j:Lrs0;

    new-instance v0, Lrs0;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lrs0;-><init>(I)V

    sput-object v0, Lrs0;->k:Lrs0;

    new-instance v0, Lrs0;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lrs0;-><init>(I)V

    sput-object v0, Lrs0;->l:Lrs0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lrs0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lrs0;->a:B

    return p0
.end method
