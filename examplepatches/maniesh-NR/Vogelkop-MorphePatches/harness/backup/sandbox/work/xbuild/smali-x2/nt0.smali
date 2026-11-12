.class public final Lnt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lnt0;

.field public static final c:Lnt0;

.field public static final d:Lnt0;

.field public static final e:Lnt0;

.field public static final f:Lnt0;

.field public static final g:Lnt0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnt0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnt0;-><init>(I)V

    sput-object v0, Lnt0;->b:Lnt0;

    new-instance v0, Lnt0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lnt0;-><init>(I)V

    sput-object v0, Lnt0;->c:Lnt0;

    new-instance v0, Lnt0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lnt0;-><init>(I)V

    sput-object v0, Lnt0;->d:Lnt0;

    new-instance v0, Lnt0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lnt0;-><init>(I)V

    sput-object v0, Lnt0;->e:Lnt0;

    new-instance v0, Lnt0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lnt0;-><init>(I)V

    sput-object v0, Lnt0;->f:Lnt0;

    new-instance v0, Lnt0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lnt0;-><init>(I)V

    sput-object v0, Lnt0;->g:Lnt0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lnt0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lnt0;->a:B

    return p0
.end method
