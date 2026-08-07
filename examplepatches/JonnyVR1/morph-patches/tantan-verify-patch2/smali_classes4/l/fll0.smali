.class public final synthetic Ll/fll0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/sunshine/engine/base/s;

.field public final synthetic b:Lcom/sunshine/engine/base/a;


# direct methods
.method public synthetic constructor <init>(Lcom/sunshine/engine/base/s;Lcom/sunshine/engine/base/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fll0;->a:Lcom/sunshine/engine/base/s;

    iput-object p2, p0, Ll/fll0;->b:Lcom/sunshine/engine/base/a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fll0;->a:Lcom/sunshine/engine/base/s;

    iget-object p0, p0, Ll/fll0;->b:Lcom/sunshine/engine/base/a;

    invoke-static {v0, p0}, Lcom/sunshine/engine/base/s;->f(Lcom/sunshine/engine/base/s;Lcom/sunshine/engine/base/a;)V

    return-void
.end method
