.class public final synthetic Ll/j9k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Lcom/facebook/e;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Lcom/facebook/e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j9k;->a:Ljava/util/ArrayList;

    iput-object p2, p0, Ll/j9k;->b:Lcom/facebook/e;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j9k;->a:Ljava/util/ArrayList;

    iget-object p0, p0, Ll/j9k;->b:Lcom/facebook/e;

    invoke-static {v0, p0}, Lcom/facebook/GraphRequest$c;->a(Ljava/util/ArrayList;Lcom/facebook/e;)V

    return-void
.end method
