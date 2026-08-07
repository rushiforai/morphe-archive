.class public final synthetic Ll/iie;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/lie;


# direct methods
.method public synthetic constructor <init>(Ll/lie;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iie;->a:Ll/lie;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iie;->a:Ll/lie;

    check-cast p1, Ll/pf60;

    invoke-static {p0, p1}, Ll/lie;->F0(Ll/lie;Ll/pf60;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
