.class Lcom/leanplum/Var$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/leanplum/Var$VarInitializer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/Var;->defineResource(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;[B)Lcom/leanplum/Var;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/leanplum/Var$VarInitializer<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$data:[B

.field final synthetic val$hash:Ljava/lang/String;

.field final synthetic val$size:I


# direct methods
.method public constructor <init>(ILjava/lang/String;[B)V
    .registers 4

    iput p1, p0, Lcom/leanplum/Var$3;->val$size:I

    iput-object p2, p0, Lcom/leanplum/Var$3;->val$hash:Ljava/lang/String;

    iput-object p3, p0, Lcom/leanplum/Var$3;->val$data:[B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public init(Lcom/leanplum/Var;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/Var<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/leanplum/Var;->isResource:Z

    iget v0, p0, Lcom/leanplum/Var$3;->val$size:I

    # setter for: Lcom/leanplum/Var;->size:I
    invoke-static {p1, v0}, Lcom/leanplum/Var;->access$102(Lcom/leanplum/Var;I)I

    iget-object v0, p0, Lcom/leanplum/Var$3;->val$hash:Ljava/lang/String;

    # setter for: Lcom/leanplum/Var;->hash:Ljava/lang/String;
    invoke-static {p1, v0}, Lcom/leanplum/Var;->access$202(Lcom/leanplum/Var;Ljava/lang/String;)Ljava/lang/String;

    iget-object p0, p0, Lcom/leanplum/Var$3;->val$data:[B

    # setter for: Lcom/leanplum/Var;->data:[B
    invoke-static {p1, p0}, Lcom/leanplum/Var;->access$302(Lcom/leanplum/Var;[B)[B

    return-void
.end method
