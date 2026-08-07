.class public final synthetic Ll/w0o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/x0o;


# direct methods
.method public synthetic constructor <init>(Ll/x0o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w0o;->a:Ll/x0o;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0o;->a:Ll/x0o;

    check-cast p1, Ll/h1e;

    invoke-static {p0, p1}, Ll/x0o;->L3(Ll/x0o;Ll/h1e;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
