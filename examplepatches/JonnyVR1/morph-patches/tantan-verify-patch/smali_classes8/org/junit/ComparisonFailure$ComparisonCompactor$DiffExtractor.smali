.class Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/ComparisonFailure$ComparisonCompactor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DiffExtractor"
.end annotation


# instance fields
.field private final sharedPrefix:Ljava/lang/String;

.field private final sharedSuffix:Ljava/lang/String;

.field final synthetic this$0:Lorg/junit/ComparisonFailure$ComparisonCompactor;


# direct methods
.method private constructor <init>(Lorg/junit/ComparisonFailure$ComparisonCompactor;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->this$0:Lorg/junit/ComparisonFailure$ComparisonCompactor;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lorg/junit/ComparisonFailure$ComparisonCompactor;->access$100(Lorg/junit/ComparisonFailure$ComparisonCompactor;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedPrefix:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p1, v0}, Lorg/junit/ComparisonFailure$ComparisonCompactor;->access$200(Lorg/junit/ComparisonFailure$ComparisonCompactor;Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedSuffix:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public synthetic constructor <init>(Lorg/junit/ComparisonFailure$ComparisonCompactor;Lorg/junit/ComparisonFailure$1;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;-><init>(Lorg/junit/ComparisonFailure$ComparisonCompactor;)V

    return-void
.end method

.method private extractDiff(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedPrefix:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    iget-object p0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedSuffix:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    sub-int/2addr v2, p0

    .line 25
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string p0, "]"

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method


# virtual methods
.method public actualDiff()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->this$0:Lorg/junit/ComparisonFailure$ComparisonCompactor;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/junit/ComparisonFailure$ComparisonCompactor;->access$400(Lorg/junit/ComparisonFailure$ComparisonCompactor;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->extractDiff(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public compactPrefix()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedPrefix:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->this$0:Lorg/junit/ComparisonFailure$ComparisonCompactor;

    .line 8
    .line 9
    invoke-static {v1}, Lorg/junit/ComparisonFailure$ComparisonCompactor;->access$500(Lorg/junit/ComparisonFailure$ComparisonCompactor;)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedPrefix:Ljava/lang/String;

    .line 14
    .line 15
    if-gt v0, v1, :cond_0

    .line 16
    .line 17
    return-object v2

    .line 18
    :cond_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object p0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->this$0:Lorg/junit/ComparisonFailure$ComparisonCompactor;

    .line 23
    .line 24
    invoke-static {p0}, Lorg/junit/ComparisonFailure$ComparisonCompactor;->access$500(Lorg/junit/ComparisonFailure$ComparisonCompactor;)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    sub-int/2addr v0, p0

    .line 29
    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v0, "..."

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public compactSuffix()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedSuffix:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->this$0:Lorg/junit/ComparisonFailure$ComparisonCompactor;

    .line 8
    .line 9
    invoke-static {v1}, Lorg/junit/ComparisonFailure$ComparisonCompactor;->access$500(Lorg/junit/ComparisonFailure$ComparisonCompactor;)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedSuffix:Ljava/lang/String;

    .line 14
    .line 15
    if-gt v0, v1, :cond_0

    .line 16
    .line 17
    return-object v2

    .line 18
    :cond_0
    iget-object p0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->this$0:Lorg/junit/ComparisonFailure$ComparisonCompactor;

    .line 19
    .line 20
    invoke-static {p0}, Lorg/junit/ComparisonFailure$ComparisonCompactor;->access$500(Lorg/junit/ComparisonFailure$ComparisonCompactor;)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {v2, v0, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "..."

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public expectedDiff()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->this$0:Lorg/junit/ComparisonFailure$ComparisonCompactor;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/junit/ComparisonFailure$ComparisonCompactor;->access$300(Lorg/junit/ComparisonFailure$ComparisonCompactor;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->extractDiff(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
