.class public final Lxn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lxn0;

.field public static final c:Lxn0;

.field public static final d:Lxn0;

.field public static final e:Lxn0;

.field public static final f:Lxn0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lxn0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lxn0;-><init>(I)V

    sput-object v0, Lxn0;->b:Lxn0;

    new-instance v0, Lxn0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lxn0;-><init>(I)V

    sput-object v0, Lxn0;->c:Lxn0;

    new-instance v0, Lxn0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lxn0;-><init>(I)V

    sput-object v0, Lxn0;->d:Lxn0;

    new-instance v0, Lxn0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lxn0;-><init>(I)V

    sput-object v0, Lxn0;->e:Lxn0;

    new-instance v0, Lxn0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lxn0;-><init>(I)V

    sput-object v0, Lxn0;->f:Lxn0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lxn0;->a:B

    return-void
.end method

.method public static final a(I)Lxn0;
    .registers 2

    if-eqz p0, :cond_1f

    const/4 v0, 0x1

    if-eq p0, v0, :cond_1c

    const/4 v0, 0x2

    if-eq p0, v0, :cond_19

    const/4 v0, 0x3

    if-eq p0, v0, :cond_16

    const/4 v0, 0x4

    if-ne p0, v0, :cond_11

    sget-object p0, Lxn0;->f:Lxn0;

    return-object p0

    :cond_11
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :cond_16
    sget-object p0, Lxn0;->e:Lxn0;

    return-object p0

    :cond_19
    sget-object p0, Lxn0;->d:Lxn0;

    return-object p0

    :cond_1c
    sget-object p0, Lxn0;->c:Lxn0;

    return-object p0

    :cond_1f
    sget-object p0, Lxn0;->b:Lxn0;

    return-object p0
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lxn0;->a:B

    return p0
.end method
