.class public final Luq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Luq0;

.field public static final c:Luq0;

.field public static final d:Luq0;

.field public static final e:Luq0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Luq0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Luq0;-><init>(I)V

    sput-object v0, Luq0;->b:Luq0;

    new-instance v0, Luq0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Luq0;-><init>(I)V

    sput-object v0, Luq0;->c:Luq0;

    new-instance v0, Luq0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Luq0;-><init>(I)V

    sput-object v0, Luq0;->d:Luq0;

    new-instance v0, Luq0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Luq0;-><init>(I)V

    sput-object v0, Luq0;->e:Luq0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Luq0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Luq0;->a:B

    return p0
.end method
