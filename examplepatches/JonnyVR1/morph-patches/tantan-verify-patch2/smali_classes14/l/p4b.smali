.class public final synthetic Ll/p4b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p4b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput-boolean p2, p0, Ll/p4b;->b:Z

    iput-object p3, p0, Ll/p4b;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p4b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-boolean v1, p0, Ll/p4b;->b:Z

    iget-object p0, p0, Ll/p4b;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->b3(Lcom/p1/mobile/putong/core/api/CoreSuggested;ZLjava/lang/String;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
