.class public final Ll/bkx0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/vjx0;

.field public static final b:Ll/vjx0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    const-string v1, "com.google.protobuf.MapFieldSchemaFull"

    .line 3
    .line 4
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1, v0}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ll/vjx0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    move-object v0, v1

    .line 19
    :catch_0
    sput-object v0, Ll/bkx0;->a:Ll/vjx0;

    .line 20
    .line 21
    new-instance v0, Ll/vjx0;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/vjx0;-><init>()V

    .line 24
    .line 25
    .line 26
    sput-object v0, Ll/bkx0;->b:Ll/vjx0;

    .line 27
    .line 28
    return-void
.end method

.method public static a()Ll/vjx0;
    .locals 1

    .line 1
    sget-object v0, Ll/bkx0;->a:Ll/vjx0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static b()Ll/vjx0;
    .locals 1

    .line 1
    sget-object v0, Ll/bkx0;->b:Ll/vjx0;

    .line 2
    .line 3
    return-object v0
.end method
