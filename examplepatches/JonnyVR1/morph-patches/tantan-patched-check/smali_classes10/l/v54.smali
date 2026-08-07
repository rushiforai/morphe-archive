.class public final synthetic Ll/v54;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/z54;


# direct methods
.method public synthetic constructor <init>(Ll/z54;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v54;->a:Ll/z54;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v54;->a:Ll/z54;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/z54;->J3(Ll/z54;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
