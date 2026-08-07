.class public final synthetic Ll/n98;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/n98;->a:Z

    iput-object p2, p0, Ll/n98;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/n98;->a:Z

    iget-object p0, p0, Ll/n98;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->Yb(ZLjava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
