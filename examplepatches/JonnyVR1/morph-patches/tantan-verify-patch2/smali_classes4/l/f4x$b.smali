.class public Ll/f4x$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f4x;->a0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/android/app/c;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/f4x;


# direct methods
.method public constructor <init>(Ll/f4x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f4x$b;->a:Ll/f4x;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/f4x$b;->a:Ll/f4x;

    .line 6
    .line 7
    invoke-static {p1}, Ll/f4x;->t0(Ll/f4x;)Ll/iam;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 12
    .line 13
    iget-object p0, p0, Ll/f4x$b;->a:Ll/f4x;

    .line 14
    .line 15
    invoke-static {p0}, Ll/f4x;->o0(Ll/f4x;)Ll/iam;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->p:Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/MarryModeEmptyView;->getType()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->B(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 32
    .line 33
    if-ne p1, v0, :cond_1

    .line 34
    .line 35
    iget-object p0, p0, Ll/f4x$b;->a:Ll/f4x;

    .line 36
    .line 37
    invoke-static {p0}, Ll/f4x;->u0(Ll/f4x;)Ll/iam;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->e()V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f4x$b;->a(Lcom/p1/mobile/android/app/c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
