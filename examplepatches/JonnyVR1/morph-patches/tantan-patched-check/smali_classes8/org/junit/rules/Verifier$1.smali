.class Lorg/junit/rules/Verifier$1;
.super Lorg/junit/runners/model/Statement;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/rules/Verifier;->apply(Lorg/junit/runners/model/Statement;Lorg/junit/runner/Description;)Lorg/junit/runners/model/Statement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/rules/Verifier;

.field final synthetic val$base:Lorg/junit/runners/model/Statement;


# direct methods
.method public constructor <init>(Lorg/junit/rules/Verifier;Lorg/junit/runners/model/Statement;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/junit/rules/Verifier$1;->this$0:Lorg/junit/rules/Verifier;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/junit/rules/Verifier$1;->val$base:Lorg/junit/runners/model/Statement;

    .line 4
    .line 5
    invoke-direct {p0}, Lorg/junit/runners/model/Statement;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public evaluate()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/junit/rules/Verifier$1;->val$base:Lorg/junit/runners/model/Statement;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/junit/runners/model/Statement;->evaluate()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lorg/junit/rules/Verifier$1;->this$0:Lorg/junit/rules/Verifier;

    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/junit/rules/Verifier;->verify()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
