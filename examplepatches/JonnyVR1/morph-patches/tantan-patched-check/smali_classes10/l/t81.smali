.class public final synthetic Ll/t81;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/x81;


# direct methods
.method public synthetic constructor <init>(Ll/x81;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t81;->a:Ll/x81;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t81;->a:Ll/x81;

    check-cast p1, Ll/hrk0$a;

    invoke-static {p0, p1}, Ll/x81;->J3(Ll/x81;Ll/hrk0$a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
