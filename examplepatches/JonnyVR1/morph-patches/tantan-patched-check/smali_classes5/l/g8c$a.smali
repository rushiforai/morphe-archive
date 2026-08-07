.class public Ll/g8c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g8c;->A(Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

.field public final synthetic b:Ll/g8c;


# direct methods
.method public constructor <init>(Ll/g8c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g8c$a;->b:Ll/g8c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Ll/g8c;->q:Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

    .line 7
    .line 8
    iput-object p1, p0, Ll/g8c$a;->a:Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g8c$a;->b:Ll/g8c;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/g8c;->n()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/g8c$a;->a:Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Ll/g8c$a;->b:Ll/g8c;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ll/g8c;->y(Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Ll/g8c$a;->a:Lcom/p1/mobile/putong/dbcenter/db/opt/TransactionOpt;

    .line 20
    .line 21
    return-void
.end method
