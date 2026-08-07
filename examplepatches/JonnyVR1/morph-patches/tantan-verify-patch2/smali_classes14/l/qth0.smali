.class public final synthetic Ll/qth0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/wth0$a;


# direct methods
.method public synthetic constructor <init>(Ll/wth0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qth0;->a:Ll/wth0$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qth0;->a:Ll/wth0$a;

    check-cast p1, Ll/wth0$a;

    invoke-static {p0, p1}, Ll/wth0;->b(Ll/wth0$a;Ll/wth0$a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
