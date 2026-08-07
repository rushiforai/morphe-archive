.class public Ll/de00$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/de00;->i()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/de00;


# direct methods
.method public constructor <init>(Ll/de00;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/de00$b;->a:Ll/de00;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/de00$b;->a:Ll/de00;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Ll/hmb0;->h(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/de00$b;->a:Ll/de00;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0}, Ll/hmb0;->f(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/de00$b;->a:Ll/de00;

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/de00;->m(Ll/de00;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Throwable;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/de00$b;->a(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
