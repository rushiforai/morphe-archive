.class public final Ll60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Ll60;

.field public static final c:Ll60;

.field public static final d:Ll60;

.field public static final e:Ll60;

.field public static final f:Ll60;

.field public static final g:Ll60;

.field public static final h:Ll60;

.field public static final i:Ll60;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ll60;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ll60;-><init>(I)V

    sput-object v0, Ll60;->b:Ll60;

    new-instance v0, Ll60;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ll60;-><init>(I)V

    sput-object v0, Ll60;->c:Ll60;

    new-instance v0, Ll60;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ll60;-><init>(I)V

    sput-object v0, Ll60;->d:Ll60;

    new-instance v0, Ll60;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ll60;-><init>(I)V

    sput-object v0, Ll60;->e:Ll60;

    new-instance v0, Ll60;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ll60;-><init>(I)V

    sput-object v0, Ll60;->f:Ll60;

    new-instance v0, Ll60;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ll60;-><init>(I)V

    sput-object v0, Ll60;->g:Ll60;

    new-instance v0, Ll60;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Ll60;-><init>(I)V

    sput-object v0, Ll60;->h:Ll60;

    new-instance v0, Ll60;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Ll60;-><init>(I)V

    sput-object v0, Ll60;->i:Ll60;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Ll60;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Ll60;->a:B

    return p0
.end method
