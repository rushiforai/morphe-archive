.class public final synthetic Ll/nl7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/e;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/e;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nl7;->a:Lcom/p1/mobile/putong/core/api/e;

    iput-object p2, p0, Ll/nl7;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/nl7;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nl7;->a:Lcom/p1/mobile/putong/core/api/e;

    iget-object v1, p0, Ll/nl7;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/nl7;->c:Z

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/api/e;->c6(Lcom/p1/mobile/putong/core/api/e;Ljava/lang/String;ZLcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
