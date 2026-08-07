.class public Ll/g5e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/g5e$b;
    }
.end annotation


# static fields
.field public static c:Z = false

.field public static d:J = 0x400L


# instance fields
.field public a:Ll/g5e$b;

.field public b:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/g5e$b;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/g5e$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/g5e$a;-><init>(Ll/g5e;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/g5e;->b:Ljava/lang/Runnable;

    .line 10
    .line 11
    iput-object p1, p0, Ll/g5e;->a:Ll/g5e$b;

    .line 12
    .line 13
    return-void
.end method

.method public synthetic constructor <init>(Ll/g5e$b;Ll/g5e$a;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Ll/g5e;-><init>(Ll/g5e$b;)V

    return-void
.end method

.method public static synthetic a()J
    .locals 2

    .line 1
    sget-wide v0, Ll/g5e;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic b(Ll/g5e;)Ll/g5e$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g5e;->a:Ll/g5e$b;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public c()V
    .locals 1

    .line 1
    sget-boolean v0, Ll/g5e;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p0, p0, Ll/g5e;->b:Ljava/lang/Runnable;

    .line 7
    .line 8
    invoke-static {p0}, Ll/u21;->b(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    sput-boolean p0, Ll/g5e;->c:Z

    .line 13
    .line 14
    return-void
.end method
