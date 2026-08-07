.class public Ll/q1r0;
.super Ljava/lang/Object;


# static fields
.field private static final b:Ll/q1r0;


# instance fields
.field private a:Ll/q1r0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/q1r0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q1r0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/q1r0;->b:Ll/q1r0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    sget-object v0, Ll/q1r0;->b:Ll/q1r0;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/q1r0;-><init>(Ll/q1r0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Ll/q1r0;)V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q1r0;->a:Ll/q1r0;

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q1r0;->a:Ll/q1r0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/q1r0;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public b(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q1r0;->a:Ll/q1r0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/q1r0;->b(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method
