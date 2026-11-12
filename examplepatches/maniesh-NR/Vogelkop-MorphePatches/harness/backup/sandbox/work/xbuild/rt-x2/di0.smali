.class public final Ldi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Ldi0;

.field public static final c:Ldi0;

.field public static final d:Ldi0;

.field public static final e:Ldi0;

.field public static final f:Ldi0;

.field public static final g:Ldi0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ldi0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ldi0;-><init>(I)V

    sput-object v0, Ldi0;->b:Ldi0;

    new-instance v0, Ldi0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ldi0;-><init>(I)V

    sput-object v0, Ldi0;->c:Ldi0;

    new-instance v0, Ldi0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ldi0;-><init>(I)V

    sput-object v0, Ldi0;->d:Ldi0;

    new-instance v0, Ldi0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ldi0;-><init>(I)V

    sput-object v0, Ldi0;->e:Ldi0;

    new-instance v0, Ldi0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ldi0;-><init>(I)V

    sput-object v0, Ldi0;->f:Ldi0;

    new-instance v0, Ldi0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ldi0;-><init>(I)V

    sput-object v0, Ldi0;->g:Ldi0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Ldi0;->a:B

    return-void
.end method

.method public static final a(I)Ldi0;
    .registers 2

    if-eqz p0, :cond_25

    const/4 v0, 0x1

    if-eq p0, v0, :cond_22

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1f

    const/4 v0, 0x3

    if-eq p0, v0, :cond_1c

    const/4 v0, 0x4

    if-eq p0, v0, :cond_19

    const/4 v0, 0x5

    if-ne p0, v0, :cond_14

    sget-object p0, Ldi0;->g:Ldi0;

    return-object p0

    :cond_14
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :cond_19
    sget-object p0, Ldi0;->f:Ldi0;

    return-object p0

    :cond_1c
    sget-object p0, Ldi0;->e:Ldi0;

    return-object p0

    :cond_1f
    sget-object p0, Ldi0;->d:Ldi0;

    return-object p0

    :cond_22
    sget-object p0, Ldi0;->c:Ldi0;

    return-object p0

    :cond_25
    sget-object p0, Ldi0;->b:Ldi0;

    return-object p0
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Ldi0;->a:B

    return p0
.end method
