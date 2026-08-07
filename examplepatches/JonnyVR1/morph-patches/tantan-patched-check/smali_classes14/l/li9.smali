.class public final synthetic Ll/li9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/li9;->a:Z

    iput p2, p0, Ll/li9;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/li9;->a:Z

    iget p0, p0, Ll/li9;->b:I

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->Q4(ZILcom/p1/mobile/putong/data/Envelope;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
