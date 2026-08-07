.class public final Ll/h9x0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ll/h9x0;

.field public static final c:Ll/h9x0;

.field public static final d:Ll/h9x0;

.field public static final e:Ll/h9x0;

.field public static final f:Ll/h9x0;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/h9x0;

    .line 2
    .line 3
    const-string v1, "SHA1"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/h9x0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/h9x0;->b:Ll/h9x0;

    .line 9
    .line 10
    new-instance v0, Ll/h9x0;

    .line 11
    .line 12
    const-string v1, "SHA224"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ll/h9x0;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/h9x0;->c:Ll/h9x0;

    .line 18
    .line 19
    new-instance v0, Ll/h9x0;

    .line 20
    .line 21
    const-string v1, "SHA256"

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ll/h9x0;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Ll/h9x0;->d:Ll/h9x0;

    .line 27
    .line 28
    new-instance v0, Ll/h9x0;

    .line 29
    .line 30
    const-string v1, "SHA384"

    .line 31
    .line 32
    invoke-direct {v0, v1}, Ll/h9x0;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Ll/h9x0;->e:Ll/h9x0;

    .line 36
    .line 37
    new-instance v0, Ll/h9x0;

    .line 38
    .line 39
    const-string v1, "SHA512"

    .line 40
    .line 41
    invoke-direct {v0, v1}, Ll/h9x0;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Ll/h9x0;->f:Ll/h9x0;

    .line 45
    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/h9x0;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h9x0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
