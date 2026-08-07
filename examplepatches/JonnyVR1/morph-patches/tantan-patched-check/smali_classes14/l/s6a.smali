.class public final synthetic Ll/s6a;
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

    iput-boolean p1, p0, Ll/s6a;->a:Z

    iput-object p2, p0, Ll/s6a;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/s6a;->a:Z

    iget-object p0, p0, Ll/s6a;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/v;->a4(ZLjava/lang/String;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
