.class public final synthetic Ll/g16;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/q16$b;


# direct methods
.method public synthetic constructor <init>(Ll/q16$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g16;->a:Ll/q16$b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g16;->a:Ll/q16$b;

    check-cast p1, Ll/uxj0;

    invoke-static {p0, p1}, Ll/q16;->m(Ll/q16$b;Ll/uxj0;)Ll/q16$b;

    move-result-object p0

    return-object p0
.end method
