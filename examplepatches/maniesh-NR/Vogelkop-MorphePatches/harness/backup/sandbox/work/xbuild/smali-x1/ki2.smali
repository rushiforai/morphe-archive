.class public final synthetic Lki2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:Lli2;

.field public final synthetic b:B


# direct methods
.method public synthetic constructor <init>(Lli2;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lki2;->a:Lli2;

    iput-byte p2, p0, Lki2;->b:B

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Ljava/lang/Long;

    const/4 p1, 0x0

    iget-object v0, p0, Lki2;->a:Lli2;

    iput-object p1, v0, Lli2;->i:Lih4;

    iget-byte p0, p0, Lki2;->b:B

    invoke-virtual {v0, p0}, Lhi2;->c(I)V

    return-void
.end method
