.class public final Ll/jxx0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/Float;

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Ll/jxx0;)Ljava/lang/Float;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jxx0;->a:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic e(Ll/jxx0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jxx0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final a(Ljava/lang/Float;)Ll/jxx0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jxx0;->a:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Ljava/lang/String;)Ll/jxx0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jxx0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ll/txx0;
    .locals 2

    .line 1
    new-instance v0, Ll/txx0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/txx0;-><init>(Ll/jxx0;Ll/oxx0;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method
