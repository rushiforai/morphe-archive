.class public final synthetic Ll/zoj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/etj;


# direct methods
.method public synthetic constructor <init>(Ll/etj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zoj;->a:Ll/etj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zoj;->a:Ll/etj;

    check-cast p1, Ll/jjs;

    invoke-static {p0, p1}, Ll/dpj;->a(Ll/etj;Ll/jjs;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
