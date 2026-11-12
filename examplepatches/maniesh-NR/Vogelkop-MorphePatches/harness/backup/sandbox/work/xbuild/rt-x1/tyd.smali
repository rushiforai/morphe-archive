.class public final synthetic Ltyd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwyd;


# direct methods
.method public synthetic constructor <init>(Lwyd;B)V
    .registers 3

    iput-byte p2, p0, Ltyd;->a:B

    iput-object p1, p0, Ltyd;->b:Lwyd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Ltyd;->a:B

    iget-object p0, p0, Ltyd;->b:Lwyd;

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lwyd;->a(Ljava/util/List;)V

    return-void
.end method
