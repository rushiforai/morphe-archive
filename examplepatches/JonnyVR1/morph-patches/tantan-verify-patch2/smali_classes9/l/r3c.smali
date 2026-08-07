.class public final synthetic Ll/r3c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/u3c;


# direct methods
.method public synthetic constructor <init>(Ll/u3c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r3c;->a:Ll/u3c;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r3c;->a:Ll/u3c;

    check-cast p1, Ll/uxj0;

    invoke-static {p0, p1}, Ll/u3c;->M3(Ll/u3c;Ll/uxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
