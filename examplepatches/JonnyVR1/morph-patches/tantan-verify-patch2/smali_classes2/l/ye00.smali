.class public final synthetic Ll/ye00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sii$a;


# instance fields
.field public final synthetic a:Lcom/facebook/appevents/ml/ModelManager$a;

.field public final synthetic b:Lcom/facebook/appevents/ml/a;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/appevents/ml/ModelManager$a;Lcom/facebook/appevents/ml/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ye00;->a:Lcom/facebook/appevents/ml/ModelManager$a;

    iput-object p2, p0, Ll/ye00;->b:Lcom/facebook/appevents/ml/a;

    return-void
.end method


# virtual methods
.method public final a(Ljava/io/File;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ye00;->a:Lcom/facebook/appevents/ml/ModelManager$a;

    iget-object p0, p0, Ll/ye00;->b:Lcom/facebook/appevents/ml/a;

    invoke-static {v0, p0, p1}, Lcom/facebook/appevents/ml/ModelManager$a$a;->a(Lcom/facebook/appevents/ml/ModelManager$a;Lcom/facebook/appevents/ml/a;Ljava/io/File;)V

    return-void
.end method
