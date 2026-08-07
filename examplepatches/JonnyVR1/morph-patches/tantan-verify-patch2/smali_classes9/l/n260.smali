.class public final synthetic Ll/n260;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/p260;


# direct methods
.method public synthetic constructor <init>(Ll/p260;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n260;->a:Ll/p260;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n260;->a:Ll/p260;

    check-cast p1, Ll/bcg0;

    invoke-static {p0, p1}, Ll/p260;->X3(Ll/p260;Ll/bcg0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
