.class public abstract Loqe;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Lqre;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lqre;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Loqe;->b:Ljava/lang/String;

    iput-object p2, p0, Loqe;->c:Ljava/lang/String;

    iput-object p3, p0, Loqe;->d:Lqre;

    return-void
.end method


# virtual methods
.method public a()Z
    .registers 2

    const-string v0, "top_news_group"

    iget-object p0, p0, Loqe;->c:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    const-string v0, "roundups"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method
