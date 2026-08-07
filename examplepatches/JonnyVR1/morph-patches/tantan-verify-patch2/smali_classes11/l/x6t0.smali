.class public abstract Ll/x6t0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/x6t0;

.field public static final b:Ll/x6t0;

.field public static final c:Ll/x6t0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/d2t0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/d2t0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/x6t0;->a:Ll/x6t0;

    .line 7
    .line 8
    new-instance v0, Ll/f3t0;

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    invoke-direct {v0, v1}, Ll/f3t0;-><init>(I)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/x6t0;->b:Ll/x6t0;

    .line 15
    .line 16
    new-instance v0, Ll/f3t0;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-direct {v0, v1}, Ll/f3t0;-><init>(I)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Ll/x6t0;->c:Ll/x6t0;

    .line 23
    .line 24
    return-void
.end method

.method public synthetic constructor <init>(Ll/j4t0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic c()Ll/x6t0;
    .locals 1

    .line 1
    sget-object v0, Ll/x6t0;->a:Ll/x6t0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic d()Ll/x6t0;
    .locals 1

    .line 1
    sget-object v0, Ll/x6t0;->c:Ll/x6t0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic e()Ll/x6t0;
    .locals 1

    .line 1
    sget-object v0, Ll/x6t0;->b:Ll/x6t0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static f()Ll/x6t0;
    .locals 1

    .line 1
    sget-object v0, Ll/x6t0;->a:Ll/x6t0;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public abstract a()I
.end method

.method public abstract b(Ljava/lang/Comparable;Ljava/lang/Comparable;)Ll/x6t0;
.end method
