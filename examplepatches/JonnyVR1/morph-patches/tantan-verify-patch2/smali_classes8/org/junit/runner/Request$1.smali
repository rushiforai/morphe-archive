.class Lorg/junit/runner/Request$1;
.super Lorg/junit/runner/Request;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/runner/Request;->runner(Lorg/junit/runner/Runner;)Lorg/junit/runner/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field final synthetic val$runner:Lorg/junit/runner/Runner;


# direct methods
.method public constructor <init>(Lorg/junit/runner/Runner;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/junit/runner/Request$1;->val$runner:Lorg/junit/runner/Runner;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/junit/runner/Request;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getRunner()Lorg/junit/runner/Runner;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/junit/runner/Request$1;->val$runner:Lorg/junit/runner/Runner;

    .line 2
    .line 3
    return-object p0
.end method
