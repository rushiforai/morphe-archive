.class public Ll/uzh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Lcom/p1/mobile/putong/data/Emotion;

.field public final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(ZLcom/p1/mobile/putong/data/Emotion;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/uzh;->a:Z

    .line 5
    .line 6
    iput-object p2, p0, Ll/uzh;->b:Lcom/p1/mobile/putong/data/Emotion;

    .line 7
    .line 8
    iput-object p3, p0, Ll/uzh;->c:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uzh;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Lcom/p1/mobile/putong/data/Emotion;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uzh;->b:Lcom/p1/mobile/putong/data/Emotion;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uzh;->b:Lcom/p1/mobile/putong/data/Emotion;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uzh;->b:Lcom/p1/mobile/putong/data/Emotion;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/uzh;->a:Z

    .line 2
    .line 3
    return p0
.end method
