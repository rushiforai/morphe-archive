.class public final Lwih;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Ljava/util/Set;


# instance fields
.field public final a:Lj4c;

.field public final b:Lpde;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    const-string v0, "image-recognition-camera"

    const-string v1, "image-recognition"

    const-string v2, "entertainment"

    const-string v3, "image-generation"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lwih;->c:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Lj4c;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwih;->a:Lj4c;

    new-instance p1, Lpde;

    sget-object v0, Ll08;->a:Ll08;

    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lwih;->b:Lpde;

    return-void
.end method
