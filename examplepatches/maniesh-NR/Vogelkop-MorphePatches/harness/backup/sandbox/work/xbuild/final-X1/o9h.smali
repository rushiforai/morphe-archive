.class public final Lo9h;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:[B

.field public static final d:Ljava/util/List;

.field public static final e:Ll08;


# instance fields
.field public final a:[B

.field public final b:[B


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x1

    new-array v0, v0, [B

    const/16 v1, 0x2a

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    sput-object v0, Lo9h;->c:[B

    const-string v0, "*"

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lo9h;->d:Ljava/util/List;

    sget-object v0, Ll08;->a:Ll08;

    sput-object v0, Lo9h;->e:Ll08;

    return-void
.end method

.method public constructor <init>([B[B)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lo9h;->a:[B

    iput-object p2, p0, Lo9h;->b:[B

    return-void
.end method
