.class public final synthetic Ll/qrd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$d;


# instance fields
.field public final synthetic a:Ll/f2e0;


# direct methods
.method public synthetic constructor <init>(Ll/f2e0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qrd0;->a:Ll/f2e0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qrd0;->a:Ll/f2e0;

    check-cast p1, Lrx/c;

    invoke-static {p0, p1}, Ll/trd0;->b(Ll/f2e0;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
