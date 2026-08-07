.class public final synthetic Ll/z18;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Z

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;ZZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z18;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-boolean p2, p0, Ll/z18;->b:Z

    iput-boolean p3, p0, Ll/z18;->c:Z

    iput-object p4, p0, Ll/z18;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/z18;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-boolean v1, p0, Ll/z18;->b:Z

    iget-boolean v2, p0, Ll/z18;->c:Z

    iget-object p0, p0, Ll/z18;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/g;->Hb(Lcom/p1/mobile/putong/core/api/g;ZZLjava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
