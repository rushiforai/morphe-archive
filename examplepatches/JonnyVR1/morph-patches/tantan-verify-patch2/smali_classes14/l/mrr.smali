.class public final synthetic Ll/mrr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/prr;

.field public final synthetic b:Ll/msr;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/prr;Ll/msr;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mrr;->a:Ll/prr;

    iput-object p2, p0, Ll/mrr;->b:Ll/msr;

    iput-object p3, p0, Ll/mrr;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mrr;->a:Ll/prr;

    iget-object v1, p0, Ll/mrr;->b:Ll/msr;

    iget-object p0, p0, Ll/mrr;->c:Ljava/util/List;

    invoke-static {v0, v1, p0}, Ll/prr;->p(Ll/prr;Ll/msr;Ljava/util/List;)V

    return-void
.end method
