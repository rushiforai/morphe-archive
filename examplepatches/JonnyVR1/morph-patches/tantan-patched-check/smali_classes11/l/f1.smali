.class public final synthetic Ll/f1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/facebook/GraphRequest$b;


# instance fields
.field public final synthetic a:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f1;->a:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a(Lcom/facebook/GraphResponse;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f1;->a:Ljava/util/List;

    invoke-static {p0, p1}, Ll/h1;->b(Ljava/util/List;Lcom/facebook/GraphResponse;)V

    return-void
.end method
