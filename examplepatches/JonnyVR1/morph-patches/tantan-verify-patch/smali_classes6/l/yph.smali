.class public final synthetic Ll/yph;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/g90;


# direct methods
.method public synthetic constructor <init>(Ll/g90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yph;->a:Ll/g90;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yph;->a:Ll/g90;

    check-cast p1, Ll/cqh;

    invoke-static {p0, p1}, Ll/bqh;->E(Ll/g90;Ll/cqh;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
