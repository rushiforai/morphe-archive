.class public final Lyxk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lywk;


# instance fields
.field public final synthetic a:Lzxk;


# direct methods
.method public constructor <init>(Lzxk;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyxk;->a:Lzxk;

    return-void
.end method


# virtual methods
.method public final G(I)V
    .registers 2

    return-void
.end method

.method public final e(Z)V
    .registers 2

    if-eqz p1, :cond_7

    iget-object p0, p0, Lyxk;->a:Lzxk;

    invoke-virtual {p0}, Lzxk;->b()V

    :cond_7
    return-void
.end method
