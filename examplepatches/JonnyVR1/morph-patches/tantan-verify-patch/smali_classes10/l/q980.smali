.class public final synthetic Ll/q980;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/t980;


# direct methods
.method public synthetic constructor <init>(Ll/t980;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q980;->a:Ll/t980;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q980;->a:Ll/t980;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/t980;->J3(Ll/t980;Ljava/lang/Long;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
