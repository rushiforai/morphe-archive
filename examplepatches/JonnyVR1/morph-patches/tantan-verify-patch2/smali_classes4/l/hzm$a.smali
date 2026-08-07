.class public Ll/hzm$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hzm;->B(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/function/Consumer<",
        "Lcom/p1/mobile/putong/data/Tag;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ll/hzm;


# direct methods
.method public constructor <init>(Ll/hzm;Ljava/util/ArrayList;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/hzm$a;->c:Ll/hzm;

    .line 2
    .line 3
    iput-object p2, p0, Ll/hzm$a;->a:Ljava/util/ArrayList;

    .line 4
    .line 5
    iput-object p3, p0, Ll/hzm$a;->b:Ljava/util/List;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/Tag;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LabelData;->new_()Lcom/p1/mobile/putong/core/data/LabelData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p0, Ll/hzm$a;->a:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput-boolean p1, v0, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 16
    .line 17
    iget-object p0, p0, Ll/hzm$a;->b:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/Tag;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hzm$a;->a(Lcom/p1/mobile/putong/data/Tag;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
