.class public final synthetic Ll/sp7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/pcj;

.field public final synthetic b:Lrx/subjects/a;


# direct methods
.method public synthetic constructor <init>(Ll/pcj;Lrx/subjects/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sp7;->a:Ll/pcj;

    iput-object p2, p0, Ll/sp7;->b:Lrx/subjects/a;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sp7;->a:Ll/pcj;

    iget-object p0, p0, Ll/sp7;->b:Lrx/subjects/a;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreCommonServiceImpl;->N(Ll/pcj;Lrx/subjects/a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
