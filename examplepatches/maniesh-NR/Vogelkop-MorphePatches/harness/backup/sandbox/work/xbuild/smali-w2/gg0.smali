.class public final Lgg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lgg0;

.field public static final c:Lgg0;

.field public static final d:Lgg0;

.field public static final e:Lgg0;

.field public static final f:Lgg0;

.field public static final g:Lgg0;

.field public static final h:Lgg0;

.field public static final i:Lgg0;

.field public static final j:Lgg0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lgg0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lgg0;-><init>(I)V

    sput-object v0, Lgg0;->b:Lgg0;

    new-instance v0, Lgg0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lgg0;-><init>(I)V

    sput-object v0, Lgg0;->c:Lgg0;

    new-instance v0, Lgg0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lgg0;-><init>(I)V

    sput-object v0, Lgg0;->d:Lgg0;

    new-instance v0, Lgg0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lgg0;-><init>(I)V

    sput-object v0, Lgg0;->e:Lgg0;

    new-instance v0, Lgg0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lgg0;-><init>(I)V

    sput-object v0, Lgg0;->f:Lgg0;

    new-instance v0, Lgg0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lgg0;-><init>(I)V

    sput-object v0, Lgg0;->g:Lgg0;

    new-instance v0, Lgg0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lgg0;-><init>(I)V

    sput-object v0, Lgg0;->h:Lgg0;

    new-instance v0, Lgg0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lgg0;-><init>(I)V

    sput-object v0, Lgg0;->i:Lgg0;

    new-instance v0, Lgg0;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lgg0;-><init>(I)V

    sput-object v0, Lgg0;->j:Lgg0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lgg0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lgg0;->a:B

    return p0
.end method
