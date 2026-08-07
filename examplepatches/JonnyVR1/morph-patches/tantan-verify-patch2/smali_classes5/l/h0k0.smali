.class public final synthetic Ll/h0k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/p0k0$b;


# direct methods
.method public synthetic constructor <init>(Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h0k0;->a:Ll/p0k0$b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h0k0;->a:Ll/p0k0$b;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/p0k0;->y(Ll/p0k0$b;Ljava/lang/Throwable;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
