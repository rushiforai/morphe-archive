.class public final synthetic Ll/huu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/vuu;


# direct methods
.method public synthetic constructor <init>(Ll/vuu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/huu;->a:Ll/vuu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/huu;->a:Ll/vuu;

    check-cast p1, Ll/ypu;

    invoke-static {p0, p1}, Ll/vuu;->d3(Ll/vuu;Ll/ypu;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
