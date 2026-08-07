.class public final synthetic Ll/sb5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;ZLjava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sb5;->a:Ljava/util/List;

    iput-boolean p2, p0, Ll/sb5;->b:Z

    iput-object p3, p0, Ll/sb5;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sb5;->a:Ljava/util/List;

    iget-boolean v1, p0, Ll/sb5;->b:Z

    iget-object p0, p0, Ll/sb5;->c:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, p0, p1}, Ll/yb5;->F(Ljava/util/List;ZLjava/util/List;Lcom/p1/mobile/putong/data/Envelope;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
