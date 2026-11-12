.class public final synthetic Ldpk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lsrg;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lepk;


# direct methods
.method public synthetic constructor <init>(Lepk;B)V
    .registers 3

    iput-byte p2, p0, Ldpk;->a:B

    iput-object p1, p0, Ldpk;->b:Lepk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Z
    .registers 3

    iget-byte v0, p0, Ldpk;->a:B

    iget-object p0, p0, Ldpk;->b:Lepk;

    check-cast p1, Lrca;

    invoke-virtual {p0, p1}, Lepk;->test(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method
