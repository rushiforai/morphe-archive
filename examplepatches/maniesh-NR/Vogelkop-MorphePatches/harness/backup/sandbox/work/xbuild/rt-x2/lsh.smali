.class public final enum Llsh;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Llsh;

.field public static final enum c:Llsh;

.field public static final enum d:Llsh;

.field public static final enum e:Llsh;

.field public static final enum f:Llsh;

.field public static final enum g:Llsh;

.field public static final enum h:Llsh;

.field public static final enum i:Llsh;

.field public static final synthetic j:[Llsh;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 11

    new-instance v0, Llsh;

    const-string v1, "NONE"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Llsh;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Llsh;->b:Llsh;

    new-instance v1, Llsh;

    const/4 v2, 0x1

    const-string v4, "like"

    const-string v5, "LIKE"

    invoke-direct {v1, v5, v2, v4}, Llsh;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Llsh;->c:Llsh;

    new-instance v2, Llsh;

    const/4 v4, 0x2

    const-string v5, "laugh"

    const-string v6, "LAUGH"

    invoke-direct {v2, v6, v4, v5}, Llsh;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Llsh;->d:Llsh;

    move-object v4, v3

    new-instance v3, Llsh;

    const/4 v5, 0x3

    const-string v6, "surprise"

    const-string v7, "SURPRISE"

    invoke-direct {v3, v7, v5, v6}, Llsh;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Llsh;->e:Llsh;

    move-object v5, v4

    new-instance v4, Llsh;

    const/4 v6, 0x4

    const-string v7, "sad"

    const-string v8, "SAD"

    invoke-direct {v4, v8, v6, v7}, Llsh;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v4, Llsh;->f:Llsh;

    move-object v6, v5

    new-instance v5, Llsh;

    const/4 v7, 0x5

    const-string v8, "angry"

    const-string v9, "ANGRY"

    invoke-direct {v5, v9, v7, v8}, Llsh;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Llsh;->g:Llsh;

    move-object v7, v6

    new-instance v6, Llsh;

    const-string v8, "DISLIKE"

    const/4 v9, 0x6

    invoke-direct {v6, v8, v9, v7}, Llsh;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v6, Llsh;->h:Llsh;

    move-object v8, v7

    new-instance v7, Llsh;

    const-string v9, "IGNORE"

    const/4 v10, 0x7

    invoke-direct {v7, v9, v10, v8}, Llsh;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v7, Llsh;->i:Llsh;

    filled-new-array/range {v0 .. v7}, [Llsh;

    move-result-object v0

    sput-object v0, Llsh;->j:[Llsh;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Llsh;->a:Ljava/lang/String;

    return-void
.end method

.method public static d(Ljava/lang/String;)Llsh;
    .registers 4

    sget-object v0, Lmsh;->C:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Llsh;

    iget-object v2, v1, Llsh;->a:Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    return-object v1

    :cond_1b
    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Llsh;
    .registers 2

    const-class v0, Llsh;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Llsh;

    return-object p0
.end method

.method public static values()[Llsh;
    .registers 1

    sget-object v0, Llsh;->j:[Llsh;

    invoke-virtual {v0}, [Llsh;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Llsh;

    return-object v0
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .registers 2

    sget-object v0, Laik;->a:[Ljava/lang/String;

    iget-object p0, p0, Llsh;->a:Ljava/lang/String;

    if-nez p0, :cond_8

    const-string p0, ""

    :cond_8
    return-object p0
.end method
