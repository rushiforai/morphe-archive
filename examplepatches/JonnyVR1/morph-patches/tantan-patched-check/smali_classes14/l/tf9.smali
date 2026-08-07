.class public final synthetic Ll/tf9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/xf9;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/xf9;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tf9;->a:Ll/xf9;

    iput p2, p0, Ll/tf9;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tf9;->a:Ll/xf9;

    iget p0, p0, Ll/tf9;->b:I

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0, p1}, Ll/xf9;->s3(Ll/xf9;ILcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
