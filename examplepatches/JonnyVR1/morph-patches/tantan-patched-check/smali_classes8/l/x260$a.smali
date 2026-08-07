.class public Ll/x260$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/x260;-><init>(Lrx/c;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/pcj<",
        "Lrx/c<",
        "+TTClosing;>;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lrx/c;

.field public final synthetic b:Ll/x260;


# direct methods
.method public constructor <init>(Ll/x260;Lrx/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x260$a;->b:Ll/x260;

    .line 2
    .line 3
    iput-object p2, p0, Ll/x260$a;->a:Lrx/c;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "+TTClosing;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/x260$a;->a:Lrx/c;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/x260$a;->a()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
