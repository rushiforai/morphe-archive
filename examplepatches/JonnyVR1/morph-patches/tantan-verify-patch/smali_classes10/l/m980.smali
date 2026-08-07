.class public final synthetic Ll/m980;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/p980;


# direct methods
.method public synthetic constructor <init>(Ll/p980;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m980;->a:Ll/p980;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m980;->a:Ll/p980;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/p980;->J3(Ll/p980;Ljava/lang/Long;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
