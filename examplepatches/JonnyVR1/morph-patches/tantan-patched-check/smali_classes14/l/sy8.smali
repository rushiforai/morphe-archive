.class public final synthetic Ll/sy8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sy8;->a:Ljava/lang/String;

    iput-boolean p2, p0, Ll/sy8;->b:Z

    iput-object p3, p0, Ll/sy8;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sy8;->a:Ljava/lang/String;

    iget-boolean v1, p0, Ll/sy8;->b:Z

    iget-object p0, p0, Ll/sy8;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/j;->D3(Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
