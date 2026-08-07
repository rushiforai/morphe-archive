.class public Ll/me00;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/me00$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<A:",
        "Ljava/lang/Object;",
        "B:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final a:Ll/wgw;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wgw<",
            "Ll/me00$b<",
            "TA;>;TB;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    const-wide/16 v0, 0xfa

    .line 12
    invoke-direct {p0, v0, v1}, Ll/me00;-><init>(J)V

    return-void
.end method

.method public constructor <init>(J)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/me00$a;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1, p2}, Ll/me00$a;-><init>(Ll/me00;J)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/me00;->a:Ll/wgw;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;II)Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TA;II)TB;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Ll/me00$b;->a(Ljava/lang/Object;II)Ll/me00$b;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Ll/me00;->a:Ll/wgw;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/wgw;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1}, Ll/me00$b;->c()V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method public b(Ljava/lang/Object;IILjava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TA;IITB;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Ll/me00$b;->a(Ljava/lang/Object;II)Ll/me00$b;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Ll/me00;->a:Ll/wgw;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p4}, Ll/wgw;->k(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void
.end method
