.class public Ll/i3l$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/i3l;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ll/q2l;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/i3l;


# direct methods
.method public constructor <init>(Ll/i3l;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i3l$a;->a:Ll/i3l;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/q2l;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i3l$a;->a:Ll/i3l;

    .line 2
    .line 3
    invoke-static {p0}, Ll/i3l;->b(Ll/i3l;)Ll/a3l;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/a3l;->s0(Ll/q2l;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/q2l;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i3l$a;->a(Ll/q2l;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
