.class public final Lzwe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljnf;


# instance fields
.field public final a:Lgjm;


# direct methods
.method public constructor <init>(Lgjm;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzwe;->a:Lgjm;

    return-void
.end method


# virtual methods
.method public final varargs a([I)V
    .registers 6

    new-instance v0, Lexe;

    new-instance v1, Loba;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p1}, Loba;-><init>(II[I)V

    const/4 p1, 0x1

    invoke-direct {v0, p1, v1}, Lexe;-><init>(ILoba;)V

    iget-object p0, p0, Lzwe;->a:Lgjm;

    invoke-virtual {p0, v0, v3}, Lgjm;->e(Ln37;Z)V

    return-void
.end method
