.class public final synthetic Ll/m4r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/r4r;


# direct methods
.method public synthetic constructor <init>(Ll/r4r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m4r;->a:Ll/r4r;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m4r;->a:Ll/r4r;

    check-cast p1, Ll/hrk0$a;

    invoke-static {p0, p1}, Ll/r4r;->N3(Ll/r4r;Ll/hrk0$a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
