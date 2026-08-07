.class public final synthetic Ll/jg9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(JILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/jg9;->a:J

    iput p3, p0, Ll/jg9;->b:I

    iput-object p4, p0, Ll/jg9;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-wide v0, p0, Ll/jg9;->a:J

    iget v2, p0, Ll/jg9;->b:I

    iget-object p0, p0, Ll/jg9;->c:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->e3(JILjava/lang/String;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
