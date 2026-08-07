.class public final synthetic Ll/kf50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/qf50;


# direct methods
.method public synthetic constructor <init>(Ll/qf50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kf50;->a:Ll/qf50;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kf50;->a:Ll/qf50;

    check-cast p1, Ll/jsv;

    invoke-static {p0, p1}, Ll/qf50;->T3(Ll/qf50;Ll/jsv;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
