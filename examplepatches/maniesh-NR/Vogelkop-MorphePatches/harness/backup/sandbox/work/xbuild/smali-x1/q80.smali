.class public final Lq80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lq80;

.field public static final c:Lq80;

.field public static final d:Lq80;

.field public static final e:Lq80;

.field public static final f:Lq80;

.field public static final g:Lq80;

.field public static final h:Lq80;

.field public static final i:Lq80;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lq80;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lq80;-><init>(I)V

    sput-object v0, Lq80;->b:Lq80;

    new-instance v0, Lq80;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lq80;-><init>(I)V

    sput-object v0, Lq80;->c:Lq80;

    new-instance v0, Lq80;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lq80;-><init>(I)V

    sput-object v0, Lq80;->d:Lq80;

    new-instance v0, Lq80;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lq80;-><init>(I)V

    sput-object v0, Lq80;->e:Lq80;

    new-instance v0, Lq80;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lq80;-><init>(I)V

    sput-object v0, Lq80;->f:Lq80;

    new-instance v0, Lq80;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lq80;-><init>(I)V

    sput-object v0, Lq80;->g:Lq80;

    new-instance v0, Lq80;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lq80;-><init>(I)V

    sput-object v0, Lq80;->h:Lq80;

    new-instance v0, Lq80;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lq80;-><init>(I)V

    sput-object v0, Lq80;->i:Lq80;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lq80;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lq80;->a:B

    return p0
.end method
