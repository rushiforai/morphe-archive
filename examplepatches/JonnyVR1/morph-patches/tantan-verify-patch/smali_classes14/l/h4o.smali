.class public final synthetic Ll/h4o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/k4o;


# direct methods
.method public synthetic constructor <init>(Ll/k4o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h4o;->a:Ll/k4o;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h4o;->a:Ll/k4o;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/k4o;->X2(Ll/k4o;Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
