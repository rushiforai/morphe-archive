.class public final synthetic Lufe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvwh;
.implements Ldkj;


# instance fields
.field public final synthetic a:Lfge;


# direct methods
.method public synthetic constructor <init>(Lfge;)V
    .registers 2

    iput-object p1, p0, Lufe;->a:Lfge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object p0, p0, Lufe;->a:Lfge;

    iget-object v0, p0, Lfge;->x:Lrc9;

    new-instance v1, Ltfe;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Ltfe;-><init>(Lfge;B)V

    iget-object p0, v0, Lrc9;->b:Lbf9;

    invoke-virtual {p0, v1}, Lbf9;->f(Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final f(Lo93;)V
    .registers 2

    iget-object p0, p0, Lufe;->a:Lfge;

    invoke-virtual {p0, p1}, Lfge;->I0(Lo93;)V

    return-void
.end method
