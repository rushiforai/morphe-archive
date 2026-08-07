.class Ll/o410$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/o410;->A(Ll/wej;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ll/wej;

.field final synthetic c:Ll/o410;


# direct methods
.method public constructor <init>(Ll/o410;Ljava/lang/String;Ll/wej;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/o410$a;->c:Ll/o410;

    .line 2
    .line 3
    iput-object p2, p0, Ll/o410$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/o410$a;->b:Ll/wej;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o410$a;->c:Ll/o410;

    .line 2
    .line 3
    iget-object v0, v0, Ll/o410;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 4
    .line 5
    iget-object v1, p0, Ll/o410$a;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/o410$a;->b:Ll/wej;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
