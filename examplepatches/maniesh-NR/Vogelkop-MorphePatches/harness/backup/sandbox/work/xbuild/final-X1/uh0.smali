.class public final Luh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Luh0;

.field public static final c:Luh0;

.field public static final d:Luh0;

.field public static final e:Luh0;

.field public static final f:Luh0;

.field public static final g:Luh0;

.field public static final h:Luh0;

.field public static final i:Luh0;

.field public static final j:Luh0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Luh0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Luh0;-><init>(I)V

    sput-object v0, Luh0;->b:Luh0;

    new-instance v0, Luh0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Luh0;-><init>(I)V

    sput-object v0, Luh0;->c:Luh0;

    new-instance v0, Luh0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Luh0;-><init>(I)V

    sput-object v0, Luh0;->d:Luh0;

    new-instance v0, Luh0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Luh0;-><init>(I)V

    sput-object v0, Luh0;->e:Luh0;

    new-instance v0, Luh0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Luh0;-><init>(I)V

    sput-object v0, Luh0;->f:Luh0;

    new-instance v0, Luh0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Luh0;-><init>(I)V

    sput-object v0, Luh0;->g:Luh0;

    new-instance v0, Luh0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Luh0;-><init>(I)V

    sput-object v0, Luh0;->h:Luh0;

    new-instance v0, Luh0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Luh0;-><init>(I)V

    sput-object v0, Luh0;->i:Luh0;

    new-instance v0, Luh0;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Luh0;-><init>(I)V

    sput-object v0, Luh0;->j:Luh0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Luh0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Luh0;->a:B

    return p0
.end method
