.class Lorg/eclipse/jetty/util/ajax/JSON$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/util/ajax/JSON$Convertible;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/util/ajax/JSON;->appendJSON(Ljava/lang/Appendable;Lorg/eclipse/jetty/util/ajax/JSON$Convertor;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/util/ajax/JSON;

.field final synthetic val$convertor:Lorg/eclipse/jetty/util/ajax/JSON$Convertor;

.field final synthetic val$object:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/util/ajax/JSON;Lorg/eclipse/jetty/util/ajax/JSON$Convertor;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/util/ajax/JSON$1;->this$0:Lorg/eclipse/jetty/util/ajax/JSON;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/eclipse/jetty/util/ajax/JSON$1;->val$convertor:Lorg/eclipse/jetty/util/ajax/JSON$Convertor;

    .line 4
    .line 5
    iput-object p3, p0, Lorg/eclipse/jetty/util/ajax/JSON$1;->val$object:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public fromJSON(Ljava/util/Map;)V
    .locals 0

    return-void
.end method

.method public toJSON(Lorg/eclipse/jetty/util/ajax/JSON$Output;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ajax/JSON$1;->val$convertor:Lorg/eclipse/jetty/util/ajax/JSON$Convertor;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/util/ajax/JSON$1;->val$object:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-interface {v0, p0, p1}, Lorg/eclipse/jetty/util/ajax/JSON$Convertor;->toJSON(Ljava/lang/Object;Lorg/eclipse/jetty/util/ajax/JSON$Output;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
