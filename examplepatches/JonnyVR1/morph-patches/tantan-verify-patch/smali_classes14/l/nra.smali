.class public final synthetic Ll/nra;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ura;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/ura;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nra;->a:Ll/ura;

    iput-boolean p2, p0, Ll/nra;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nra;->a:Ll/ura;

    iget-boolean p0, p0, Ll/nra;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0, p1}, Ll/ura;->g3(Ll/ura;ZLcom/p1/mobile/putong/data/Envelope;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
