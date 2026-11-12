.class public final Lyd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lyd0;

.field public static final c:Lyd0;

.field public static final d:Lyd0;

.field public static final e:Lyd0;

.field public static final f:Lyd0;

.field public static final g:Lyd0;

.field public static final h:Lyd0;

.field public static final i:Lyd0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lyd0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lyd0;-><init>(I)V

    sput-object v0, Lyd0;->b:Lyd0;

    new-instance v0, Lyd0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lyd0;-><init>(I)V

    sput-object v0, Lyd0;->c:Lyd0;

    new-instance v0, Lyd0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lyd0;-><init>(I)V

    sput-object v0, Lyd0;->d:Lyd0;

    new-instance v0, Lyd0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lyd0;-><init>(I)V

    sput-object v0, Lyd0;->e:Lyd0;

    new-instance v0, Lyd0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lyd0;-><init>(I)V

    sput-object v0, Lyd0;->f:Lyd0;

    new-instance v0, Lyd0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lyd0;-><init>(I)V

    sput-object v0, Lyd0;->g:Lyd0;

    new-instance v0, Lyd0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lyd0;-><init>(I)V

    sput-object v0, Lyd0;->h:Lyd0;

    new-instance v0, Lyd0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lyd0;-><init>(I)V

    sput-object v0, Lyd0;->i:Lyd0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lyd0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lyd0;->a:B

    return p0
.end method
