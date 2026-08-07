.class public final synthetic Ll/rxi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/jyi$a;


# direct methods
.method public synthetic constructor <init>(Ll/jyi$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rxi;->a:Ll/jyi$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rxi;->a:Ll/jyi$a;

    check-cast p1, Ll/jyi$a;

    invoke-static {p0, p1}, Ll/jyi;->Z3(Ll/jyi$a;Ll/jyi$a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
