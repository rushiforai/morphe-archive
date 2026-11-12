.class public final Lkqn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Laqn;


# instance fields
.field public final synthetic a:Llqn;


# direct methods
.method public constructor <init>(Llqn;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkqn;->a:Llqn;

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x2

    iget-object p0, p0, Lkqn;->a:Llqn;

    invoke-static {p0, p1, v0, v1}, Llqn;->I0(Llqn;IZI)V

    return-void
.end method
