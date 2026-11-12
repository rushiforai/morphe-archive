.class public final Lyv9;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Lyv9;


# instance fields
.field public final a:D

.field public final b:D

.field public final c:J


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lyv9;

    const-wide/16 v1, 0x0

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    invoke-direct/range {v0 .. v6}, Lyv9;-><init>(DDJ)V

    sput-object v0, Lyv9;->d:Lyv9;

    return-void
.end method

.method public constructor <init>(DDJ)V
    .registers 7

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-wide p1, p0, Lyv9;->a:D

    .line 32
    iput-wide p3, p0, Lyv9;->b:D

    .line 33
    iput-wide p5, p0, Lyv9;->c:J

    return-void
.end method

.method public constructor <init>(Lorb;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object p1, p1, Lorb;->a:Lorg/json/JSONObject;

    const-string v0, "la"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p0, Lyv9;->a:D

    const-string v0, "lo"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p0, Lyv9;->b:D

    const-string v0, "ts"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lyv9;->c:J

    return-void
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
