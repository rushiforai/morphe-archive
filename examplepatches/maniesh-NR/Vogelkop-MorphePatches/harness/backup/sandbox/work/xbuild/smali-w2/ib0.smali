.class public final Lib0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lib0;

.field public static final c:Lib0;

.field public static final d:Lib0;

.field public static final e:Lib0;

.field public static final f:Lib0;

.field public static final g:Lib0;

.field public static final h:Lib0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lib0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lib0;-><init>(I)V

    sput-object v0, Lib0;->b:Lib0;

    new-instance v0, Lib0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lib0;-><init>(I)V

    sput-object v0, Lib0;->c:Lib0;

    new-instance v0, Lib0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lib0;-><init>(I)V

    sput-object v0, Lib0;->d:Lib0;

    new-instance v0, Lib0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lib0;-><init>(I)V

    sput-object v0, Lib0;->e:Lib0;

    new-instance v0, Lib0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lib0;-><init>(I)V

    sput-object v0, Lib0;->f:Lib0;

    new-instance v0, Lib0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lib0;-><init>(I)V

    sput-object v0, Lib0;->g:Lib0;

    new-instance v0, Lib0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lib0;-><init>(I)V

    sput-object v0, Lib0;->h:Lib0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lib0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lib0;->a:B

    return p0
.end method
