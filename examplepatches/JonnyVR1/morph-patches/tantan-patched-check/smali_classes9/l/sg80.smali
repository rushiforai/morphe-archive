.class public final synthetic Ll/sg80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/oo2;


# direct methods
.method public synthetic constructor <init>(Ll/oo2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sg80;->a:Ll/oo2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sg80;->a:Ll/oo2;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/wg80;->d(Ll/oo2;Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
