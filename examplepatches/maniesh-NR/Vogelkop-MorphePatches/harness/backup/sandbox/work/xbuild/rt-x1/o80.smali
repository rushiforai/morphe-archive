.class public final Lo80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lo80;

.field public static final c:Lo80;

.field public static final d:Lo80;

.field public static final e:Lo80;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lo80;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lo80;-><init>(I)V

    sput-object v0, Lo80;->b:Lo80;

    new-instance v0, Lo80;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lo80;-><init>(I)V

    sput-object v0, Lo80;->c:Lo80;

    new-instance v0, Lo80;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lo80;-><init>(I)V

    sput-object v0, Lo80;->d:Lo80;

    new-instance v0, Lo80;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lo80;-><init>(I)V

    sput-object v0, Lo80;->e:Lo80;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lo80;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lo80;->a:B

    return p0
.end method
