.class public final synthetic Ll/f54;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/n54;


# direct methods
.method public synthetic constructor <init>(Ll/n54;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f54;->a:Ll/n54;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f54;->a:Ll/n54;

    check-cast p1, Ll/ml50;

    invoke-static {p0, p1}, Ll/n54;->O3(Ll/n54;Ll/ml50;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
