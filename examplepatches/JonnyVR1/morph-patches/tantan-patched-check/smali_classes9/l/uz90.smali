.class public final synthetic Ll/uz90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/zz90;


# direct methods
.method public synthetic constructor <init>(Ll/zz90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uz90;->a:Ll/zz90;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uz90;->a:Ll/zz90;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/zz90;->T(Ll/zz90;Ljava/lang/Boolean;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
