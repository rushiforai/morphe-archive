.class public final synthetic Ll/hoj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/dtj;


# direct methods
.method public synthetic constructor <init>(Ll/dtj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hoj;->a:Ll/dtj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hoj;->a:Ll/dtj;

    check-cast p1, Ll/jjs;

    invoke-static {p0, p1}, Ll/cpj;->b(Ll/dtj;Ll/jjs;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
