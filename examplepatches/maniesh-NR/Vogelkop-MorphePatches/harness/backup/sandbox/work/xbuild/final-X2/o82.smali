.class public final Lo82;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final synthetic a:Lq82;


# direct methods
.method public constructor <init>(Lq82;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lo82;->a:Lq82;

    return-void
.end method


# virtual methods
.method public final H(Lb2l;Lb2l;I)V
    .registers 4

    const/4 p1, 0x0

    const/4 p3, 0x1

    iget-object p0, p0, Lo82;->a:Lq82;

    invoke-virtual {p0, p1, p3}, Lq82;->b(ZZ)V

    iput-object p2, p0, Lq82;->j:Lb2l;

    invoke-virtual {p0}, Lq82;->d()Z

    move-result p1

    if-eqz p1, :cond_12

    invoke-virtual {p0}, Lq82;->a()V

    :cond_12
    return-void
.end method
