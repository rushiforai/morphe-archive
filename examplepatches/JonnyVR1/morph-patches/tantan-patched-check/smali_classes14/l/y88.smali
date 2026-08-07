.class public final synthetic Ll/y88;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/y88;->a:Z

    iput-object p2, p0, Ll/y88;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/y88;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/y88;->a:Z

    iget-object v1, p0, Ll/y88;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object p0, p0, Ll/y88;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/g;->ba(ZLcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
