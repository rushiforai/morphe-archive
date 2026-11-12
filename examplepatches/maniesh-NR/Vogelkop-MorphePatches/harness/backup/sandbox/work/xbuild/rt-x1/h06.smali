.class public final Lh06;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk06;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7

    .line 60
    iput-object p1, p0, Lh06;->a:Ljava/lang/String;

    iput-object p2, p0, Lh06;->b:Ljava/lang/String;

    iput-object p3, p0, Lh06;->c:Ljava/lang/String;

    iput-object p4, p0, Lh06;->d:Ljava/lang/String;

    iput-object p5, p0, Lh06;->e:Ljava/lang/String;

    iput-object p6, p0, Lh06;->f:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lorb;)V
    .registers 10

    const-string v0, "headlineText"

    invoke-virtual {p1, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "bodyText"

    invoke-virtual {p1, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "attributionText"

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "bigImageUrl"

    invoke-virtual {p1, v4}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "smallImageUrl"

    invoke-virtual {p1, v5, v3}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "ctaButtonVisible"

    iget-object v7, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v7, v6}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    const-string v6, "ctaButtonText"

    invoke-virtual {p1, v6, v3}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lh06;->a:Ljava/lang/String;

    iput-object v1, p0, Lh06;->b:Ljava/lang/String;

    iput-object v2, p0, Lh06;->c:Ljava/lang/String;

    iput-object v4, p0, Lh06;->d:Ljava/lang/String;

    iput-object v5, p0, Lh06;->e:Ljava/lang/String;

    iput-object p1, p0, Lh06;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final c()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final f()Lh06;
    .registers 1

    return-object p0
.end method
