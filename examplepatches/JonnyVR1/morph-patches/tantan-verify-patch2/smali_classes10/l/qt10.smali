.class public final synthetic Ll/qt10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/st10;


# direct methods
.method public synthetic constructor <init>(Ll/st10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qt10;->a:Ll/st10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qt10;->a:Ll/st10;

    check-cast p1, Ll/ts10;

    invoke-static {p0, p1}, Ll/st10;->V3(Ll/st10;Ll/ts10;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
