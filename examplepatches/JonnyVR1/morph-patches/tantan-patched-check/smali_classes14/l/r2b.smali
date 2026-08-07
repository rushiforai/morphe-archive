.class public final synthetic Ll/r2b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:Ljava/lang/StringBuilder;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:J


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;Ljava/lang/StringBuilder;Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r2b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput-object p2, p0, Ll/r2b;->b:Ljava/lang/StringBuilder;

    iput-object p3, p0, Ll/r2b;->c:Ljava/lang/String;

    iput-wide p4, p0, Ll/r2b;->d:J

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/r2b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-object v1, p0, Ll/r2b;->b:Ljava/lang/StringBuilder;

    iget-object v2, p0, Ll/r2b;->c:Ljava/lang/String;

    iget-wide v3, p0, Ll/r2b;->d:J

    invoke-static {v0, v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->n3(Lcom/p1/mobile/putong/core/api/CoreSuggested;Ljava/lang/StringBuilder;Ljava/lang/String;J)Lrx/c;

    move-result-object p0

    return-object p0
.end method
