.class public final synthetic Ll/di7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/di7;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/di7;->b:Ljava/util/List;

    iput-object p3, p0, Ll/di7;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/di7;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/di7;->b:Ljava/util/List;

    iget-object p0, p0, Ll/di7;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/e;->s4(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
