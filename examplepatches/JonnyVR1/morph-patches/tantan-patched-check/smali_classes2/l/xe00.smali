.class public final synthetic Ll/xe00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sii$a;


# instance fields
.field public final synthetic a:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xe00;->a:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a(Ljava/io/File;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xe00;->a:Ljava/util/List;

    invoke-static {p0, p1}, Lcom/facebook/appevents/ml/ModelManager$a$a;->b(Ljava/util/List;Ljava/io/File;)V

    return-void
.end method
