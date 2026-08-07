.class public final synthetic Ll/x7i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$d;


# instance fields
.field public final synthetic a:Ljava/lang/Long;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x7i0;->a:Ljava/lang/Long;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x7i0;->a:Ljava/lang/Long;

    check-cast p1, Lrx/c;

    invoke-static {p0, p1}, Ll/z7i0;->a(Ljava/lang/Long;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
