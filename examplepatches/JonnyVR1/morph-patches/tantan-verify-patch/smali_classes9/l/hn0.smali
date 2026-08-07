.class public final synthetic Ll/hn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/pn0$a;


# direct methods
.method public synthetic constructor <init>(ILl/pn0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/hn0;->a:I

    iput-object p2, p0, Ll/hn0;->b:Ll/pn0$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/hn0;->a:I

    iget-object p0, p0, Ll/hn0;->b:Ll/pn0$a;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/pn0;->b(ILl/pn0$a;Ljava/lang/Throwable;)V

    return-void
.end method
