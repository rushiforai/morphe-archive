.class public final enum Lf7h;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final b:Lwu5;

.field public static final enum c:Lf7h;

.field public static final enum d:Lf7h;

.field public static final enum e:Lf7h;

.field public static final enum f:Lf7h;

.field public static final enum g:Lf7h;

.field public static final enum h:Lf7h;

.field public static final enum i:Lf7h;

.field public static final synthetic j:[Lf7h;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lf7h;

    const/4 v1, 0x0

    const-string v2, "http/1.0"

    const-string v3, "HTTP_1_0"

    invoke-direct {v0, v3, v1, v2}, Lf7h;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lf7h;->c:Lf7h;

    new-instance v1, Lf7h;

    const/4 v2, 0x1

    const-string v3, "http/1.1"

    const-string v4, "HTTP_1_1"

    invoke-direct {v1, v4, v2, v3}, Lf7h;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lf7h;->d:Lf7h;

    new-instance v2, Lf7h;

    const/4 v3, 0x2

    const-string v4, "spdy/3.1"

    const-string v5, "SPDY_3"

    invoke-direct {v2, v5, v3, v4}, Lf7h;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lf7h;->e:Lf7h;

    new-instance v3, Lf7h;

    const/4 v4, 0x3

    const-string v5, "h2"

    const-string v6, "HTTP_2"

    invoke-direct {v3, v6, v4, v5}, Lf7h;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lf7h;->f:Lf7h;

    new-instance v4, Lf7h;

    const/4 v5, 0x4

    const-string v6, "h2_prior_knowledge"

    const-string v7, "H2_PRIOR_KNOWLEDGE"

    invoke-direct {v4, v7, v5, v6}, Lf7h;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v4, Lf7h;->g:Lf7h;

    new-instance v5, Lf7h;

    const/4 v6, 0x5

    const-string v7, "quic"

    const-string v8, "QUIC"

    invoke-direct {v5, v8, v6, v7}, Lf7h;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Lf7h;->h:Lf7h;

    new-instance v6, Lf7h;

    const/4 v7, 0x6

    const-string v8, "h3"

    const-string v9, "HTTP_3"

    invoke-direct {v6, v9, v7, v8}, Lf7h;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v6, Lf7h;->i:Lf7h;

    filled-new-array/range {v0 .. v6}, [Lf7h;

    move-result-object v0

    sput-object v0, Lf7h;->j:[Lf7h;

    new-instance v0, Lh58;

    new-instance v0, Lwu5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lf7h;->b:Lwu5;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lf7h;->a:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lf7h;
    .registers 2

    const-class v0, Lf7h;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lf7h;

    return-object p0
.end method

.method public static values()[Lf7h;
    .registers 1

    sget-object v0, Lf7h;->j:[Lf7h;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lf7h;

    return-object v0
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lf7h;->a:Ljava/lang/String;

    return-object p0
.end method
