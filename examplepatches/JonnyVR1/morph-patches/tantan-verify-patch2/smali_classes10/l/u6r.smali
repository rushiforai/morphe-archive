.class public final synthetic Ll/u6r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/x6r;


# direct methods
.method public synthetic constructor <init>(Ll/x6r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u6r;->a:Ll/x6r;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u6r;->a:Ll/x6r;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/x6r;->L3(Ll/x6r;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
