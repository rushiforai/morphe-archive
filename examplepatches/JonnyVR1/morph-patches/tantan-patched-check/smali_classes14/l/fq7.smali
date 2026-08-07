.class public final synthetic Ll/fq7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/mq7;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/mq7;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fq7;->a:Ll/mq7;

    iput-boolean p2, p0, Ll/fq7;->b:Z

    iput-object p3, p0, Ll/fq7;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fq7;->a:Ll/mq7;

    iget-boolean v1, p0, Ll/fq7;->b:Z

    iget-object p0, p0, Ll/fq7;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/mq7;->c3(Ll/mq7;ZLjava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
