.class public final Lp60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lp60;

.field public static final c:Lp60;

.field public static final d:Lp60;

.field public static final e:Lp60;

.field public static final f:Lp60;

.field public static final g:Lp60;

.field public static final h:Lp60;

.field public static final i:Lp60;

.field public static final j:Lp60;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lp60;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lp60;-><init>(I)V

    sput-object v0, Lp60;->b:Lp60;

    new-instance v0, Lp60;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lp60;-><init>(I)V

    sput-object v0, Lp60;->c:Lp60;

    new-instance v0, Lp60;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lp60;-><init>(I)V

    sput-object v0, Lp60;->d:Lp60;

    new-instance v0, Lp60;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lp60;-><init>(I)V

    sput-object v0, Lp60;->e:Lp60;

    new-instance v0, Lp60;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lp60;-><init>(I)V

    sput-object v0, Lp60;->f:Lp60;

    new-instance v0, Lp60;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lp60;-><init>(I)V

    sput-object v0, Lp60;->g:Lp60;

    new-instance v0, Lp60;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lp60;-><init>(I)V

    sput-object v0, Lp60;->h:Lp60;

    new-instance v0, Lp60;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lp60;-><init>(I)V

    sput-object v0, Lp60;->i:Lp60;

    new-instance v0, Lp60;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lp60;-><init>(I)V

    sput-object v0, Lp60;->j:Lp60;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lp60;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lp60;->a:B

    return p0
.end method
