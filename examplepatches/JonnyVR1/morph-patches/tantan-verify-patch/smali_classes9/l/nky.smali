.class public final synthetic Ll/nky;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/pky;


# direct methods
.method public synthetic constructor <init>(Ll/pky;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nky;->a:Ll/pky;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nky;->a:Ll/pky;

    check-cast p1, Ll/uxj0;

    invoke-static {p0, p1}, Ll/pky;->X3(Ll/pky;Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
