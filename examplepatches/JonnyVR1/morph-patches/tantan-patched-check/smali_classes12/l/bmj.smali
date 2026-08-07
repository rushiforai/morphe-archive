.class public Ll/bmj;
.super Ll/c7b0;
.source "SourceFile"


# static fields
.field public static c:Ljava/util/UUID;


# instance fields
.field b:Ljava/nio/ByteBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "00000000-0000-0000-0000-000000000000"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/bmj;->c:Ljava/util/UUID;

    .line 8
    .line 9
    sget-object v1, Ll/c7b0;->a:Ljava/util/Map;

    .line 10
    .line 11
    const-class v2, Ll/bmj;

    .line 12
    .line 13
    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c7b0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bmj;->b:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bmj;->b:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-void
.end method
