.class public Ll/nbz$k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nbz;->u2(Ll/clz;)Ljava/util/ArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/clz;


# direct methods
.method public constructor <init>(Ll/clz;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nbz$k;->a:Ll/clz;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/clz;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    const/4 v2, 0x3

    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->new_()Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    const-string v3, "\u5982\u679c\u53ef\u4ee5\u7528\u4e00\u534a\u667a\u5546\u636210cm\u7684\u8eab\u9ad8\uff0c\u4f60\u613f\u610f\u5417\uff1f"

    .line 15
    .line 16
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->question:Ljava/lang/String;

    .line 17
    .line 18
    const/16 v3, 0x7b

    .line 19
    .line 20
    iput v3, v2, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->questionId:I

    .line 21
    .line 22
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 31
    .line 32
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v1, p0, v0}, Lcom/p1/mobile/putong/core/api/g;->Yg(Ljava/lang/String;Ljava/util/List;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/nbz$k;->a:Ll/clz;

    .line 2
    .line 3
    new-instance v0, Ll/sbz;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/sbz;-><init>(Ll/clz;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
