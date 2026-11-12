.class public final Le80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Le80;

.field public static final c:Le80;

.field public static final d:Le80;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Le80;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Le80;-><init>(I)V

    sput-object v0, Le80;->b:Le80;

    new-instance v0, Le80;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Le80;-><init>(I)V

    sput-object v0, Le80;->c:Le80;

    new-instance v0, Le80;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Le80;-><init>(I)V

    sput-object v0, Le80;->d:Le80;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Le80;->a:B

    return-void
.end method

.method public static final a(I)Le80;
    .registers 2

    if-eqz p0, :cond_13

    const/4 v0, 0x1

    if-eq p0, v0, :cond_10

    const/4 v0, 0x2

    if-ne p0, v0, :cond_b

    sget-object p0, Le80;->d:Le80;

    return-object p0

    :cond_b
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :cond_10
    sget-object p0, Le80;->c:Le80;

    return-object p0

    :cond_13
    sget-object p0, Le80;->b:Le80;

    return-object p0
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Le80;->a:B

    return p0
.end method
