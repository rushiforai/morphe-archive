.class public final synthetic Ll/kw7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:J

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;JLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kw7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-wide p2, p0, Ll/kw7;->b:J

    iput-object p4, p0, Ll/kw7;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kw7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-wide v1, p0, Ll/kw7;->b:J

    iget-object p0, p0, Ll/kw7;->c:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/g;->Dc(Lcom/p1/mobile/putong/core/api/g;JLjava/lang/String;)V

    return-void
.end method
