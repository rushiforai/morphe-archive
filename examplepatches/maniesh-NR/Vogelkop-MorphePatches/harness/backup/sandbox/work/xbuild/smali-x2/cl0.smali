.class public final Lcl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lcl0;

.field public static final c:Lcl0;

.field public static final d:Lcl0;

.field public static final e:Lcl0;

.field public static final f:Lcl0;

.field public static final g:Lcl0;

.field public static final h:Lcl0;

.field public static final i:Lcl0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lcl0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcl0;-><init>(I)V

    sput-object v0, Lcl0;->b:Lcl0;

    new-instance v0, Lcl0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcl0;-><init>(I)V

    sput-object v0, Lcl0;->c:Lcl0;

    new-instance v0, Lcl0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lcl0;-><init>(I)V

    sput-object v0, Lcl0;->d:Lcl0;

    new-instance v0, Lcl0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lcl0;-><init>(I)V

    sput-object v0, Lcl0;->e:Lcl0;

    new-instance v0, Lcl0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcl0;-><init>(I)V

    sput-object v0, Lcl0;->f:Lcl0;

    new-instance v0, Lcl0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lcl0;-><init>(I)V

    sput-object v0, Lcl0;->g:Lcl0;

    new-instance v0, Lcl0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lcl0;-><init>(I)V

    sput-object v0, Lcl0;->h:Lcl0;

    new-instance v0, Lcl0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lcl0;-><init>(I)V

    sput-object v0, Lcl0;->i:Lcl0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lcl0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lcl0;->a:B

    return p0
.end method
