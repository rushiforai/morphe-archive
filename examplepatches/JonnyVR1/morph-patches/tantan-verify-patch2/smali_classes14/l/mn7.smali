.class public final synthetic Ll/mn7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/no7;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Links;

.field public final synthetic c:Z

.field public final synthetic d:J


# direct methods
.method public synthetic constructor <init>(Ll/no7;Lcom/p1/mobile/putong/data/Links;ZJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mn7;->a:Ll/no7;

    iput-object p2, p0, Ll/mn7;->b:Lcom/p1/mobile/putong/data/Links;

    iput-boolean p3, p0, Ll/mn7;->c:Z

    iput-wide p4, p0, Ll/mn7;->d:J

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/mn7;->a:Ll/no7;

    iget-object v1, p0, Ll/mn7;->b:Lcom/p1/mobile/putong/data/Links;

    iget-boolean v2, p0, Ll/mn7;->c:Z

    iget-wide v3, p0, Ll/mn7;->d:J

    invoke-static {v0, v1, v2, v3, v4}, Ll/no7;->j3(Ll/no7;Lcom/p1/mobile/putong/data/Links;ZJ)Lrx/c;

    move-result-object p0

    return-object p0
.end method
