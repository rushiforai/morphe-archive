.class public final synthetic Ll/fe60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$d;


# instance fields
.field public final synthetic a:Ll/ke60;


# direct methods
.method public synthetic constructor <init>(Ll/ke60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fe60;->a:Ll/ke60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fe60;->a:Ll/ke60;

    check-cast p1, Lrx/c;

    invoke-static {p0, p1}, Ll/ke60;->K3(Ll/ke60;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
