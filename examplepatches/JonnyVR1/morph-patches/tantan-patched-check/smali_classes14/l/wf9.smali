.class public final synthetic Ll/wf9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/xf9;

.field public final synthetic b:Z

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/xf9;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wf9;->a:Ll/xf9;

    iput-boolean p2, p0, Ll/wf9;->b:Z

    iput p3, p0, Ll/wf9;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wf9;->a:Ll/xf9;

    iget-boolean v1, p0, Ll/wf9;->b:Z

    iget p0, p0, Ll/wf9;->c:I

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, p0, p1}, Ll/xf9;->f3(Ll/xf9;ZILcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
