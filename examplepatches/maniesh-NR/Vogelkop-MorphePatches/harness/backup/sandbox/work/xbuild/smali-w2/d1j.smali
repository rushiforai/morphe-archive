.class public final synthetic Ld1j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lf1j;


# direct methods
.method public synthetic constructor <init>(Lf1j;B)V
    .registers 3

    iput-byte p2, p0, Ld1j;->a:B

    iput-object p1, p0, Ld1j;->b:Lf1j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Ld1j;->a:B

    iget-object p0, p0, Ld1j;->b:Lf1j;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p0, p1}, Lf1j;->c(Z)V

    return-void
.end method
