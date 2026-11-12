.class public final Llb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Llb0;

.field public static final c:Llb0;

.field public static final d:Llb0;

.field public static final e:Llb0;

.field public static final f:Llb0;

.field public static final g:Llb0;

.field public static final h:Llb0;

.field public static final i:Llb0;

.field public static final j:Llb0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Llb0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Llb0;-><init>(I)V

    sput-object v0, Llb0;->b:Llb0;

    new-instance v0, Llb0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Llb0;-><init>(I)V

    sput-object v0, Llb0;->c:Llb0;

    new-instance v0, Llb0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Llb0;-><init>(I)V

    sput-object v0, Llb0;->d:Llb0;

    new-instance v0, Llb0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Llb0;-><init>(I)V

    sput-object v0, Llb0;->e:Llb0;

    new-instance v0, Llb0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Llb0;-><init>(I)V

    sput-object v0, Llb0;->f:Llb0;

    new-instance v0, Llb0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Llb0;-><init>(I)V

    sput-object v0, Llb0;->g:Llb0;

    new-instance v0, Llb0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Llb0;-><init>(I)V

    sput-object v0, Llb0;->h:Llb0;

    new-instance v0, Llb0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Llb0;-><init>(I)V

    sput-object v0, Llb0;->i:Llb0;

    new-instance v0, Llb0;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Llb0;-><init>(I)V

    sput-object v0, Llb0;->j:Llb0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Llb0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Llb0;->a:B

    return p0
.end method
