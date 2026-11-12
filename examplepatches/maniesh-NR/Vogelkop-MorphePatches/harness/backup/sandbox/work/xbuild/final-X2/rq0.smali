.class public final Lrq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lrq0;

.field public static final c:Lrq0;

.field public static final d:Lrq0;

.field public static final e:Lrq0;

.field public static final f:Lrq0;

.field public static final g:Lrq0;

.field public static final h:Lrq0;

.field public static final i:Lrq0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lrq0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lrq0;-><init>(I)V

    sput-object v0, Lrq0;->b:Lrq0;

    new-instance v0, Lrq0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lrq0;-><init>(I)V

    sput-object v0, Lrq0;->c:Lrq0;

    new-instance v0, Lrq0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lrq0;-><init>(I)V

    sput-object v0, Lrq0;->d:Lrq0;

    new-instance v0, Lrq0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lrq0;-><init>(I)V

    sput-object v0, Lrq0;->e:Lrq0;

    new-instance v0, Lrq0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lrq0;-><init>(I)V

    sput-object v0, Lrq0;->f:Lrq0;

    new-instance v0, Lrq0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lrq0;-><init>(I)V

    sput-object v0, Lrq0;->g:Lrq0;

    new-instance v0, Lrq0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lrq0;-><init>(I)V

    sput-object v0, Lrq0;->h:Lrq0;

    new-instance v0, Lrq0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lrq0;-><init>(I)V

    sput-object v0, Lrq0;->i:Lrq0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lrq0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lrq0;->a:B

    return p0
.end method
